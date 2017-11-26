create or replace package AF_HXBCB_MODEL_PKG is

  -- Created : 2017/11/6 14:39:38
  -- Purpose : MODEL
  v_model_errors varchar2(500);
  procedure getResLvl(appid in varchar2, score in number,lvl out varchar2);
  procedure getModelResult(appid in varchar);



end AF_HXBCB_MODEL_PKG;


/


create or replace package body AF_HXBCB_MODEL_PKG is
  procedure getResLvl(appid in varchar2, score in number,lvl out varchar2) is
    begin
      declare
        cursor parms_cur is
          select PARM_LEVEL,parm_value_up,parm_value_lower
          from af_app_risk_conf_parms
          where parm_type='MODEL'
        ;
        parm_cur parms_cur%rowtype;
        v_res varchar2(30):='null';
      begin
        for parm_cur in parms_cur
        loop
          if score>=parm_cur.parm_value_lower and score<=parm_cur.parm_value_up then
            v_res :=parm_cur.PARM_LEVEL;
          end if;
        end loop;
        lvl:=v_res;
        exception when others then
        v_model_errors:='MODEL_PKG.getResLvl:'||sqlerrm;
        insert into AF_App_Prc_Logs(App_Id,Error_Logs)
        values
          (appid,v_model_errors);
        commit;
      end;
    end getResLvl;


  procedure getModelResult(appid in varchar) is
    begin
      declare
        v_var varchar2(30);
        v_var_value number:=0;
        v_score number:=0;
        v_pred_p number(8,4);
        v_res varchar2(30);

        cursor parms_cur is
          select model_var,model_var_value
          from af_app_model_input_parms

        ;
        parm_cur parms_cur%rowtype;
      begin
        for parm_cur in parms_cur
        loop
          begin
            select to_number(var_value) into v_var
            from af_app_model_var_input
            where app_id = appid and upper(var_name)=upper(parm_cur.model_var);
            if upper(parm_cur.model_var)=upper('intercept') then
              v_score:=v_score + to_number(parm_cur.model_var_value);
            end if;
            if upper(parm_cur.model_var)=upper('C1_GENDER') then
              if v_var='M' then v_var_value:=1 ;
              else v_var_value:=0;
              end if;
            elsif upper(parm_cur.model_var)=upper('C1_EDUCLS') then
              if nvl(v_var,'a')='a' then v_var_value:=0;
              else v_var_value:=to_number(v_var);
              end if;
            elsif upper(parm_cur.model_var)=upper('C1_MARST') then
              if v_var='0' then v_var_value:=0;
              elsif  v_var='M' then v_var_value:=1;
              elsif v_var='S' then v_var_value:=2;
              else v_var_value:=0;
              end if;
            else
              v_var_value:=to_number(nvl(v_var,'0'));
            end if;
            v_score :=v_score + to_number(v_var_value) * to_number(parm_cur.model_var_value);
            exception when no_data_found then
            continue;
          end;
        end loop;
        v_pred_p := (1/(1+exp(-1*v_score)))*100;
        getResLvl(appid, v_pred_p,v_res);
        if v_res !='null' then
          delete from af_app_model_result where app_id=appid;
          commit;
          insert into af_app_model_result(app_id,model_ressult)
          values
            (appid,v_res);
          commit;
        end if;
        exception when others then
        v_model_errors := 'MODEL_PKG.getModelResult:' || sqlerrm;
        insert into AF_App_Prc_Logs(App_Id,Error_Logs)
        values
          (appid,v_model_errors);
        commit;
      end;
    end getModelResult;
end AF_HXBCB_MODEL_PKG;