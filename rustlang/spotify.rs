// Example code that deserializes and serializes the model.
// extern crate serde;
// #[macro_use]
// extern crate serde_derive;
// extern crate serde_json;
// 
// use generated_module::Album;
// 
// fn main() {
//     let json = r#"{"answer": 42}"#;
//     let model: Album = serde_json::from_str(&json).unwrap();
// }

extern crate serde_json;

#[derive(Serialize, Deserialize)]
pub struct Album {
    #[serde(rename = "error")]
    error: Error,
}

#[derive(Serialize, Deserialize)]
pub struct Error {
    #[serde(rename = "status")]
    status: i64,

    #[serde(rename = "message")]
    message: String,
}

#[derive(Serialize, Deserialize)]
pub struct Artist {
    #[serde(rename = "error")]
    error: Error,
}

#[derive(Serialize, Deserialize)]
pub struct Playlist {
    #[serde(rename = "error")]
    error: Error,
}

#[derive(Serialize, Deserialize)]
pub struct Profile {
    #[serde(rename = "error")]
    error: Error,
}

#[derive(Serialize, Deserialize)]
pub struct Track {
    #[serde(rename = "error")]
    error: Error,
}
