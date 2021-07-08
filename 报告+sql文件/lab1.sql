 -- 请在以下空白行填写完成目标任务的SQL语句：
 create database covid19mon;

 -- end 

if exists (select * from sys.databases where name = 'covid19mon')
    drop database covid19mon;
 create database covid19mon  COLLATE Chinese_PRC_CI_AS;  
 go
 use covid19mon;
 go

-- 请在以下适当的空白位置填写SQL语句完成任务书的要求。空白位置不够的话，可以通过回车换行增加。
-- 表1 人员表(person)
 create table person(
     id int,
     fullname char(20) not null,
     telephone char(11) not null,
     constraint pk_person primary key(id)
 );
-- 表2 地点表(location)
 create table location(
     id int,
     location_name char(20) not null,
     constraint pk_location primary key(id)
 );
-- 表3 行程表（itinerary）
 create table itinerary(
     id int,
     p_id int,
     loc_id int,
     constraint fk_itinerary_pid foreign key(p_id) references person(id),
     constraint fk_itinerary_lid foreign key(loc_id) references location(id),
     s_time datetime,
     e_time datetime,
     constraint pk_itinerary primary key(id)
 );
-- 表4 诊断表（diagnose_record）
 create table diagnose_record(
     id int,
     p_id int,
     constraint fk_diagnose_pid foreign key (p_id) references person(id),
     diagnose_date datetime,
     result int,
     constraint pk_diagnose_record primary key(id)
 );
-- 表5 密切接触者表（close_contact）
create table close_contact(
    id int,
    p_id int,
    contact_date datetime,
    loc_id int,
    case_p_id int,
    constraint fk_contact_pid foreign key (p_id) references person(id),
    constraint fk_contact_lid foreign key (loc_id) references location(id),
    constraint fk_contact_caseid foreign key(case_p_id) references person(id),
    constraint pk_close_contact primary key(id)
);
-- 表6 隔离地点表（isolation_location）
create table isolation_location(
    id int,
    location_name char(20),
    capacity int,
    constraint pk_isolation_loc primary key(id)
);
-- 表7 隔离表（isolation_record）
create table isolation_record(
    id int,
    p_id int,
    s_date datetime,
    e_date datetime,
    isol_loc_id int,
    constraint fk_isolation_pid foreign key(p_id) references person(id),
    constraint fk_isolation_lid foreign key(isol_loc_id) references isolation_location(id),
    state int, 
    constraint pk_isolation primary key(id)
);
-- 代码结束
/* *********************************************************** */

use covid19mon;
go

-- 向人员表person插入以下3条数据:
-- ( 1, 张小敏,13907110001)
-- ( 2, 李大锤,18907110002)
-- ( 3, 孙二娘,13307100003)
-- 请在以下空白处写下完成任务要求的SQL语句：
insert into person values(1,N'张小敏',N'13907110001');
insert into person values(2,N'李大锤',N'18907110002');
insert into person values(3,N'孙二娘',N'13307100003');



-- -----------------------------------
 use  covid19mon;
go

-- 从人员表person中删除以下数据:
-- ( 2, 李大锤,18907110002)
-- 请在以下空白处写下完成任务要求的SQL语句：

delete from person where id=2;
-- -----------------------------------
  -- 请将人员表person中1号人员的电话更改成13607176668
 -- 请在空白处写下能完成目标任务的SQL语句：
 
use covid19mon;
go

update person set telephone =N'13607176668' where id=1;
------------------------------------------------
 use covid19mon;

-- 1) 查询累计人流量大于30的地点名称和累计人流量，累积人流量请用visitors作标题名称。
--    查询结果按照人流量从高到低排序，人流量相同时，依地点名称的字典顺序排序。（注意：同一人多次逛同一地点，去几次算几次）
--    请用一条SQL语句实现该查询：

select location.location_name,count(p_id) as visitors
from location,itinerary
where location.id=itinerary.loc_id 
group by location.location_name
having count(p_id)>30
order by count(p_id) desc,location.location_name;


/*  end  of  your code  */
 
、 use covid19mon;

-- 2) 查询每个隔离地及该地正在进行隔离的人数，以number为隔离人数的标题.
--    查询结果依隔离人数由多到少排序。人数相同时，依隔离地点名排序。
--    请用一条SQL语句实现该查询：

select location_name,count(p_id) as number 
from isolation_record,isolation_location
where isolation_location.id=isolation_record.isol_loc_id and isolation_record.state=1
group by location_name
order by count(p_id) desc,location_name;

/*  end  of  your code  */

 use covid19mon;

