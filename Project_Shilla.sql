/*
   ������Ʈ�� : �Ŷ�ȣ�� ������ �������α׷� ����
   �۾��� : �Խ���, �α��� ����
   �α��� ���̺�� : shilla_users
   �Խ��� ���̺�� : shilla_board
*/

--shilla_USERS
--�����ϴ� ���̺� ����
drop table shilla_users;
--���̺� ����
Create Table shilla_users (
    email       varchar2(40)      primary key,
    password    varchar2(20)      not null,
    name        varchar2(20)      not null,
    gender      CHAR(1)           CHECK (gender IN ('F', 'M')),
    birth       varchar(15)       not null,
    tel         varchar(15)       not null,
    role        varchar(15)       default 'user' CHECK (role IN ('admin', 'user'))
);

--insert ����(ȸ������)
insert into shilla_users values('zig2@gmail.com','1111','���¿�','M','1992-01-01','010-5620-0123','admin');

--�α��� ����
select * from shilla_users where email='zig2@gmail.com' and password = '1111';

SELECT COUNT(*) AS count FROM shilla_users WHERE email = 'aaaa@naver.com';
commit;
--select ����
--��� ���� ��������
select * from shilla_users;
--��й�ȣ ��ȸ
select password from shilla_users where email = 'zig2@gmail.com';

------------------------------------------------------------------------------------------------------
select * from g_movierent;
--shilla_Board
--���̺� ����
create Table shilla_board(
num         number          primary key,
subject     varchar2(50)    not null,
content     varchar2(2000)  not null,
reg_date    Date            not null,
readcount   number          default 0 not null,
category varchar2(10) default 'NOTICE' check (category IN ('NOTICE','NEWS','EVENT')),
file_path   VARCHAR(250)
);


--�����ϴ� ���̺� ����
drop table shilla_board;
drop SEQUENCE shilla_board_seq;

select * from shilla_users;
select * from shilla_board;
commit;

--������ �����
Create SEQUENCE shilla_board_seq increment by 1 start with 1;


--insert ����
--�� �ۼ�
insert into shilla_BOARD values(SHILLA_BOARD_SEQ.nextval,'����','�������� ����',sysdate,0,'NOTICE','aa');


--select ����
--Ư�� �� ��������
select * from shilla_board where num = 1;
--�Խñ� ���� 
select count(*) from SHILLA_BOARD;
--10���� ��������
SELECT * FROM (
  SELECT A.*, ROWNUM Rnum FROM (
    SELECT * FROM shilla_board ORDER BY num DESC
  )A
) WHERE Rnum >= 1 AND Rnum <= 10;
--�ۼ��� Ȯ��
SELECT * FROM shilla_board
WHERE UPPER(subject) LIKE UPPER('%�˻���%');
--���� Ȯ��
SELECT * FROM shilla_board
WHERE UPPER(content) LIKE UPPER('%�˻���%');
SELECT * FROM shilla_board;
select * from shilla_board order by num desc;
commit;
--update ����
--�� ��ȸ�� ����
update shilla_board set readcount = readcount+1 where num = 1;
--Ư�� �� ����
update bb_board set subject = '����', content = '�������' where num = 2;

--delete ����
--��� �Խñ� ����
delete from shilla_board;
--Ư�� �� ���� 
delete from bb_board where num=14;