// To parse and unparse this JSON data, add this code to your project and do:
//
//    r, err := UnmarshalAlbum(bytes)
//    bytes, err = r.Marshal()
//
//    r, err := UnmarshalArtist(bytes)
//    bytes, err = r.Marshal()
//
//    r, err := UnmarshalPlaylist(bytes)
//    bytes, err = r.Marshal()
//
//    r, err := UnmarshalProfile(bytes)
//    bytes, err = r.Marshal()
//
//    r, err := UnmarshalTrack(bytes)
//    bytes, err = r.Marshal()

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
	AlbumType            string           `json:"album_type"`
	Artists              []Profile        `json:"artists"`
	Copyrights           []Copyright      `json:"copyrights"`
	ExternalIDS          AlbumExternalIDS `json:"external_ids"`
	ExternalUrls         ExternalUrls     `json:"external_urls"`
	Genres               []interface{}    `json:"genres"`
	Href                 string           `json:"href"`
	ID                   string           `json:"id"`
	Images               []Image          `json:"images"`
	Label                string           `json:"label"`
	Name                 string           `json:"name"`
	Popularity           int64            `json:"popularity"`
	ReleaseDate          string           `json:"release_date"`
	ReleaseDatePrecision string           `json:"release_date_precision"`
	Tracks               AlbumTracks      `json:"tracks"`
	Type                 string           `json:"type"`
	URI                  string           `json:"uri"`
}

type Profile struct {
	ExternalUrls ExternalUrls `json:"external_urls"`
	Href         string       `json:"href"`
	ID           string       `json:"id"`
	Name         *string      `json:"name"`
	Type         ArtistType   `json:"type"`
	URI          string       `json:"uri"`
	DisplayName  *string      `json:"display_name"`
	Followers    *Followers   `json:"followers"`
	Images       []Image      `json:"images"`
}

type ExternalUrls struct {
	Spotify string `json:"spotify"`
}

type Followers struct {
	Href  interface{} `json:"href"`
	Total int64       `json:"total"`
}

type Image struct {
	Height *int64 `json:"height"`
	URL    string `json:"url"`
	Width  *int64 `json:"width"`
}

type Copyright struct {
	Text string `json:"text"`
	Type string `json:"type"`
}

type AlbumExternalIDS struct {
	Upc string `json:"upc"`
}

type AlbumTracks struct {
	Href     string      `json:"href"`
	Items    []Track     `json:"items"`
	Limit    int64       `json:"limit"`
	Next     interface{} `json:"next"`
	Offset   int64       `json:"offset"`
	Previous interface{} `json:"previous"`
	Total    int64       `json:"total"`
}

type Track struct {
	Artists      []Profile        `json:"artists"`
	DiscNumber   int64            `json:"disc_number"`
	DurationMS   int64            `json:"duration_ms"`
	Explicit     bool             `json:"explicit"`
	ExternalUrls ExternalUrls     `json:"external_urls"`
	Href         string           `json:"href"`
	ID           string           `json:"id"`
	IsPlayable   bool             `json:"is_playable"`
	Name         string           `json:"name"`
	PreviewURL   *string          `json:"preview_url"`
	TrackNumber  int64            `json:"track_number"`
	Type         ItemType         `json:"type"`
	URI          string           `json:"uri"`
	Album        *PurpleAlbum     `json:"album"`
	ExternalIDS  *ItemExternalIDS `json:"external_ids"`
	Popularity   *int64           `json:"popularity"`
	LinkedFrom   *Profile         `json:"linked_from"`
}

type PurpleAlbum struct {
	AlbumType    string       `json:"album_type"`
	Artists      []Profile    `json:"artists"`
	ExternalUrls ExternalUrls `json:"external_urls"`
	Href         string       `json:"href"`
	ID           string       `json:"id"`
	Images       []Image      `json:"images"`
	Name         string       `json:"name"`
	Type         string       `json:"type"`
	URI          string       `json:"uri"`
}

type ItemExternalIDS struct {
	Isrc string `json:"isrc"`
}

type Artist struct {
	ExternalUrls ExternalUrls `json:"external_urls"`
	Followers    Followers    `json:"followers"`
	Genres       []string     `json:"genres"`
	Href         string       `json:"href"`
	ID           string       `json:"id"`
	Images       []Image      `json:"images"`
	Name         string       `json:"name"`
	Popularity   int64        `json:"popularity"`
	Type         string       `json:"type"`
	URI          string       `json:"uri"`
}

type Playlist struct {
	Collaborative bool           `json:"collaborative"`
	Description   string         `json:"description"`
	ExternalUrls  ExternalUrls   `json:"external_urls"`
	Followers     Followers      `json:"followers"`
	Href          string         `json:"href"`
	ID            string         `json:"id"`
	Images        []Image        `json:"images"`
	Name          string         `json:"name"`
	Owner         Profile        `json:"owner"`
	Public        bool           `json:"public"`
	SnapshotID    string         `json:"snapshot_id"`
	Tracks        PlaylistTracks `json:"tracks"`
	Type          string         `json:"type"`
	URI           string         `json:"uri"`
}

type PlaylistTracks struct {
	Href     string      `json:"href"`
	Items    []Item      `json:"items"`
	Limit    int64       `json:"limit"`
	Next     interface{} `json:"next"`
	Offset   int64       `json:"offset"`
	Previous interface{} `json:"previous"`
	Total    int64       `json:"total"`
}

type Item struct {
	AddedAt string  `json:"added_at"`
	AddedBy Profile `json:"added_by"`
	IsLocal bool    `json:"is_local"`
	Track   Track   `json:"track"`
}

type ArtistType string
const (
	PurpleArtist ArtistType = "artist"
	PurpleTrack ArtistType = "track"
	User ArtistType = "user"
)

type ItemType string
const (
	FluffyTrack ItemType = "track"
)
