use mysql::*;
use mysql::prelude::*;
use chrono::{NaiveDate, Local, Datelike};

#[derive(Debug, PartialEq, Eq)]
struct Friend {
    id: i16,
    name: Option<String>,
    phonenumber: Option<String>,
    birth: NaiveDate
}    


fn check_birthday(f : Vec<Friend>) {

    for elem in f {
        let month = Local::now().date_naive().month();
        let day = Local::now().date_naive().day();
        let birth_month = elem.birth.month();
        let birth_day = elem.birth.day();
        
        if month == birth_month && day == birth_day {
            println!("HEY! happy birthday! {:?}", elem.name);
        }
    }    
}

pub fn backend()  -> std::result::Result<(), Box<dyn std::error::Error>>{
    let url = "mysql://root:caio@localhost:3306/amigos";
    let pool = Pool::new(url)?;

    let mut connection = pool.get_conn()?;

    let friends = connection.query_map(
        "select id, name, phonenumber, birth from amigos limit 68;",
        |(id, name, phonenumber, birth)| {
            Friend { id, name, phonenumber, birth }
        },
    )?;
    
    check_birthday(friends);

    Ok(())
}    
