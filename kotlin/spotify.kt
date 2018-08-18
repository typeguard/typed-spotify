// To parse the JSON, install Klaxon and do:
//
//   val album = Album.fromJson(jsonString)
//   val artist = Artist.fromJson(jsonString)
//   val playlist = Playlist.fromJson(jsonString)
//   val profile = Profile.fromJson(jsonString)
//   val track = Track.fromJson(jsonString)

package quicktype

import com.beust.klaxon.*

private val klaxon = Klaxon()

data class Track (
    val error: Error
) {
    public fun toJson() = klaxon.toJsonString(this)

    companion object {
        public fun fromJson(json: String) = klaxon.parse<Track>(json)
    }
}

data class Error (
    val status: Long,
    val message: String
)
