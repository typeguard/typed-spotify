// To parse this JSON:
//
//   NSError *error;
//   QTAlbum *album = [QTAlbum fromJSON:json encoding:NSUTF8Encoding error:&error]
//   QTArtist *artist = [QTArtist fromJSON:json encoding:NSUTF8Encoding error:&error]
//   QTPlaylist *playlist = [QTPlaylist fromJSON:json encoding:NSUTF8Encoding error:&error]
//   QTProfile *profile = [QTProfile fromJSON:json encoding:NSUTF8Encoding error:&error]
//   QTTrack *track = [QTTrack fromJSON:json encoding:NSUTF8Encoding error:&error]

#import <Foundation/Foundation.h>

@class QTAlbum;
@class QTProfile;
@class QTExternalUrls;
@class QTFollowers;
@class QTImage;
@class QTArtistType;
@class QTCopyright;
@class QTAlbumExternalIDS;
@class QTAlbumTracks;
@class QTTrack;
@class QTPurpleAlbum;
@class QTItemExternalIDS;
@class QTItemType;
@class QTArtist;
@class QTExternalUrls;
@class QTFollowers;
@class QTImage;
@class QTPlaylist;
@class QTExternalUrls;
@class QTFollowers;
@class QTImage;
@class QTProfile;
@class QTArtistType;
@class QTPlaylistTracks;
@class QTItem;
@class QTTrack;
@class QTPurpleAlbum;
@class QTItemExternalIDS;
@class QTItemType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface QTArtistType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTArtistType *)artist;
+ (QTArtistType *)track;
+ (QTArtistType *)user;
@end

@interface QTItemType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTItemType *)track;
@end

#pragma mark - Object interfaces

@interface QTAlbum : NSObject
@property (nonatomic, copy)   NSString *albumType;
@property (nonatomic, copy)   NSArray<QTProfile *> *artists;
@property (nonatomic, copy)   NSArray<QTCopyright *> *copyrights;
@property (nonatomic, strong) QTAlbumExternalIDS *externalIDS;
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, copy)   NSArray *genres;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSArray<QTImage *> *images;
@property (nonatomic, copy)   NSString *label;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) NSInteger popularity;
@property (nonatomic, copy)   NSString *releaseDate;
@property (nonatomic, copy)   NSString *releaseDatePrecision;
@property (nonatomic, strong) QTAlbumTracks *tracks;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *uri;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTProfile : NSObject
@property (nonatomic, strong)           QTExternalUrls *externalUrls;
@property (nonatomic, copy)             NSString *href;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, assign)           QTArtistType *type;
@property (nonatomic, copy)             NSString *uri;
@property (nonatomic, nullable, copy)   NSString *displayName;
@property (nonatomic, nullable, strong) QTFollowers *followers;
@property (nonatomic, nullable, copy)   NSArray<QTImage *> *images;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTExternalUrls : NSObject
@property (nonatomic, copy) NSString *spotify;
@end

@interface QTFollowers : NSObject
@property (nonatomic, nullable, copy) id href;
@property (nonatomic, assign)         NSInteger total;
@end

@interface QTImage : NSObject
@property (nonatomic, nullable, strong) NSNumber *height;
@property (nonatomic, copy)             NSString *url;
@property (nonatomic, nullable, strong) NSNumber *width;
@end

@interface QTCopyright : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *type;
@end

@interface QTAlbumExternalIDS : NSObject
@property (nonatomic, copy) NSString *upc;
@end

@interface QTAlbumTracks : NSObject
@property (nonatomic, copy)           NSString *href;
@property (nonatomic, copy)           NSArray<QTTrack *> *items;
@property (nonatomic, assign)         NSInteger limit;
@property (nonatomic, nullable, copy) id next;
@property (nonatomic, assign)         NSInteger offset;
@property (nonatomic, nullable, copy) id previous;
@property (nonatomic, assign)         NSInteger total;
@end

@interface QTTrack : NSObject
@property (nonatomic, copy)             NSArray<QTProfile *> *artists;
@property (nonatomic, assign)           NSInteger discNumber;
@property (nonatomic, assign)           NSInteger durationMS;
@property (nonatomic, assign)           BOOL isExplicit;
@property (nonatomic, strong)           QTExternalUrls *externalUrls;
@property (nonatomic, copy)             NSString *href;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, assign)           BOOL isPlayable;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, nullable, copy)   NSString *previewURL;
@property (nonatomic, assign)           NSInteger trackNumber;
@property (nonatomic, assign)           QTItemType *type;
@property (nonatomic, copy)             NSString *uri;
@property (nonatomic, nullable, strong) QTPurpleAlbum *album;
@property (nonatomic, nullable, strong) QTItemExternalIDS *externalIDS;
@property (nonatomic, nullable, strong) NSNumber *popularity;
@property (nonatomic, nullable, strong) QTProfile *linkedFrom;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTPurpleAlbum : NSObject
@property (nonatomic, copy)   NSString *albumType;
@property (nonatomic, copy)   NSArray<QTProfile *> *artists;
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSArray<QTImage *> *images;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *uri;
@end

