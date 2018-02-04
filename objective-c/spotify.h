// To parse this JSON:
//
//   NSError *error;
//   QTAlbum *album = [QTAlbum fromJSON:json encoding:NSUTF8Encoding error:&error]

#import <Foundation/Foundation.h>

@class QTAlbum;
@class QTArtist;
@class QTExternalUrls;
@class QTArtistType;
@class QTCopyright;
@class QTExternalIDS;
@class QTImage;
@class QTTracks;
@class QTItem;
@class QTItemType;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Boxed enums

@interface QTArtistType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTArtistType *)artist;
@end

@interface QTItemType : NSObject
@property (nonatomic, readonly, copy) NSString *value;
+ (instancetype _Nullable)withValue:(NSString *)value;
+ (QTItemType *)track;
@end

#pragma mark - Object interfaces

@interface QTAlbum : NSObject
@property (nonatomic, copy)   NSString *albumType;
@property (nonatomic, copy)   NSArray<QTArtist *> *artists;
@property (nonatomic, copy)   NSArray<QTCopyright *> *copyrights;
@property (nonatomic, strong) QTExternalIDS *externalIDS;
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
@property (nonatomic, strong) QTTracks *tracks;
@property (nonatomic, copy)   NSString *type;
@property (nonatomic, copy)   NSString *uri;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTArtist : NSObject
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, assign) QTArtistType *type;
@property (nonatomic, copy)   NSString *uri;
@end

@interface QTExternalUrls : NSObject
@property (nonatomic, copy) NSString *spotify;
@end

@interface QTCopyright : NSObject
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *type;
@end

@interface QTExternalIDS : NSObject
@property (nonatomic, copy) NSString *upc;
@end

@interface QTImage : NSObject
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, copy)   NSString *url;
@property (nonatomic, assign) NSInteger width;
@end

@interface QTTracks : NSObject
@property (nonatomic, copy)           NSString *href;
@property (nonatomic, copy)           NSArray<QTItem *> *items;
@property (nonatomic, assign)         NSInteger limit;
@property (nonatomic, nullable, copy) id next;
@property (nonatomic, assign)         NSInteger offset;
@property (nonatomic, nullable, copy) id previous;
@property (nonatomic, assign)         NSInteger total;
@end

@interface QTItem : NSObject
@property (nonatomic, copy)   NSArray<QTArtist *> *artists;
@property (nonatomic, assign) NSInteger discNumber;
@property (nonatomic, assign) NSInteger durationMS;
@property (nonatomic, assign) BOOL isExplicit;
@property (nonatomic, strong) QTExternalUrls *externalUrls;
@property (nonatomic, copy)   NSString *href;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, assign) BOOL isPlayable;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *previewURL;
@property (nonatomic, assign) NSInteger trackNumber;
@property (nonatomic, assign) QTItemType *type;
@property (nonatomic, copy)   NSString *uri;
@end

NS_ASSUME_NONNULL_END
