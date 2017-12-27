-- According to the dataflux result data, generate cid and update tables
-- @author shawn
-- @date 2017-12-8 18:52:00
create or replace procedure GENERATE_CID(app_id_input in varchar2) is
  v_error varchar2(500);
  v_cid varchar2(30):='-1';
  -- select cmp matchcode info
  cursor c_cmp_today
  is
  select app_id, cid, data_type, data_value, namemc, legalformmc, sitemc, addmc, datavaluemc, create_time
  from af_app_cmp_today
  where app_id = app_id_input;
  c_cmp_row c_cmp_today%rowtype;
  -- select addr matchcode info
  cursor c_add_today
  is
  select app_id, cid, data_source, data_type, data_value, districtmc, townmc, streetmc, blockmc, buildingmc, unitmc, floormc, roommc, addinfomc, datavaluemc, city, create_time
  from af_app_add_today
  where app_id = app_id_input;
  c_add_row c_add_today%rowtype;
begin
  for c_cmp_row in c_cmp_today loop
    -- IDX_CMP_CID_RATE1
    if c_cmp_row.datavaluemc != '-1' then
      select cid
      into v_cid
      from (select t.cid
            from af_app_cmp_his t
            where t.datavaluemc = c_cmp_row.datavaluemc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_CMP_CID_RATE2
    if c_cmp_row.namemc != '-1' and c_cmp_row.legalformmc != '-1' and c_cmp_row.sitemc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from af_app_cmp_his t
            where t.namemc = c_cmp_row.namemc
                  and t.legalformmc = c_cmp_row.legalformmc
                  and t.sitemc = c_cmp_row.sitemc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_CMP_CID_RATE3
    if c_cmp_row.namemc != '-1' and c_cmp_row.sitemc != '-1' and c_cmp_row.addmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from af_app_cmp_his t
            where t.namemc = c_cmp_row.namemc
                  and t.sitemc = c_cmp_row.sitemc
                  and t.addmc = c_cmp_row.addmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    if v_cid = '-1' then
      -- generate new cid
      v_cid := 'cn_' || af_cmp_cid_seq.nextval;
    end if;
    insert into af_app_cmp_his(app_id, cid, data_type, namemc, legalformmc, sitemc, addmc, datavaluemc)
         values(app_id_input, v_cid, c_cmp_row.data_type, c_cmp_row.namemc, c_cmp_row.legalformmc, c_cmp_row.sitemc, c_cmp_row.addmc, c_cmp_row.datavaluemc);
    commit;
  end loop;
  for c_add_row in c_add_today loop
    -- IDX_ADD_CID_RATE1
    if c_add_row.datavaluemc != '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.datavaluemc = c_add_row.datavaluemc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE2
    if c_add_row.blockmc != '-1' and c_add_row.buildingmc != '-1' and c_add_row.districtmc != '-1' and c_add_row.roommc != '-1' and c_add_row.unitmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.blockmc = c_add_row.blockmc
                  and t.buildingmc = c_add_row.buildingmc
                  and t.districtmc = c_add_row.districtmc
                  and t.roommc = c_add_row.roommc
                  and t.unitmc = c_add_row.unitmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE3
    if c_add_row.buildingmc != '-1' and c_add_row.districtmc != '-1' and c_add_row.roommc != '-1' and c_add_row.streetmc != '-1' and c_add_row.unitmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.buildingmc = c_add_row.buildingmc
                  and t.districtmc = c_add_row.districtmc
                  and t.roommc = c_add_row.roommc
                  and t.streetmc = c_add_row.streetmc
                  and t.unitmc = c_add_row.unitmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE4
    if c_add_row.blockmc != '-1' and c_add_row.buildingmc != '-1' and c_add_row.roommc != '-1' and c_add_row.streetmc != '-1' and c_add_row.unitmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.blockmc = c_add_row.blockmc
                  and t.buildingmc = c_add_row.buildingmc
                  and t.roommc = c_add_row.roommc
                  and t.streetmc = c_add_row.streetmc
                  and t.unitmc = c_add_row.unitmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE5
    if c_add_row.addinfomc != '-1' and c_add_row.blockmc != '-1' and c_add_row.districtmc != '-1' and c_add_row.streetmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.addinfomc = c_add_row.addinfomc
                  and t.blockmc = c_add_row.blockmc
                  and t.districtmc = c_add_row.districtmc
                  and t.streetmc = c_add_row.streetmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE6
    if c_add_row.addinfomc != '-1' and c_add_row.districtmc != '-1' and c_add_row.floormc != '-1' and c_add_row.streetmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.addinfomc = c_add_row.addinfomc
                  and t.districtmc = c_add_row.districtmc
                  and t.floormc = c_add_row.floormc
                  and t.streetmc = c_add_row.streetmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE7
    if c_add_row.blockmc != '-1' and c_add_row.roommc != '-1' and c_add_row.townmc != '-1' and c_add_row.unitmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.blockmc = c_add_row.blockmc
                  and t.roommc = c_add_row.roommc
                  and t.townmc = c_add_row.townmc
                  and t.unitmc = c_add_row.unitmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE8
    if c_add_row.addinfomc != '-1' and c_add_row.districtmc != '-1' and c_add_row.roommc != '-1' and c_add_row.streetmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.addinfomc = c_add_row.addinfomc
                  and t.districtmc = c_add_row.districtmc
                  and t.roommc = c_add_row.roommc
                  and t.streetmc = c_add_row.streetmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE9
    if c_add_row.addinfomc != '-1' and c_add_row.buildingmc != '-1' and c_add_row.districtmc != '-1' and c_add_row.streetmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.addinfomc = c_add_row.addinfomc
                  and t.buildingmc = c_add_row.buildingmc
                  and t.districtmc = c_add_row.districtmc
                  and t.streetmc = c_add_row.streetmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE10
    if c_add_row.blockmc != '-1' and c_add_row.districtmc != '-1' and c_add_row.floormc != '-1' and c_add_row.roommc != '-1' and c_add_row.streetmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.blockmc = c_add_row.blockmc
                  and t.districtmc = c_add_row.districtmc
                  and t.floormc = c_add_row.floormc
                  and t.roommc = c_add_row.roommc
                  and t.streetmc = c_add_row.streetmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    -- IDX_ADD_CID_RATE11
    if c_add_row.blockmc != '-1' and c_add_row.buildingmc != '-1' and c_add_row.districtmc != '-1' and c_add_row.floormc != '-1' and c_add_row.streetmc != '-1' and v_cid = '-1' then
      select cid
      into v_cid
      from (select t.cid
            from v_add_all_his t
            where t.blockmc = c_add_row.blockmc
                  and t.buildingmc = c_add_row.buildingmc
                  and t.districtmc = c_add_row.districtmc
                  and t.floormc = c_add_row.floormc
                  and t.streetmc = c_add_row.streetmc
            union all
            select '-1' from dual)
      where rownum = 1;
    end if;

    if v_cid = '-1' then
      -- generate new cid
      v_cid := 'an_' || af_add_cid_seq.nextval;
    end if;
    if c_add_row.data_source = 'APP' then
      -- update af_app_add_his
      insert into af_app_add_his(app_id, cid, data_type, addinfomc, blockmc, buildingmc, districtmc, floormc, roommc, streetmc, townmc, unitmc, datavaluemc)
           values(app_id_input, v_cid, c_add_row.data_type, c_add_row.addinfomc, c_add_row.blockmc, c_add_row.buildingmc, c_add_row.districtmc, c_add_row.floormc, c_add_row.roommc, c_add_row.streetmc, c_add_row.townmc, c_add_row.unitmc, c_add_row.datavaluemc);
    else
      -- update af_app_add_ext_his
      insert into af_app_add_ext_his(app_id, cid, data_type, addinfomc, blockmc, buildingmc, districtmc, floormc, roommc, streetmc, townmc, unitmc, datavaluemc)
           values(app_id_input, v_cid, c_add_row.data_type, c_add_row.addinfomc, c_add_row.blockmc, c_add_row.buildingmc, c_add_row.districtmc, c_add_row.floormc, c_add_row.roommc, c_add_row.streetmc, c_add_row.townmc, c_add_row.unitmc, c_add_row.datavaluemc);
    end if;
    commit;
  end loop;
  -- handle exceptions
  exception when others then v_error := 'GENERATE_CID: ' || sqlerrm;
  insert into af_app_prc_logs(app_id, error_logs) values(app_id_input, v_error);
  commit;
end GENERATE_CID;
