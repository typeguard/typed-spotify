// To parse this JSON:
//
//   NSError *error;
//   QTAlbum *album = [QTAlbum fromJSON:json encoding:NSUTF8Encoding error:&error];
//   QTArtist *artist = [QTArtist fromJSON:json encoding:NSUTF8Encoding error:&error];
//   QTPlaylist *playlist = [QTPlaylist fromJSON:json encoding:NSUTF8Encoding error:&error];
//   QTProfile *profile = [QTProfile fromJSON:json encoding:NSUTF8Encoding error:&error];
//   QTTrack *track = [QTTrack fromJSON:json encoding:NSUTF8Encoding error:&error];

#import <Foundation/Foundation.h>

@class QTTrack;
@class QTError;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - Object interfaces

@interface QTTrack : NSObject
@property (nonatomic, strong) QTError *error;

+ (_Nullable instancetype)fromJSON:(NSString *)json encoding:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
+ (_Nullable instancetype)fromData:(NSData *)data error:(NSError *_Nullable *)error;
- (NSString *_Nullable)toJSON:(NSStringEncoding)encoding error:(NSError *_Nullable *)error;
- (NSData *_Nullable)toData:(NSError *_Nullable *)error;
@end

@interface QTError : NSObject
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy)   NSString *message;
@end

NS_ASSUME_NONNULL_END
