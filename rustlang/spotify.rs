// Example code that deserializes and serializes the model.
// extern crate serde;
// #[macro_use]
// extern crate serde_derive;
// extern crate serde_json;
//
// use generated_module::[object Object];
//
// fn main() {
//     let json = r#"{"answer": 42}"#;
//     let model: [object Object] = serde_json::from_str(&json).unwrap();
// }

extern crate serde_json;

#[derive(Serialize, Deserialize)]
pub struct Track {
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
