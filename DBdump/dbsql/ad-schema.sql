# -----------------------------------------------------------------------
# DateBase AD
# -----------------------------------------------------------------------
drop database if exists ad01;
create database ad01;
use ad01;

# -----------------------------------------------------------------------
# user_group
# -----------------------------------------------------------------------
drop table if exists user_group;

CREATE TABLE user_group
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# user
# -----------------------------------------------------------------------
drop table if exists user;

CREATE TABLE user
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    group_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(128) NOT NULL,
    description VARCHAR(255),
    insert_date DATETIME,
    login_ip VARCHAR(15),
    status VARCHAR(1) NOT NULL,
    username VARCHAR(100),
    usertype VARCHAR(100),
    useremail VARCHAR(100),
    userphone VARCHAR(100),
    title VARCHAR(255),
    crm_team_id INTEGER,
    region VARCHAR(255),
    level VARCHAR(100),
    gender VARCHAR(255),
    cellphone VARCHAR(100),
    msn VARCHAR(255),
    qq VARCHAR(255),
    workstatus VARCHAR(255),
    user_type_id INTEGER,
    user_sub_type_id INTEGER,
    leader_id_01 INTEGER,
    leader_id_02 INTEGER,
    leader_id_03 INTEGER,
    orther_report_id INTEGER,
    assist_user_id INTEGER,
    other_assist_user_id INTEGER,
    password_update_date DATETIME,
    data_scope VARCHAR(1) default '0' NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# privilege
# -----------------------------------------------------------------------
drop table if exists privilege;

CREATE TABLE privilege
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# group_privilege
# -----------------------------------------------------------------------
drop table if exists group_privilege;

CREATE TABLE group_privilege
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    privilege_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# agent
# -----------------------------------------------------------------------
drop table if exists agent;

CREATE TABLE agent
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    system_user VARCHAR(255),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    level VARCHAR(100),
    agent_type VARCHAR(100),
    company_type VARCHAR(100),
    money INTEGER,
    money_confirm INTEGER,
    orders INTEGER,
    province VARCHAR(100),
    isRegister INTEGER,
    province_id VARCHAR(100),
    city_id VARCHAR(100),
    crm_company_id_01 INTEGER,
    crm_company_id_02 INTEGER,
    crm_company_id_03 INTEGER,
    first_order_sign_date DATETIME,
    f_agent_company_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ad_order
# -----------------------------------------------------------------------
drop table if exists ad_order;

CREATE TABLE ad_order
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    customer_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    insert_date DATETIME,
    percent INTEGER,
    status VARCHAR(255) NOT NULL,
    status2 VARCHAR(255),
    status3 VARCHAR(255),
    status4 VARCHAR(255) default '-1',
    order_type VARCHAR(100),
    order_sub_type VARCHAR(100),
    order_status VARCHAR(100),
    order_number_temp VARCHAR(255),
    order_number VARCHAR(255),
    order_brand VARCHAR(255),
    order_product VARCHAR(255),
    order_agent VARCHAR(255),
    cpm INTEGER default 0,
    order_direct_salsename VARCHAR(255),
    order_direct_salsephone VARCHAR(255),
    order_channel_salsename VARCHAR(255),
    order_channel_salsephone VARCHAR(255),
    order_ae_name VARCHAR(255),
    order_ae_phone VARCHAR(255),
    quotation_version VARCHAR(255),
    build_user VARCHAR(255),
    agent_id INTEGER,
    start_date DATETIME,
    end_date DATETIME,
    frame_order_id INTEGER NOT NULL,
    money INTEGER,
    money_decimal INTEGER,
    discount VARCHAR(255),
    f_order_back VARCHAR(255),
    f_money_confirm INTEGER,
    f_invoice INTEGER,
    f_back_invoice INTEGER,
    f_order_sign DATETIME,
    f_abstract VARCHAR(255),
    f_yongyou_id VARCHAR(255),
    f_fee VARCHAR(255),
    f_income INTEGER,
    f_customer_id INTEGER,
    f_agent_id INTEGER,
    f_user_type_id INTEGER,
    f_youku_company VARCHAR(255),
    f_money_pre_confirm INTEGER,
    order_template VARCHAR(100),
    modifiable INTEGER,
    action_description VARCHAR(2000),
    order_executor_id INTEGER default -1,
    order_examinator_id INTEGER default -1,
    order_vip INTEGER default -1 NOT NULL,
    product_vip INTEGER default 1 NOT NULL,
    lock_state INTEGER default 0 NOT NULL,
    special_approval INTEGER default 0 NOT NULL,
    special_commit INTEGER default 0 NOT NULL,
    atm_lock INTEGER default 0 NOT NULL,
    order_description VARCHAR(255),
    capacity_flag INTEGER default -1 NOT NULL,
    isComplete INTEGER default 0,
    complete_comment VARCHAR(255),
    complete_confirm_letter INTEGER default 0,
    complete_confirm_comment VARCHAR(255),
    isCompleteCasted INTEGER default -1 NOT NULL,
    order_class VARCHAR(3),
    site INTEGER default 1,
    isSurplusflowOrder INTEGER default -1 NOT NULL,
    isGeneralcastOrder INTEGER default -1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# channel
# -----------------------------------------------------------------------
drop table if exists channel;

