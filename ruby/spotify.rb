# This code may look unusually verbose for Ruby (and it is), but
# it performs some subtle and complex validation of JSON data.
#
# To parse this JSON, add 'dry-struct' and 'dry-types' gems, then do:
#
#   album = Album.from_json! "{…}"
#   puts album.error.status.even?
#
#   artist = Artist.from_json! "{…}"
#   puts artist.error.status.even?
#
#   playlist = Playlist.from_json! "{…}"
#   puts playlist.error.status.even?
#
#   profile = Profile.from_json! "{…}"
#   puts profile.error.status.even?
#
#   track = Track.from_json! "{…}"
#   puts track.error.status.even?
#
# If from_json! succeeds, the value returned matches the schema.

require 'json'
require 'dry-types'
require 'dry-struct'

module Types
  include Dry::Types.module

  Int    = Strict::Int
  Hash   = Strict::Hash
  String = Strict::String
end

class Error < Dry::Struct
  attribute :status,  Types::Int
  attribute :message, Types::String

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      status:  d.fetch("status"),
      message: d.fetch("message"),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "status"  => @status,
      "message" => @message,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end

class Track < Dry::Struct
  attribute :error, Error

  def self.from_dynamic!(d)
    d = Types::Hash[d]
    new(
      error: Error.from_dynamic!(d.fetch("error")),
    )
  end

  def self.from_json!(json)
    from_dynamic!(JSON.parse(json))
  end

  def to_dynamic
    {
      "error" => @error.to_dynamic,
    }
  end

  def to_json(options = nil)
    JSON.generate(to_dynamic, options)
  end
end
