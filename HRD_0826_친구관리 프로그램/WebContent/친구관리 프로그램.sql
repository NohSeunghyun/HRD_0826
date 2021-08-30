create table member_tbl_11 (
member_no number not null primary key,
member_id varchar2(10) not null,
member_name varchar2(20) not null,
member_grade char(1),
member_hobby varchar2(100),
member_date date
);

desc member_tbl_11 -- Run SQL에서 구조확인

insert into member_tbl_11 values (1001, 'hong', '홍길동', 'S', '독서,운동,영화', '18/01/10');
insert into member_tbl_11 values (1002, 'choi', '최영문', 'A', '영화', '18/01/11');
insert into member_tbl_11 values (1003, 'park', '박기자', 'A', '독서', '18/01/12');
insert into member_tbl_11 values (1004, 'lee', '이은주', 'B', '운동', '18/01/13');
insert into member_tbl_11 values (1005, 'kang', '강하나', 'S', null, '18/01/14');

select * from member_tbl_11; -- insert 확인

create table friend_tbl_11 (
req_member_no number not null,
res_member_no number,
req_date date,
allow_yn char(1)
);

desc friend_tbl_11 -- Run SQL에서 구조확인

insert into friend_tbl_11 values (1001, 1002, '18/09/20', 'Y');
insert into friend_tbl_11 values (1003, 1001, '18/09/21', 'Y');
insert into friend_tbl_11 values (1002, 1004, '18/09/21', 'Y');
insert into friend_tbl_11 values (1001, 1005, '18/09/22', 'N');
insert into friend_tbl_11 values (1002, 1005, '18/09/22', 'Y');
insert into friend_tbl_11 values (1005, 1003, '18/09/22', 'Y');

select * from friend_tbl_11; -- insert 확인

--select.jsp
select member_no, member_id, member_name, 
decode(member_grade, 'S', '특별', 'A', '우수', 'B', '일반') as member_grade,
member_hobby, 
to_char(member_date, 'yyyy.mm.dd')
from member_tbl_11
order by member_id;

--select2.jsp join사용
--[1]
select req_member_no, res_member_no, allow_yn, req_date
from friend_tbl_11
where allow_yn = 'Y' and req_member_no = 1001 or res_member_no = 1001;
--[2]
select member_id, member_name, to_char(req_date, 'yyyy-mm-dd') as req_date
from member_tbl_11 m, (select req_member_no, res_member_no, allow_yn, req_date
					   from friend_tbl_11
					   where allow_yn = 'Y' and req_member_no = 1001 or res_member_no = 1001) f
where (m.member_no = f.res_member_no or m.member_no = f.req_member_no) and not member_no = 1001;

--select2.jsp 건우씨방법 union사용
select MEMBER_ID, MEMBER_NAME, to_char(REQ_DATE,'yyyy-mm-dd') as REQ_DATE
from MEMBER_TBL_11 natural join FRIEND_TBL_11
where (REQ_MEMBER_NO = '1001' or RES_MEMBER_NO = '1001') and (MEMBER_NO != '1001') and (MEMBER_NO = REQ_MEMBER_NO) and ALLOW_yN ='Y'
union
select MEMBER_ID, MEMBER_NAME, to_char(REQ_DATE,'yyyy-mm-dd') as REQ_DATE
from MEMBER_TBL_11 natural join FRIEND_TBL_11
where (REQ_MEMBER_NO = '1001' or RES_MEMBER_NO = '1001') and (MEMBER_NO != '1001') and(MEMBER_NO = RES_MEMBER_NO) and ALLOW_yN ='Y';