CREATE TABLE channel
(
    id VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# sub_channel
# -----------------------------------------------------------------------
drop table if exists sub_channel;

CREATE TABLE sub_channel
(
    id VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    channel_id VARCHAR(255) NOT NULL,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ad_type
# -----------------------------------------------------------------------
drop table if exists ad_type;

CREATE TABLE ad_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    templet MEDIUMTEXT,
    isEditable INTEGER default -1,
    site INTEGER default 1,
    isvideo INTEGER default -1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# page
# -----------------------------------------------------------------------
drop table if exists page;

CREATE TABLE page
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# block
# -----------------------------------------------------------------------
drop table if exists block;

CREATE TABLE block
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    htmlcode MEDIUMTEXT,
    status INTEGER default 1,
    page_id INTEGER,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# position
# -----------------------------------------------------------------------
drop table if exists position;

CREATE TABLE position
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    width INTEGER NOT NULL,
    height INTEGER NOT NULL,
    page_id INTEGER,
    block_id INTEGER,
    default_idea_id INTEGER,
    status INTEGER default 1,
    isEditable INTEGER default -1,
    price VARCHAR(255),
    alias VARCHAR(255),
    isShow VARCHAR(255),
    show_index INTEGER,
    max_ad_num INTEGER default 1,
    p_type INTEGER default 1,
    parent_id INTEGER default -1,
    order_id INTEGER default -1,
    unit INTEGER default -1,
    p_price INTEGER default 0,
    res_type VARCHAR(255) default '-1',
    cast_sign INTEGER default 0,
    price_type INTEGER default -1 NOT NULL,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# default_idea
# -----------------------------------------------------------------------
drop table if exists default_idea;

CREATE TABLE default_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    click_url MEDIUMTEXT NOT NULL,
    idea_url MEDIUMTEXT NOT NULL,
    width INTEGER,
    height INTEGER,
    video_length INTEGER,
    ad_type_id INTEGER NOT NULL,
    ad_body MEDIUMTEXT,
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ad_cast
# -----------------------------------------------------------------------
drop table if exists ad_cast;

CREATE TABLE ad_cast
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ad_type_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    isOverAll INTEGER NOT NULL,
    isRegionLimit INTEGER NOT NULL,
    isKeywordLimit INTEGER,
    isYoukuUserLimit INTEGER,
    isVidLimit INTEGER,
    isIpVip INTEGER,
    isInvideo INTEGER NOT NULL,
    isCloseAble INTEGER,
    isIndexTurbo INTEGER,
    isISPLimit INTEGER,
    isCopyrightLimit INTEGER,
    isTheaterLimit INTEGER,
    isUrlLimit INTEGER default -1,
    idea_width INTEGER,
    idea_height INTEGER,
    idea_time INTEGER,
    cpm INTEGER,
    cpm_ok INTEGER,
    status INTEGER default 1 NOT NULL,
    description VARCHAR(255),
    preHours VARCHAR(255),
    valf_cast_id VARCHAR(255),
    valb_cast_id VARCHAR(255),
    video_register_id INTEGER default -1,
    video_config_id INTEGER default -1,
    display_register_id INTEGER default -1,
    nonstandard_register_id INTEGER default -1,
    play_register_id INTEGER default -1,
    cast_type INTEGER default -1,
    check_status INTEGER default -1,
    check_user_id INTEGER default -1,
    check_desc VARCHAR(255),
    check_result VARCHAR(255),
    priority VARCHAR(255),
    priority_number INTEGER default 0,
    deliver_type INTEGER default 0,
    device_type INTEGER default 0 NOT NULL,
    modify_status INTEGER default 0 NOT NULL,
    rates INTEGER default 100,
    vip_number VARCHAR(255),
    ad_format INTEGER NOT NULL,
    site INTEGER default 1,
    tiepian_pos INTEGER default 5,
    rate_m INTEGER default 0,
    isRate INTEGER default 0,
    package_type INTEGER default 0,
    product_type INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_channel
# -----------------------------------------------------------------------
drop table if exists cast_channel;

CREATE TABLE cast_channel
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    channel_id VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_subchannel
# -----------------------------------------------------------------------
drop table if exists cast_subchannel;

CREATE TABLE cast_subchannel
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    subchannel_id VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_city
# -----------------------------------------------------------------------
drop table if exists cast_city;

CREATE TABLE cast_city
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_province
# -----------------------------------------------------------------------
drop table if exists cast_province;

CREATE TABLE cast_province
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_keyword
# -----------------------------------------------------------------------
drop table if exists cast_keyword;

CREATE TABLE cast_keyword
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    keyword VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_vid
# -----------------------------------------------------------------------
drop table if exists cast_vid;

CREATE TABLE cast_vid
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    vid VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_playlist
# -----------------------------------------------------------------------
drop table if exists cast_playlist;

CREATE TABLE cast_playlist
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    playlist_id VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea
# -----------------------------------------------------------------------
drop table if exists idea;

CREATE TABLE idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    click_url MEDIUMTEXT NOT NULL,
    td_click_url MEDIUMTEXT,
    idea_url MEDIUMTEXT NOT NULL,
    idea_url2 VARCHAR(255),
    td_idea_url MEDIUMTEXT,
    td_idea_url2 VARCHAR(255),
    click_url2 MEDIUMTEXT,
    leftpx VARCHAR(255),
    rightpx VARCHAR(255),
    toppx VARCHAR(255),
    footpx VARCHAR(255),
    leftpx2 VARCHAR(255),
    rightpx2 VARCHAR(255),
    td_rightpx2 VARCHAR(255),
    toppx2 VARCHAR(255),
    td_vcu VARCHAR(255),
    footpx2 VARCHAR(255),
    showtime VARCHAR(255),
    feeType VARCHAR(100),
    feeValue VARCHAR(100),
    useOldUrl VARCHAR(255),
    td_show_url VARCHAR(255),
    idea_width INTEGER,
    idea_height INTEGER,
    idea2_width INTEGER,
    idea2_height INTEGER,
    td_idea_width INTEGER,
    td_idea_height INTEGER,
    td_idea2_width INTEGER,
    td_idea2_height INTEGER,
    ad_body MEDIUMTEXT,
    percent INTEGER default 100 NOT NULL,
    status INTEGER default 1,
    other1 MEDIUMTEXT,
    other2 MEDIUMTEXT,
    other3 MEDIUMTEXT,
    other4 MEDIUMTEXT,
    other5 MEDIUMTEXT,
    other6 MEDIUMTEXT,
    numlimit INTEGER default 0,
    campaign_id INTEGER default 0,
    isosu MEDIUMTEXT,
    td_isosu MEDIUMTEXT,
    f3 INTEGER default 0,
    f4 INTEGER,
    auto_makeup_switch INTEGER default 0,
    vp_type INTEGER default 1,
    st INTEGER,
    mt INTEGER default -1,
    cmu MEDIUMTEXT,
    td_cmu MEDIUMTEXT,
    cpm INTEGER default 1,
    target_position INTEGER default 0,
    mutex INTEGER default 0,
    needies INTEGER default 0,
    iesorg VARCHAR(255),
    isSame INTEGER default 1,
    isPredict INTEGER default 0,
    threshold VARCHAR(10),
    cooperation_type INTEGER default 0,
    td_survey_url MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# keyword
# -----------------------------------------------------------------------
drop table if exists keyword;

CREATE TABLE keyword
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# region
# -----------------------------------------------------------------------
drop table if exists region;

CREATE TABLE region
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    city_id VARCHAR(100) NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    start_ip VARCHAR(100) NOT NULL,
    end_ip VARCHAR(100) NOT NULL,
    geoid VARCHAR(100) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# city_name
# -----------------------------------------------------------------------
drop table if exists city_name;

CREATE TABLE city_name
(
    id VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# province_name
# -----------------------------------------------------------------------
drop table if exists province_name;

CREATE TABLE province_name
(
    id VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# seed
# -----------------------------------------------------------------------
drop table if exists seed;

CREATE TABLE seed
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    vid VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    url VARCHAR(255),
    description MEDIUMTEXT,
    status INTEGER default 1,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea_time
# -----------------------------------------------------------------------
drop table if exists idea_time;

CREATE TABLE idea_time
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    status INTEGER default 1,
    position_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea_time_bak
# -----------------------------------------------------------------------
drop table if exists idea_time_bak;

CREATE TABLE idea_time_bak
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    status INTEGER default 1,
    position_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_time
# -----------------------------------------------------------------------
drop table if exists cast_time;

CREATE TABLE cast_time
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    status INTEGER default 1,
    position_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_ip
# -----------------------------------------------------------------------
drop table if exists cast_ip;

CREATE TABLE cast_ip
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    ip VARCHAR(30) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# youkuUser
# -----------------------------------------------------------------------
drop table if exists youkuUser;

CREATE TABLE youkuUser
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    youku_id VARCHAR(250),
    name VARCHAR(250),
    site INTEGER default 1,
    description VARCHAR(255),
    protect_f INTEGER default 0,
    protect_b INTEGER default 0,
    protect_p INTEGER default 0,
    protect_o INTEGER default 0,
    protect_c INTEGER default 0,
    protect_h INTEGER default 0,
    protect_vhtml INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_youkuUser
# -----------------------------------------------------------------------
drop table if exists cast_youkuUser;

CREATE TABLE cast_youkuUser
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    youkuUser_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_url
# -----------------------------------------------------------------------
drop table if exists cast_url;

CREATE TABLE cast_url
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    url VARCHAR(1024) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea_cpm
# -----------------------------------------------------------------------
drop table if exists idea_cpm;

CREATE TABLE idea_cpm
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    cpm INTEGER,
    cpm_ok INTEGER,
    target_date DATETIME,
    position_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# op_log
# -----------------------------------------------------------------------
drop table if exists op_log;

CREATE TABLE op_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    target VARCHAR(255),
    description VARCHAR(255),
    log_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# delay
# -----------------------------------------------------------------------
drop table if exists delay;

CREATE TABLE delay
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_time_id INTEGER NOT NULL,
    delayTime DATETIME,
    delayCpm INTEGER,
    cpm INTEGER,
    delayType INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# customer
# -----------------------------------------------------------------------
drop table if exists customer;

CREATE TABLE customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    agent_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    system_user VARCHAR(255),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    country VARCHAR(100),
    province VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    postcode VARCHAR(30),
    website VARCHAR(100),
    ip VARCHAR(255),
    user_type_id INTEGER,
    user_sub_type_id INTEGER,
    level VARCHAR(100),
    money INTEGER,
    money_confirm INTEGER,
    orders INTEGER,
    isRegister INTEGER,
    province_id VARCHAR(100),
    crm_company_id_01 INTEGER,
    crm_company_id_02 INTEGER,
    crm_company_id_03 INTEGER,
    new_customer_info INTEGER,
    first_order_sign_date DATETIME,
    f_customer_company_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# user_type
# -----------------------------------------------------------------------
drop table if exists user_type;

CREATE TABLE user_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# user_sub_type
# -----------------------------------------------------------------------
drop table if exists user_sub_type;

CREATE TABLE user_sub_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    user_type_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# customer_info
# -----------------------------------------------------------------------
drop table if exists customer_info;

CREATE TABLE customer_info
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    province VARCHAR(25),
    salse_name VARCHAR(250) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# info_ip
# -----------------------------------------------------------------------
drop table if exists info_ip;

CREATE TABLE info_ip
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    customer_info_id INTEGER,
    ip VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# copyright_youkuUser
# -----------------------------------------------------------------------
drop table if exists copyright_youkuUser;

CREATE TABLE copyright_youkuUser
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    vid VARCHAR(100) NOT NULL,
    name VARCHAR(255),
    url VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    youkuUser_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# history_access
# -----------------------------------------------------------------------
drop table if exists history_access;

CREATE TABLE history_access
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    day INTEGER default 1 NOT NULL,
    access_times INTEGER default 0 NOT NULL,
    adtype_id INTEGER default 1 NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_display
# -----------------------------------------------------------------------
drop table if exists register_display;

CREATE TABLE register_display
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    cpm INTEGER,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    temporary INTEGER default 0,
    isClone INTEGER default 0 NOT NULL,
    sale_type INTEGER default 0 NOT NULL,
    product_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_video
# -----------------------------------------------------------------------
drop table if exists register_video;

CREATE TABLE register_video
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    cpm INTEGER,
    adtype_id INTEGER NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    valf INTEGER default 0,
    valb INTEGER default 0,
    valm INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_nonstandard
# -----------------------------------------------------------------------
drop table if exists register_nonstandard;

CREATE TABLE register_nonstandard
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    money INTEGER,
    cpm INTEGER default 1,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    discount VARCHAR(255),
    isClone INTEGER default 0 NOT NULL,
    sale_type INTEGER default 0 NOT NULL,
    product_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# frame_order
# -----------------------------------------------------------------------
drop table if exists frame_order;

CREATE TABLE frame_order
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    p_id INTEGER,
    order_number VARCHAR(255),
    start_date DATETIME,
    end_date DATETIME,
    money VARCHAR(255),
    f_order_sign DATETIME,
    agent_id INTEGER,
    f_order_back VARCHAR(255),
    order_direct_salsename VARCHAR(255),
    order_channel_salsename VARCHAR(255),
    f_yongyou_id VARCHAR(255),
    youku_company VARCHAR(250),
    company VARCHAR(250),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# discount
# -----------------------------------------------------------------------
drop table if exists discount;

CREATE TABLE discount
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    ad_order_id INTEGER NOT NULL,
    position_id INTEGER NOT NULL,
    discount VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_display
# -----------------------------------------------------------------------
drop table if exists order_display;

CREATE TABLE order_display
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_video
# -----------------------------------------------------------------------
drop table if exists order_video;

CREATE TABLE order_video
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    adtype_id INTEGER NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    status INTEGER default 1,
    quotation_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_type
# -----------------------------------------------------------------------
drop table if exists order_type;

CREATE TABLE order_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_sub_type
# -----------------------------------------------------------------------
drop table if exists order_sub_type;

CREATE TABLE order_sub_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    order_type_id INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# quotation
# -----------------------------------------------------------------------
drop table if exists quotation;

CREATE TABLE quotation
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    code VARCHAR(250),
    page VARCHAR(250),
    position VARCHAR(250),
    show_type VARCHAR(250),
    unit VARCHAR(250),
    unit_price VARCHAR(250),
    file_type VARCHAR(250),
    file_width_height VARCHAR(250),
    file_size VARCHAR(250),
    description VARCHAR(255),
    version VARCHAR(255),
    quotation_type VARCHAR(255),
    video_type VARCHAR(255),
    standby1 VARCHAR(255),
    standby2 VARCHAR(255),
    standby3 VARCHAR(255),
    price_type INTEGER default -1 NOT NULL,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# discount_display
# -----------------------------------------------------------------------
drop table if exists discount_display;

CREATE TABLE discount_display
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    position_id INTEGER NOT NULL,
    discount VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# discount_video
# -----------------------------------------------------------------------
drop table if exists discount_video;

CREATE TABLE discount_video
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    adtype_id INTEGER NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    discount VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# price_video
# -----------------------------------------------------------------------
drop table if exists price_video;

CREATE TABLE price_video
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    adtype_id INTEGER NOT NULL,
    quotation_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_status
# -----------------------------------------------------------------------
drop table if exists order_status;

CREATE TABLE order_status
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    status VARCHAR(255) NOT NULL,
    status_type VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# status_permit
# -----------------------------------------------------------------------
drop table if exists status_permit;

CREATE TABLE status_permit
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    status_id INTEGER NOT NULL,
    next_status_id INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_action_type
# -----------------------------------------------------------------------
drop table if exists crm_action_type;

CREATE TABLE crm_action_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_action
# -----------------------------------------------------------------------
drop table if exists crm_action;

CREATE TABLE crm_action
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    crm_action_type_id INTEGER NOT NULL,
    status VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_team
# -----------------------------------------------------------------------
drop table if exists crm_team;

CREATE TABLE crm_team
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    type VARCHAR(255),
    status VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_contact
# -----------------------------------------------------------------------
drop table if exists crm_contact;

CREATE TABLE crm_contact
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    customer_id INTEGER,
    agent_id INTEGER,
    name VARCHAR(255),
    gender VARCHAR(255),
    age VARCHAR(255),
    dept VARCHAR(255),
    title VARCHAR(255),
    tel VARCHAR(255),
    mobile VARCHAR(255),
    email VARCHAR(255),
    msn VARCHAR(255),
    qq VARCHAR(255),
    status VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_agent_customer
# -----------------------------------------------------------------------
drop table if exists crm_agent_customer;

CREATE TABLE crm_agent_customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    customer_id INTEGER NOT NULL,
    agent_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_user_agent
# -----------------------------------------------------------------------
drop table if exists crm_user_agent;

CREATE TABLE crm_user_agent
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    agent_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_user_customer
# -----------------------------------------------------------------------
drop table if exists crm_user_customer;

CREATE TABLE crm_user_customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_brief
# -----------------------------------------------------------------------
drop table if exists crm_brief;

CREATE TABLE crm_brief
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    amount INTEGER,
    schedule VARCHAR(255),
    probability VARCHAR(255),
    probability_real INTEGER,
    start_date DATETIME,
    end_date DATETIME,
    input_start_date DATETIME,
    input_end_date DATETIME,
    create_date DATETIME,
    update_date DATETIME,
    level INTEGER,
    description VARCHAR(255),
    status VARCHAR(255),
    customer_id INTEGER,
    agent_id INTEGER,
    order_direct_id INTEGER,
    order_channel_id INTEGER,
    user_id INTEGER,
    remark VARCHAR(255),
    ok_date DATETIME,
    ok_week INTEGER,
    ok_show VARCHAR(255),
    fee VARCHAR(255),
    q_rev INTEGER,
    current_q VARCHAR(255),
    approve_user_id INTEGER,
    approve_remark VARCHAR(255),
    contract_no VARCHAR(255),
    contract_data DATETIME,
    contract_data_ok_show VARCHAR(255),
    contract_category VARCHAR(255),
    order_direct_id_02 INTEGER,
    order_channel_id_02 INTEGER,
    contract_year VARCHAR(255),
    contract_quarter VARCHAR(255),
    order_direct_leader_id_01 INTEGER,
    order_direct_leader_id_02 INTEGER,
    order_direct_leader_id_03 INTEGER,
    order_channel_leader_id_01 INTEGER,
    order_channel_leader_id_02 INTEGER,
    contract_project VARCHAR(255),
    contract_desc MEDIUMTEXT,
    week VARCHAR(255),
    week_date DATETIME,
    week_approve_user_id INTEGER,
    other MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_diary
# -----------------------------------------------------------------------
drop table if exists crm_diary;

CREATE TABLE crm_diary
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    agent_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    create_date DATETIME,
    description MEDIUMTEXT,
    update_date DATETIME,
    diary_approve_remark MEDIUMTEXT,
    diary_approve_remark_date DATETIME,
    diary_approve_user_id INTEGER,
    other MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_diary_brief
# -----------------------------------------------------------------------
drop table if exists crm_diary_brief;

CREATE TABLE crm_diary_brief
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_diary_id INTEGER NOT NULL,
    crm_brief_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_diary_customer
# -----------------------------------------------------------------------
drop table if exists crm_diary_customer;

CREATE TABLE crm_diary_customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_diary_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_diary_contact
# -----------------------------------------------------------------------
drop table if exists crm_diary_contact;

CREATE TABLE crm_diary_contact
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_diary_id INTEGER NOT NULL,
    crm_contact_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_diary_action
# -----------------------------------------------------------------------
drop table if exists crm_diary_action;

CREATE TABLE crm_diary_action
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_diary_id INTEGER NOT NULL,
    crm_action_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_user_user
# -----------------------------------------------------------------------
drop table if exists crm_user_user;

CREATE TABLE crm_user_user
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    salse_user_id INTEGER NOT NULL,
    charge_user_id INTEGER NOT NULL,
    sequence VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_chargeUser_agent
# -----------------------------------------------------------------------
drop table if exists crm_chargeUser_agent;

CREATE TABLE crm_chargeUser_agent
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    agent_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_chargeUser_customer
# -----------------------------------------------------------------------
drop table if exists crm_chargeUser_customer;

CREATE TABLE crm_chargeUser_customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_brief_log
# -----------------------------------------------------------------------
drop table if exists crm_brief_log;

CREATE TABLE crm_brief_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_brief_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    edit_date DATETIME,
    body MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# position_quotation
# -----------------------------------------------------------------------
drop table if exists position_quotation;

CREATE TABLE position_quotation
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    position_id INTEGER NOT NULL,
    quotation_id INTEGER NOT NULL,
    version VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# frame_order_feeback
# -----------------------------------------------------------------------
drop table if exists frame_order_feeback;

CREATE TABLE frame_order_feeback
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    frame_order_id INTEGER NOT NULL,
    money_min INTEGER,
    money_max INTEGER,
    percent VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# pre_confirm_adorder
# -----------------------------------------------------------------------
drop table if exists pre_confirm_adorder;

CREATE TABLE pre_confirm_adorder
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    money INTEGER,
    pre_confirm_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# confirm_adorder
# -----------------------------------------------------------------------
drop table if exists confirm_adorder;

CREATE TABLE confirm_adorder
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    money INTEGER,
    confirm_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# fee_adorder
# -----------------------------------------------------------------------
drop table if exists fee_adorder;

CREATE TABLE fee_adorder
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    fee VARCHAR(255),
    create_date DATETIME,
    user VARCHAR(255),
    status VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# preview_url
# -----------------------------------------------------------------------
drop table if exists preview_url;

CREATE TABLE preview_url
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    url VARCHAR(255),
    channel_name VARCHAR(255),
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# income_adorder
# -----------------------------------------------------------------------
drop table if exists income_adorder;

CREATE TABLE income_adorder
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    money INTEGER,
    income_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# invoice_adorder
# -----------------------------------------------------------------------
drop table if exists invoice_adorder;

CREATE TABLE invoice_adorder
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    money INTEGER,
    invoice_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_customer_company
# -----------------------------------------------------------------------
drop table if exists f_customer_company;

CREATE TABLE f_customer_company
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    credit_rating VARCHAR(100),
    credit_limit INTEGER,
    period INTEGER,
    credit_start_date DATETIME,
    credit_end_date DATETIME,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_customer_company_credit
# -----------------------------------------------------------------------
drop table if exists f_customer_company_credit;

CREATE TABLE f_customer_company_credit
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    credit_limit INTEGER,
    credit_start_date DATETIME,
    credit_end_date DATETIME,
    cur_credit VARCHAR(1),
    create_date DATETIME,
    user_id INTEGER,
    f_customer_company_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_customer_company_credit_totalizer
# -----------------------------------------------------------------------
drop table if exists f_customer_company_credit_totalizer;

CREATE TABLE f_customer_company_credit_totalizer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    type VARCHAR(1),
    credit_limit INTEGER,
    credit_start_date DATETIME,
    credit_end_date DATETIME,
    create_date DATETIME,
    user_id INTEGER,
    f_customer_company_credit_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_customer
# -----------------------------------------------------------------------
drop table if exists f_customer;

CREATE TABLE f_customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    fullname VARCHAR(255),
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    system_user VARCHAR(255),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    country VARCHAR(100),
    province VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    postcode VARCHAR(30),
    website VARCHAR(100),
    ip VARCHAR(255),
    user_type_id INTEGER,
    user_sub_type_id INTEGER,
    level VARCHAR(100),
    f_customer_company_id INTEGER,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_customer_payment
# -----------------------------------------------------------------------
drop table if exists f_customer_payment;

CREATE TABLE f_customer_payment
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    postcode VARCHAR(255),
    linkman VARCHAR(255),
    phone VARCHAR(255),
    fax VARCHAR(255),
    f_customer_id INTEGER,
    create_date DATETIME,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_agent_company
# -----------------------------------------------------------------------
drop table if exists f_agent_company;

CREATE TABLE f_agent_company
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    credit_rating VARCHAR(100),
    credit_limit INTEGER,
    period INTEGER,
    credit_start_date DATETIME,
    credit_end_date DATETIME,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_agent_company_credit
# -----------------------------------------------------------------------
drop table if exists f_agent_company_credit;

CREATE TABLE f_agent_company_credit
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    credit_limit INTEGER,
    credit_start_date DATETIME,
    credit_end_date DATETIME,
    cur_credit VARCHAR(1),
    create_date DATETIME,
    user_id INTEGER,
    f_agent_company_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_agent_company_credit_totalizer
# -----------------------------------------------------------------------
drop table if exists f_agent_company_credit_totalizer;

CREATE TABLE f_agent_company_credit_totalizer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    type VARCHAR(1),
    credit_limit INTEGER,
    credit_start_date DATETIME,
    credit_end_date DATETIME,
    create_date DATETIME,
    user_id INTEGER,
    f_agent_company_credit_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_agent
# -----------------------------------------------------------------------
drop table if exists f_agent;

CREATE TABLE f_agent
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    fullname VARCHAR(255),
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    system_user VARCHAR(255),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    f_agent_company_id INTEGER,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_agent_payment
# -----------------------------------------------------------------------
drop table if exists f_agent_payment;

CREATE TABLE f_agent_payment
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    postcode VARCHAR(255),
    linkman VARCHAR(255),
    phone VARCHAR(255),
    fax VARCHAR(255),
    f_agent_id INTEGER,
    create_date DATETIME,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# f_user_type
# -----------------------------------------------------------------------
drop table if exists f_user_type;

CREATE TABLE f_user_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# report_cache
# -----------------------------------------------------------------------
drop table if exists report_cache;

CREATE TABLE report_cache
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    insert_date DATETIME,
    high_class INTEGER,
    customer_class INTEGER default 0,
    user_class INTEGER default 0,
    video_type INTEGER default 0,
    access_times INTEGER default 0,
    show_times INTEGER default 0,
    click_times INTEGER default 0,
    sale_percent VARCHAR(255),
    CTR VARCHAR(255),
    video_length INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# report_cache_channel
# -----------------------------------------------------------------------
drop table if exists report_cache_channel;

CREATE TABLE report_cache_channel
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    insert_date DATETIME,
    high_class INTEGER,
    customer_class INTEGER default 0,
    user_class INTEGER default 0,
    video_type INTEGER default 0,
    access_times INTEGER default 0,
    show_times INTEGER default 0,
    click_times INTEGER default 0,
    sale_percent VARCHAR(255),
    CTR VARCHAR(255),
    video_length INTEGER default 0,
    channel_id VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# history_ad_order
# -----------------------------------------------------------------------
drop table if exists history_ad_order;

CREATE TABLE history_ad_order
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    insert_date DATETIME,
    percent INTEGER,
    status VARCHAR(255) NOT NULL,
    status2 VARCHAR(255),
    status3 VARCHAR(255),
    status4 VARCHAR(255) default '-1',
    order_type VARCHAR(100),
    order_sub_type VARCHAR(100),
    order_status VARCHAR(100),
    order_number_temp VARCHAR(255),
    order_number VARCHAR(255),
    order_brand VARCHAR(255),
    order_product VARCHAR(255),
    order_agent VARCHAR(255),
    cpm INTEGER default 0,
    order_direct_salsename VARCHAR(255),
    order_direct_salsephone VARCHAR(255),
    order_channel_salsename VARCHAR(255),
    order_channel_salsephone VARCHAR(255),
    order_ae_name VARCHAR(255),
    order_ae_phone VARCHAR(255),
    quotation_version VARCHAR(255),
    build_user VARCHAR(255),
    agent_id INTEGER,
    start_date DATETIME,
    end_date DATETIME,
    frame_order_id INTEGER NOT NULL,
    money INTEGER,
    discount VARCHAR(255),
    f_order_back VARCHAR(255),
    f_money_confirm INTEGER,
    f_invoice INTEGER,
    f_back_invoice INTEGER,
    f_order_sign DATETIME,
    f_abstract VARCHAR(255),
    f_yongyou_id VARCHAR(255),
    f_fee VARCHAR(255),
    f_income INTEGER,
    f_customer_id INTEGER,
    f_agent_id INTEGER,
    f_user_type_id INTEGER,
    f_youku_company VARCHAR(255),
    f_money_pre_confirm INTEGER,
    order_template VARCHAR(100),
    modifiable INTEGER,
    action_description VARCHAR(2000),
    order_executor_id INTEGER default -1,
    history_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# history_register_display
# -----------------------------------------------------------------------
drop table if exists history_register_display;

CREATE TABLE history_register_display
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    cpm INTEGER,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    history_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# history_register_video
# -----------------------------------------------------------------------
drop table if exists history_register_video;

CREATE TABLE history_register_video
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    cpm INTEGER,
    adtype_id INTEGER NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    history_date DATETIME,
    valf INTEGER default 0,
    valb INTEGER default 0,
    valm INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_balance
# -----------------------------------------------------------------------
drop table if exists order_balance;

CREATE TABLE order_balance
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    balance_date DATETIME,
    year INTEGER,
    month INTEGER,
    balance INTEGER,
    balance_total INTEGER,
    balance_confirm INTEGER,
    balance_total_confirm INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# video_group
# -----------------------------------------------------------------------
drop table if exists video_group;

CREATE TABLE video_group
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    cms_id VARCHAR(255),
    cms_id2 VARCHAR(255),
    vid_list MEDIUMTEXT,
    play_list MEDIUMTEXT,
    description VARCHAR(255),
    expire_date DATETIME,
    groupType INTEGER default 0,
    groupStatus INTEGER default 0,
    groupCpm BIGINT default 0,
    vid MEDIUMTEXT,
    video_group_id MEDIUMTEXT,
    protect_f INTEGER default 0,
    protect_b INTEGER default 0,
    protect_p INTEGER default 0,
    protect_o INTEGER default 0,
    protect_c INTEGER default 0,
    protect_h INTEGER default 0,
    protect_vhtml INTEGER default 0,
    playid BIGINT default 0,
    playtype VARCHAR(250),
    register_status INTEGER default 1,
    site INTEGER default 1,
    play_source INTEGER default 1,
    tudou_url_list MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_video_group
# -----------------------------------------------------------------------
drop table if exists cast_video_group;

CREATE TABLE cast_video_group
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    video_group_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# click_ini
# -----------------------------------------------------------------------
drop table if exists click_ini;

CREATE TABLE click_ini
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    cast_name VARCHAR(255),
    click INTEGER default 0,
    level INTEGER default 100,
    target_date DATETIME NOT NULL,
    description VARCHAR(255),
    f1 VARCHAR(255),
    f2 VARCHAR(255),
    f3 VARCHAR(255),
    f4 VARCHAR(255),
    f5 VARCHAR(255),
    f6 DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# click_log
# -----------------------------------------------------------------------
drop table if exists click_log;

CREATE TABLE click_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    click INTEGER default 0,
    target_date DATETIME NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea_mask
# -----------------------------------------------------------------------
drop table if exists idea_mask;

CREATE TABLE idea_mask
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    target_date DATETIME NOT NULL,
    idea_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# iresearch_display
# -----------------------------------------------------------------------
drop table if exists iresearch_display;

CREATE TABLE iresearch_display
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    log_date DATETIME NOT NULL,
    customer_count INTEGER NOT NULL,
    cast_count INTEGER NOT NULL,
    idea_count INTEGER NOT NULL,
    mask_count INTEGER NOT NULL,
    pub_fee INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_company
# -----------------------------------------------------------------------
drop table if exists crm_company;

CREATE TABLE crm_company
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    pid INTEGER default -1 NOT NULL,
    level INTEGER NOT NULL,
    company_type INTEGER default 1,
    description VARCHAR(255),
    user_type_id INTEGER,
    user_sub_type_id INTEGER,
    company_level VARCHAR(100),
    area VARCHAR(100),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# count_ini
# -----------------------------------------------------------------------
drop table if exists count_ini;

CREATE TABLE count_ini
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    type VARCHAR(255),
    url VARCHAR(1000),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# company_income
# -----------------------------------------------------------------------
drop table if exists company_income;

CREATE TABLE company_income
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    company_id INTEGER NOT NULL,
    year INTEGER NOT NULL,
    money INTEGER,
    money_confirm INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# isp
# -----------------------------------------------------------------------
drop table if exists isp;

CREATE TABLE isp
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# isp_ip
# -----------------------------------------------------------------------
drop table if exists isp_ip;

CREATE TABLE isp_ip
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    isp_id INTEGER NOT NULL,
    ip VARCHAR(255) NOT NULL,
    mask VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_isp
# -----------------------------------------------------------------------
drop table if exists cast_isp;

CREATE TABLE cast_isp
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    isp_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_agent
# -----------------------------------------------------------------------
drop table if exists crm_agent;

CREATE TABLE crm_agent
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    system_user VARCHAR(255),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    level VARCHAR(100),
    agent_type VARCHAR(100),
    company_type VARCHAR(100),
    money INTEGER,
    money_confirm INTEGER,
    orders INTEGER,
    province VARCHAR(100),
    isRegister INTEGER,
    province_id VARCHAR(100),
    city_id VARCHAR(100),
    crm_company_id_01 INTEGER,
    crm_company_id_02 INTEGER,
    crm_company_id_03 INTEGER,
    user_id INTEGER,
    approve VARCHAR(1) NOT NULL,
    approve_user_id INTEGER,
    approve_remark VARCHAR(255),
    approve_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer
# -----------------------------------------------------------------------
drop table if exists crm_customer;

CREATE TABLE crm_customer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    agent_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    system_user VARCHAR(255),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    country VARCHAR(100),
    province VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    postcode VARCHAR(30),
    website VARCHAR(100),
    ip VARCHAR(255),
    user_type_id INTEGER,
    user_sub_type_id INTEGER,
    level VARCHAR(100),
    money INTEGER,
    money_confirm INTEGER,
    orders INTEGER,
    isRegister INTEGER,
    province_id VARCHAR(100),
    crm_company_id_01 INTEGER,
    crm_company_id_02 INTEGER,
    crm_company_id_03 INTEGER,
    user_id INTEGER,
    approve VARCHAR(1) NOT NULL,
    approve_user_id INTEGER,
    approve_remark VARCHAR(255),
    approve_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_news
# -----------------------------------------------------------------------
drop table if exists crm_news;

CREATE TABLE crm_news
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(255),
    link VARCHAR(255),
    priority INTEGER NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    create_date DATETIME,
    update_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_dictionary
# -----------------------------------------------------------------------
drop table if exists crm_dictionary;

CREATE TABLE crm_dictionary
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    value VARCHAR(255),
    code VARCHAR(255),
    remark VARCHAR(255),
    create_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_vote
# -----------------------------------------------------------------------
drop table if exists crm_vote;

CREATE TABLE crm_vote
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    subject VARCHAR(255) NOT NULL,
    create_date DATETIME,
    cur_vote VARCHAR(1),
    remark VARCHAR(255),
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_vote_answer
# -----------------------------------------------------------------------
drop table if exists crm_vote_answer;

CREATE TABLE crm_vote_answer
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    answer VARCHAR(255) NOT NULL,
    answer_sign VARCHAR(255),
    total INTEGER,
    vote_id INTEGER,
    update_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_login_logs
# -----------------------------------------------------------------------
drop table if exists crm_login_logs;

CREATE TABLE crm_login_logs
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    eventType VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_app_logs
# -----------------------------------------------------------------------
drop table if exists crm_app_logs;

CREATE TABLE crm_app_logs
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    eventType VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_pms
# -----------------------------------------------------------------------
drop table if exists crm_pms;

CREATE TABLE crm_pms
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    from_user VARCHAR(255) NOT NULL,
    from_id INTEGER NOT NULL,
    to_id INTEGER NOT NULL,
    drafts INTEGER default 0 NOT NULL,
    news INTEGER default 0 NOT NULL,
    title VARCHAR(1000) NOT NULL,
    message VARCHAR(2000) NOT NULL,
    message_date DATETIME NOT NULL,
    delstatus INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order
# -----------------------------------------------------------------------
drop table if exists crm_order;

CREATE TABLE crm_order
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    frontlog_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    customer_id INTEGER,
    agent_id INTEGER,
    f_agent_payment_id INTEGER,
    f_customer_payment_id INTEGER,
    name VARCHAR(255),
    description MEDIUMTEXT,
    money_decimal BIGINT,
    money INTEGER,
    type VARCHAR(100),
    order_type VARCHAR(100),
    schedule_file VARCHAR(100),
    nonstandard_contract_file VARCHAR(100),
    framework_contract_file VARCHAR(100),
    order_number_temp VARCHAR(255),
    order_number VARCHAR(255),
    start_date DATETIME,
    end_date DATETIME,
    execute_start_date DATETIME,
    execute_end_date DATETIME,
    user_id INTEGER,
    create_date DATETIME,
    update_date DATETIME,
    approve_date DATETIME,
    cancel_date DATETIME,
    confirm_date DATETIME,
    is_print VARCHAR(1),
    express_delivery VARCHAR(100),
    lawyer_approve_status VARCHAR(1),
    is_direct VARCHAR(1),
    is_lawyer_approve_status VARCHAR(1),
    is_vp_approve_status VARCHAR(1),
    is_super_vp_approve_status VARCHAR(1),
    is_account_approve_status INTEGER default 1,
    order_status VARCHAR(10) NOT NULL,
    offline_status INTEGER default 5,
    isoffline INTEGER default 0,
    cursor_approve_status VARCHAR(10) NOT NULL,
    approve_status VARCHAR(10) NOT NULL,
    contract_first_party VARCHAR(255),
    contract_fp_address VARCHAR(255),
    contract_fp_postcode VARCHAR(255),
    contract_fp_linkman VARCHAR(255),
    contract_fp_phone VARCHAR(255),
    contract_fp_fax VARCHAR(255),
    contract_fp_representative VARCHAR(255),
    contract_fp_sign_date DATETIME,
    contract_fp_person VARCHAR(255),
    contract_fp_person_phone VARCHAR(255),
    contract_second_party VARCHAR(255),
    contract_sp_address VARCHAR(255),
    contract_sp_postcode VARCHAR(255),
    contract_sp_linkman VARCHAR(255),
    contract_sp_phone VARCHAR(255),
    contract_sp_fax VARCHAR(255),
    contract_sp_representative VARCHAR(255),
    contract_sp_sign_date DATETIME,
    contract_sp_person VARCHAR(255),
    contract_sp_person_phone VARCHAR(255),
    contract_account_name VARCHAR(255),
    contract_account_bank VARCHAR(255),
    contract_account_number VARCHAR(255),
    contract_start_date DATETIME,
    contract_end_date DATETIME,
    registration_insert_date DATETIME,
    registration_superintendent VARCHAR(255),
    registration_agent_name VARCHAR(255),
    registration_agent_group_name VARCHAR(255),
    registration_agent_sub_name VARCHAR(255),
    registration_agent_bus_name VARCHAR(255),
    registration_customer_name VARCHAR(255),
    registration_customer_group_name VARCHAR(255),
    registration_customer_sub_name VARCHAR(255),
    registration_customer_bus_name VARCHAR(255),
    registration_soft_resource_total_money INTEGER,
    registration_money INTEGER,
    registration_dispatching VARCHAR(255),
    registration_discount VARCHAR(255),
    registration_conventionality_seed VARCHAR(2),
    registration_conventionality_paster VARCHAR(2),
    registration_conventionality_stop VARCHAR(2),
    registration_conventionality_five VARCHAR(2),
    registration_conventionality_theatre VARCHAR(2),
    registration_conventionality_crazy VARCHAR(2),
    registration_conventionality_image VARCHAR(2),
    registration_conventionality_text VARCHAR(2),
    registration_unconventionality_logo VARCHAR(2),
    registration_unconventionality_channel VARCHAR(2),
    registration_unconventionality_special VARCHAR(2),
    registration_unconventionality_topic VARCHAR(2),
    registration_unconventionality_subject VARCHAR(2),
    registration_unconventionality_extend VARCHAR(2),
    registration_unconventionality_cooperate VARCHAR(2),
    registration_unconventionality_cover VARCHAR(2),
    registration_unconventionality_pr VARCHAR(2),
    registration_unconventionality_direct VARCHAR(2),
    registration_unconventionality_api VARCHAR(2),
    registration_unconventionality_server VARCHAR(2),
    registration_unconventionality_other VARCHAR(2),
    registration_unconventionality_other_desc VARCHAR(255),
    registration_operating_comment VARCHAR(2),
    registration_operating_comment_outsourcing VARCHAR(2),
    registration_operating_comment_outsourcing_desc VARCHAR(255),
    registration_operating_register VARCHAR(2),
    registration_operating_register_outsourcing VARCHAR(2),
    registration_operating_register_outsourcing_desc VARCHAR(255),
    registration_operating_posts VARCHAR(2),
    registration_operating_posts_outsourcing VARCHAR(2),
    registration_operating_posts_outsourcing_desc VARCHAR(255),
    registration_operating_play VARCHAR(2),
    registration_operating_play_outsourcing VARCHAR(2),
    registration_operating_play_outsourcing_desc VARCHAR(255),
    registration_operating_site VARCHAR(2),
    registration_operating_site_outsourcing VARCHAR(2),
    registration_operating_site_outsourcing_desc VARCHAR(255),
    registration_operating_other VARCHAR(2),
    registration_operating_other_desc VARCHAR(255),
    registration_fee_original VARCHAR(2),
    registration_fee_original_impulse VARCHAR(2),
    registration_fee_original_impulse_price INTEGER,
    registration_fee_original_impulse_count INTEGER,
    registration_fee_original_original VARCHAR(2),
    registration_fee_original_original_price INTEGER,
    registration_fee_original_original_count INTEGER,
    registration_fee_original_money INTEGER,
    registration_fee_capture VARCHAR(2),
    registration_fee_capture_primate_cities INTEGER,
    registration_fee_capture_primate_cities_price INTEGER,
    registration_fee_capture_other_cities INTEGER,
    registration_fee_capture_other_cities_price INTEGER,
    registration_fee_capture_money INTEGER,
    registration_fee_design VARCHAR(2),
    registration_fee_design_minisite_tech VARCHAR(2),
    registration_fee_design_minisite_design VARCHAR(2),
    registration_fee_design_ad VARCHAR(2),
    registration_fee_design_other VARCHAR(2),
    registration_fee_design_other_desc VARCHAR(255),
    registration_fee_design_money INTEGER,
    registration_fee_total INTEGER,
    registration_desc MEDIUMTEXT,
    direct_user_id_01 INTEGER,
    direct_user_id_01_leader_id_01 INTEGER,
    direct_user_id_01_leader_id_02 INTEGER,
    direct_user_id_01_leader_id_03 INTEGER,
    direct_user_id_02 INTEGER,
    direct_user_id_02_leader_id_01 INTEGER,
    direct_user_id_02_leader_id_02 INTEGER,
    direct_user_id_02_leader_id_03 INTEGER,
    channel_user_id_01 INTEGER,
    channel_user_id_01_leader_id_01 INTEGER,
    channel_user_id_01_leader_id_03 INTEGER,
    channel_user_id_02 INTEGER,
    channel_user_id_02_leader_id_01 INTEGER,
    channel_user_id_02_leader_id_03 INTEGER,
    ae_user_id INTEGER,
    tp_user_id INTEGER,
    parentid INTEGER,
    team_leader_sign VARCHAR(255),
    team_leader_sign_date DATETIME,
    resources_sign VARCHAR(255),
    resources_sign_date DATETIME,
    vp_sign VARCHAR(255),
    vp_sign_date DATETIME,
    lawyer_sign VARCHAR(255),
    lawyer_sign_date DATETIME,
    finance_sign VARCHAR(255),
    finance_sign_date DATETIME,
    other_sign VARCHAR(255),
    other_sign_date DATETIME,
    special_unlock_request INTEGER default 0,
    is_full_schedule INTEGER,
    contract_monitor_type INTEGER,
    contract_monitor_name VARCHAR(255),
    contract_monitor_day VARCHAR(255),
    contract_monitor_count_day VARCHAR(255),
    new_customer_id INTEGER,
    customer_industry_id INTEGER,
    customer_category_id INTEGER,
    customer_brand_id INTEGER,
    crm_customer_product_id INTEGER,
    iskpi INTEGER,
    needmonitor INTEGER,
    isframe INTEGER,
    ispacksale INTEGER,
    isneedprint INTEGER,
    isonlytheater INTEGER,
    isonlyvideo INTEGER,
    isonlynormal INTEGER,
    isonlyayouku INTEGER,
    isonlyactive INTEGER,
    isonlyacase INTEGER,
    isallflight INTEGER,
    isonlyapi INTEGER,
    onlytheatername VARCHAR(255),
    product_theater_fee INTEGER,
    product_video_fee INTEGER,
    product_normal_fee INTEGER,
    product_youku_fee INTEGER,
    product_active_fee INTEGER,
    product_case_fee INTEGER,
    product_flight_fee INTEGER,
    product_api_fee INTEGER,
    order_version INTEGER,
    order_subversion INTEGER,
    customer_frame_number VARCHAR(255),
    agent_frame_number VARCHAR(255),
    complete_confirm_letter INTEGER default 0,
    complete_confirm_comment VARCHAR(255),
    giftnum VARCHAR(255),
    vediofee VARCHAR(255),
    notvediofee VARCHAR(255),
    ischeck INTEGER default 0,
    direct_money INTEGER default 0,
    direct_second_money INTEGER default 0,
    channel_money INTEGER default 0,
    channel_second_money INTEGER default 0,
    sign_date DATETIME,
    need_resource_check_approve INTEGER default 0,
    contract_back_status INTEGER default 0,
    back_order_version INTEGER,
    back_order_subversion INTEGER,
    contract_hylz_relation_url VARCHAR(255),
    contract_hylz_monitor_name VARCHAR(255),
    contract_hylz_pay_limit_workdays INTEGER,
    contract_qy_pay_limit_workdays INTEGER,
    contract_qy_pay_deadline_workdays INTEGER,
    contract_qy_sign_city INTEGER default 1,
    contract_limit_days INTEGER,
    sale_area1 VARCHAR(45),
    sale_area2 VARCHAR(45),
    sale_area3 VARCHAR(45),
    sale_area4 VARCHAR(45),
    sale_area5 VARCHAR(45),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_user
# -----------------------------------------------------------------------
drop table if exists crm_order_user;

CREATE TABLE crm_order_user
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    user_type VARCHAR(45) NOT NULL,
    sale_group VARCHAR(45) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_kpi
# -----------------------------------------------------------------------
drop table if exists crm_order_kpi;

CREATE TABLE crm_order_kpi
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    name VARCHAR(255),
    standard VARCHAR(255),
    type INTEGER,
    other_name VARCHAR(255),
    remark VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_schedule_attachment
# -----------------------------------------------------------------------
drop table if exists crm_order_schedule_attachment;

CREATE TABLE crm_order_schedule_attachment
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    attachment_name VARCHAR(200) NOT NULL,
    attachment_size INTEGER,
    attachment_path VARCHAR(200) NOT NULL,
    crm_order_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_contract_attachment
# -----------------------------------------------------------------------
drop table if exists crm_order_contract_attachment;

CREATE TABLE crm_order_contract_attachment
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    attachment_name VARCHAR(200) NOT NULL,
    attachment_size INTEGER,
    attachment_path VARCHAR(200) NOT NULL,
    crm_order_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_log
# -----------------------------------------------------------------------
drop table if exists crm_order_log;

CREATE TABLE crm_order_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    edit_date DATETIME,
    tip VARCHAR(1),
    body MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_approve_operator
# -----------------------------------------------------------------------
drop table if exists crm_order_approve_operator;

CREATE TABLE crm_order_approve_operator
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    approve_user_id INTEGER NOT NULL,
    approve_step VARCHAR(10),
    approve_date DATETIME,
    approve_remark MEDIUMTEXT,
    approve_status VARCHAR(10),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_advertising_fee
# -----------------------------------------------------------------------
drop table if exists crm_order_advertising_fee;

CREATE TABLE crm_order_advertising_fee
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    customer_id INTEGER,
    customer_name VARCHAR(255),
    collection_date DATETIME,
    money INTEGER,
    money_decimal BIGINT,
    proportion VARCHAR(10),
    remark VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_advertising_fee_income
# -----------------------------------------------------------------------
drop table if exists crm_order_advertising_fee_income;

CREATE TABLE crm_order_advertising_fee_income
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    money INTEGER,
    money_decimal BIGINT,
    income_date DATETIME,
    remark VARCHAR(255),
    ufida_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_notes
# -----------------------------------------------------------------------
drop table if exists crm_notes;

CREATE TABLE crm_notes
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content VARCHAR(2000),
    note_time DATETIME,
    create_date DATETIME,
    update_date DATETIME,
    prop VARCHAR(255),
    user_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_credit
# -----------------------------------------------------------------------
drop table if exists crm_credit;

CREATE TABLE crm_credit
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    f_name VARCHAR(255) NOT NULL,
    type VARCHAR(1),
    money INTEGER,
    confirm_money INTEGER,
    customer_id INTEGER,
    agent_id INTEGER,
    start_date DATETIME,
    end_date DATETIME,
    agent_name VARCHAR(255),
    agent_group_name VARCHAR(255),
    agent_sub_name VARCHAR(255),
    agent_bus_name VARCHAR(255),
    customer_name VARCHAR(255),
    customer_group_name VARCHAR(255),
    customer_sub_name VARCHAR(255),
    customer_bus_name VARCHAR(255),
    description MEDIUMTEXT,
    is_direct VARCHAR(1),
    is_new VARCHAR(1),
    credit_status VARCHAR(10) NOT NULL,
    cursor_approve_status VARCHAR(10) NOT NULL,
    user_id INTEGER,
    create_date DATETIME,
    update_date DATETIME,
    approve_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_credit_approve_operator
# -----------------------------------------------------------------------
drop table if exists crm_credit_approve_operator;

CREATE TABLE crm_credit_approve_operator
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_credit_id INTEGER NOT NULL,
    approve_user_id INTEGER NOT NULL,
    approve_step VARCHAR(10),
    approve_date DATETIME,
    approve_remark MEDIUMTEXT,
    approve_status VARCHAR(10),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blockIni
# -----------------------------------------------------------------------
drop table if exists blockIni;

CREATE TABLE blockIni
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    block_id INTEGER,
    name VARCHAR(255),
    block_tab VARCHAR(255),
    block_name VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blockStat
# -----------------------------------------------------------------------
drop table if exists blockStat;

CREATE TABLE blockStat
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    pv INTEGER,
    times INTEGER,
    click INTEGER,
    ctr INTEGER,
    name VARCHAR(255),
    block_tab VARCHAR(255),
    block_name VARCHAR(255),
    block_id INTEGER,
    isCpm INTEGER default 0,
    isTurn INTEGER default 0,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# campaign
# -----------------------------------------------------------------------
drop table if exists campaign;

CREATE TABLE campaign
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    numlimit INTEGER default 0,
    daylimit INTEGER default 0,
    description VARCHAR(255),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# copyright
# -----------------------------------------------------------------------
drop table if exists copyright;

CREATE TABLE copyright
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    vid BIGINT NOT NULL,
    vname VARCHAR(250),
    uid BIGINT,
    uname VARCHAR(250),
    ct VARCHAR(250),
    cs VARCHAR(250),
    times INTEGER,
    status INTEGER default 0,
    parent_vid BIGINT default 0,
    PRIMARY KEY(id),
    INDEX copyright_status (status),
    INDEX copyright_vid (vid),
    INDEX copyright_parent_vid (parent_vid));


# -----------------------------------------------------------------------
# copyright_user
# -----------------------------------------------------------------------
drop table if exists copyright_user;

CREATE TABLE copyright_user
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    uid BIGINT NOT NULL,
    uname VARCHAR(250),
    status INTEGER default 0,
    PRIMARY KEY(id),
    INDEX copyright_uid (uid));


# -----------------------------------------------------------------------
# point
# -----------------------------------------------------------------------
drop table if exists point;

CREATE TABLE point
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    vid BIGINT NOT NULL,
    playname VARCHAR(250) NOT NULL,
    name VARCHAR(250),
    point VARCHAR(250),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_display_process
# -----------------------------------------------------------------------
drop table if exists register_display_process;

CREATE TABLE register_display_process
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    cpm INTEGER,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_video_process
# -----------------------------------------------------------------------
drop table if exists register_video_process;

CREATE TABLE register_video_process
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    cpm INTEGER,
    adtype_id INTEGER NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# page_capability
# -----------------------------------------------------------------------
drop table if exists page_capability;

CREATE TABLE page_capability
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    page_id INTEGER default 0,
    page_name VARCHAR(250),
    block_id INTEGER default 0,
    block_name VARCHAR(250),
    position_id INTEGER default 0,
    position_name VARCHAR(250),
    logstat_id INTEGER default 0,
    logstat_name VARCHAR(250),
    cpm INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cache_flvUrl
# -----------------------------------------------------------------------
drop table if exists cache_flvUrl;

CREATE TABLE cache_flvUrl
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    html_url VARCHAR(1000),
    f_url VARCHAR(1000),
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cache_playList
# -----------------------------------------------------------------------
drop table if exists cache_playList;

CREATE TABLE cache_playList
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    p_id VARCHAR(255),
    vids MEDIUMTEXT,
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cache_cms
# -----------------------------------------------------------------------
drop table if exists cache_cms;

CREATE TABLE cache_cms
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cms_id VARCHAR(255),
    vids MEDIUMTEXT,
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# tv
# -----------------------------------------------------------------------
drop table if exists tv;

CREATE TABLE tv
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(250) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# play
# -----------------------------------------------------------------------
drop table if exists play;

CREATE TABLE play
(
    id VARCHAR(250) NOT NULL,
    name VARCHAR(250) NOT NULL,
    play_type INTEGER default 1,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# tv_play
# -----------------------------------------------------------------------
drop table if exists tv_play;

CREATE TABLE tv_play
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    tv_id INTEGER,
    play_id VARCHAR(250),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vali_todolist
# -----------------------------------------------------------------------
drop table if exists vali_todolist;

CREATE TABLE vali_todolist
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    url VARCHAR(250) NOT NULL,
    type VARCHAR(250),
    flag INTEGER,
    title VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vali_todovideo
# -----------------------------------------------------------------------
drop table if exists vali_todovideo;

CREATE TABLE vali_todovideo
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    url VARCHAR(250) NOT NULL,
    playlist_name VARCHAR(250),
    title VARCHAR(250),
    image VARCHAR(250),
    vid INTEGER,
    flag INTEGER,
    list_id INTEGER,
    video_type VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vali_pointcut
# -----------------------------------------------------------------------
drop table if exists vali_pointcut;

CREATE TABLE vali_pointcut
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    groupnum INTEGER NOT NULL,
    pointcut VARCHAR(1024) NOT NULL,
    pointcut_more MEDIUMTEXT,
    video_id INTEGER NOT NULL,
    point_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# history_register_nonstandard
# -----------------------------------------------------------------------
drop table if exists history_register_nonstandard;

CREATE TABLE history_register_nonstandard
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    money INTEGER,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    discount VARCHAR(255),
    history_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# html_effect_position_total
# -----------------------------------------------------------------------
drop table if exists html_effect_position_total;

CREATE TABLE html_effect_position_total
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    log_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    block_id INTEGER NOT NULL,
    cast_id VARCHAR(100),
    idea_id VARCHAR(100),
    show_times INTEGER default 0 NOT NULL,
    click_times INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX html_effect_position_total_date (log_date),
    INDEX html_effect_position_total_position_id (position_id),
    INDEX html_effect_position_total_block_id (block_id),
    INDEX html_effect_position_total_cast_id (cast_id),
    INDEX html_effect_position_total_idea_id (idea_id));


# -----------------------------------------------------------------------
# video_effect_total
# -----------------------------------------------------------------------
drop table if exists video_effect_total;

CREATE TABLE video_effect_total
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    log_date DATETIME NOT NULL,
    channel_id VARCHAR(100) NOT NULL,
    cast_id VARCHAR(100),
    idea_id VARCHAR(100),
    video_ad_type INTEGER NOT NULL,
    show_times INTEGER default 0 NOT NULL,
    click_times INTEGER default 0 NOT NULL,
    vf_show_times INTEGER default -1,
    PRIMARY KEY(id),
    INDEX video_effect_total_date (log_date),
    INDEX video_effect_total_channel_id (channel_id),
    INDEX video_effect_total_cast_id (cast_id),
    INDEX video_effect_total_idea_id (idea_id),
    INDEX video_effect_total_video_ad_type (video_ad_type));


# -----------------------------------------------------------------------
# zw_effect_total
# -----------------------------------------------------------------------
drop table if exists zw_effect_total;

CREATE TABLE zw_effect_total
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    log_date DATETIME NOT NULL,
    sub_channel_id VARCHAR(100) NOT NULL,
    cast_id VARCHAR(100),
    idea_id VARCHAR(100),
    video_ad_type INTEGER NOT NULL,
    show_times INTEGER default 0 NOT NULL,
    click_times INTEGER default 0 NOT NULL,
    vf_show_times INTEGER default -1,
    PRIMARY KEY(id),
    INDEX zw_effect_total_date (log_date),
    INDEX zw_effect_total_channel_id (sub_channel_id),
    INDEX zw_effect_total_cast_id (cast_id),
    INDEX zw_effect_total_idea_id (idea_id),
    INDEX zw_effect_total_video_ad_type (video_ad_type));


