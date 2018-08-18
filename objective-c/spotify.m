#import "spotify.h"

#define λ(decl, expr) (^(decl) { return (expr); })

static id NSNullify(id _Nullable x) {
    return (x == nil || x == NSNull.null) ? NSNull.null : x;
}

NS_ASSUME_NONNULL_BEGIN

@interface QTTrack (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTError (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

#pragma mark - JSON serialization

QTAlbum *_Nullable QTAlbumFromData(NSData *data, NSError **error)
{
    @try {
        id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
        return *error ? nil : [QTTrack fromJSONDictionary:json];
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
        return *error ? nil : [QTTrack fromJSONDictionary:json];
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
        return *error ? nil : [QTTrack fromJSONDictionary:json];
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
        return *error ? nil : [QTTrack fromJSONDictionary:json];
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

@implementation QTTrack
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"error": @"error",
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
        _error = [QTError fromJSONDictionary:(id)_error];
    }
    return self;
}

- (NSDictionary *)JSONDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:QTTrack.properties.allValues] mutableCopy];

    [dict addEntriesFromDictionary:@{
        @"error": [_error JSONDictionary],
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

@implementation QTError
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"status": @"status",
        @"message": @"message",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTError alloc] initWithJSONDictionary:dict] : nil;
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
    return [self dictionaryWithValuesForKeys:QTError.properties.allValues];
}
@end

NS_ASSUME_NONNULL_END
