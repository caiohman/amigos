use mysql::*;
use mysql::prelude::*;
use chrono::{NaiveDate, Local, Datelike};
use std::process::Command;

#[derive(Debug, PartialEq, Eq)]
pub struct Friend {
    pub id: i16,
    pub name: Option<String>,
    pub phonenumber: Option<String>,
    pub birth: NaiveDate
}    

fn check_container() -> bool{
    let out = Command::new("podman")
        .arg("ps")
        .output()
        .expect("Failed.");
    let str = String::from_utf8(out.stdout);
    
    if str.is_err() == false {
       str.unwrap().contains("mysql") 
    } else {
        false
    }
}

fn check_birthday(f : Vec<Friend>) -> Vec<Friend>{
    let mut vec = Vec::<Friend>::new();
    
    for elem in f {
        let month = Local::now().date_naive().month();
        let day = Local::now().date_naive().day();
        let birth_month = elem.birth.month();
        let birth_day = elem.birth.day();
        
        if month == birth_month && day == birth_day {
            vec.push(elem);
        }             
    }
    vec
}

pub fn backend()  -> std::result::Result<Vec<Friend>, Box<dyn std::error::Error>>{
    if check_container() {
        let url = "mysql://root:caio@localhost:3306/amigos";
        let pool = Pool::new(url)?;    
        let mut connection = pool.get_conn()?;

        let friends = connection.query_map(
            "select id, name, phonenumber, birth from amigos limit 68;",
            |(id, name, phonenumber, birth)| {
                Friend { id, name, phonenumber, birth }
            },
        )?;
    
        Ok(check_birthday(friends))
    } else {
        Err("podman mysql container not found".into())
    }
}    
