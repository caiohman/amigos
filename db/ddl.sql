create table if not exists amigos(
    id int auto_increment,
    name varchar(255),
    phonenumber varchar(20).
    birth date,
    grupo int,
    unique(id),
    constraint fk_grupo foreign key(grupo) references grupos(id)
);

create table if not exists grupos(
    id int auto_increment,
    name varchar(255),
    description varchar(255),
    unique(id)
);
