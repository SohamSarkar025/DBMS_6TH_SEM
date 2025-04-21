set serveroutput on

create table ACC_details(
Acc_no varchar2(8) primary key,
Name varchar2(20) not null,
Adress varchar2(20) not null,
DOB date not null,
Sex char(1) not null check(sex in('M','F')),
Contact_no number(10) not null,
last_trans_date date not null,
Total_amt number(12,4) not null,
Acc_details char(1) not null check(Acc_details in('A','I'))
);
create table Transaction_acc(
Transaction_id number(8) primary key,
Acc_no varchar2(8) references Acc_details on DELETE CASCADE,
Deposit_amt number(12,4),
Withdraw_amt number(12,4),
Mode_trans char(5) not null,
Cheque_no number(6) default 0,
trans_date date not null
);
