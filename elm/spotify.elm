-- To decode the JSON data, add this file to your project, run
-- 
--     elm-package install NoRedInk/elm-decode-pipeline
-- 
-- add these imports
-- 
--     import Json.Decode exposing (decodeString)`);
--     import QuickType exposing (album, artist, playlist, profile, track)
--
-- and you're off to the races with
--
--     decodeString album myJsonString
--     decodeString artist myJsonString
--     decodeString playlist myJsonString
--     decodeString profile myJsonString
--     decodeString track myJsonString

module QuickType exposing
    ( Album
    , albumToString
    , album
    , Artist
    , artistToString
    , artist
    , Playlist
    , playlistToString
    , playlist
    , Profile
    , profileToString
    , profile
    , Track
    , trackToString
    , track
    , Error
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias Album =
    { error : Error
    }

type alias Error =
    { status : Int
    , message : String
    }

type alias Artist =
    { error : Error
    }

type alias Playlist =
    { error : Error
    }

type alias Profile =
    { error : Error
    }

type alias Track =
    { error : Error
    }

-- decoders and encoders

albumToString : Album -> String
albumToString r = Jenc.encode 0 (encodeAlbum r)

artistToString : Artist -> String
artistToString r = Jenc.encode 0 (encodeArtist r)

playlistToString : Playlist -> String
playlistToString r = Jenc.encode 0 (encodePlaylist r)

profileToString : Profile -> String
profileToString r = Jenc.encode 0 (encodeProfile r)

trackToString : Track -> String
trackToString r = Jenc.encode 0 (encodeTrack r)

album : Jdec.Decoder Album
album =
    Jpipe.decode Album
        |> Jpipe.required "error" error

encodeAlbum : Album -> Jenc.Value
encodeAlbum x =
    Jenc.object
        [ ("error", encodeError x.error)
        ]

error : Jdec.Decoder Error
error =
    Jpipe.decode Error
        |> Jpipe.required "status" Jdec.int
        |> Jpipe.required "message" Jdec.string

encodeError : Error -> Jenc.Value
encodeError x =
    Jenc.object
        [ ("status", Jenc.int x.status)
        , ("message", Jenc.string x.message)
        ]

artist : Jdec.Decoder Artist
artist =
    Jpipe.decode Artist
        |> Jpipe.required "error" error

encodeArtist : Artist -> Jenc.Value
encodeArtist x =
    Jenc.object
        [ ("error", encodeError x.error)
        ]

playlist : Jdec.Decoder Playlist
playlist =
    Jpipe.decode Playlist
        |> Jpipe.required "error" error

encodePlaylist : Playlist -> Jenc.Value
encodePlaylist x =
    Jenc.object
        [ ("error", encodeError x.error)
        ]

profile : Jdec.Decoder Profile
profile =
    Jpipe.decode Profile
        |> Jpipe.required "error" error

encodeProfile : Profile -> Jenc.Value
encodeProfile x =
    Jenc.object
        [ ("error", encodeError x.error)
        ]

track : Jdec.Decoder Track
track =
    Jpipe.decode Track
        |> Jpipe.required "error" error

encodeTrack : Track -> Jenc.Value
encodeTrack x =
    Jenc.object
        [ ("error", encodeError x.error)
        ]

--- encoder helpers

makeArrayEncoder : (a -> Jenc.Value) -> Array a -> Jenc.Value
makeArrayEncoder f arr =
    Jenc.array (Array.map f arr)

makeDictEncoder : (a -> Jenc.Value) -> Dict String a -> Jenc.Value
makeDictEncoder f dict =
    Jenc.object (toList (Dict.map (\k -> f) dict))

makeNullableEncoder : (a -> Jenc.Value) -> Maybe a -> Jenc.Value
makeNullableEncoder f m =
    case m of
    Just x -> f x
    Nothing -> Jenc.null
