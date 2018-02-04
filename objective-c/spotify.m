#import "spotify.h"

#define λ(decl, expr) (^(decl) { return (expr); })

static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

@interface QTAlbum (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTProfile (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTExternalUrls (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTFollowers (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTImage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTCopyright (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTAlbumExternalIDS (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTAlbumTracks (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTTrack (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTPurpleAlbum (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTItemExternalIDS (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTArtist (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTExternalUrls (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTFollowers (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTImage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTPlaylist (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTExternalUrls (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTFollowers (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTImage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTProfile (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTPlaylistTracks (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTItem (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTTrack (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTPurpleAlbum (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTItemExternalIDS (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@implementation QTArtistType
+ (NSDictionary<NSString *, QTArtistType *> *)values
{
    static NSDictionary<NSString *, QTArtistType *> *values;
    return values = values ? values : @{
        @"artist": [[QTArtistType alloc] initWithValue:@"artist"],
        @"track": [[QTArtistType alloc] initWithValue:@"track"],
        @"user": [[QTArtistType alloc] initWithValue:@"user"],
    };
}

+ (QTArtistType *)artist { return QTArtistType.values[@"artist"]; }
+ (QTArtistType *)track { return QTArtistType.values[@"track"]; }
+ (QTArtistType *)user { return QTArtistType.values[@"user"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTArtistType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

@implementation QTItemType
+ (NSDictionary<NSString *, QTItemType *> *)values
{
    static NSDictionary<NSString *, QTItemType *> *values;
    return values = values ? values : @{
        @"track": [[QTItemType alloc] initWithValue:@"track"],
    };
}

+ (QTItemType *)track { return QTItemType.values[@"track"]; }

+ (instancetype _Nullable)withValue:(NSString *)value
{
    return QTItemType.values[value];
}

- (instancetype)initWithValue:(NSString *)value
{
    if (self = [super init]) _value = value;
    return self;
}

- (NSUInteger)hash { return _value.hash; }
@end

static id map(id collection, id (^f)(id value)) {
    id result = nil;
    if ([collection isKindOfClass:NSArray.class]) {
        result = [NSMutableArray arrayWithCapacity:[collection count]];
        for (id x in collection) [result addObject:f(x)];
    } else if ([collection isKindOfClass:NSDictionary.class]) {
        result = [NSMutableDictionary dictionaryWithCapacity:[collection count]];
        for (id key in collection) [result setObject:f([collection objectForKey:key]) forKey:key];
    }
    return result;
}

#pragma mark - JSON serialization

QTAlbum *_Nullable QTAlbumFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTAlbum fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTAlbum *_Nullable QTAlbumFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTAlbumFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTAlbumToData(QTAlbum *album, NSError **error)
{
    @try {
        id json = [album JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTAlbumToJSON(QTAlbum *album, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTAlbumToData(album, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

QTArtist *_Nullable QTArtistFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTArtist fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTArtist *_Nullable QTArtistFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTArtistFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTArtistToData(QTArtist *artist, NSError **error)
{
    @try {
        id json = [artist JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTArtistToJSON(QTArtist *artist, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTArtistToData(artist, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

QTPlaylist *_Nullable QTPlaylistFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTPlaylist fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTPlaylist *_Nullable QTPlaylistFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTPlaylistFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTPlaylistToData(QTPlaylist *playlist, NSError **error)
{
    @try {
        id json = [playlist JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTPlaylistToJSON(QTPlaylist *playlist, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTPlaylistToData(playlist, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

QTProfile *_Nullable QTProfileFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTProfile fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTProfile *_Nullable QTProfileFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTProfileFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTProfileToData(QTProfile *profile, NSError **error)
{
    @try {
        id json = [profile JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTProfileToJSON(QTProfile *profile, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTProfileToData(profile, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

QTTrack *_Nullable QTTrackFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTTrack fromJSONDictionary:json];
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

QTTrack *_Nullable QTTrackFromJSON(NSString *json, NSStringEncoding encoding, NSError **error)
{
    return QTTrackFromData([json dataUsingEncoding:encoding], error);
}

NSData *_Nullable QTTrackToData(QTTrack *track, NSError **error)
{
    @try {
        id json = [track JSONDictionary];
        NSData *data = [NSJSONSerialization dataWithJSONObject:json options:kNilOptions error:error];
        return *error ? nil : data;
    } @catch (NSException *exception) {
        *error = [NSError errorWithDomain:@"JSONSerialization" code:-1 userInfo:@{ @"exception": exception }];
        return nil;
    }
}

NSString *_Nullable QTTrackToJSON(QTTrack *track, NSStringEncoding encoding, NSError **error)
{
    NSData *data = QTTrackToData(track, error);
    return data ? [[NSString alloc] initWithData:data encoding:encoding] : nil;
}

@implementation QTAlbum
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"album_type": @"albumType",
        @"artists": @"artists",
        @"copyrights": @"copyrights",
        @"external_ids": @"externalIDS",
        @"external_urls": @"externalUrls",
        @"genres": @"genres",
        @"href": @"href",
        @"id": @"identifier",
        @"images": @"images",
        @"label": @"label",
        @"name": @"name",
        @"popularity": @"popularity",
        @"release_date": @"releaseDate",
        @"release_date_precision": @"releaseDatePrecision",
        @"tracks": @"tracks",
        @"type": @"type",
        @"uri": @"uri",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTAlbumFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTAlbumFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTAlbum alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _artists = map(_artists, λ(id x, [QTProfile fromJSONDictionary:x]));
        _copyrights = map(_copyrights, λ(id x, [QTCopyright fromJSONDictionary:x]));
        _externalIDS = [QTAlbumExternalIDS fromJSONDictionary:(id)_externalIDS];
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
        _tracks = [QTAlbumTracks fromJSONDictionary:(id)_tracks];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTAlbum.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTAlbum.properties.allValues] mutableCopy];

    for (id jsonName in QTAlbum.properties) {
        id propertyName = QTAlbum.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"artists": map(_artists, λ(id x, [x JSONDictionary])),
        @"copyrights": map(_copyrights, λ(id x, [x JSONDictionary])),
        @"external_ids": [_externalIDS JSONDictionary],
        @"external_urls": [_externalUrls JSONDictionary],
        @"images": map(_images, λ(id x, [x JSONDictionary])),
        @"tracks": [_tracks JSONDictionary],
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTAlbumToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTAlbumToJSON(self, encoding, error);
}
@end

@implementation QTProfile
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"external_urls": @"externalUrls",
        @"href": @"href",
        @"id": @"identifier",
        @"name": @"name",
        @"type": @"type",
        @"uri": @"uri",
        @"display_name": @"displayName",
        @"followers": @"followers",
        @"images": @"images",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTProfileFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTProfileFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTProfile alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _type = [QTArtistType withValue:(id)_type];
        _followers = [QTFollowers fromJSONDictionary:(id)_followers];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTProfile.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTProfile.properties.allValues] mutableCopy];

    for (id jsonName in QTProfile.properties) {
        id propertyName = QTProfile.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"external_urls": [_externalUrls JSONDictionary],
        @"type": [_type value],
        @"followers": NSNullify([_followers JSONDictionary]),
        @"images": NSNullify(map(_images, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTProfileToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTProfileToJSON(self, encoding, error);
}
@end

@implementation QTExternalUrls
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"spotify": @"spotify",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTExternalUrls alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTExternalUrls.properties.allValues];
}
@end

@implementation QTFollowers
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"href": @"href",
        @"total": @"total",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTFollowers alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTFollowers.properties.allValues];
}
@end

@implementation QTImage
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"height": @"height",
        @"url": @"url",
        @"width": @"width",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTImage alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTImage.properties.allValues];
}
@end

@implementation QTCopyright
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"text": @"text",
        @"type": @"type",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTCopyright alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTCopyright.properties.allValues];
}
@end

@implementation QTAlbumExternalIDS
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"upc": @"upc",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTAlbumExternalIDS alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTAlbumExternalIDS.properties.allValues];
}
@end

@implementation QTAlbumTracks
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"href": @"href",
        @"items": @"items",
        @"limit": @"limit",
        @"next": @"next",
        @"offset": @"offset",
        @"previous": @"previous",
        @"total": @"total",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTAlbumTracks alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _items = map(_items, λ(id x, [QTTrack fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTAlbumTracks.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"items": map(_items, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTTrack
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"artists": @"artists",
        @"disc_number": @"discNumber",
        @"duration_ms": @"durationMS",
        @"explicit": @"isExplicit",
        @"external_urls": @"externalUrls",
        @"href": @"href",
        @"id": @"identifier",
        @"is_playable": @"isPlayable",
        @"name": @"name",
        @"preview_url": @"previewURL",
        @"track_number": @"trackNumber",
        @"type": @"type",
        @"uri": @"uri",
        @"album": @"album",
        @"external_ids": @"externalIDS",
        @"popularity": @"popularity",
        @"linked_from": @"linkedFrom",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTTrackFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTTrackFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTTrack alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _artists = map(_artists, λ(id x, [QTProfile fromJSONDictionary:x]));
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _type = [QTItemType withValue:(id)_type];
        _album = [QTPurpleAlbum fromJSONDictionary:(id)_album];
        _externalIDS = [QTItemExternalIDS fromJSONDictionary:(id)_externalIDS];
        _linkedFrom = [QTProfile fromJSONDictionary:(id)_linkedFrom];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTTrack.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTrack.properties.allValues] mutableCopy];

    for (id jsonName in QTTrack.properties) {
        id propertyName = QTTrack.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"artists": map(_artists, λ(id x, [x JSONDictionary])),
        @"explicit": _isExplicit ? @YES : @NO,
        @"external_urls": [_externalUrls JSONDictionary],
        @"is_playable": _isPlayable ? @YES : @NO,
        @"type": [_type value],
        @"album": NSNullify([_album JSONDictionary]),
        @"external_ids": NSNullify([_externalIDS JSONDictionary]),
        @"linked_from": NSNullify([_linkedFrom JSONDictionary]),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTTrackToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTTrackToJSON(self, encoding, error);
}
@end

@implementation QTPurpleAlbum
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"album_type": @"albumType",
        @"artists": @"artists",
        @"external_urls": @"externalUrls",
        @"href": @"href",
        @"id": @"identifier",
        @"images": @"images",
        @"name": @"name",
        @"type": @"type",
        @"uri": @"uri",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTPurpleAlbum alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _artists = map(_artists, λ(id x, [QTProfile fromJSONDictionary:x]));
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTPurpleAlbum.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTPurpleAlbum.properties.allValues] mutableCopy];

    for (id jsonName in QTPurpleAlbum.properties) {
        id propertyName = QTPurpleAlbum.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"artists": map(_artists, λ(id x, [x JSONDictionary])),
        @"external_urls": [_externalUrls JSONDictionary],
        @"images": map(_images, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTItemExternalIDS
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"isrc": @"isrc",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTItemExternalIDS alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTItemExternalIDS.properties.allValues];
}
@end

@implementation QTArtist
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"external_urls": @"externalUrls",
        @"followers": @"followers",
        @"genres": @"genres",
        @"href": @"href",
        @"id": @"identifier",
        @"images": @"images",
        @"name": @"name",
        @"popularity": @"popularity",
        @"type": @"type",
        @"uri": @"uri",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTArtistFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTArtistFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTArtist alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _followers = [QTFollowers fromJSONDictionary:(id)_followers];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTArtist.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTArtist.properties.allValues] mutableCopy];

    for (id jsonName in QTArtist.properties) {
        id propertyName = QTArtist.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"external_urls": [_externalUrls JSONDictionary],
        @"followers": [_followers JSONDictionary],
        @"images": map(_images, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTArtistToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTArtistToJSON(self, encoding, error);
}
@end

@implementation QTExternalUrls
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"spotify": @"spotify",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTExternalUrls alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTExternalUrls.properties.allValues];
}
@end

@implementation QTFollowers
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"href": @"href",
        @"total": @"total",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTFollowers alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTFollowers.properties.allValues];
}
@end

@implementation QTImage
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"height": @"height",
        @"url": @"url",
        @"width": @"width",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTImage alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTImage.properties.allValues];
}
@end

@implementation QTPlaylist
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"collaborative": @"isCollaborative",
        @"description": @"theDescription",
        @"external_urls": @"externalUrls",
        @"followers": @"followers",
        @"href": @"href",
        @"id": @"identifier",
        @"images": @"images",
        @"name": @"name",
        @"owner": @"owner",
        @"public": @"isPublic",
        @"snapshot_id": @"snapshotID",
        @"tracks": @"tracks",
        @"type": @"type",
        @"uri": @"uri",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTPlaylistFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTPlaylistFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTPlaylist alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _followers = [QTFollowers fromJSONDictionary:(id)_followers];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
        _owner = [QTProfile fromJSONDictionary:(id)_owner];
        _tracks = [QTPlaylistTracks fromJSONDictionary:(id)_tracks];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTPlaylist.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTPlaylist.properties.allValues] mutableCopy];

    for (id jsonName in QTPlaylist.properties) {
        id propertyName = QTPlaylist.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"collaborative": _isCollaborative ? @YES : @NO,
        @"external_urls": [_externalUrls JSONDictionary],
        @"followers": [_followers JSONDictionary],
        @"images": map(_images, λ(id x, [x JSONDictionary])),
        @"owner": [_owner JSONDictionary],
        @"public": _isPublic ? @YES : @NO,
        @"tracks": [_tracks JSONDictionary],
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTPlaylistToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTPlaylistToJSON(self, encoding, error);
}
@end

@implementation QTExternalUrls
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"spotify": @"spotify",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTExternalUrls alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTExternalUrls.properties.allValues];
}
@end

@implementation QTFollowers
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"href": @"href",
        @"total": @"total",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTFollowers alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTFollowers.properties.allValues];
}
@end

@implementation QTImage
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"height": @"height",
        @"url": @"url",
        @"width": @"width",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTImage alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTImage.properties.allValues];
}
@end

@implementation QTProfile
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"external_urls": @"externalUrls",
        @"href": @"href",
        @"id": @"identifier",
        @"name": @"name",
        @"type": @"type",
        @"uri": @"uri",
        @"display_name": @"displayName",
        @"followers": @"followers",
        @"images": @"images",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTProfileFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTProfileFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTProfile alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _type = [QTArtistType withValue:(id)_type];
        _followers = [QTFollowers fromJSONDictionary:(id)_followers];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTProfile.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTProfile.properties.allValues] mutableCopy];

    for (id jsonName in QTProfile.properties) {
        id propertyName = QTProfile.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"external_urls": [_externalUrls JSONDictionary],
        @"type": [_type value],
        @"followers": NSNullify([_followers JSONDictionary]),
        @"images": NSNullify(map(_images, λ(id x, [x JSONDictionary]))),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTProfileToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTProfileToJSON(self, encoding, error);
}
@end

@implementation QTPlaylistTracks
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"href": @"href",
        @"items": @"items",
        @"limit": @"limit",
        @"next": @"next",
        @"offset": @"offset",
        @"previous": @"previous",
        @"total": @"total",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTPlaylistTracks alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _items = map(_items, λ(id x, [QTItem fromJSONDictionary:x]));
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTPlaylistTracks.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"items": map(_items, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTItem
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"added_at": @"addedAt",
        @"added_by": @"addedBy",
        @"is_local": @"isLocal",
        @"track": @"track",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTItem alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _addedBy = [QTProfile fromJSONDictionary:(id)_addedBy];
        _track = [QTTrack fromJSONDictionary:(id)_track];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTItem.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTItem.properties.allValues] mutableCopy];

    for (id jsonName in QTItem.properties) {
        id propertyName = QTItem.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"added_by": [_addedBy JSONDictionary],
        @"is_local": _isLocal ? @YES : @NO,
        @"track": [_track JSONDictionary],
    }];

    return dict;
}
@end

@implementation QTTrack
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"artists": @"artists",
        @"disc_number": @"discNumber",
        @"duration_ms": @"durationMS",
        @"explicit": @"isExplicit",
        @"external_urls": @"externalUrls",
        @"href": @"href",
        @"id": @"identifier",
        @"is_playable": @"isPlayable",
        @"name": @"name",
        @"preview_url": @"previewURL",
        @"track_number": @"trackNumber",
        @"type": @"type",
        @"uri": @"uri",
        @"album": @"album",
        @"external_ids": @"externalIDS",
        @"popularity": @"popularity",
        @"linked_from": @"linkedFrom",
    };
}

+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error
{
    return QTTrackFromData(data, error);
}

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTTrackFromJSON(json, encoding, error);
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTTrack alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _artists = map(_artists, λ(id x, [QTProfile fromJSONDictionary:x]));
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _type = [QTItemType withValue:(id)_type];
        _album = [QTPurpleAlbum fromJSONDictionary:(id)_album];
        _externalIDS = [QTItemExternalIDS fromJSONDictionary:(id)_externalIDS];
        _linkedFrom = [QTProfile fromJSONDictionary:(id)_linkedFrom];
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTTrack.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTrack.properties.allValues] mutableCopy];

    for (id jsonName in QTTrack.properties) {
        id propertyName = QTTrack.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"artists": map(_artists, λ(id x, [x JSONDictionary])),
        @"explicit": _isExplicit ? @YES : @NO,
        @"external_urls": [_externalUrls JSONDictionary],
        @"is_playable": _isPlayable ? @YES : @NO,
        @"type": [_type value],
        @"album": NSNullify([_album JSONDictionary]),
        @"external_ids": NSNullify([_externalIDS JSONDictionary]),
        @"linked_from": NSNullify([_linkedFrom JSONDictionary]),
    }];

    return dict;
}

- (NSData *_Nullable)toData:(NSError *_Nullable *)error
{
    return QTTrackToData(self, error);
}

- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error
{
    return QTTrackToJSON(self, encoding, error);
}
@end

@implementation QTPurpleAlbum
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"album_type": @"albumType",
        @"artists": @"artists",
        @"external_urls": @"externalUrls",
        @"href": @"href",
        @"id": @"identifier",
        @"images": @"images",
        @"name": @"name",
        @"type": @"type",
        @"uri": @"uri",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTPurpleAlbum alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _artists = map(_artists, λ(id x, [QTProfile fromJSONDictionary:x]));
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
    }
    return self;
}

- (void)setValue:(nullable id)value forKey:(NSString *)key
{
    [super setValue:value forKey:QTPurpleAlbum.properties[key]];
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTPurpleAlbum.properties.allValues] mutableCopy];

    for (id jsonName in QTPurpleAlbum.properties) {
        id propertyName = QTPurpleAlbum.properties[jsonName];
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }

    [dict addEntriesFromDictionary:@{
        @"artists": map(_artists, λ(id x, [x JSONDictionary])),
        @"external_urls": [_externalUrls JSONDictionary],
        @"images": map(_images, λ(id x, [x JSONDictionary])),
    }];

    return dict;
}
@end

@implementation QTItemExternalIDS
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"isrc": @"isrc",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTItemExternalIDS alloc] initWithJSONDictionary:dict] : nil;
}

- (instancetype)initWithJSONDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    return [self dictionaryWithValuesForKeys:QTItemExternalIDS.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
