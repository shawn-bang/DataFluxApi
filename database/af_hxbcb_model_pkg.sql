create or replace package AF_HXBCB_MODEL_PKG is

  -- Created : 2017/11/6 14:39:38
  -- Purpose : MODEL
  v_model_errors varchar2(500);
  procedure getModelResult(appid in varchar);
  
  
 
end AF_HXBCB_MODEL_PKG;

/

create or replace package body AF_HXBCB_MODEL_PKG is

procedure getModelResult(appid in varchar) is
begin 
declare 
 v_var_value number:=0;
 v_score number:=0;
 v_pred_p number(8,4);
 v_res varchar2(6);
cursor parms_cur is 
       select model_var,model_var_value
              from af_app_model_input_parms
          ;
parm_cur parms_cur%rowtype;
begin
  for parm_cur in parms_cur
  loop
  begin
      if upper(parm_cur.model_var)=upper('intercept') then 
           v_score:=v_score + to_number(parm_cur.model_var_value);
      end if;
      select to_number(var_value) into v_var_value
             from af_app_model_var_input
             where app_id = appid and var_name=LOWER(parm_cur.model_var);
     v_score :=v_score + to_number(v_var_value) * to_number(parm_cur.model_var_value);
      exception when no_data_found then 
      continue;
   end;
  end loop;
  v_pred_p := (1/(1+exp(-1*v_score)))*1000;
  if v_pred_p>=200 and v_pred_p<500 then v_res :='A';
  elsif v_pred_p>=500 and v_pred_p<800 then v_res:='C';
  else v_res:='E';
  end if;
  delete from af_app_model_result where app_id=appid;
     commit;
  insert into af_app_model_result(app_id,model_ressult)
  values
  (appid,v_res);
  commit;
  exception when others then 
     v_model_errors := 'MODEL_PKG.getModelResult:' || sqlerrm;
     insert into AF_App_Prc_Logs(App_Id,Error_Logs)
     values
     (appid,v_model_errors);
 commit;
end;
end getModelResult;
end AF_HXBCB_MODEL_PKG;
