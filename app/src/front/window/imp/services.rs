use tokio;
use reqwest::Client;
use serde;

#[derive(Debug, PartialEq, Eq, serde::Deserialize)]
pub struct Friend {
    pub id: i16,
    pub name: Option<String>,
    pub phoneNumber: Option<String>,
    pub birth: Option<String>
}    

#[derive(Debug)]
pub struct Services {
  client: Client,
}


impl Services {

    pub fn new() -> Self {
        Self { client: reqwest::Client::new() }
    }

    #[tokio::main]
    pub async fn get_friends(&mut self) -> std::result::Result<Vec<Friend>, Box<dyn std::error::Error>> {
        let response : Vec<Friend> = self.client.get("http:localhost:8081/").send()
            .await?
            .json()
            .await?;
         return Ok(response);
    }

    #[tokio::main]
    pub async fn get_events(&mut self) -> std::result::Result<Vec<Friend>, Box<dyn std::error::Error>> {
        let response : Vec<Friend> = self.client.get("http:localhost:8081/birthday").send()
            .await?
            .json()
            .await?;
        return Ok(response);
    }
}


