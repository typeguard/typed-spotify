# To use this code, make sure you
#
#     import json
#
# and then, to convert JSON from a string, do
#
#     result = album_from_dict(json.loads(json_string))
#     result = artist_from_dict(json.loads(json_string))
#     result = playlist_from_dict(json.loads(json_string))
#     result = profile_from_dict(json.loads(json_string))
#     result = track_from_dict(json.loads(json_string))

from typing import Any, TypeVar, Type, cast


T = TypeVar("T")


def from_int(x: Any) -> int:
    assert isinstance(x, int) and not isinstance(x, bool)
    return x


def from_str(x: Any) -> str:
    assert isinstance(x, str)
    return x


def to_class(c: Type[T], x: Any) -> dict:
    assert isinstance(x, c)
    return cast(Any, x).to_dict()


class Error:
    status: int
    message: str

    def __init__(self, status: int, message: str) -> None:
        self.status = status
        self.message = message

    @staticmethod
    def from_dict(obj: Any) -> 'Error':
        assert isinstance(obj, dict)
        status = from_int(obj.get("status"))
        message = from_str(obj.get("message"))
        return Error(status, message)

    def to_dict(self) -> dict:
        result: dict = {}
        result["status"] = from_int(self.status)
        result["message"] = from_str(self.message)
        return result


class Track:
    error: Error

    def __init__(self, error: Error) -> None:
        self.error = error

    @staticmethod
    def from_dict(obj: Any) -> 'Track':
        assert isinstance(obj, dict)
        error = Error.from_dict(obj.get("error"))
        return Track(error)

    def to_dict(self) -> dict:
        result: dict = {}
        result["error"] = to_class(Error, self.error)
        return result


def album_from_dict(s: Any) -> Track:
    return Track.from_dict(s)


def album_to_dict(x: Track) -> Any:
    return to_class(Track, x)


def artist_from_dict(s: Any) -> Track:
    return Track.from_dict(s)


def artist_to_dict(x: Track) -> Any:
    return to_class(Track, x)


def playlist_from_dict(s: Any) -> Track:
    return Track.from_dict(s)


def playlist_to_dict(x: Track) -> Any:
    return to_class(Track, x)


def profile_from_dict(s: Any) -> Track:
    return Track.from_dict(s)


def profile_to_dict(x: Track) -> Any:
    return to_class(Track, x)


def track_from_dict(s: Any) -> Track:
    return Track.from_dict(s)


def track_to_dict(x: Track) -> Any:
    return to_class(Track, x)
