-- According to the dataflux result data, generate cid and update tables
-- @author shawn
-- @date 2017-12-8 18:52:00
create or replace procedure GENERATE_CID(app_id_input in varchar2) is
  v_error varchar2(500);
  v_cid varchar2(30);
  -- select cmp matchcode info
  cursor c_cmp_today
  is
  select app_id, cid, data_type, data_value, namemc, legalformmc, sitemc, addmc, create_time
  from af_app_cmp_today
  where app_id = app_id_input;
  c_cmp_row c_cmp_today%rowtype;
  -- select addr matchcode info
  cursor c_add_today
  is
  select app_id, cid, data_source, data_type, data_value, districtmc, townmc, streetmc, blockmc, buildingmc, unitmc, floormc, roommc, addinfomc, city, create_time
  from af_app_add_today
  where app_id = app_id_input;
  c_add_row c_add_today%rowtype;
begin
  -- TODO do something!
  for c_cmp_row in c_cmp_today loop
    -- do something!
    -- update af_app_cmp_his
    select cid
      into v_cid
      from (select t.cid
              from af_app_cmp_his t
             where exists (select 1
                      from af_app_cmp_his a
                     where a.namemc = c_cmp_row.namemc
                       and a.legalformmc = c_cmp_row.legalformmc
                       and a.sitemc = c_cmp_row.sitemc
                    union all
                    select 1
                      from af_app_cmp_his b
                     where b.namemc = c_cmp_row.namemc
                       and b.sitemc = c_cmp_row.sitemc
                       and b.addmc = c_cmp_row.addmc)
            union all
            select 'null'
              from dual)
     where rownum = 1;
    
    if v_cid = 'null' then
      -- generate new cid
      v_cid := 'CN' || af_cmp_cid_seq.nextval;
    end if;
    insert into af_app_cmp_his(app_id, cid, data_type, namemc, legalformmc, sitemc, addmc)
         values(app_id_input, v_cid, c_cmp_row.data_type, c_cmp_row.namemc, c_cmp_row.legalformmc, c_cmp_row.sitemc, c_cmp_row.addmc);
    commit;
  end loop;
  for c_add_row in c_add_today loop
    -- do something!
    select cid
      into v_cid
      from (select t.cid
              from v_add_all_his t
             where exists (select 1
                      from v_add_all_his a
                     where a.districtmc = c_add_row.districtmc
                       and a.blockmc = c_add_row.blockmc
                       and a.unitmc = c_add_row.unitmc
                       and a.roommc = c_add_row.roommc
                    union all
                    select 1
                      from v_add_all_his b
                     where b.districtmc = c_add_row.districtmc
                       and b.streetmc = c_add_row.streetmc
                       and b.buildingmc = c_add_row.buildingmc
                       and b.addinfomc = c_add_row.addinfomc
                    union all
                    select 1
                      from v_add_all_his c
                     where c.districtmc = c_add_row.districtmc
                       and c.streetmc = c_add_row.streetmc
                       and c.buildingmc = c_add_row.buildingmc
                       and c.roommc = c_add_row.roommc
                    union all
                    select 1
                      from v_add_all_his d
                     where d.districtmc = c_add_row.districtmc
                       and d.streetmc = c_add_row.streetmc
                       and d.floormc = c_add_row.floormc
                       and d.addinfomc = c_add_row.addinfomc
                    union all
                    select 1
                      from v_add_all_his e
                     where e.streetmc = c_add_row.streetmc
                       and e.buildingmc = c_add_row.buildingmc
                       and e.floormc = c_add_row.floormc
                       and e.addinfomc = c_add_row.addinfomc)
            union all
            select 'null'
              from dual)
     where rownum = 1;

    if v_cid = 'null' then
      -- generate new cid
      v_cid := 'CN' || af_add_cid_seq.nextval;
    end if;
    if c_add_row.data_source = 'APP' then
      -- update af_app_add_his
      insert into af_app_add_his(app_id, cid, data_type, addinfomc, blockmc, buildingmc, districtmc, floormc, roommc, streetmc, townmc, unitmc)
           values(app_id_input, v_cid, c_add_row.data_type, c_add_row.addinfomc, c_add_row.blockmc, c_add_row.buildingmc, c_add_row.districtmc, c_add_row.floormc, c_add_row.roommc, c_add_row.streetmc, c_add_row.townmc, c_add_row.unitmc);
    else
      -- update af_app_add_ext_his
      insert into af_app_add_ext_his(app_id, cid, data_type, addinfomc, blockmc, buildingmc, districtmc, floormc, roommc, streetmc, townmc, unitmc)
           values(app_id_input, v_cid, c_add_row.data_type, c_add_row.addinfomc, c_add_row.blockmc, c_add_row.buildingmc, c_add_row.districtmc, c_add_row.floormc, c_add_row.roommc, c_add_row.streetmc, c_add_row.townmc, c_add_row.unitmc);
    end if;
    commit;
  end loop;
  -- handle exceptions
  exception when others then v_error := 'GENERATE_CID: ' || sqlerrm;
  insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
  commit;
end GENERATE_CID;
