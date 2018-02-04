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

@interface QTArtist (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTExternalUrls (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTCopyright (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTExternalIDS (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTImage (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTTracks (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@interface QTItem (JSONConversion)
+ (instancetype)fromJSONDictionary:(NSDictionary *)dict;
- (NSDictionary *)JSONDictionary;
@end

@implementation QTArtistType
+ (NSDictionary<NSString *, QTArtistType *> *)values
{
    static NSDictionary<NSString *, QTArtistType *> *values;
    return values = values ? values : @{
        @"artist": [[QTArtistType alloc] initWithValue:@"artist"],
    };
}

+ (QTArtistType *)artist { return QTArtistType.values[@"artist"]; }

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
        _artists = map(_artists, λ(id x, [QTArtist fromJSONDictionary:x]));
        _copyrights = map(_copyrights, λ(id x, [QTCopyright fromJSONDictionary:x]));
        _externalIDS = [QTExternalIDS fromJSONDictionary:(id)_externalIDS];
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _images = map(_images, λ(id x, [QTImage fromJSONDictionary:x]));
        _tracks = [QTTracks fromJSONDictionary:(id)_tracks];
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

@implementation QTArtist
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
    };
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
        _type = [QTArtistType withValue:(id)_type];
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
        @"type": [_type value],
    }];

    return dict;
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

@implementation QTExternalIDS
+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"upc": @"upc",
    };
}

+ (instancetype)fromJSONDictionary:(NSDictionary *)dict
{
    return dict ? [[QTExternalIDS alloc] initWithJSONDictionary:dict] : nil;
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
    return [self dictionaryWithValuesForKeys:QTExternalIDS.properties.allValues];
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

@implementation QTTracks
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
    return dict ? [[QTTracks alloc] initWithJSONDictionary:dict] : nil;
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
    id dict = [[self dictionaryWithValuesForKeys:QTTracks.properties.allValues] mutableCopy];

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
        _artists = map(_artists, λ(id x, [QTArtist fromJSONDictionary:x]));
        _externalUrls = [QTExternalUrls fromJSONDictionary:(id)_externalUrls];
        _type = [QTItemType withValue:(id)_type];
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
        @"artists": map(_artists, λ(id x, [x JSONDictionary])),
        @"explicit": _isExplicit ? @YES : @NO,
        @"external_urls": [_externalUrls JSONDictionary],
        @"is_playable": _isPlayable ? @YES : @NO,
        @"type": [_type value],
    }];

    return dict;
}
@end

NS_ASSUME_NONNULL_END
