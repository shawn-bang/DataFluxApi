create or replace package AF_HXBCB_SNA_PKG is
  -- Created : 2017/11/6 14:39:00
  -- Purpose : SNA
  --error_msg
  v_sna_errors varchar2(1000);
  /*function getResLvl(score in number) return varchar2;*/
  -- get Sna Res
  procedure getSnaResult(appid in varchar2);

end AF_HXBCB_SNA_PKG;

/

create or replace package body AF_HXBCB_SNA_PKG is

/*function getResLvl(score in number) return varchar2 is 
v_res varchar2(6):='';
begin 



end getResLvl;*/




procedure getSnaResult(appid in varchar2)
is 
begin 
declare v_net_score varchar2(10);
 v_sna_result varchar2(10);
begin
         select max(net_score) into v_net_score
                from (select a.net_score
                     from af_app_sna_input a 
                     inner join 
                           af_app_snainput b
                           on b.from_node=appid and b.ifcluster='1' and 
                           a.to_node=b.to_node and a.to_type=b.to_type);
         if v_net_score>=0 then 
            v_sna_result := 'A';
         elsif v_net_score>=300 then 
            v_sna_result :='C';
         else 
            v_sna_result:='E';
         end if;
     delete from af_app_sna_result where app_id=appid;
     commit;
     insert into af_app_sna_result (app_id,sna_result)
     values(appid,v_sna_result);
     commit;
exception when others then
     v_sna_errors := 'SNA_PKG.getSnaResult:' || sqlerrm;
     insert into AF_App_Prc_Logs(App_Id,Error_Logs)
     values
     (appid,v_sna_errors);
 commit;
         
          
end;
end getSnaResult;


end AF_HXBCB_SNA_PKG;