# -----------------------------------------------------------------------
# play_info
# -----------------------------------------------------------------------
drop table if exists play_info;

CREATE TABLE play_info
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    playname VARCHAR(250),
    playtype VARCHAR(250),
    playvv BIGINT NOT NULL,
    PRIMARY KEY(id),
    INDEX playname (playname),
    INDEX playtype (playtype));


# -----------------------------------------------------------------------
# register_play
# -----------------------------------------------------------------------
drop table if exists register_play;

CREATE TABLE register_play
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    playid BIGINT NOT NULL,
    orderid BIGINT NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    register_status INTEGER default 1,
    confirm_status INTEGER default 1,
    register_type INTEGER default 2,
    cast_position INTEGER default 1,
    cpm INTEGER default 0,
    process_status INTEGER default 0,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_relation_amount
# -----------------------------------------------------------------------
drop table if exists order_relation_amount;

CREATE TABLE order_relation_amount
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    amount_order_id INTEGER NOT NULL,
    sour_order_id INTEGER NOT NULL,
    amount_reason INTEGER default -1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_relation_effect
# -----------------------------------------------------------------------
drop table if exists order_relation_effect;

CREATE TABLE order_relation_effect
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    effect_order_id INTEGER NOT NULL,
    sour_order_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# partner_ad_url