-- 2) 查询行程表中人员编号大于30的同一个人的接续行程信息。输出内容包括：
-- 人员编号,姓名,重合时间,起始地点id,起始地点,结束地点id,结束地点。
-- 查询结果依人员编号排序，如同一人员有多个接续行程，再按重合时间排序。
-- 请用一条SQL语句实现该查询：
select p.id, fullname, telephone, i1.e_time as reclosing_time ,i1.loc_id as loc1,l1.location_name as address1,i2.loc_id as loc2,l2.location_name as address2
from person p, location l1,location l2,itinerary i1,itinerary i2
where p.id=i1.p_id and l1.id=i1.loc_id and l2.id=i2.loc_id and
    i1.p_id=i2.p_id and i1.e_time=i2.s_time and i1.p_id >30
order by p.id;


/*  end  of  your code  */

-- 4) 查询充珉瑶和贾涵山的行程情况。查询结果包括：姓名、电话、到过什么地方（地名），何时到达，何时离开 。
--  列名原样列出，不必用别名。查询结果依人员编号降序排序，同一人员行程依行程开始时间顺序排列.

--    请用一条SQL语句实现该查询：
use covid19mon;

select fullname,telephone,location_name,(select convert(char(19),s_time,20)) as s_time, (select convert(char(19),e_time,20)) as e_time
from itinerary 
    join location on itinerary.loc_id=location.id
    right join person on p_id=person.id
    
where fullname=N'充珉瑶' or fullname=N'贾涵山'
order by person.id desc;

/*  end  of  your code  */

-- 5) 查询地名中带有‘店’字的地点编号和名称。查询结果按地点编号排序。
--    请用一条SQL语句实现该查询：
use covid19mon;

select id,location_name 
from location
where location_name like N'%店%'
order by id asc;

/*  end  of  your code  */


 -- 6) 新发现一位确诊者，已知他在2021.2.2日20:05:40到21:25:40之间在“活动中心”逗留，
--    凡在此间在同一地点逗留过的，视为接触者，请查询接触者的姓名和电话。查询结果按姓名排序.
--    请用一条SQL语句实现该查询：
use covid19mon;
select fullname,telephone
from person ,itinerary
where person.id=itinerary.p_id and  
itinerary.loc_id=(select id from location where location.location_name='活动中心') and 
itinerary.s_time<= '2021-02-02 21:25:40' and
itinerary.e_time >='2021-02-02 20:05:40' 
order by fullname asc;

/*  end  of  your code  */

-- 7) 查询正在使用的隔离点名,查询结果按隔离点的编号排序。
--    请用一条SQL语句实现该查询：


use covid19mon;
select location_name
from isolation_location
Where id in(
select distinct isol_loc_id
from isolation_record
where isolation_record.state=1);

/*  end  of  your code  */

-- 8) 用一条带exists关键字的SQL语句查询前30位有出行记录的人员姓名和电话。查询结果按照人员编号排序。
--    请用一条SQL语句实现该查询：
use covid19mon;

select top 30 fullname,telephone
from person 
where exists(
select *
from itinerary
where person.id=itinerary.p_id)
order by id asc;


/*  end  of  your code  */

-- 9) 写一条带NOT EXISTS 子查询的SQL语句实现下述查询要求：
--   查询人员表中没有去过地点“Today便利店”的人数。请给统计出的人数命名为number。
--   请用一条SQL语句实现该查询：
use covid19mon;
select count(id) as number
from person
where not exists(
select * from itinerary,location
where itinerary.p_id=person.id and location.id=itinerary.loc_id and location.location_name=N'Today便利店');

/*  end  of  your code  */

-- 10) 查询人员表去过所有地点的人员姓名。查询结果依人员姓名的字典顺序排序。
--    请用一条SQL语句实现该查询：
use covid19mon;

select fullname 
from person
where not exists(
    select * from location 
    where not exists(
        select * from itinerary 
        where p_id=person.id and loc_id=location.id))
order by fullname asc;

/*  end  of  your code  */ 

-- 11) 建立反映所有隔离点现状的视图isolation_location_status。
-- 内容包括：地点编号，隔离地点名，房间容量，已占用量
-- 请保持原列名不变，已占用量由统计函籹计算得出，该列命名为occupied。 
-- 正在隔离的人占用着隔离点的位置，隔离结束或已转院的人不占用位置。

use covid19mon;
go

create view isolation_location_status as
select id,location_name,capacity,(select count(*) from isolation_record where isol_loc_id =i.id and state = 1) as occupied 
from isolation_location i;
/*  end  of  your code  */ 

