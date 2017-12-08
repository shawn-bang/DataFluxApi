-- According to the dataflux result data, generate cid and update tables
-- @author shawn
-- @date 2017-12-8 18:52:00
create or replace procedure GENERATE_CID(app_id_input in varchar2) is
  v_error varchar2(500);
  -- select cmp matchcode info
  cursor c_cmp_today
  is
  select app_id, cid, data_type, data_value, namemc, legalformmc, sitemc, addmc, create_time
  from af_app_cmp_today
  where app_id = app_id_input;
  c_cmp_today_row c_cmp_today%rowtype;
  -- select addr matchcode info
  cursor c_add_today
  is
  select app_id, cid, data_source, data_type, data_value, districtmc, townmc, streetmc, blockmc, buildingmc, unitmc, floormc, roommc, addinfomc, city, create_time
  from af_app_add_today
  where app_id = app_id_input;
  c_add_today_row c_add_today%rowtype;  
begin
  -- TODO do something!
  for c_cmp_today_row in c_cmp_today loop
    -- do something!
    -- update af_app_cmp_his
    DBMS_OUTPUT.PUT_LINE(c_cmp_today_row.app_id);
  end loop;
  for c_add_today_row in c_add_today loop
    -- do something!
    if c_add_today_row.data_source = 'APP' then
      -- update af_app_add_his
      DBMS_OUTPUT.PUT_LINE(c_add_today_row.app_id);
    else
      -- update af_app_add_ext_his
      DBMS_OUTPUT.PUT_LINE(c_add_today_row.app_id);
    end if;
  end loop;  
end GENERATE_CID;
