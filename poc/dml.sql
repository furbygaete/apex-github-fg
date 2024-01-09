create table users(
    userid number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
    username varchar(128) not null,
    email varchar2(128) not null,
    password varchar(128) not null,
    blockchain_address varchar2(256),
    full_name varchar2(128)
);

create table creditcards(
    cardid number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
    cardnumber varchar(20) not null,
    cardname varchar(20) not null,
    cardtype varchar(20) not null,
    cardexpirydate varchar(20) not null,
    cardcvv varchar(20) not null,
    userid number not null,
    CONSTRAINT creditcards_fk1 FOREIGN KEY (userid) REFERENCES users (userid)
);

create table transactions(
    transid number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
    cardid  number not null,
    CONSTRAINT transactions_fk1 FOREIGN KEY (cardid) REFERENCES creditcards(cardid),
    amount number not null,
    transac_date date 
);

create table card_statements(
    cardstatid number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
    cardid number,
    CONSTRAINT card_statement_fk1 FOREIGN KEY (cardid) REFERENCES creditcards(cardid),
    userid number,
    CONSTRAINT card_statement_fk2 FOREIGN KEY (userid) REFERENCES users(userid),
    issue_month date,
    tot_amount number not null
);

create table card_payments(
    cardpayid number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
    
);

--This might be a materialized view with refresh-on-commit of the card_payment table 
create table user_scoring(
    uscoreid number GENERATED ALWAYS as IDENTITY(START with 1 INCREMENT by 1) primary key,
    userid number not null,
    CONSTRAINT user_scoring_fk1 FOREIGN KEY (userid) REFERENCES users(userid),
    month date,
    amount_due number,
    amount_payed number
);

PROMPT INSERTING into USERS
set define off
begin
  insert into users (username,email,full_name,password,blockchain_address) values ('tammy.bryant@internalmail','tammy.bryant@internalmail','Tammy Bryant', '123', '');
  insert into users (username,email,full_name,password,blockchain_address) values ('roy.white@internalmail','roy.white@internalmail','Roy White', '123', '');
  insert into users (username,email,full_name,password,blockchain_address) values ('gary.jenkins@internalmail','gary.jenkins@internalmail','Gary Jenkins', '123', '');
  insert into users (username,email,full_name,password,blockchain_address) values ('victor.morris@internalmail','victor.morris@internalmail','Victor Morris', '123', '');
  insert into users (username,email,full_name,password,blockchain_address) values ('beverly.hughes@internalmail','beverly.hughes@internalmail','Beverly Hughes', '123', '');
end;
/