create table t_board(
	no number(5) primary key,
	title varchar2(500) not null,
	writer varchar2(200) not null,
	content varchar2(4000),
	view_cnt number(5),
	reg_date date default sysdate
);

create sequence seq_t_board_no nocache;

create table t_member(
	id varchar2(20) primary key,
	password varchar2(20) not null,
	name varchar2(20)
);