# -----------------------------------------------------------------------
drop table if exists partner_ad_url;

CREATE TABLE partner_ad_url
(
    partner_id VARCHAR(100) NOT NULL,
    partner_name VARCHAR(100) NOT NULL,
    vf_url VARCHAR(255),
    vb_url VARCHAR(255),
    vp_url VARCHAR(255),
    vo_url VARCHAR(255),
    vc_url VARCHAR(255),
    vf_cu VARCHAR(255),
    vb_cu VARCHAR(255),
    vp_cu VARCHAR(255),
    vo_cu VARCHAR(255),
    vc_cu VARCHAR(255),
    bp_url VARCHAR(255),
    show_url VARCHAR(255),
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    status INTEGER NOT NULL,
    PRIMARY KEY(partner_id));


# -----------------------------------------------------------------------
# idea_url
# -----------------------------------------------------------------------
drop table if exists idea_url;

CREATE TABLE idea_url
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    idea_url VARCHAR(255) NOT NULL,
    td_idea_url VARCHAR(255) NOT NULL,
    display_times INTEGER NOT NULL,
    show_url MEDIUMTEXT,
    td_show_url MEDIUMTEXT,
    cmu MEDIUMTEXT,
    td_cmu MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea_kaijitu
# -----------------------------------------------------------------------
drop table if exists idea_kaijitu;

CREATE TABLE idea_kaijitu
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    width INTEGER NOT NULL,
    height INTEGER NOT NULL,
    url VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# idea_cpm_diff
# -----------------------------------------------------------------------
drop table if exists idea_cpm_diff;

CREATE TABLE idea_cpm_diff
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    position_id INTEGER,
    target_date DATETIME,
    target_cpm INTEGER,
    effect_cpm INTEGER,
    diff_cpm INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# auto_makeup_cpm_log
# -----------------------------------------------------------------------
drop table if exists auto_makeup_cpm_log;

CREATE TABLE auto_makeup_cpm_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    position_id INTEGER,
    target_date DATETIME,
    from_cpm INTEGER,
    to_cpm INTEGER,
    op_datetime DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# nielsen_si
# -----------------------------------------------------------------------
drop table if exists nielsen_si;

CREATE TABLE nielsen_si
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    code VARCHAR(255) NOT NULL,
    parentcode VARCHAR(255),
    used INTEGER,
    channelid INTEGER,
    isbig INTEGER,
    url VARCHAR(255),
    ci VARCHAR(255),
    accountid VARCHAR(255),
    sicode VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# nielsen_si_data_log
# -----------------------------------------------------------------------
drop table if exists nielsen_si_data_log;

CREATE TABLE nielsen_si_data_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    code VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    ideaid INTEGER,
    orderid INTEGER,
    cpm INTEGER,
    compare DOUBLE,
    youkucount INTEGER,
    nielsencount INTEGER,
    starttime DATETIME,
    endtime DATETIME,
    createtime DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# nielsen_si_detail
# -----------------------------------------------------------------------
drop table if exists nielsen_si_detail;

CREATE TABLE nielsen_si_detail
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    sicode VARCHAR(255),
    account VARCHAR(255),
    type INTEGER,
    ub INTEGER,
    registerid INTEGER,
    firstname VARCHAR(255),
    secondname VARCHAR(255),
    siid INTEGER,
    password VARCHAR(255),
    creator VARCHAR(255),
    createtime DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vf5_capacity_week
# -----------------------------------------------------------------------
drop table if exists vf5_capacity_week;

CREATE TABLE vf5_capacity_week
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    week INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    channel_id VARCHAR(100),
    subchannel_id VARCHAR(100),
    cpm INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX idx_video_capacity_week_week (week),
    INDEX idx_video_capacity_week_province_id (province_id),
    INDEX idx_video_capacity_week_city_id (city_id),
    INDEX idx_video_capacity_week_channel_id (channel_id),
    INDEX idx_video_capacity_week_subchannel_id (subchannel_id));


# -----------------------------------------------------------------------
# vf15_capacity_week
# -----------------------------------------------------------------------
drop table if exists vf15_capacity_week;

CREATE TABLE vf15_capacity_week
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    week INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    channel_id VARCHAR(100),
    subchannel_id VARCHAR(100),
    cpm INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX idx_video_capacity_week_week (week),
    INDEX idx_video_capacity_week_province_id (province_id),
    INDEX idx_video_capacity_week_city_id (city_id),
    INDEX idx_video_capacity_week_channel_id (channel_id),
    INDEX idx_video_capacity_week_subchannel_id (subchannel_id));


# -----------------------------------------------------------------------
# vb_capacity_week
# -----------------------------------------------------------------------
drop table if exists vb_capacity_week;

CREATE TABLE vb_capacity_week
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    week INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    channel_id VARCHAR(100),
    subchannel_id VARCHAR(100),
    cpm INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX idx_video_capacity_week_week (week),
    INDEX idx_video_capacity_week_province_id (province_id),
    INDEX idx_video_capacity_week_city_id (city_id),
    INDEX idx_video_capacity_week_channel_id (channel_id),
    INDEX idx_video_capacity_week_subchannel_id (subchannel_id));


# -----------------------------------------------------------------------
# vp_capacity_week
# -----------------------------------------------------------------------
drop table if exists vp_capacity_week;

CREATE TABLE vp_capacity_week
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    week INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    channel_id VARCHAR(100),
    subchannel_id VARCHAR(100),
    cpm INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX idx_video_capacity_week_week (week),
    INDEX idx_video_capacity_week_province_id (province_id),
    INDEX idx_video_capacity_week_city_id (city_id),
    INDEX idx_video_capacity_week_channel_id (channel_id),
    INDEX idx_video_capacity_week_subchannel_id (subchannel_id));


# -----------------------------------------------------------------------
# vob_capacity_week
# -----------------------------------------------------------------------
drop table if exists vob_capacity_week;

CREATE TABLE vob_capacity_week
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    week INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    channel_id VARCHAR(100),
    subchannel_id VARCHAR(100),
    cpm INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX idx_video_capacity_week_week (week),
    INDEX idx_video_capacity_week_province_id (province_id),
    INDEX idx_video_capacity_week_city_id (city_id),
    INDEX idx_video_capacity_week_channel_id (channel_id),
    INDEX idx_video_capacity_week_subchannel_id (subchannel_id));


# -----------------------------------------------------------------------
# vt_capacity_week
# -----------------------------------------------------------------------
drop table if exists vt_capacity_week;

CREATE TABLE vt_capacity_week
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    week INTEGER NOT NULL,
    province_id VARCHAR(100) NOT NULL,
    city_id VARCHAR(100) NOT NULL,
    channel_id VARCHAR(100),
    subchannel_id VARCHAR(100),
    cpm INTEGER default 0 NOT NULL,
    PRIMARY KEY(id),
    INDEX idx_video_capacity_week_week (week),
    INDEX idx_video_capacity_week_province_id (province_id),
    INDEX idx_video_capacity_week_city_id (city_id),
    INDEX idx_video_capacity_week_channel_id (channel_id),
    INDEX idx_video_capacity_week_subchannel_id (subchannel_id));


# -----------------------------------------------------------------------
# vp_position
# -----------------------------------------------------------------------
drop table if exists vp_position;

CREATE TABLE vp_position
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    p_type INTEGER default 3,
    parent_id INTEGER,
    order_id INTEGER,
    unit INTEGER default 1 NOT NULL,
    price_old INTEGER default 0 NOT NULL,
    price INTEGER default 0 NOT NULL,
    position_id INTEGER,
    ad_type_id INTEGER,
    version VARCHAR(255) NOT NULL,
    description MEDIUMTEXT,
    status INTEGER default 1 NOT NULL,
    vt_type INTEGER default -1,
    price_type INTEGER default -1 NOT NULL,
    site INTEGER default 1,
    device_type INTEGER default 0,
    product_type INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_register
# -----------------------------------------------------------------------
drop table if exists vp_register;

CREATE TABLE vp_register
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    vp_position_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    config_id INTEGER NOT NULL,
    description MEDIUMTEXT,
    cpm INTEGER default 0,
    discount INTEGER default 0,
    temporary INTEGER default 0,
    isClone INTEGER default 0 NOT NULL,
    sale_type INTEGER default 0 NOT NULL,
    blue_ocean_num INTEGER default -1 NOT NULL,
    blue_ocean_limit INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_config
# -----------------------------------------------------------------------
drop table if exists vp_config;

CREATE TABLE vp_config
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    order_id INTEGER NOT NULL,
    t_type INTEGER default 1,
    iscrazy INTEGER default -1,
    isfrequency INTEGER default -1,
    ispre INTEGER default -1 NOT NULL,
    iscontent INTEGER default -1 NOT NULL,
    hours VARCHAR(255),
    status INTEGER default 1,
    cpm INTEGER NOT NULL,
    description MEDIUMTEXT,
    create_date DATETIME NOT NULL,
    sub_type INTEGER default 0,
    del_sign INTEGER default 0,
    check_sign INTEGER default 0,
    config_code INTEGER default 0 NOT NULL,
    cast_code INTEGER default 0 NOT NULL,
    isClone INTEGER default 0 NOT NULL,
    device_type INTEGER default 0 NOT NULL,
    blue_ocean_num INTEGER default -1 NOT NULL,
    blue_ocean_limit INTEGER default 1 NOT NULL,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_city
# -----------------------------------------------------------------------
drop table if exists vp_city;

CREATE TABLE vp_city
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    config_id INTEGER NOT NULL,
    province_id VARCHAR(255) NOT NULL,
    city_id VARCHAR(255) NOT NULL,
    isClone INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_channel
# -----------------------------------------------------------------------
drop table if exists vp_channel;

CREATE TABLE vp_channel
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    config_id INTEGER NOT NULL,
    channel_id VARCHAR(255),
    sub_channel_id VARCHAR(255),
    isClone INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_business
# -----------------------------------------------------------------------
drop table if exists p_business;

CREATE TABLE p_business
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_role
# -----------------------------------------------------------------------
drop table if exists p_role;

CREATE TABLE p_role
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    level INTEGER default 1 NOT NULL,
    type VARCHAR(10) default '0' NOT NULL,
    sort_flag INTEGER default 0 NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    business_id INTEGER default 0,
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_module
# -----------------------------------------------------------------------
drop table if exists p_module;

CREATE TABLE p_module
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    parentId INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    level INTEGER default 1 NOT NULL,
    url VARCHAR(255),
    visiable VARCHAR(10) default 'Y',
    icon VARCHAR(255),
    sort_flag INTEGER default 0 NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    business_id INTEGER default 0,
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_function
# -----------------------------------------------------------------------
drop table if exists p_function;

CREATE TABLE p_function
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    module_id INTEGER default 0,
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_module_namespace
# -----------------------------------------------------------------------
drop table if exists p_module_namespace;

CREATE TABLE p_module_namespace
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    module_id INTEGER NOT NULL,
    namespace VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_user_role
# -----------------------------------------------------------------------
drop table if exists p_user_role;

CREATE TABLE p_user_role
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_user_role_data
# -----------------------------------------------------------------------
drop table if exists p_user_role_data;

CREATE TABLE p_user_role_data
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_user_module
# -----------------------------------------------------------------------
drop table if exists p_user_module;

CREATE TABLE p_user_module
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    module_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_user_function
# -----------------------------------------------------------------------
drop table if exists p_user_function;

CREATE TABLE p_user_function
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    function_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_role_module
# -----------------------------------------------------------------------
drop table if exists p_role_module;

CREATE TABLE p_role_module
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    role_id INTEGER NOT NULL,
    module_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_role_function
# -----------------------------------------------------------------------
drop table if exists p_role_function;

CREATE TABLE p_role_function
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    role_id INTEGER NOT NULL,
    function_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_user_business
# -----------------------------------------------------------------------
drop table if exists p_user_business;

CREATE TABLE p_user_business
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    business_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_login_logs
# -----------------------------------------------------------------------
drop table if exists p_login_logs;

CREATE TABLE p_login_logs
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    event_type VARCHAR(255),
    event_sub_type VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    browser_version VARCHAR(255),
    log_date DATETIME,
    description MEDIUMTEXT,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_app_logs
# -----------------------------------------------------------------------
drop table if exists p_app_logs;

CREATE TABLE p_app_logs
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    event_type VARCHAR(255),
    event_sub_type VARCHAR(255),
    module_name VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description MEDIUMTEXT,
    PRIMARY KEY(id),
    INDEX p_app_logs_username (username),
    INDEX p_app_logs_event_type (event_type),
    INDEX p_app_logs_event_sub_type (event_sub_type),
    INDEX p_app_logs_module_name (module_name),
    INDEX p_app_logs_ip (ip),
    INDEX p_app_logs_log_date (log_date));


# -----------------------------------------------------------------------
# p_auth_user_app_logs
# -----------------------------------------------------------------------
drop table if exists p_auth_user_app_logs;

CREATE TABLE p_auth_user_app_logs
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    auth_doc_file VARCHAR(100),
    username VARCHAR(255) NOT NULL,
    targetusername VARCHAR(255) NOT NULL,
    auth_type_status VARCHAR(10) default '1',
    event_type VARCHAR(255),
    event_sub_type VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description MEDIUMTEXT,
    op_user_id INTEGER default 0,
    target_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_auth_user_app_logs_detail
# -----------------------------------------------------------------------
drop table if exists p_auth_user_app_logs_detail;

CREATE TABLE p_auth_user_app_logs_detail
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    auth_doc_file VARCHAR(100),
    username VARCHAR(255) NOT NULL,
    targetusername VARCHAR(255) NOT NULL,
    auth_type_status VARCHAR(10) default '1',
    event_type VARCHAR(255),
    event_sub_type VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description MEDIUMTEXT,
    op_user_id INTEGER default 0,
    target_user_id INTEGER default 0,
    target_module_id INTEGER default 0,
    target_function_id INTEGER default 0,
    target_role_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_auth_role_app_logs
# -----------------------------------------------------------------------
drop table if exists p_auth_role_app_logs;

CREATE TABLE p_auth_role_app_logs
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    auth_doc_file VARCHAR(100),
    username VARCHAR(255) NOT NULL,
    targetrolename VARCHAR(255) NOT NULL,
    auth_type_status VARCHAR(10) default '1',
    event_type VARCHAR(255),
    event_sub_type VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description MEDIUMTEXT,
    op_user_id INTEGER default 0,
    target_role_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_auth_role_app_logs_detail
# -----------------------------------------------------------------------
drop table if exists p_auth_role_app_logs_detail;

CREATE TABLE p_auth_role_app_logs_detail
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    auth_doc_file VARCHAR(100),
    username VARCHAR(255) NOT NULL,
    targetrolename VARCHAR(255) NOT NULL,
    auth_type_status VARCHAR(10) default '1',
    event_type VARCHAR(255),
    event_sub_type VARCHAR(255),
    priority VARCHAR(255),
    ip VARCHAR(255),
    log_date DATETIME,
    description MEDIUMTEXT,
    op_user_id INTEGER default 0,
    target_role_id INTEGER default 0,
    target_module_id INTEGER default 0,
    target_function_id INTEGER default 0,
    target_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_data
# -----------------------------------------------------------------------
drop table if exists p_data;

CREATE TABLE p_data
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    type VARCHAR(10) default '0' NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    business_id INTEGER default 0,
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# p_user_data
# -----------------------------------------------------------------------
drop table if exists p_user_data;

CREATE TABLE p_user_data
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    data_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    update_date DATETIME,
    status VARCHAR(10) default '1',
    flag VARCHAR(10) default '1',
    create_user_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_module
# -----------------------------------------------------------------------
drop table if exists crm_module;

CREATE TABLE crm_module
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    url VARCHAR(255) NOT NULL,
    icon VARCHAR(255),
    sort INTEGER default 0 NOT NULL,
    description VARCHAR(255),
    status INTEGER default 0 NOT NULL,
    creator INTEGER default 0,
    create_date DATETIME,
    parentid INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_module_work
# -----------------------------------------------------------------------
drop table if exists crm_module_work;

CREATE TABLE crm_module_work
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    url VARCHAR(255) NOT NULL,
    icon VARCHAR(255),
    description VARCHAR(255),
    creator INTEGER default 0,
    create_date DATETIME,
    module_id INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_role
# -----------------------------------------------------------------------
drop table if exists crm_role;

CREATE TABLE crm_role
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    type INTEGER default 0 NOT NULL,
    description VARCHAR(255),
    status INTEGER default 0 NOT NULL,
    creator INTEGER default 0,
    create_date DATETIME,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_role_user
# -----------------------------------------------------------------------
drop table if exists crm_role_user;

CREATE TABLE crm_role_user
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_module_role
# -----------------------------------------------------------------------
drop table if exists crm_module_role;

CREATE TABLE crm_module_role
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    role_id INTEGER NOT NULL,
    module_id INTEGER NOT NULL,
    mail VARCHAR(255),
    level INTEGER default 0,
    levelcode VARCHAR(255),
    works VARCHAR(255),
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_user_data
# -----------------------------------------------------------------------
drop table if exists crm_user_data;

CREATE TABLE crm_user_data
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    service_type VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creaor INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_user_org
# -----------------------------------------------------------------------
drop table if exists crm_user_org;

CREATE TABLE crm_user_org
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    user_id INTEGER NOT NULL,
    org_id INTEGER,
    description VARCHAR(255),
    create_date DATETIME,
    creaor INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_organize
# -----------------------------------------------------------------------
drop table if exists crm_organize;

CREATE TABLE crm_organize
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    pareint_id INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creaor INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_workflow
# -----------------------------------------------------------------------
drop table if exists crm_workflow;

CREATE TABLE crm_workflow
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    mark VARCHAR(255) NOT NULL,
    edition INTEGER default 1 NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    status INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_workflow_plugin
# -----------------------------------------------------------------------
drop table if exists crm_workflow_plugin;

CREATE TABLE crm_workflow_plugin
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    code VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    value VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_doc
# -----------------------------------------------------------------------
drop table if exists crm_order_doc;

CREATE TABLE crm_order_doc
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    name VARCHAR(255),
    url VARCHAR(255) NOT NULL,
    size INTEGER default 0,
    status INTEGER default 0,
    version VARCHAR(255),
    upload_date DATETIME,
    creatator INTEGER default 0,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_workflow_node
# -----------------------------------------------------------------------
drop table if exists crm_workflow_node;

CREATE TABLE crm_workflow_node
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    workflow_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    pre_condition VARCHAR(255),
    after_condition VARCHAR(255),
    edition INTEGER default 1 NOT NULL,
    step INTEGER NOT NULL,
    next INTEGER,
    sequence INTEGER NOT NULL,
    service VARCHAR(255),
    backnode INTEGER,
    pereventurl VARCHAR(255),
    callbackeventurl VARCHAR(255),
    viewserviceurl VARCHAR(255),
    description VARCHAR(255),
    type INTEGER default 0 NOT NULL,
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_workflow_instance
# -----------------------------------------------------------------------
drop table if exists crm_workflow_instance;

CREATE TABLE crm_workflow_instance
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    workflow_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL,
    status INTEGER default 0 NOT NULL,
    current_node INTEGER NOT NULL,
    workflow_name VARCHAR(255),
    current_approve VARCHAR(255),
    current_approve_result_content VARCHAR(255),
    current_approve_result INTEGER,
    current_approve_date DATETIME,
    next_node INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_workflow_task
# -----------------------------------------------------------------------
drop table if exists crm_workflow_task;

