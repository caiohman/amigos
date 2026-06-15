create table if not exists amigos(
    id integer auto_increment,
    name varchar(255),
    phonenumber varchar(20).
    birth date,
    groups integer,
    unique(id),
    constraint fk_groups foreign key(groups) references(id)
);

create table if not exists groups(
    id integer auto_increment,
    name varchar(255),
    description(255),
    unique(id)
);
