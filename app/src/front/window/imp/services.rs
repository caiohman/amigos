use std::process::Command;
use tokio;
use reqwest;
use serde;

#[derive(Debug, PartialEq, Eq, serde::Deserialize)]
pub struct Friend {
    pub id: i16,
    pub name: Option<String>,
    pub phoneNumber: Option<String>,
    pub birth: Option<String>
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

#[tokio::main]
pub async fn api() -> std::result::Result<Vec<Friend>, Box<dyn std::error::Error>> {
    if check_container() {
        let response : Vec<Friend> = reqwest::get("http:localhost:8081/")
            .await?
            .json()
            .await?;
       return Ok(response);
    }
    Err("podman mysql container not found".into())
}