CREATE TABLE crm_workflow_task
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    instance_id INTEGER NOT NULL,
    node_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    result INTEGER NOT NULL,
    content VARCHAR(255) NOT NULL,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    approve_date DATETIME,
    pre_task_id INTEGER NOT NULL,
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_group
# -----------------------------------------------------------------------
drop table if exists crm_customer_group;

CREATE TABLE crm_customer_group
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    haslicence INTEGER NOT NULL,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_industry
# -----------------------------------------------------------------------
drop table if exists crm_customer_industry;

CREATE TABLE crm_customer_industry
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    parentid INTEGER NOT NULL,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_brand
# -----------------------------------------------------------------------
drop table if exists crm_customer_brand;

CREATE TABLE crm_customer_brand
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    persons INTEGER,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_product
# -----------------------------------------------------------------------
drop table if exists crm_customer_product;

CREATE TABLE crm_customer_product
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    brand INTEGER,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_dictionary
# -----------------------------------------------------------------------
drop table if exists crm_customer_dictionary;

CREATE TABLE crm_customer_dictionary
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    dname VARCHAR(255) NOT NULL,
    dvalue VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    create_date DATETIME,
    creatator INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_info
# -----------------------------------------------------------------------
drop table if exists crm_customer_info;

CREATE TABLE crm_customer_info
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL,
    haslicence INTEGER NOT NULL,
    groupid INTEGER NOT NULL,
    industry INTEGER,
    level INTEGER,
    backschedule INTEGER,
    iskpi INTEGER,
    iska INTEGER,
    kalevel INTEGER,
    kpifuture INTEGER,
    kpinow INTEGER,
    kpivideo INTEGER,
    property INTEGER,
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    country VARCHAR(100),
    province VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(255),
    postcode VARCHAR(30),
    website VARCHAR(100),
    creator INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_brand_ref
# -----------------------------------------------------------------------
drop table if exists crm_customer_brand_ref;

CREATE TABLE crm_customer_brand_ref
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    brand INTEGER,
    customer INTEGER,
    category INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_category_ref
# -----------------------------------------------------------------------
drop table if exists crm_customer_category_ref;

CREATE TABLE crm_customer_category_ref
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    category INTEGER,
    customer INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_customer_monitor
# -----------------------------------------------------------------------
drop table if exists crm_customer_monitor;

CREATE TABLE crm_customer_monitor
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    difference VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    linkman VARCHAR(50),
    link_method VARCHAR(100),
    insert_date DATETIME,
    status VARCHAR(1) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_advertising_fee_moidfy_bak
# -----------------------------------------------------------------------
drop table if exists crm_order_advertising_fee_moidfy_bak;

CREATE TABLE crm_order_advertising_fee_moidfy_bak
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    customer_id INTEGER,
    customer_name VARCHAR(255),
    collection_date DATETIME,
    money INTEGER,
    money_decimal BIGINT,
    proportion VARCHAR(10),
    remark VARCHAR(255),
    source_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_kpi_moidfy_bak
# -----------------------------------------------------------------------
drop table if exists crm_order_kpi_moidfy_bak;

CREATE TABLE crm_order_kpi_moidfy_bak
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    name VARCHAR(255),
    standard VARCHAR(255),
    type INTEGER,
    other_name VARCHAR(255),
    remark VARCHAR(255),
    source_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_display_version
# -----------------------------------------------------------------------
drop table if exists register_display_version;

CREATE TABLE register_display_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    cpm INTEGER,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    quotation_id INTEGER,
    discount VARCHAR(255),
    temporary INTEGER default 0,
    sale_type INTEGER default 0 NOT NULL,
    version VARCHAR(14),
    product_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_nonstandard_version
# -----------------------------------------------------------------------
drop table if exists register_nonstandard_version;

CREATE TABLE register_nonstandard_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    position_id INTEGER NOT NULL,
    money INTEGER,
    cpm INTEGER default 1,
    order_type VARCHAR(10),
    status INTEGER default 1,
    description VARCHAR(255),
    discount VARCHAR(255),
    sale_type INTEGER default 0 NOT NULL,
    version VARCHAR(14),
    product_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_register_version
# -----------------------------------------------------------------------
drop table if exists vp_register_version;

CREATE TABLE vp_register_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    vp_position_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    config_id INTEGER NOT NULL,
    description MEDIUMTEXT,
    cpm INTEGER default 0,
    discount INTEGER default 0,
    temporary INTEGER default 0,
    sale_type INTEGER default 0 NOT NULL,
    blue_ocean_num INTEGER default -1 NOT NULL,
    blue_ocean_limit INTEGER default 1 NOT NULL,
    version VARCHAR(14),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_lock_state
# -----------------------------------------------------------------------
drop table if exists order_lock_state;

CREATE TABLE order_lock_state
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    lock_state INTEGER NOT NULL,
    min_modify_date DATETIME,
    is_money_change INTEGER,
    is_registerDate_change INTEGER default 0,
    rollback_date DATETIME,
    del_files VARCHAR(1000),
    commit_comment VARCHAR(1000),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_modify
# -----------------------------------------------------------------------
drop table if exists crm_order_modify;

CREATE TABLE crm_order_modify
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    user_id INTEGER,
    edit_date DATETIME,
    money INTEGER NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    agent_id INTEGER,
    customer_id INTEGER,
    is_approved INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_registerDiffFile
# -----------------------------------------------------------------------
drop table if exists order_registerDiffFile;

CREATE TABLE order_registerDiffFile
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    diff_file VARCHAR(1000) NOT NULL,
    sign INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# register_price
# -----------------------------------------------------------------------
drop table if exists register_price;

CREATE TABLE register_price
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    register_type INTEGER NOT NULL,
    channel_name VARCHAR(255),
    position_id INTEGER NOT NULL,
    unit INTEGER default 0 NOT NULL,
    amount INTEGER default 0 NOT NULL,
    quotation_price INTEGER default 0 NOT NULL,
    discount INTEGER default 0 NOT NULL,
    standby VARCHAR(1000),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ad_product
# -----------------------------------------------------------------------
drop table if exists ad_product;

CREATE TABLE ad_product
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_product
# -----------------------------------------------------------------------
drop table if exists order_product;

CREATE TABLE order_product
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    money BIGINT default 0,
    isClone INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# order_product_version
# -----------------------------------------------------------------------
drop table if exists order_product_version;

CREATE TABLE order_product_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    money BIGINT default 0,
    version VARCHAR(14),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# config_product
# -----------------------------------------------------------------------
drop table if exists config_product;

CREATE TABLE config_product
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    config_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    isClone INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# config_product_version
# -----------------------------------------------------------------------
drop table if exists config_product_version;

CREATE TABLE config_product_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    config_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    version VARCHAR(14),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_position_quotation
# -----------------------------------------------------------------------
drop table if exists vp_position_quotation;

CREATE TABLE vp_position_quotation
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    quotation_version VARCHAR(255),
    vp_position_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# city_quotation_level
# -----------------------------------------------------------------------
drop table if exists city_quotation_level;

CREATE TABLE city_quotation_level
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    quotation_version VARCHAR(255),
    city_level VARCHAR(255),
    city_id VARCHAR(255),
    city_name VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cityLevel_quotation_price
# -----------------------------------------------------------------------
drop table if exists cityLevel_quotation_price;

CREATE TABLE cityLevel_quotation_price
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    quotation_version VARCHAR(255),
    city_level VARCHAR(255),
    vp_position_id INTEGER NOT NULL,
    price INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crowd
# -----------------------------------------------------------------------
drop table if exists crowd;

CREATE TABLE crowd
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_crowd
# -----------------------------------------------------------------------
drop table if exists cast_crowd;

CREATE TABLE cast_crowd
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    crowd_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater
# -----------------------------------------------------------------------
drop table if exists theater;

CREATE TABLE theater
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    theater_type_id INTEGER default -1 NOT NULL,
    theater_order_id INTEGER default -1 NOT NULL,
    select_type INTEGER default 0 NOT NULL,
    file_switch INTEGER default 0 NOT NULL,
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_play
# -----------------------------------------------------------------------
drop table if exists theater_play;

CREATE TABLE theater_play
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_id INTEGER NOT NULL,
    playid BIGINT default 0 NOT NULL,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    status INTEGER default -1 NOT NULL,
    description VARCHAR(255),
    site INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_play_version
# -----------------------------------------------------------------------
drop table if exists theater_play_version;

CREATE TABLE theater_play_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_id INTEGER NOT NULL,
    playid BIGINT default 0 NOT NULL,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    status INTEGER NOT NULL,
    build_date TIMESTAMP,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_idea
# -----------------------------------------------------------------------
drop table if exists theater_idea;

CREATE TABLE theater_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    rate FLOAT NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_def
# -----------------------------------------------------------------------
drop table if exists theater_def;

CREATE TABLE theater_def
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    level INTEGER,
    period INTEGER,
    numlimit INTEGER default 0,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# partner_idea
# -----------------------------------------------------------------------
drop table if exists partner_idea;

CREATE TABLE partner_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    partner_id VARCHAR(50) NOT NULL,
    partner_name VARCHAR(50) NOT NULL,
    idea_id INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# partner_area
# -----------------------------------------------------------------------
drop table if exists partner_area;

CREATE TABLE partner_area
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    province_id VARCHAR(100),
    city_id VARCHAR(100),
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# partner_rate
# -----------------------------------------------------------------------
drop table if exists partner_rate;

CREATE TABLE partner_rate
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    partner_area_id INTEGER NOT NULL,
    rate FLOAT NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# campaign_period
# -----------------------------------------------------------------------
drop table if exists campaign_period;

CREATE TABLE campaign_period
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    campaign_id INTEGER default 0 NOT NULL,
    period INTEGER NOT NULL,
    times INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_buying_brief
# -----------------------------------------------------------------------
drop table if exists crm_buying_brief;

CREATE TABLE crm_buying_brief
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    agent_id INTEGER,
    customer_id INTEGER,
    brand_name VARCHAR(255),
    start_date DATETIME,
    end_date DATETIME,
    schedule_end_date DATETIME,
    schedule_money DOUBLE,
    contract_money DOUBLE,
    third_monitor INTEGER,
    third_monitor_name VARCHAR(255),
    copyright_info VARCHAR(255),
    monitor_project VARCHAR(255),
    idea_play_type INTEGER,
    frequency_dd INTEGER,
    area_cast INTEGER,
    frequency_type VARCHAR(255),
    frequency_num_day INTEGER,
    frequency_num_week INTEGER,
    frequency_num_campain INTEGER,
    brand_info VARCHAR(255),
    other_desc VARCHAR(255),
    brief_status INTEGER,
    approve_status INTEGER,
    area VARCHAR(255),
    brief_number VARCHAR(255),
    creatator INTEGER default 0,
    create_date DATETIME,
    cpm BIGINT,
    isupdate INTEGER,
    frequency_desc VARCHAR(255),
    atm_brief_status INTEGER,
    isfrequency INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_buying_brief_kpis
# -----------------------------------------------------------------------
drop table if exists crm_buying_brief_kpis;

CREATE TABLE crm_buying_brief_kpis
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    brief_id INTEGER,
    name VARCHAR(255),
    target VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_buying_brief_orders
# -----------------------------------------------------------------------
drop table if exists crm_buying_brief_orders;

CREATE TABLE crm_buying_brief_orders
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    brief_id INTEGER,
    order_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_buying_brief_detail
# -----------------------------------------------------------------------
drop table if exists crm_buying_brief_detail;

CREATE TABLE crm_buying_brief_detail
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    brief_id INTEGER,
    areas VARCHAR(255),
    area_ids VARCHAR(255),
    contents VARCHAR(255),
    content_idss VARCHAR(255),
    frequency_num VARCHAR(255),
    frequency_type VARCHAR(255),
    ad_type INTEGER,
    ad_position INTEGER,
    money DOUBLE,
    cpm BIGINT,
    budget DOUBLE,
    mincpm INTEGER,
    maxcpm INTEGER,
    descipt VARCHAR(255),
    priority VARCHAR(255),
    priority_number INTEGER,
    master_start_date DATETIME,
    master_end_date DATETIME,
    hours VARCHAR(255),
    min_scale VARCHAR(255),
    max_scale VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_buying_brief_approve
# -----------------------------------------------------------------------
drop table if exists crm_buying_brief_approve;

CREATE TABLE crm_buying_brief_approve
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    brief_id INTEGER,
    approve_date DATETIME,
    creator INTEGER default 0,
    creator_name VARCHAR(255),
    approve_status INTEGER,
    other_desc VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# video_ad_type
# -----------------------------------------------------------------------
drop table if exists video_ad_type;

CREATE TABLE video_ad_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# video_ad_position
# -----------------------------------------------------------------------
drop table if exists video_ad_position;

CREATE TABLE video_ad_position
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# video_ad_type_position
# -----------------------------------------------------------------------
drop table if exists video_ad_type_position;

CREATE TABLE video_ad_type_position
(
    video_ad_type_id INTEGER NOT NULL,
    video_ad_position_id INTEGER NOT NULL,
    vp_position_id INTEGER NOT NULL);


# -----------------------------------------------------------------------
# cast_check
# -----------------------------------------------------------------------
drop table if exists cast_check;

CREATE TABLE cast_check
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER default 0 NOT NULL,
    operator_id INTEGER NOT NULL,
    op_date DATETIME NOT NULL,
    status VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ad_cast_offline
# -----------------------------------------------------------------------
drop table if exists ad_cast_offline;

CREATE TABLE ad_cast_offline
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    display_position_id INTEGER default -1 NOT NULL,
    nonstandard_position_id INTEGER default -1 NOT NULL,
    ask_date DATETIME NOT NULL,
    status INTEGER default 0 NOT NULL,
    comment VARCHAR(255),
    excute_user_id INTEGER NOT NULL,
    admin_user_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_channel_version
# -----------------------------------------------------------------------
drop table if exists vp_channel_version;

CREATE TABLE vp_channel_version
(
    id INTEGER NOT NULL,
    config_id INTEGER NOT NULL,
    channel_id VARCHAR(255),
    sub_channel_id VARCHAR(255),
    version VARCHAR(14) NOT NULL);


# -----------------------------------------------------------------------
# vp_city_version
# -----------------------------------------------------------------------
drop table if exists vp_city_version;

CREATE TABLE vp_city_version
(
    id INTEGER NOT NULL,
    config_id INTEGER NOT NULL,
    province_id VARCHAR(255) NOT NULL,
    city_id VARCHAR(255) NOT NULL,
    version VARCHAR(14) NOT NULL);


# -----------------------------------------------------------------------
# vp_config_version
# -----------------------------------------------------------------------
drop table if exists vp_config_version;

CREATE TABLE vp_config_version
(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    order_id INTEGER NOT NULL,
    t_type INTEGER default 1,
    iscrazy INTEGER default -1,
    isfrequency INTEGER default -1,
    ispre INTEGER default -1 NOT NULL,
    iscontent INTEGER default -1 NOT NULL,
    hours VARCHAR(255),
    status INTEGER default 1,
    cpm INTEGER NOT NULL,
    description MEDIUMTEXT,
    create_date DATETIME NOT NULL,
    sub_type INTEGER default 0,
    del_sign INTEGER default 0,
    check_sign INTEGER default 0,
    config_code INTEGER default 0 NOT NULL,
    cast_code INTEGER default 0 NOT NULL,
    blue_ocean_num INTEGER default -1 NOT NULL,
    blue_ocean_limit INTEGER default 1 NOT NULL,
    version VARCHAR(14) NOT NULL);


# -----------------------------------------------------------------------
# crm_mail_approval_token
# -----------------------------------------------------------------------
drop table if exists crm_mail_approval_token;

CREATE TABLE crm_mail_approval_token
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    approval_user_id INTEGER NOT NULL,
    crm_order_id INTEGER NOT NULL,
    approval_step INTEGER NOT NULL,
    approval_result INTEGER NOT NULL,
    millisecond VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL,
    create_date DATETIME NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_contract_takeback_history
# -----------------------------------------------------------------------
drop table if exists crm_contract_takeback_history;

CREATE TABLE crm_contract_takeback_history
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    order_version INTEGER NOT NULL,
    schedule_version INTEGER NOT NULL,
    sys_order_version INTEGER NOT NULL,
    sys_schedule_version INTEGER NOT NULL,
    status INTEGER default 0 NOT NULL,
    takeback_date DATETIME NOT NULL,
    takeback_user_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_order_income
# -----------------------------------------------------------------------
drop table if exists crm_order_income;

CREATE TABLE crm_order_income
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    crm_order_id INTEGER NOT NULL,
    income DOUBLE NOT NULL,
    income_status INTEGER,
    sys_type INTEGER default 0,
    user_col_type INTEGER default 0,
    income_date DATETIME,
    confirm_income_date DATETIME,
    user_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_executor_examinator
# -----------------------------------------------------------------------
drop table if exists cast_executor_examinator;

CREATE TABLE cast_executor_examinator
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    executor_id INTEGER NOT NULL,
    examinator_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ad_cast_ignore
# -----------------------------------------------------------------------
drop table if exists ad_cast_ignore;

CREATE TABLE ad_cast_ignore
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    order_id INTEGER NOT NULL,
    vp_position_id INTEGER default -1,
    vp_config_id INTEGER default -1,
    display_position_id INTEGER default -1,
    nonstandard_position_id INTEGER default -1,
    play_register_id INTEGER default -1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_adlen_limit
# -----------------------------------------------------------------------
drop table if exists cast_adlen_limit;

CREATE TABLE cast_adlen_limit
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    video_len_low INTEGER NOT NULL,
    video_len_high INTEGER NOT NULL,
    ad_len_max INTEGER NOT NULL,
    status INTEGER default 1,
    description VARCHAR(255),
    device INTEGER default 0,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_config
# -----------------------------------------------------------------------
drop table if exists cast_config;

CREATE TABLE cast_config
(
    id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    value VARCHAR(1024) NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id,name));


# -----------------------------------------------------------------------
# theater_cpm
# -----------------------------------------------------------------------
drop table if exists theater_cpm;

CREATE TABLE theater_cpm
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    cpm INTEGER default 0 NOT NULL,
    startTime TIMESTAMP,
    endTime TIMESTAMP,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_lunbo
# -----------------------------------------------------------------------
drop table if exists theater_lunbo;

CREATE TABLE theater_lunbo
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_order
# -----------------------------------------------------------------------
drop table if exists theater_order;

CREATE TABLE theater_order
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    brand VARCHAR(255),
    money BIGINT default 0,
    ad_order_id INTEGER default -1,
    build_user_id INTEGER NOT NULL,
    insert_date DATETIME NOT NULL,
    status INTEGER default 0 NOT NULL,
    area VARCHAR(64),
    file_path VARCHAR(1024),
    description VARCHAR(512),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_approval
# -----------------------------------------------------------------------
drop table if exists theater_approval;

CREATE TABLE theater_approval
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_order_id INTEGER NOT NULL,
    op_type INTEGER default 0 NOT NULL,
    op_user_id INTEGER NOT NULL,
    op_date DATETIME NOT NULL,
    description VARCHAR(512),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_resource
# -----------------------------------------------------------------------
drop table if exists theater_resource;

CREATE TABLE theater_resource
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(512) NOT NULL,
    rights VARCHAR(255) NOT NULL,
    unit VARCHAR(250) NOT NULL,
    price BIGINT NOT NULL,
    description VARCHAR(1024),
    status INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_type
# -----------------------------------------------------------------------
drop table if exists theater_type;

CREATE TABLE theater_type
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    select_type INTEGER default 1 NOT NULL,
    description VARCHAR(512),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_type_resource
# -----------------------------------------------------------------------
drop table if exists theater_type_resource;

CREATE TABLE theater_type_resource
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    product_type_id INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# theater_register
# -----------------------------------------------------------------------
drop table if exists theater_register;

CREATE TABLE theater_register
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    theater_order_id INTEGER NOT NULL,
    theater_id INTEGER NOT NULL,
    theater_resource_id INTEGER NOT NULL,
    ask_date DATETIME NOT NULL,
    count INTEGER default 0 NOT NULL,
    sale_type INTEGER NOT NULL,
    unit VARCHAR(250) NOT NULL,
    descrpition VARCHAR(512),
    status INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# yum_idea
# -----------------------------------------------------------------------
drop table if exists yum_idea;

CREATE TABLE yum_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    priority INTEGER NOT NULL,
    is_olduser_limit INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    orient_provinces VARCHAR(255),
    opp_provinces VARCHAR(255),
    lowest_provinces VARCHAR(255),
    province_rates VARCHAR(510),
    orient_citys VARCHAR(1024),
    opp_citys VARCHAR(1024),
    lowest_citys VARCHAR(1024),
    city_rates VARCHAR(2048),
    opp_ideas VARCHAR(1024),
    description VARCHAR(255),
    last_high INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# crm_buying_brief_modify_log
# -----------------------------------------------------------------------
drop table if exists crm_buying_brief_modify_log;

