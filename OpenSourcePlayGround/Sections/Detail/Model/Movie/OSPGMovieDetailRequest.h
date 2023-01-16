//
//  OSPGMovieDetailRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGBaseRequest.h"

typedef NS_ENUM(NSUInteger, OSPGMovieDetailType) {
    OSPGMovieDetailType_Default,
    OSPGMovieDetailType_Common,
    OSPGMovieDetailType_CrewCast,
    OSPGMovieDetailType_Image,
    OSPGMovieDetailType_Review,
    OSPGMovieDetailType_Similar,
};

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieDetailRequest : OSPGBaseRequest

@property (nonatomic, assign) NSInteger movieId;
@property (nonatomic, assign) OSPGMovieDetailType type;

@property (nonatomic, copy) NSString *language;
// only for image
@property (nonatomic, copy) NSString *includeImageLanguage;
// only for similar, review
@property (nonatomic, copy) NSString *page;

@end

NS_ASSUME_NONNULL_END
