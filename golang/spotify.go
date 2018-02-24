// To parse and unparse this JSON data, add this code to your project and do:
//
//    album, err := UnmarshalAlbum(bytes)
//    bytes, err = album.Marshal()
//
//    artist, err := UnmarshalArtist(bytes)
//    bytes, err = artist.Marshal()
//
//    playlist, err := UnmarshalPlaylist(bytes)
//    bytes, err = playlist.Marshal()
//
//    profile, err := UnmarshalProfile(bytes)
//    bytes, err = profile.Marshal()
//
//    track, err := UnmarshalTrack(bytes)
//    bytes, err = track.Marshal()

package main

import "encoding/json"

func UnmarshalAlbum(data []byte) (Album, error) {
	var r Album
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Album) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

func UnmarshalArtist(data []byte) (Artist, error) {
	var r Artist
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Artist) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

func UnmarshalPlaylist(data []byte) (Playlist, error) {
	var r Playlist
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Playlist) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

func UnmarshalProfile(data []byte) (Profile, error) {
	var r Profile
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Profile) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

func UnmarshalTrack(data []byte) (Track, error) {
	var r Track
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Track) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type Album struct {
	Error Error `json:"error"`
}

type Error struct {
	Status  int64  `json:"status"` 
	Message string `json:"message"`
}

type Artist struct {
	Error Error `json:"error"`
}

type Playlist struct {
	Error Error `json:"error"`
}

type Profile struct {
	Error Error `json:"error"`
}

type Track struct {
	Error Error `json:"error"`
}