CREATE TABLE crm_buying_brief_modify_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    modify_briefId INTEGER NOT NULL,
    modify_id INTEGER NOT NULL,
    modify_userId INTEGER NOT NULL,
    original_content VARCHAR(255) NOT NULL,
    modify_content VARCHAR(255) NOT NULL,
    modify_column VARCHAR(255) NOT NULL,
    modify_type VARCHAR(45) NOT NULL,
    create_time DATETIME NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ies_report
# -----------------------------------------------------------------------
drop table if exists ies_report;

CREATE TABLE ies_report
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    date VARCHAR(255),
    hour VARCHAR(255),
    idea_id VARCHAR(255),
    ad_type_id VARCHAR(255),
    province_code VARCHAR(255),
    city_code VARCHAR(255),
    ies_impression DOUBLE default 0,
    ies_click DOUBLE default 0,
    youku_impression DOUBLE default 0,
    youku_click DOUBLE default 0,
    ad_order_id VARCHAR(255),
    ad_cast_id VARCHAR(255),
    ies_id INTEGER,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ies_data_log
# -----------------------------------------------------------------------
drop table if exists ies_data_log;

CREATE TABLE ies_data_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    pull_date INTEGER NOT NULL,
    data_size BIGINT NOT NULL,
    request_result INTEGER NOT NULL,
    ies_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ies_organization
# -----------------------------------------------------------------------
drop table if exists ies_organization;

CREATE TABLE ies_organization
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    monitorUrl VARCHAR(256) NOT NULL,
    isOauth INTEGER NOT NULL,
    oauthUrl VARCHAR(256) NOT NULL,
    oauthQueryString VARCHAR(1024) NOT NULL,
    apiUrl VARCHAR(256) NOT NULL,
    threshold INTEGER NOT NULL,
    status INTEGER default 1 NOT NULL,
    email VARCHAR(256) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# log_config
# -----------------------------------------------------------------------
drop table if exists log_config;

CREATE TABLE log_config
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    code VARCHAR(256) NOT NULL,
    ip VARCHAR(256) NOT NULL,
    remoteport VARCHAR(256) NOT NULL,
    localport VARCHAR(256) NOT NULL,
    path VARCHAR(256) NOT NULL,
    site INTEGER default 0 NOT NULL,
    log_type VARCHAR(20) default 'a' NOT NULL,
    adTypeIds VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# server_config
# -----------------------------------------------------------------------
drop table if exists server_config;

CREATE TABLE server_config
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    ip VARCHAR(40) NOT NULL,
    role INTEGER NOT NULL,
    status INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# resource
# -----------------------------------------------------------------------
drop table if exists resource;

CREATE TABLE resource
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    site INTEGER(11) default 1 NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# resource_area
# -----------------------------------------------------------------------
drop table if exists resource_area;

CREATE TABLE resource_area
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    resource_id INTEGER NOT NULL,
    province_id VARCHAR(100),
    city_id VARCHAR(100),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# resource_channel
# -----------------------------------------------------------------------
drop table if exists resource_channel;

CREATE TABLE resource_channel
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    resource_id INTEGER NOT NULL,
    channel_id VARCHAR(255),
    subchannel_id VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean
# -----------------------------------------------------------------------
drop table if exists blueocean;

CREATE TABLE blueocean
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    resource_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    total_lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean_idea
# -----------------------------------------------------------------------
drop table if exists blueocean_idea;

CREATE TABLE blueocean_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    blueocean_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# flashbomb
# -----------------------------------------------------------------------
drop table if exists flashbomb;

CREATE TABLE flashbomb
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    resource_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    vb_idea_id INTEGER NOT NULL,
    vp_idea_id INTEGER NOT NULL,
    crazy_idea_id INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    starthour VARCHAR(255) NOT NULL,
    endhour VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean_log
# -----------------------------------------------------------------------
drop table if exists blueocean_log;

CREATE TABLE blueocean_log
(
    id INTEGER NOT NULL,
    name VARCHAR(256) NOT NULL,
    resource_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    total_lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255));


# -----------------------------------------------------------------------
# blueocean_idea_log
# -----------------------------------------------------------------------
drop table if exists blueocean_idea_log;

CREATE TABLE blueocean_idea_log
(
    id INTEGER NOT NULL,
    blueocean_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255));


# -----------------------------------------------------------------------
# flashbomb_log
# -----------------------------------------------------------------------
drop table if exists flashbomb_log;

CREATE TABLE flashbomb_log
(
    id INTEGER NOT NULL,
    resource_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    starthour VARCHAR(255) NOT NULL,
    endhour VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1 NOT NULL);


# -----------------------------------------------------------------------
# default_html_idea
# -----------------------------------------------------------------------
drop table if exists default_html_idea;

CREATE TABLE default_html_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    idea_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# default_position_idea
# -----------------------------------------------------------------------
drop table if exists default_position_idea;

CREATE TABLE default_position_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    position_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# entry
# -----------------------------------------------------------------------
drop table if exists entry;

CREATE TABLE entry
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    display_register_id INTEGER NOT NULL,
    ev VARCHAR(256) NOT NULL,
    seq INTEGER NOT NULL,
    total_lun INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# entry_idea
# -----------------------------------------------------------------------
drop table if exists entry_idea;

CREATE TABLE entry_idea
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    entry_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# entry_log
# -----------------------------------------------------------------------
drop table if exists entry_log;

CREATE TABLE entry_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    display_register_id INTEGER NOT NULL,
    ev VARCHAR(256) NOT NULL,
    seq INTEGER NOT NULL,
    total_lun INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# entry_idea_log
# -----------------------------------------------------------------------
drop table if exists entry_idea_log;

CREATE TABLE entry_idea_log
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    entry_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    lun INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# product_level
# -----------------------------------------------------------------------
drop table if exists product_level;

CREATE TABLE product_level
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    product INTEGER NOT NULL,
    level INTEGER NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# video_check_info
# -----------------------------------------------------------------------
drop table if exists video_check_info;

CREATE TABLE video_check_info
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    task_id INTEGER default -1 NOT NULL,
    task_url MEDIUMTEXT,
    type INTEGER(1) default -1 NOT NULL,
    apply_time DATETIME NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    apply_user VARCHAR(12) NOT NULL,
    apply_reason VARCHAR(255) NOT NULL,
    checker VARCHAR(8),
    check_status INTEGER(1) default 1 NOT NULL,
    check_info VARCHAR(255),
    request_id VARCHAR(32),
    remark VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# video_check_list
# -----------------------------------------------------------------------
drop table if exists video_check_list;

CREATE TABLE video_check_list
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    video_id INTEGER default 1 NOT NULL,
    source_id INTEGER default 1 NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean_resource
# -----------------------------------------------------------------------
drop table if exists blueocean_resource;

CREATE TABLE blueocean_resource
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    resource_id INTEGER NOT NULL,
    area_id VARCHAR(255) NOT NULL,
    channel_id VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean_info
# -----------------------------------------------------------------------
drop table if exists blueocean_info;

CREATE TABLE blueocean_info
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    seq INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    total_lun INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean_idea_cpm
# -----------------------------------------------------------------------
drop table if exists blueocean_idea_cpm;

CREATE TABLE blueocean_idea_cpm
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    blueocean_info_id INTEGER NOT NULL,
    blueocean_resource_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    lun VARCHAR(255) NOT NULL,
    target_date DATETIME NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# blueocean_cast
# -----------------------------------------------------------------------
drop table if exists blueocean_cast;

CREATE TABLE blueocean_cast
(
    blueocean_info_id INTEGER NOT NULL,
    cast_id INTEGER NOT NULL);


# -----------------------------------------------------------------------
# os
# -----------------------------------------------------------------------
drop table if exists os;

CREATE TABLE os
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# sub_os
# -----------------------------------------------------------------------
drop table if exists sub_os;