-- 12) 从视图isolation_location_status中查询各隔离点的剩余空房间的数目。
--    需要列出的数据项：隔离点名称，剩余房间数。其中剩余房间数为计算得出，请给该列命名为available_rooms
--    查询结果依隔离点编号排序。
--    请用一条SQL语句实现该查询：
use covid19mon;
go
select location_name,capacity-occupied as available_rooms
from isolation_location_status
where capacity-occupied>0
order by id;

/*  end  of  your code  */ 

-- 13) 筛查发现，靳宛儿为无症状感染者。现需查询其接触者姓名名单和电话，以便通知并安排隔离。查询结题按姓名排序。
--    凡行程表中，在同一地点逗留时间与靳宛儿有交集的，均视为接触者。
--    请用一条SQL语句实现该查询：
use covid19mon;
go

select fullname,telephone
from person 
where fullname <>N'靳宛儿' and id in(
    select  p_id 
    from itinerary i1
    where  exists
        (select * from itinerary i2
         where i1.loc_id=i2.loc_id and i1.s_time <= i2.e_time and i1.e_time >=i2.s_time and 
                i2.p_id in (select id from person where fullname =N'靳宛儿' )
        ))
order by fullname;

/*  end  of  your code  */ 

 -- 14) 依据密切接触表的内容查询每个地点的密切接触者的数量，列出内容包括：地点名称，密接者人数。
--     人数由统计获得，列名命名为close_contact_number.查询结果依密接者人数降序排列。
--  密接者人数相同时，依地点名称排序。
--    请用一条SQL语句实现该查询：
use covid19mon;
go

select location_name,count(close_contact.id) as close_contact_number
from location,close_contact
where location.id=close_contact.loc_id
group by location_name
order by count(close_contact.id) desc,location_name;

/*  end  of  your code  */ 

-- 15) 查询感染人数最多的人员编号，姓名，和被其感染的人数。
--     感染人数由统计所得，命名为infected_number.
--    请用一条SQL语句实现该查询：
use covid19mon;
go

select top 1 person.id as case_p_id,person.fullname,count(close_contact.p_id) as infected_number
from person,close_contact
where person.id=close_contact.case_p_id
group by person.id,person.fullname
order by count(close_contact.p_id) desc;

/*  end  of  your code  */

-- 16) 查询2021-02-02 10:00:00到14:00:00期间，行程记录最频繁的3个人的姓名及行程记录条数。
--     记录条数命名为record_number. 记录数并列的，按姓名顺序排列。
--    请用一条SQL语句实现该查询：
use covid19mon;
go
select top 3 fullname,count(itinerary.id) as record_number
from person,itinerary
where person.id=itinerary.p_id and s_time<='2021-02-02 14:00:00' and e_time >= '2021-02-02 10:00:00'
group by p_id,fullname
order by count(itinerary.id) desc,fullname;

/*  end  of  your code  */

-- 17 查询隔离点中，房间数第二多的隔离点名称和房间数。
--    请用一条SQL语句实现该查询：

use covid19mon;
go

select top 1 location_name,capacity
from isolation_location
where capacity not in (
    select max(capacity)
    from isolation_location
    )
group by location_name,capacity
order by capacity desc;

/*  end  of  your code  */

-- 用create trigger语句创建符合任务要求的触发器（触发器名称自已命名）：
-- 当隔离表（isolation_record）中的某位隔离人员在诊断表（diagnose_record）中的
-- 诊断结果（result）为1(新冠确诊)时，自动将隔离表中的隔离状态（state)改成3（转入医院）。

-- 你需要考虑：
-- (1) 触发器应该建在哪个表上；
-- (2) 触发器执行的时机；
-- (3) (insert,update,delete)中的哪些(个）事件触发这个触发器运行。

-- 当前你处于SQL Server环境下！
use covid19mon;
go
CREATE TRIGGER trigger_tpl
ON diagnose_record
AFTER INSERT,UPDATE
AS
BEGIN
    declare @diag_result int;
    select @diag_result = result from inserted;
    if @diag_result = 1
        begin
            update isolation_record set state = 3 
            from isolation_record,inserted
            where isolation_record.p_id = inserted.p_id
        end
END;
-- ------------------------------------------

/*
(1)用create function语句创建符合以下要求的函数：
   依据人员编号计算其到达所有地点的次数(即行程表中的记录数)。
   函数名为：Count_Records。函数的参数名可以自己命名:*/
use covid19mon;
go
create function Count_Records(@a int)
returns int
as
begin
	declare @b int;
	select @b = count(loc_id) from itinerary where itinerary.p_id=@a;
	return @b;
end;
go
/*
(2) 利用创建的函数，仅用一条SQL语句查询在行程表中至少有3条行程记录的人员信息，查询结果依人员编号排序。*/
select * from person
where dbo.Count_Records(person.id)>=3
order by person.id;
 

