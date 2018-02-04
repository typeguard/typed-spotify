// To parse and unparse this JSON data, add this code to your project and do:
//
//    r, err := UnmarshalAlbum(bytes)
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

type Album struct {
	AlbumType            string        `json:"album_type"`
	Artists              []AlbumArtist `json:"artists"`
	Copyrights           []Copyright   `json:"copyrights"`
	ExternalIDS          ExternalIDS   `json:"external_ids"`
	ExternalUrls         ExternalUrls  `json:"external_urls"`
	Genres               []interface{} `json:"genres"`
	Href                 string        `json:"href"`
	ID                   string        `json:"id"`
	Images               []Image       `json:"images"`
	Label                string        `json:"label"`
	Name                 string        `json:"name"`
	Popularity           int64         `json:"popularity"`
	ReleaseDate          string        `json:"release_date"`
	ReleaseDatePrecision string        `json:"release_date_precision"`
	Tracks               Tracks        `json:"tracks"`
	Type                 string        `json:"type"`
	URI                  string        `json:"uri"`
}

type AlbumArtist struct {
	ExternalUrls ExternalUrls `json:"external_urls"`
	Href         string       `json:"href"`
	ID           string       `json:"id"`
	Name         string       `json:"name"`
	Type         ArtistType   `json:"type"`
	URI          string       `json:"uri"`
}

type ExternalUrls struct {
	Spotify string `json:"spotify"`
}

type Copyright struct {
	Text string `json:"text"`
	Type string `json:"type"`
}

type ExternalIDS struct {
	Upc string `json:"upc"`
}

type Image struct {
	Height int64  `json:"height"`
	URL    string `json:"url"`
	Width  int64  `json:"width"`
}

type Tracks struct {
	Href     string      `json:"href"`
	Items    []Item      `json:"items"`
	Limit    int64       `json:"limit"`
	Next     interface{} `json:"next"`
	Offset   int64       `json:"offset"`
	Previous interface{} `json:"previous"`
	Total    int64       `json:"total"`
}

type Item struct {
	Artists      []AlbumArtist `json:"artists"`
	DiscNumber   int64         `json:"disc_number"`
	DurationMS   int64         `json:"duration_ms"`
	Explicit     bool          `json:"explicit"`
	ExternalUrls ExternalUrls  `json:"external_urls"`
	Href         string        `json:"href"`
	ID           string        `json:"id"`
	IsPlayable   bool          `json:"is_playable"`
	Name         string        `json:"name"`
	PreviewURL   string        `json:"preview_url"`
	TrackNumber  int64         `json:"track_number"`
	Type         ItemType      `json:"type"`
	URI          string        `json:"uri"`
}

type ArtistType string
const (
	TypeArtist ArtistType = "artist"
)

type ItemType string
const (
	Track ItemType = "track"
)