CREATE TABLE sub_os
(
    id INTEGER NOT NULL,
    name VARCHAR(255),
    description VARCHAR(255),
    status INTEGER default 1,
    os_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_os
# -----------------------------------------------------------------------
drop table if exists cast_os;

CREATE TABLE cast_os
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    os_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# cast_subos
# -----------------------------------------------------------------------
drop table if exists cast_subos;

CREATE TABLE cast_subos
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    cast_id INTEGER NOT NULL,
    subos_id INTEGER NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# ration_optimize
# -----------------------------------------------------------------------
drop table if exists ration_optimize;

CREATE TABLE ration_optimize
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    m_resource_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    level INTEGER,
    period INTEGER,
    numlimit INTEGER default 0,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    description VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# m_resource
# -----------------------------------------------------------------------
drop table if exists m_resource;

CREATE TABLE m_resource
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# m_resource_os
# -----------------------------------------------------------------------
drop table if exists m_resource_os;

CREATE TABLE m_resource_os
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    m_resource_id INTEGER NOT NULL,
    os_id INTEGER(255),
    subos_id INTEGER(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# m_resource_area
# -----------------------------------------------------------------------
drop table if exists m_resource_area;

CREATE TABLE m_resource_area
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    m_resource_id INTEGER NOT NULL,
    province_id VARCHAR(100),
    city_id VARCHAR(100),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# m_resource_channel
# -----------------------------------------------------------------------
drop table if exists m_resource_channel;

CREATE TABLE m_resource_channel
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    m_resource_id INTEGER NOT NULL,
    channel_id VARCHAR(255),
    subchannel_id VARCHAR(255),
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# m_flashbomb
# -----------------------------------------------------------------------
drop table if exists m_flashbomb;

CREATE TABLE m_flashbomb
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    m_resource_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    starthour VARCHAR(255) NOT NULL,
    endhour VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# m_flashbomb_log
# -----------------------------------------------------------------------
drop table if exists m_flashbomb_log;

CREATE TABLE m_flashbomb_log
(
    id INTEGER NOT NULL,
    m_resource_id INTEGER NOT NULL,
    idea_id INTEGER NOT NULL,
    startTime TIMESTAMP NOT NULL,
    endTime TIMESTAMP NOT NULL,
    starthour VARCHAR(255) NOT NULL,
    endhour VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    status INTEGER default 1 NOT NULL);


# -----------------------------------------------------------------------
# vp_os
# -----------------------------------------------------------------------
drop table if exists vp_os;

CREATE TABLE vp_os
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    config_id INTEGER NOT NULL,
    os_id INTEGER,
    sub_os_id INTEGER,
    isClone INTEGER default 0 NOT NULL,
    PRIMARY KEY(id));


# -----------------------------------------------------------------------
# vp_os_version
# -----------------------------------------------------------------------
drop table if exists vp_os_version;

CREATE TABLE vp_os_version
(
    id INTEGER NOT NULL AUTO_INCREMENT,
    config_id INTEGER NOT NULL,
    os_id INTEGER,
    sub_os_id INTEGER,
    version VARCHAR(14) NOT NULL,
    PRIMARY KEY(id));

ALTER TABLE user
    ADD CONSTRAINT fk_user_type_id
    FOREIGN KEY (user_type_id)
    REFERENCES user_type (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_user_sub_type_id
    FOREIGN KEY (user_sub_type_id)
    REFERENCES user_sub_type (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_u_id_01
    FOREIGN KEY (leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_u_id_02
    FOREIGN KEY (leader_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_u_id_03
    FOREIGN KEY (leader_id_03)
    REFERENCES user (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_u_report_id
    FOREIGN KEY (orther_report_id)
    REFERENCES user (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_u_a_u_id
    FOREIGN KEY (assist_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_u_o_a_u_id
    FOREIGN KEY (other_assist_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_group_user_id
    FOREIGN KEY (group_id)
    REFERENCES user_group (id)
    ;

ALTER TABLE user
    ADD CONSTRAINT fk_t_id
    FOREIGN KEY (crm_team_id)
    REFERENCES crm_team (id)
    ;

ALTER TABLE group_privilege
    ADD CONSTRAINT fk_prilegegroup_id
    FOREIGN KEY (privilege_id)
    REFERENCES privilege (id)
    ;

ALTER TABLE group_privilege
    ADD CONSTRAINT fk_prilegeusergroup_id
    FOREIGN KEY (group_id)
    REFERENCES user_group (id)
    ;

ALTER TABLE agent
    ADD CONSTRAINT fk_c_id1
    FOREIGN KEY (crm_company_id_01)
    REFERENCES crm_company (id)
    ;

ALTER TABLE agent
    ADD CONSTRAINT fk_c_id2
    FOREIGN KEY (crm_company_id_02)
    REFERENCES crm_company (id)
    ;

ALTER TABLE agent
    ADD CONSTRAINT fk_c_id3
    FOREIGN KEY (crm_company_id_03)
    REFERENCES crm_company (id)
    ;

ALTER TABLE agent
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE agent
    ADD CONSTRAINT fk_region_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE agent
    ADD CONSTRAINT fk_a_f_a_c_id
    FOREIGN KEY (f_agent_company_id)
    REFERENCES f_agent_company (id)
    ;

ALTER TABLE ad_order
    ADD CONSTRAINT fk_adorder_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE ad_order
    ADD CONSTRAINT fk_frame_order_id
    FOREIGN KEY (frame_order_id)
    REFERENCES frame_order (id)
    ;

ALTER TABLE ad_order
    ADD CONSTRAINT fk_customer_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE ad_order
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (f_customer_id)
    REFERENCES f_customer (id)
    ;

ALTER TABLE ad_order
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (f_agent_id)
    REFERENCES f_agent (id)
    ;

ALTER TABLE ad_order
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (f_user_type_id)
    REFERENCES f_user_type (id)
    ;

ALTER TABLE sub_channel
    ADD CONSTRAINT fk_channel_id
    FOREIGN KEY (channel_id)
    REFERENCES channel (id)
    ;

ALTER TABLE block
    ADD CONSTRAINT fk_page_id
    FOREIGN KEY (page_id)
    REFERENCES page (id)
    ;

ALTER TABLE position
    ADD CONSTRAINT fk_default_idea_id
    FOREIGN KEY (default_idea_id)
    REFERENCES default_idea (id)
    ;

ALTER TABLE position
    ADD CONSTRAINT fk_page_id
    FOREIGN KEY (page_id)
    REFERENCES page (id)
    ;

ALTER TABLE position
    ADD CONSTRAINT fk_block_id
    FOREIGN KEY (block_id)
    REFERENCES block (id)
    ;

ALTER TABLE position
    ADD CONSTRAINT fk_parent_id
    FOREIGN KEY (parent_id)
    REFERENCES position (id)
    ;

ALTER TABLE position
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE default_idea
    ADD CONSTRAINT fk_ad_type_id
    FOREIGN KEY (ad_type_id)
    REFERENCES ad_type (id)
    ;

ALTER TABLE ad_cast
    ADD CONSTRAINT fk_adorder_cast_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE ad_cast
    ADD CONSTRAINT fk_ad_type_id
    FOREIGN KEY (ad_type_id)
    REFERENCES ad_type (id)
    ;

ALTER TABLE cast_channel
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_channel
    ADD CONSTRAINT fk_channel_id
    FOREIGN KEY (channel_id)
    REFERENCES channel (id)
    ;

ALTER TABLE cast_subchannel
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_subchannel
    ADD CONSTRAINT fk_subchannel_id
    FOREIGN KEY (subchannel_id)
    REFERENCES sub_channel (id)
    ;

ALTER TABLE cast_city
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_city
    ADD CONSTRAINT fk_region_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE cast_province
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_province
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE cast_keyword
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_vid
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_playlist
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE idea
    ADD CONSTRAINT fk_cast_idea_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE idea
    ADD CONSTRAINT fk_campaign
    FOREIGN KEY (campaign_id)
    REFERENCES campaign (id)
    ;

ALTER TABLE idea_time
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE idea_time
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE idea_time_bak
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE idea_time_bak
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE cast_time
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_time
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE cast_ip
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_ip
    ADD CONSTRAINT fk__customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE cast_youkuUser
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_youkuUser
    ADD CONSTRAINT fk__customer_id
    FOREIGN KEY (youkuUser_id)
    REFERENCES youkuUser (id)
    ;

ALTER TABLE cast_url
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE idea_cpm
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE idea_cpm
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_c_nci
    FOREIGN KEY (new_customer_info)
    REFERENCES crm_customer_info (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_c_id1
    FOREIGN KEY (crm_company_id_01)
    REFERENCES crm_company (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_c_id2
    FOREIGN KEY (crm_company_id_02)
    REFERENCES crm_company (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_c_id3
    FOREIGN KEY (crm_company_id_03)
    REFERENCES crm_company (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_customer_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_user_type_id
    FOREIGN KEY (user_type_id)
    REFERENCES user_type (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_user_sub_type_id
    FOREIGN KEY (user_sub_type_id)
    REFERENCES user_sub_type (id)
    ;

ALTER TABLE customer
    ADD CONSTRAINT fk_c_f_c_c_id
    FOREIGN KEY (f_customer_company_id)
    REFERENCES f_customer_company (id)
    ;

ALTER TABLE user_sub_type
    ADD CONSTRAINT fk_user_type_id
    FOREIGN KEY (user_type_id)
    REFERENCES user_type (id)
    ;

ALTER TABLE info_ip
    ADD CONSTRAINT fk_customer_info_id
    FOREIGN KEY (customer_info_id)
    REFERENCES customer_info (id)
    ;

ALTER TABLE copyright_youkuUser
    ADD CONSTRAINT fk__customer_id
    FOREIGN KEY (youkuUser_id)
    REFERENCES youkuUser (id)
    ;

ALTER TABLE history_access
    ADD CONSTRAINT fk_channel
    FOREIGN KEY (channel_name)
    REFERENCES channel (name)
    ;

ALTER TABLE register_display
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE register_display
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE register_display
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE register_display
    ADD CONSTRAINT fk_adproduct_id
    FOREIGN KEY (product_id)
    REFERENCES ad_product (id)
    ;

ALTER TABLE register_video
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE register_video
    ADD CONSTRAINT fk_channel
    FOREIGN KEY (channel_name)
    REFERENCES channel (name)
    ;

ALTER TABLE register_video
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE register_nonstandard
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE register_nonstandard
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE register_nonstandard
    ADD CONSTRAINT fk_adproduct_id
    FOREIGN KEY (product_id)
    REFERENCES ad_product (id)
    ;

ALTER TABLE frame_order
    ADD CONSTRAINT fk_customer_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE discount
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (ad_order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE discount
    ADD CONSTRAINT fk__position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE order_display
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_display
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE order_video
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_video
    ADD CONSTRAINT fk_channel
    FOREIGN KEY (channel_name)
    REFERENCES channel (name)
    ;

ALTER TABLE order_video
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE order_sub_type
    ADD CONSTRAINT fk_order_type
    FOREIGN KEY (order_type_id)
    REFERENCES order_type (id)
    ;

ALTER TABLE discount_display
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE discount_display
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE discount_video
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE discount_video
    ADD CONSTRAINT fk_channel
    FOREIGN KEY (channel_name)
    REFERENCES channel (name)
    ;

ALTER TABLE price_video
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE price_video
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE status_permit
    ADD CONSTRAINT fk_id
    FOREIGN KEY (status_id)
    REFERENCES order_status (id)
    ;

ALTER TABLE status_permit
    ADD CONSTRAINT fk_next_id
    FOREIGN KEY (next_status_id)
    REFERENCES order_status (id)
    ;

ALTER TABLE crm_action
    ADD CONSTRAINT fk_crm_action_type_id
    FOREIGN KEY (crm_action_type_id)
    REFERENCES crm_action_type (id)
    ;

ALTER TABLE crm_contact
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_contact
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_contact
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_agent_customer
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_agent_customer
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_user_agent
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_agent
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_user_customer
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_customer
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_direct_id
    FOREIGN KEY (order_direct_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_channel_id
    FOREIGN KEY (order_channel_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_approve_u_id
    FOREIGN KEY (approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_direct_id_02
    FOREIGN KEY (order_direct_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_channel_id_02
    FOREIGN KEY (order_channel_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_direct_leader_id_01
    FOREIGN KEY (order_direct_leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_direct_leader_id_02
    FOREIGN KEY (order_direct_leader_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_direct_leader_id_03
    FOREIGN KEY (order_direct_leader_id_03)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_channel_leader_id_01
    FOREIGN KEY (order_channel_leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_channel_leader_id_02
    FOREIGN KEY (order_channel_leader_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief
    ADD CONSTRAINT fk_week_approve_u_id
    FOREIGN KEY (week_approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_diary
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_diary
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_diary
    ADD CONSTRAINT fk_d_a_u_id
    FOREIGN KEY (diary_approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_diary_brief
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (crm_diary_id)
    REFERENCES crm_diary (id)
    ;

ALTER TABLE crm_diary_brief
    ADD CONSTRAINT fk_b_id
    FOREIGN KEY (crm_brief_id)
    REFERENCES crm_brief (id)
    ;

ALTER TABLE crm_diary_customer
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (crm_diary_id)
    REFERENCES crm_diary (id)
    ;

ALTER TABLE crm_diary_customer
    ADD CONSTRAINT fk_b_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_diary_contact
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (crm_diary_id)
    REFERENCES crm_diary (id)
    ;

ALTER TABLE crm_diary_contact
    ADD CONSTRAINT fk_b_id
    FOREIGN KEY (crm_contact_id)
    REFERENCES crm_contact (id)
    ;

ALTER TABLE crm_diary_action
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (crm_diary_id)
    REFERENCES crm_diary (id)
    ;

ALTER TABLE crm_diary_action
    ADD CONSTRAINT fk_b_id
    FOREIGN KEY (crm_action_id)
    REFERENCES crm_action (id)
    ;

ALTER TABLE crm_user_user
    ADD CONSTRAINT fk_u1_id
    FOREIGN KEY (salse_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_user
    ADD CONSTRAINT fk_u2_id
    FOREIGN KEY (charge_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_chargeUser_agent
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_chargeUser_agent
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_chargeUser_customer
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_chargeUser_customer
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_brief_log
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_brief_log
    ADD CONSTRAINT fk_b_id
    FOREIGN KEY (crm_brief_id)
    REFERENCES crm_brief (id)
    ;

ALTER TABLE position_quotation
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE position_quotation
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE frame_order_feeback
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (frame_order_id)
    REFERENCES frame_order (id)
    ;

ALTER TABLE pre_confirm_adorder
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE confirm_adorder
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE fee_adorder
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE income_adorder
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE invoice_adorder
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE f_customer_company
    ADD CONSTRAINT fk_f_agent_company_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_customer_company_credit
    ADD CONSTRAINT fk_f_customer_company_credit_id
    FOREIGN KEY (f_customer_company_id)
    REFERENCES f_customer_company (id)
    ;

ALTER TABLE f_customer_company_credit
    ADD CONSTRAINT fk_f_customer_company_credit_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_customer_company_credit_totalizer
    ADD CONSTRAINT fk_f_customer_company_credit_totalizer_id
    FOREIGN KEY (f_customer_company_credit_id)
    REFERENCES f_customer_company_credit (id)
    ;

ALTER TABLE f_customer_company_credit_totalizer
    ADD CONSTRAINT fk_f_customer_company_credit_totalizer_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_customer
    ADD CONSTRAINT fk_user_type_id
    FOREIGN KEY (user_type_id)
    REFERENCES user_type (id)
    ;

ALTER TABLE f_customer
    ADD CONSTRAINT fk_user_sub_type_id
    FOREIGN KEY (user_sub_type_id)
    REFERENCES user_sub_type (id)
    ;

ALTER TABLE f_customer
    ADD CONSTRAINT fk_f_customer_company_id
    FOREIGN KEY (f_customer_company_id)
    REFERENCES f_customer_company (id)
    ;

ALTER TABLE f_customer
    ADD CONSTRAINT fk_f_customer_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_customer_payment
    ADD CONSTRAINT fk_f_customer_payment_id
    FOREIGN KEY (f_customer_id)
    REFERENCES f_customer (id)
    ;

ALTER TABLE f_customer_payment
    ADD CONSTRAINT fk_f_customer_payment_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_agent_company
    ADD CONSTRAINT fk_f_agent_company_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_agent_company_credit
    ADD CONSTRAINT fk_f_agent_company_credit_id
    FOREIGN KEY (f_agent_company_id)
    REFERENCES f_agent_company (id)
    ;

ALTER TABLE f_agent_company_credit
    ADD CONSTRAINT fk_f_agent_company_credit_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_agent_company_credit_totalizer
    ADD CONSTRAINT fk_f_agent_company_credit_totalizer_id
    FOREIGN KEY (f_agent_company_credit_id)
    REFERENCES f_agent_company_credit (id)
    ;

ALTER TABLE f_agent_company_credit_totalizer
    ADD CONSTRAINT fk_f_agent_company_credit_totalizer_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_agent
    ADD CONSTRAINT fk_f_agent_company_id
    FOREIGN KEY (f_agent_company_id)
    REFERENCES f_agent_company (id)
    ;

ALTER TABLE f_agent
    ADD CONSTRAINT fk_f_agent_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE f_agent_payment
    ADD CONSTRAINT fk_f_agent_payment_id
    FOREIGN KEY (f_agent_id)
    REFERENCES f_agent (id)
    ;

ALTER TABLE f_agent_payment
    ADD CONSTRAINT fk_f_agent_payment_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE report_cache_channel
    ADD CONSTRAINT fk_channel_id
    FOREIGN KEY (channel_id)
    REFERENCES channel (id)
    ;

ALTER TABLE history_ad_order
    ADD CONSTRAINT fk_adorder_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE history_ad_order
    ADD CONSTRAINT fk_frame_order_id
    FOREIGN KEY (frame_order_id)
    REFERENCES frame_order (id)
    ;

ALTER TABLE history_ad_order
    ADD CONSTRAINT fk_customer_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE history_ad_order
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (f_customer_id)
    REFERENCES f_customer (id)
    ;

ALTER TABLE history_ad_order
    ADD CONSTRAINT fk_a_id
    FOREIGN KEY (f_agent_id)
    REFERENCES f_agent (id)
    ;

ALTER TABLE history_ad_order
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (f_user_type_id)
    REFERENCES f_user_type (id)
    ;

ALTER TABLE history_register_display
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE history_register_display
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE history_register_display
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE history_register_video
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE history_register_video
    ADD CONSTRAINT fk_channel
    FOREIGN KEY (channel_name)
    REFERENCES channel (name)
    ;

ALTER TABLE history_register_video
    ADD CONSTRAINT fk_quotation_id
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE order_balance
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE cast_video_group
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_video_group
    ADD CONSTRAINT fk_video_group_id
    FOREIGN KEY (video_group_id)
    REFERENCES video_group (id)
    ;

ALTER TABLE click_ini
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE idea_mask
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE crm_company
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (pid)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_company
    ADD CONSTRAINT fk_user_type_id
    FOREIGN KEY (user_type_id)
    REFERENCES user_type (id)
    ;

ALTER TABLE crm_company
    ADD CONSTRAINT fk_user_sub_type_id
    FOREIGN KEY (user_sub_type_id)
    REFERENCES user_sub_type (id)
    ;

ALTER TABLE company_income
    ADD CONSTRAINT fk_c_id
    FOREIGN KEY (company_id)
    REFERENCES crm_company (id)
    ;

ALTER TABLE isp_ip
    ADD CONSTRAINT fk_isp_id
    FOREIGN KEY (isp_id)
    REFERENCES isp (id)
    ;

ALTER TABLE cast_isp
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_isp
    ADD CONSTRAINT fk_isp_id
    FOREIGN KEY (isp_id)
    REFERENCES isp (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_c_id1
    FOREIGN KEY (crm_company_id_01)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_c_id2
    FOREIGN KEY (crm_company_id_02)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_c_id3
    FOREIGN KEY (crm_company_id_03)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_region_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_agent
    ADD CONSTRAINT fk_approve_u_id
    FOREIGN KEY (approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_c_id1
    FOREIGN KEY (crm_company_id_01)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_c_id2
    FOREIGN KEY (crm_company_id_02)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_c_id3
    FOREIGN KEY (crm_company_id_03)
    REFERENCES crm_company (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_customer_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_user_type_id
    FOREIGN KEY (user_type_id)
    REFERENCES user_type (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_user_sub_type_id
    FOREIGN KEY (user_sub_type_id)
    REFERENCES user_sub_type (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_customer
    ADD CONSTRAINT fk_approve_u_id
    FOREIGN KEY (approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_news
    ADD CONSTRAINT fk_news_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_dictionary
    ADD CONSTRAINT fk_dictionary_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_vote
    ADD CONSTRAINT fk_crm_vote_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_vote_answer
    ADD CONSTRAINT fk_crm_vote_answer_id
    FOREIGN KEY (vote_id)
    REFERENCES crm_vote (id)
    ;

ALTER TABLE crm_pms
    ADD CONSTRAINT fk_pms_from_u_id
    FOREIGN KEY (from_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_pms
    ADD CONSTRAINT fk_pms_to_u_id
    FOREIGN KEY (to_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_customer_product_id
    FOREIGN KEY (crm_customer_product_id)
    REFERENCES crm_customer_product (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_customer_info_id
    FOREIGN KEY (new_customer_id)
    REFERENCES crm_customer_info (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_customer_category_id
    FOREIGN KEY (customer_category_id)
    REFERENCES crm_customer_industry (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_customer_industry_id
    FOREIGN KEY (customer_industry_id)
    REFERENCES crm_customer_industry (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_customer_brand_id
    FOREIGN KEY (customer_brand_id)
    REFERENCES crm_customer_brand (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_frontlog_id
    FOREIGN KEY (frontlog_id)
    REFERENCES crm_brief (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_user_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_01
    FOREIGN KEY (direct_user_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_01_leader_id_01
    FOREIGN KEY (direct_user_id_01_leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_01_leader_id_02
    FOREIGN KEY (direct_user_id_01_leader_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_01_leader_id_03
    FOREIGN KEY (direct_user_id_01_leader_id_03)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_02
    FOREIGN KEY (direct_user_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_02_leader_id_01
    FOREIGN KEY (direct_user_id_02_leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_02_leader_id_02
    FOREIGN KEY (direct_user_id_02_leader_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_direct_user_id_02_leader_id_03
    FOREIGN KEY (direct_user_id_02_leader_id_03)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_channel_user_id_01
    FOREIGN KEY (channel_user_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_channel_user_id_01_leader_id_01
    FOREIGN KEY (channel_user_id_01_leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_channel_user_id_01_leader_id_03
    FOREIGN KEY (channel_user_id_01_leader_id_03)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_channel_user_id_02
    FOREIGN KEY (channel_user_id_02)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_channel_user_id_02_leader_id_01
    FOREIGN KEY (channel_user_id_02_leader_id_01)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_channel_user_id_02_leader_id_03
    FOREIGN KEY (channel_user_id_02_leader_id_03)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_ae_user_id
    FOREIGN KEY (ae_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_f_agent_payment_id
    FOREIGN KEY (f_agent_payment_id)
    REFERENCES f_agent_payment (id)
    ;

ALTER TABLE crm_order
    ADD CONSTRAINT fk_crm_order_f_customer_payment_id
    FOREIGN KEY (f_customer_payment_id)
    REFERENCES f_customer_payment (id)
    ;

ALTER TABLE crm_order_user
    ADD CONSTRAINT fk_crm_order_user_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_user
    ADD CONSTRAINT fk_crm_order_user_user_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order_kpi
    ADD CONSTRAINT fk_crm_order_kpi_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_schedule_attachment
    ADD CONSTRAINT fk_crm_order_schedule_attachment_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_contract_attachment
    ADD CONSTRAINT fk_crm_order_contract_attachment_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_log
    ADD CONSTRAINT fk_crm_order_log_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order_log
    ADD CONSTRAINT fk_crm_order_log_o_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_approve_operator
    ADD CONSTRAINT fk_crm_order_approve_u_id
    FOREIGN KEY (approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order_approve_operator
    ADD CONSTRAINT fk_crm_order_approve_o_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_advertising_fee
    ADD CONSTRAINT fk_advertising_fee_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_advertising_fee
    ADD CONSTRAINT fk_advertising_fee_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_order_advertising_fee_income
    ADD CONSTRAINT fk_crmorder_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_notes
    ADD CONSTRAINT fk_crm_notes_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_credit
    ADD CONSTRAINT fk_crm_credit_user_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_credit
    ADD CONSTRAINT fk_crm_credit_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_credit
    ADD CONSTRAINT fk_crm_credit_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_credit_approve_operator
    ADD CONSTRAINT fk_crm_credit_approve_u_id
    FOREIGN KEY (approve_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_credit_approve_operator
    ADD CONSTRAINT fk_crm_credit_approve_o_id
    FOREIGN KEY (crm_credit_id)
    REFERENCES crm_credit (id)
    ;

ALTER TABLE register_display_process
    ADD CONSTRAINT fk_adorder_id_process
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE register_display_process
    ADD CONSTRAINT fk_position_id_process
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE register_display_process
    ADD CONSTRAINT fk_quotation_id_process
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE register_video_process
    ADD CONSTRAINT fk_adorder_id_process
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE register_video_process
    ADD CONSTRAINT fk_channel_process
    FOREIGN KEY (channel_name)
    REFERENCES channel (name)
    ;

ALTER TABLE register_video_process
    ADD CONSTRAINT fk_quotation_id_process
    FOREIGN KEY (quotation_id)
    REFERENCES quotation (id)
    ;

ALTER TABLE tv_play
    ADD CONSTRAINT fk_tv
    FOREIGN KEY (tv_id)
    REFERENCES tv (id)
    ;

ALTER TABLE tv_play
    ADD CONSTRAINT fk_play
    FOREIGN KEY (play_id)
    REFERENCES play (id)
    ;

ALTER TABLE vali_todovideo
    ADD CONSTRAINT fk_listid
    FOREIGN KEY (list_id)
    REFERENCES vali_todolist (id)
    ;

ALTER TABLE vali_pointcut
    ADD CONSTRAINT fk_vid
    FOREIGN KEY (video_id)
    REFERENCES vali_todovideo (id)
    ;

ALTER TABLE vali_pointcut
    ADD CONSTRAINT fk_pid
    FOREIGN KEY (point_id)
    REFERENCES point (id)
    ;

ALTER TABLE history_register_nonstandard
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE history_register_nonstandard
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE register_play
    ADD CONSTRAINT playid
    FOREIGN KEY (playid)
    REFERENCES video_group (playid)
    ;

ALTER TABLE register_play
    ADD CONSTRAINT orderid
    FOREIGN KEY (orderid)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_relation_amount
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (amount_order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_relation_amount
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (sour_order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_relation_effect
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (effect_order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_relation_effect
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (sour_order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE idea_url
    ADD CONSTRAINT fk_adidea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE idea_kaijitu
    ADD CONSTRAINT fk_adidea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE vp_position
    ADD CONSTRAINT fk_parent_id
    FOREIGN KEY (parent_id)
    REFERENCES vp_position (id)
    ;

ALTER TABLE vp_position
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE vp_register
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE vp_register
    ADD CONSTRAINT fk_vp_config
    FOREIGN KEY (config_id)
    REFERENCES vp_config (id)
    ;

ALTER TABLE vp_register
    ADD CONSTRAINT fk_vp_position
    FOREIGN KEY (vp_position_id)
    REFERENCES vp_position (id)
    ;

ALTER TABLE vp_config
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE vp_city
    ADD CONSTRAINT fk_config_id
    FOREIGN KEY (config_id)
    REFERENCES vp_config (id)
    ;

ALTER TABLE vp_city
    ADD CONSTRAINT fk_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE vp_city
    ADD CONSTRAINT fk_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE vp_channel
    ADD CONSTRAINT fk_config_id
    FOREIGN KEY (config_id)
    REFERENCES vp_config (id)
    ;

ALTER TABLE vp_channel
    ADD CONSTRAINT fk_channel
    FOREIGN KEY (channel_id)
    REFERENCES channel (id)
    ;

ALTER TABLE vp_channel
    ADD CONSTRAINT fk_sub_channel_id
    FOREIGN KEY (sub_channel_id)
    REFERENCES sub_channel (id)
    ;

ALTER TABLE p_business
    ADD CONSTRAINT fk_p_business_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_role
    ADD CONSTRAINT fk_p_role_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_role
    ADD CONSTRAINT fk_p_role_b_u_id
    FOREIGN KEY (business_id)
    REFERENCES p_business (id)
    ;

ALTER TABLE p_module
    ADD CONSTRAINT fk_p_module_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_module
    ADD CONSTRAINT fk_p_mobule_b_id
    FOREIGN KEY (business_id)
    REFERENCES p_business (id)
    ;

ALTER TABLE p_function
    ADD CONSTRAINT fk_p_function_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_function
    ADD CONSTRAINT fk_p_function_m_id
    FOREIGN KEY (module_id)
    REFERENCES p_module (id)
    ;

ALTER TABLE p_module_namespace
    ADD CONSTRAINT fk_p_module_namespace_m_id
    FOREIGN KEY (module_id)
    REFERENCES p_module (id)
    ;

ALTER TABLE p_module_namespace
    ADD CONSTRAINT fk_p_module_namespace_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_role
    ADD CONSTRAINT fk_p_user_role_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_role
    ADD CONSTRAINT fk_p_user_role_r_id
    FOREIGN KEY (role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_user_role
    ADD CONSTRAINT fk_p_user_role_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_role_data
    ADD CONSTRAINT fk_p_user_role_data_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_role_data
    ADD CONSTRAINT fk_p_user_role_data_r_id
    FOREIGN KEY (role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_user_role_data
    ADD CONSTRAINT fk_p_user_role_data_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_module
    ADD CONSTRAINT fk_p_user_module_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_module
    ADD CONSTRAINT fk_p_user_module_m_id
    FOREIGN KEY (module_id)
    REFERENCES p_module (id)
    ;

ALTER TABLE p_user_module
    ADD CONSTRAINT fk_p_user_module_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_function
    ADD CONSTRAINT fk_p_user_function_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_function
    ADD CONSTRAINT fk_p_user_function_f_id
    FOREIGN KEY (function_id)
    REFERENCES p_function (id)
    ;

ALTER TABLE p_user_function
    ADD CONSTRAINT fk_p_user_function_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_role_module
    ADD CONSTRAINT fk_p_role_module_r_id
    FOREIGN KEY (role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_role_module
    ADD CONSTRAINT fk_p_role_module_m_id
    FOREIGN KEY (module_id)
    REFERENCES p_module (id)
    ;

ALTER TABLE p_role_module
    ADD CONSTRAINT fk_p_role_module_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_role_function
    ADD CONSTRAINT fk_p_role_function_r_id
    FOREIGN KEY (role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_role_function
    ADD CONSTRAINT fk_p_role_function_f_id
    FOREIGN KEY (function_id)
    REFERENCES p_function (id)
    ;

ALTER TABLE p_role_function
    ADD CONSTRAINT fk_p_role_function_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_business
    ADD CONSTRAINT fk_p_user_business_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_business
    ADD CONSTRAINT fk_p_user_business_r_id
    FOREIGN KEY (business_id)
    REFERENCES p_business (id)
    ;

ALTER TABLE p_user_business
    ADD CONSTRAINT fk_p_user_business_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_user_app_logs
    ADD CONSTRAINT fk_p_auth_user_app_logs_o_u_id
    FOREIGN KEY (op_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_user_app_logs
    ADD CONSTRAINT fk_p_auth_user_app_logs_t_u_id
    FOREIGN KEY (target_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_user_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_o_u_id
    FOREIGN KEY (op_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_user_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_t_u_id
    FOREIGN KEY (target_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_user_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_t_m_id
    FOREIGN KEY (target_module_id)
    REFERENCES p_module (id)
    ;

ALTER TABLE p_auth_user_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_t_f_id
    FOREIGN KEY (target_function_id)
    REFERENCES p_function (id)
    ;

ALTER TABLE p_auth_user_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_t_r_id
    FOREIGN KEY (target_role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_auth_role_app_logs
    ADD CONSTRAINT fk_p_auth_role_app_logs_o_u_id
    FOREIGN KEY (op_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_role_app_logs
    ADD CONSTRAINT fk_p_auth_role_app_logs_t_r_id
    FOREIGN KEY (target_role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_auth_role_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_o_u_id
    FOREIGN KEY (op_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_auth_role_app_logs_detail
    ADD CONSTRAINT fk_p_auth_user_app_logs_detail_t_r_id
    FOREIGN KEY (target_role_id)
    REFERENCES p_role (id)
    ;

ALTER TABLE p_auth_role_app_logs_detail
    ADD CONSTRAINT fk_p_auth_role_app_logs_detail_t_m_id
    FOREIGN KEY (target_module_id)
    REFERENCES p_module (id)
    ;

ALTER TABLE p_auth_role_app_logs_detail
    ADD CONSTRAINT fk_p_auth_role_app_logs_detail_t_f_id
    FOREIGN KEY (target_function_id)
    REFERENCES p_function (id)
    ;

ALTER TABLE p_auth_role_app_logs_detail
    ADD CONSTRAINT fk_p_auth_role_app_logs_detail_t_u_id
    FOREIGN KEY (target_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_data
    ADD CONSTRAINT fk_p_data_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_data
    ADD CONSTRAINT fk_p_data_b_u_id
    FOREIGN KEY (business_id)
    REFERENCES p_business (id)
    ;

ALTER TABLE p_user_data
    ADD CONSTRAINT fk_p_user_data_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE p_user_data
    ADD CONSTRAINT fk_p_user_data_d_id
    FOREIGN KEY (data_id)
    REFERENCES p_data (id)
    ;

ALTER TABLE p_user_data
    ADD CONSTRAINT fk_p_user_data_create_u_id
    FOREIGN KEY (create_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_module
    ADD CONSTRAINT fk_crm_module_user_creator_id
    FOREIGN KEY (creator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_module
    ADD CONSTRAINT fk_crm_module_parentid
    FOREIGN KEY (parentid)
    REFERENCES crm_module (id)
    ;

ALTER TABLE crm_module_work
    ADD CONSTRAINT fk_crm_module__work_user_creator_id
    FOREIGN KEY (creator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_module_work
    ADD CONSTRAINT fk_crm_module__work_module_id
    FOREIGN KEY (module_id)
    REFERENCES crm_module (id)
    ;

ALTER TABLE crm_role
    ADD CONSTRAINT fk_crm_role_user_creator_id
    FOREIGN KEY (creator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_role_user
    ADD CONSTRAINT fk_crm_role_user_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_role_user
    ADD CONSTRAINT fk_crm_role_user_r_id
    FOREIGN KEY (role_id)
    REFERENCES crm_role (id)
    ;

ALTER TABLE crm_role_user
    ADD CONSTRAINT fk_crm_role_user_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_module_role
    ADD CONSTRAINT fk_crm_module_role_u_id
    FOREIGN KEY (module_id)
    REFERENCES crm_module (id)
    ;

ALTER TABLE crm_module_role
    ADD CONSTRAINT fk_crm_module_role_r_id
    FOREIGN KEY (role_id)
    REFERENCES crm_role (id)
    ;

ALTER TABLE crm_module_role
    ADD CONSTRAINT fk_crm_module_role_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_data
    ADD CONSTRAINT fk_crm_user_data_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_data
    ADD CONSTRAINT fk_crm_user_data_creator_id
    FOREIGN KEY (creaor)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_org
    ADD CONSTRAINT fk_crm_user_org_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_user_org
    ADD CONSTRAINT fk_crm_org_id
    FOREIGN KEY (org_id)
    REFERENCES crm_organize (id)
    ;

ALTER TABLE crm_user_org
    ADD CONSTRAINT fk_crm_user_org_creator_id
    FOREIGN KEY (creaor)
    REFERENCES user (id)
    ;

ALTER TABLE crm_organize
    ADD CONSTRAINT fk_crm_user_org_creator_id
    FOREIGN KEY (creaor)
    REFERENCES user (id)
    ;

ALTER TABLE crm_organize
    ADD CONSTRAINT fk_crm_organize_crm_org_id
    FOREIGN KEY (pareint_id)
    REFERENCES crm_organize (id)
    ;

ALTER TABLE crm_workflow
    ADD CONSTRAINT fk_crm_workflow_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_workflow_node
    ADD CONSTRAINT fk_crm_workflow_node_workflow_id
    FOREIGN KEY (workflow_id)
    REFERENCES crm_workflow (id)
    ;

ALTER TABLE crm_workflow_node
    ADD CONSTRAINT fk_crm_workflow_node_role_id
    FOREIGN KEY (role_id)
    REFERENCES crm_role (id)
    ;

ALTER TABLE crm_workflow_node
    ADD CONSTRAINT fk_crm_workflow_node_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_workflow_instance
    ADD CONSTRAINT fk_crm_workflow_instance_workflow_id
    FOREIGN KEY (workflow_id)
    REFERENCES crm_workflow (id)
    ;

ALTER TABLE crm_workflow_instance
    ADD CONSTRAINT fk_crm_workflow_instance_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_workflow_task
    ADD CONSTRAINT fk_crm_workflow_instance_workflow_id
    FOREIGN KEY (node_id)
    REFERENCES crm_workflow_node (id)
    ;

ALTER TABLE crm_workflow_task
    ADD CONSTRAINT fk_crm_workflow_instance_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_workflow_task
    ADD CONSTRAINT fk_crm_workflow_task_pre_task_id
    FOREIGN KEY (pre_task_id)
    REFERENCES crm_workflow_task (id)
    ;

ALTER TABLE crm_customer_industry
    ADD CONSTRAINT fk_customer_info_industry_parentid
    FOREIGN KEY (parentid)
    REFERENCES crm_customer_industry (id)
    ;

ALTER TABLE crm_customer_product
    ADD CONSTRAINT fk_crm_customer_product_brand_id
    FOREIGN KEY (brand)
    REFERENCES crm_customer_brand (id)
    ;

ALTER TABLE crm_customer_info
    ADD CONSTRAINT fk_customer_info_industry_id
    FOREIGN KEY (industry)
    REFERENCES crm_customer_industry (id)
    ;

ALTER TABLE crm_customer_info
    ADD CONSTRAINT fk_customer_info_group_id
    FOREIGN KEY (groupid)
    REFERENCES crm_customer_group (id)
    ;

ALTER TABLE crm_customer_brand_ref
    ADD CONSTRAINT fk_crm_customer_brand_ref_brand_id
    FOREIGN KEY (brand)
    REFERENCES crm_customer_brand (id)
    ;

ALTER TABLE crm_customer_brand_ref
    ADD CONSTRAINT fk_crm_customer_brand_ref_brand_id
    FOREIGN KEY (customer)
    REFERENCES crm_customer_info (id)
    ;

ALTER TABLE crm_customer_brand_ref
    ADD CONSTRAINT crm_customer_category_ref_id
    FOREIGN KEY (category)
    REFERENCES crm_customer_industry (id)
    ;

ALTER TABLE crm_customer_category_ref
    ADD CONSTRAINT crm_customer_category_ref_id
    FOREIGN KEY (category)
    REFERENCES crm_customer_industry (id)
    ;

ALTER TABLE crm_customer_category_ref
    ADD CONSTRAINT crm_customer_category_ref_id
    FOREIGN KEY (customer)
    REFERENCES crm_customer_info (id)
    ;

ALTER TABLE crm_order_advertising_fee_moidfy_bak
    ADD CONSTRAINT fk_advertising_fee_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_advertising_fee_moidfy_bak
    ADD CONSTRAINT fk_advertising_fee_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_order_kpi_moidfy_bak
    ADD CONSTRAINT fk_crm_order_kpi_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE order_lock_state
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE crm_order_modify
    ADD CONSTRAINT fk_crm_order_modify_u_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order_modify
    ADD CONSTRAINT fk_crm_order_modify_o_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE order_registerDiffFile
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE register_price
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_product
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_product
    ADD CONSTRAINT fk_adproduct_id
    FOREIGN KEY (product_id)
    REFERENCES ad_product (id)
    ;

ALTER TABLE order_product_version
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE order_product_version
    ADD CONSTRAINT fk_adproduct_id
    FOREIGN KEY (product_id)
    REFERENCES ad_product (id)
    ;

ALTER TABLE config_product
    ADD CONSTRAINT fk_vpconfig_id
    FOREIGN KEY (config_id)
    REFERENCES vp_config (id)
    ;

ALTER TABLE config_product
    ADD CONSTRAINT fk_adproduct_id
    FOREIGN KEY (product_id)
    REFERENCES ad_product (id)
    ;

ALTER TABLE config_product_version
    ADD CONSTRAINT fk_vpconfig_id
    FOREIGN KEY (config_id)
    REFERENCES vp_config (id)
    ;

ALTER TABLE config_product_version
    ADD CONSTRAINT fk_adproduct_id
    FOREIGN KEY (product_id)
    REFERENCES ad_product (id)
    ;

ALTER TABLE vp_position_quotation
    ADD CONSTRAINT fk_vp_position_id
    FOREIGN KEY (vp_position_id)
    REFERENCES vp_position (id)
    ;

ALTER TABLE cityLevel_quotation_price
    ADD CONSTRAINT fk_vp_position_id
    FOREIGN KEY (vp_position_id)
    REFERENCES vp_position (id)
    ;

ALTER TABLE cast_crowd
    ADD CONSTRAINT fk_cast_crowd_c_id
    FOREIGN KEY (crowd_id)
    REFERENCES crowd (id)
    ;

ALTER TABLE cast_crowd
    ADD CONSTRAINT fk_cast_crowd_ac_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE theater
    ADD CONSTRAINT fk_type_id
    FOREIGN KEY (theater_type_id)
    REFERENCES theater_type (id)
    ;

ALTER TABLE theater
    ADD CONSTRAINT fk_order_id
    FOREIGN KEY (theater_order_id)
    REFERENCES theater_order (id)
    ;

ALTER TABLE theater_play
    ADD CONSTRAINT fk_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_play_version
    ADD CONSTRAINT fk_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_idea
    ADD CONSTRAINT fk_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_idea
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE theater_def
    ADD CONSTRAINT fk_theater_def_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_def
    ADD CONSTRAINT fk_theater_def_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE partner_idea
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE partner_area
    ADD CONSTRAINT fk_partner_area_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE partner_area
    ADD CONSTRAINT fk_partner_area_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE partner_rate
    ADD CONSTRAINT fk_partner_rate_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE partner_rate
    ADD CONSTRAINT fk_partner_rate_area_id
    FOREIGN KEY (partner_area_id)
    REFERENCES partner_area (id)
    ;

ALTER TABLE campaign_period
    ADD CONSTRAINT fk_campaign
    FOREIGN KEY (campaign_id)
    REFERENCES campaign (id)
    ;

ALTER TABLE crm_buying_brief
    ADD CONSTRAINT fk_crm_buying_brief_role_creatator_id
    FOREIGN KEY (creatator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_buying_brief
    ADD CONSTRAINT fk_crm_buying_brief_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES customer (id)
    ;

ALTER TABLE crm_buying_brief
    ADD CONSTRAINT fk_crm_buying_brief_agent_id
    FOREIGN KEY (agent_id)
    REFERENCES agent (id)
    ;

ALTER TABLE crm_buying_brief_kpis
    ADD CONSTRAINT fk_crm_buying_brief_kpis_brief_id
    FOREIGN KEY (brief_id)
    REFERENCES crm_buying_brief (id)
    ;

ALTER TABLE crm_buying_brief_orders
    ADD CONSTRAINT fk_crm_buying_brief_orders_brief_id
    FOREIGN KEY (brief_id)
    REFERENCES crm_buying_brief (id)
    ;

ALTER TABLE crm_buying_brief_orders
    ADD CONSTRAINT fk_crm_buying_brief_orders_brief_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE crm_buying_brief_detail
    ADD CONSTRAINT fk_crm_buying_brief_detail_brief_id
    FOREIGN KEY (brief_id)
    REFERENCES crm_buying_brief (id)
    ;

ALTER TABLE crm_buying_brief_approve
    ADD CONSTRAINT fk_crm_crm_buying_brief_approve_creatator
    FOREIGN KEY (creator)
    REFERENCES user (id)
    ;

ALTER TABLE crm_buying_brief_approve
    ADD CONSTRAINT fk_crm_buying_brief_approve_brief_id
    FOREIGN KEY (brief_id)
    REFERENCES crm_buying_brief (id)
    ;

ALTER TABLE video_ad_type_position
    ADD CONSTRAINT fk_video_ad_type_id
    FOREIGN KEY (video_ad_type_id)
    REFERENCES video_ad_type (id)
    ;

ALTER TABLE video_ad_type_position
    ADD CONSTRAINT fk_video_ad_position_id
    FOREIGN KEY (video_ad_position_id)
    REFERENCES video_ad_position (id)
    ;

ALTER TABLE video_ad_type_position
    ADD CONSTRAINT fk_vp_position_id
    FOREIGN KEY (vp_position_id)
    REFERENCES vp_position (id)
    ;

ALTER TABLE ad_cast_offline
    ADD CONSTRAINT fk_adorder_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE ad_cast_offline
    ADD CONSTRAINT fk_position_id
    FOREIGN KEY (display_position_id)
    REFERENCES position (id)
    ;

ALTER TABLE ad_cast_offline
    ADD CONSTRAINT fk_non_position_id
    FOREIGN KEY (nonstandard_position_id)
    REFERENCES position (id)
    ;

ALTER TABLE crm_mail_approval_token
    ADD CONSTRAINT approval_user_id
    FOREIGN KEY (approval_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_contract_takeback_history
    ADD CONSTRAINT fk_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_contract_takeback_history
    ADD CONSTRAINT fk_crm_contract_takeback_history_takeback_user_id
    FOREIGN KEY (takeback_user_id)
    REFERENCES user (id)
    ;

ALTER TABLE crm_order_income
    ADD CONSTRAINT fk_crm_order_income_crm_order_id
    FOREIGN KEY (crm_order_id)
    REFERENCES crm_order (id)
    ;

ALTER TABLE crm_order_income
    ADD CONSTRAINT fk_crm_order_income_user_id
    FOREIGN KEY (user_id)
    REFERENCES user (id)
    ;

ALTER TABLE ad_cast_ignore
    ADD CONSTRAINT fk_ad_order_cast_ignore_id
    FOREIGN KEY (order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE theater_cpm
    ADD CONSTRAINT fk_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_cpm
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE theater_lunbo
    ADD CONSTRAINT fk_theater_lunbo_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_lunbo
    ADD CONSTRAINT fk_theater_lunbo_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE theater_order
    ADD CONSTRAINT fk_adorder_theater_order_id
    FOREIGN KEY (ad_order_id)
    REFERENCES ad_order (id)
    ;

ALTER TABLE theater_approval
    ADD CONSTRAINT fk_theater_order_id
    FOREIGN KEY (theater_order_id)
    REFERENCES theater_order (id)
    ;

ALTER TABLE theater_type_resource
    ADD CONSTRAINT fk_procuct_type_id
    FOREIGN KEY (product_type_id)
    REFERENCES theater_type (id)
    ;

ALTER TABLE theater_type_resource
    ADD CONSTRAINT fk_theater_resource_id
    FOREIGN KEY (resource_id)
    REFERENCES theater_resource (id)
    ;

ALTER TABLE theater_register
    ADD CONSTRAINT fk_order_id
    FOREIGN KEY (theater_order_id)
    REFERENCES theater_order (id)
    ;

ALTER TABLE theater_register
    ADD CONSTRAINT fk_theater_id
    FOREIGN KEY (theater_id)
    REFERENCES theater (id)
    ;

ALTER TABLE theater_register
    ADD CONSTRAINT fk_resource_id
    FOREIGN KEY (theater_resource_id)
    REFERENCES theater_resource (id)
    ;

ALTER TABLE yum_idea
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE ies_report
    ADD CONSTRAINT fk_ies_organization_id
    FOREIGN KEY (ies_id)
    REFERENCES ies_organization (id)
    ;

ALTER TABLE ies_data_log
    ADD CONSTRAINT fk_ies_organization_id
    FOREIGN KEY (ies_id)
    REFERENCES ies_organization (id)
    ;

ALTER TABLE resource_area
    ADD CONSTRAINT fk_resource_id
    FOREIGN KEY (resource_id)
    REFERENCES resource (id)
    ;

ALTER TABLE resource_area
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE resource_area
    ADD CONSTRAINT fk_region_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE resource_channel
    ADD CONSTRAINT fk_resource_id
    FOREIGN KEY (resource_id)
    REFERENCES resource (id)
    ;

ALTER TABLE resource_channel
    ADD CONSTRAINT fk_channel_id
    FOREIGN KEY (channel_id)
    REFERENCES channel (id)
    ;

ALTER TABLE resource_channel
    ADD CONSTRAINT fk_subchannel_id
    FOREIGN KEY (subchannel_id)
    REFERENCES sub_channel (id)
    ;

ALTER TABLE blueocean
    ADD CONSTRAINT fk_resource_id
    FOREIGN KEY (resource_id)
    REFERENCES resource (id)
    ;

ALTER TABLE blueocean_idea
    ADD CONSTRAINT fk_blueocean_id
    FOREIGN KEY (blueocean_id)
    REFERENCES blueocean (id)
    ;

ALTER TABLE blueocean_idea
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE flashbomb
    ADD CONSTRAINT fk_flashbomb_resource_id
    FOREIGN KEY (resource_id)
    REFERENCES resource (id)
    ;

ALTER TABLE flashbomb
    ADD CONSTRAINT fk_flashbomb_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE flashbomb
    ADD CONSTRAINT fk_flashbomb_vb_idea_id
    FOREIGN KEY (vb_idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE flashbomb
    ADD CONSTRAINT fk_flashbomb_yvp_idea_id
    FOREIGN KEY (vp_idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE flashbomb
    ADD CONSTRAINT fk_flashbomb_ycrazy_idea_id
    FOREIGN KEY (crazy_idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE default_html_idea
    ADD CONSTRAINT fk_defaultHtmlIdea_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE default_position_idea
    ADD CONSTRAINT fk_defaultPI_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE default_position_idea
    ADD CONSTRAINT fk_defaultPI_position_id
    FOREIGN KEY (position_id)
    REFERENCES position (id)
    ;

ALTER TABLE entry_idea
    ADD CONSTRAINT fk_entry_id
    FOREIGN KEY (entry_id)
    REFERENCES entry (id)
    ;

ALTER TABLE entry_idea
    ADD CONSTRAINT fk_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE blueocean_idea_cpm
    ADD CONSTRAINT fk_blueocean_cpm_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE blueocean_idea_cpm
    ADD CONSTRAINT fk_blueocean_cpm_info_id
    FOREIGN KEY (blueocean_info_id)
    REFERENCES blueocean_info (id)
    ;

ALTER TABLE blueocean_idea_cpm
    ADD CONSTRAINT fk_blueocean_cpm_resource_id
    FOREIGN KEY (blueocean_resource_id)
    REFERENCES blueocean_resource (resource_id)
    ;

ALTER TABLE blueocean_cast
    ADD CONSTRAINT fk_blueocean_cast_info_id
    FOREIGN KEY (blueocean_info_id)
    REFERENCES blueocean_info (id)
    ;

ALTER TABLE blueocean_cast
    ADD CONSTRAINT fk_blueocean_cast_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE sub_os
    ADD CONSTRAINT fk_os_id
    FOREIGN KEY (os_id)
    REFERENCES os (id)
    ;

ALTER TABLE cast_os
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_os
    ADD CONSTRAINT fk_os_id
    FOREIGN KEY (os_id)
    REFERENCES os (id)
    ;

ALTER TABLE cast_subos
    ADD CONSTRAINT fk_cast_id
    FOREIGN KEY (cast_id)
    REFERENCES ad_cast (id)
    ;

ALTER TABLE cast_subos
    ADD CONSTRAINT fk_subos_id
    FOREIGN KEY (subos_id)
    REFERENCES sub_os (id)
    ;

ALTER TABLE ration_optimize
    ADD CONSTRAINT fk_m_resource_id
    FOREIGN KEY (m_resource_id)
    REFERENCES m_resource (id)
    ;

ALTER TABLE ration_optimize
    ADD CONSTRAINT fk_camp_optimize_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE m_resource_os
    ADD CONSTRAINT fk_m_resource_id
    FOREIGN KEY (m_resource_id)
    REFERENCES m_resource (id)
    ;

ALTER TABLE m_resource_os
    ADD CONSTRAINT fk_os_id
    FOREIGN KEY (os_id)
    REFERENCES os (id)
    ;

ALTER TABLE m_resource_os
    ADD CONSTRAINT fk_subos_id
    FOREIGN KEY (subos_id)
    REFERENCES sub_os (id)
    ;

ALTER TABLE m_resource_area
    ADD CONSTRAINT fk_resource_id
    FOREIGN KEY (m_resource_id)
    REFERENCES m_resource (id)
    ;

ALTER TABLE m_resource_area
    ADD CONSTRAINT fk_region_province_id
    FOREIGN KEY (province_id)
    REFERENCES province_name (id)
    ;

ALTER TABLE m_resource_area
    ADD CONSTRAINT fk_region_city_id
    FOREIGN KEY (city_id)
    REFERENCES city_name (id)
    ;

ALTER TABLE m_resource_channel
    ADD CONSTRAINT fk_resource_id
    FOREIGN KEY (m_resource_id)
    REFERENCES m_resource (id)
    ;

ALTER TABLE m_resource_channel
    ADD CONSTRAINT fk_channel_id
    FOREIGN KEY (channel_id)
    REFERENCES channel (id)
    ;

ALTER TABLE m_resource_channel
    ADD CONSTRAINT fk_subchannel_id
    FOREIGN KEY (subchannel_id)
    REFERENCES sub_channel (id)
    ;

ALTER TABLE m_flashbomb
    ADD CONSTRAINT fk_m_flashbomb_m_resource_id
    FOREIGN KEY (m_resource_id)
    REFERENCES m_resource (id)
    ;

ALTER TABLE m_flashbomb
    ADD CONSTRAINT fk_m_flashbomb_idea_id
    FOREIGN KEY (idea_id)
    REFERENCES idea (id)
    ;

ALTER TABLE vp_os
    ADD CONSTRAINT fk_vp_os_config_id
    FOREIGN KEY (config_id)
    REFERENCES vp_config (id)
    ;

ALTER TABLE vp_os
    ADD CONSTRAINT fk_vp_os_id
    FOREIGN KEY (os_id)
    REFERENCES os (id)
    ;

ALTER TABLE vp_os
    ADD CONSTRAINT fk_vp_sub_os_id
    FOREIGN KEY (sub_os_id)
    REFERENCES sub_os (id)
    ;