@interface QTItemExternalIDS : NSObject
@property (nonatomic, copy) NSString *isrc;
@end

@interface QTArtist : NSObject
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, strong) QTFollowers *followers;
@property (nonatomic, copy)   NSArray<NSString *> *genres;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSArray<QTImage *> *images;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) NSInteger popularity;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *uri;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTExternalUrls : NSObject
@property (nonatomic, copy) NSString *spotify;
@end

@interface QTFollowers : NSObject
@property (nonatomic, nullable, copy) id href;
@property (nonatomic, assign)         NSInteger total;
@end

@interface QTImage : NSObject
@property (nonatomic, nullable, strong) NSNumber *height;
@property (nonatomic, copy)             NSString *url;
@property (nonatomic, nullable, strong) NSNumber *width;
@end

@interface QTPlaylist : NSObject
@property (nonatomic, assign) BOOL isCollaborative;
@property (nonatomic, copy)   NSString *theDescription;
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, strong) QTFollowers *followers;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSArray<QTImage *> *images;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) QTProfile *owner;
@property (nonatomic, assign) BOOL isPublic;
@property (nonatomic, copy)   NSString *snapshotID;
@property (nonatomic, strong) QTPlaylistTracks *tracks;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *uri;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTExternalUrls : NSObject
@property (nonatomic, copy) NSString *spotify;
@end

@interface QTFollowers : NSObject
@property (nonatomic, nullable, copy) id href;
@property (nonatomic, assign)         NSInteger total;
@end

@interface QTImage : NSObject
@property (nonatomic, nullable, strong) NSNumber *height;
@property (nonatomic, copy)             NSString *url;
@property (nonatomic, nullable, strong) NSNumber *width;
@end

@interface QTProfile : NSObject
@property (nonatomic, strong)           QTExternalUrls *externalUrls;
@property (nonatomic, copy)             NSString *href;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, nullable, copy)   NSString *name;
@property (nonatomic, assign)           QTArtistType *type;
@property (nonatomic, copy)             NSString *uri;
@property (nonatomic, nullable, copy)   NSString *displayName;
@property (nonatomic, nullable, strong) QTFollowers *followers;
@property (nonatomic, nullable, copy)   NSArray<QTImage *> *images;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTPlaylistTracks : NSObject
@property (nonatomic, copy)           NSString *href;
@property (nonatomic, copy)           NSArray<QTItem *> *items;
@property (nonatomic, assign)         NSInteger limit;
@property (nonatomic, nullable, copy) id next;
@property (nonatomic, assign)         NSInteger offset;
@property (nonatomic, nullable, copy) id previous;
@property (nonatomic, assign)         NSInteger total;
@end

@interface QTItem : NSObject
@property (nonatomic, copy)   NSString *addedAt;
@property (nonatomic, strong) QTProfile *addedBy;
@property (nonatomic, assign) BOOL isLocal;
@property (nonatomic, strong) QTTrack *track;
@end

@interface QTTrack : NSObject
@property (nonatomic, copy)             NSArray<QTProfile *> *artists;
@property (nonatomic, assign)           NSInteger discNumber;
@property (nonatomic, assign)           NSInteger durationMS;
@property (nonatomic, assign)           BOOL isExplicit;
@property (nonatomic, strong)           QTExternalUrls *externalUrls;
@property (nonatomic, copy)             NSString *href;
@property (nonatomic, copy)             NSString *identifier;
@property (nonatomic, assign)           BOOL isPlayable;
@property (nonatomic, copy)             NSString *name;
@property (nonatomic, nullable, copy)   NSString *previewURL;
@property (nonatomic, assign)           NSInteger trackNumber;
@property (nonatomic, assign)           QTItemType *type;
@property (nonatomic, copy)             NSString *uri;
@property (nonatomic, nullable, strong) QTPurpleAlbum *album;
@property (nonatomic, nullable, strong) QTItemExternalIDS *externalIDS;
@property (nonatomic, nullable, strong) NSNumber *popularity;
@property (nonatomic, nullable, strong) QTProfile *linkedFrom;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTPurpleAlbum : NSObject
@property (nonatomic, copy)   NSString *albumType;
@property (nonatomic, copy)   NSArray<QTProfile *> *artists;
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSArray<QTImage *> *images;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *uri;
@end

@interface QTItemExternalIDS : NSObject
@property (nonatomic, copy) NSString *isrc;
@end

NS_ASSUME_NONNULL_END
