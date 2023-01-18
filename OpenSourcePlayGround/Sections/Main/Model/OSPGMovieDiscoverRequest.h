//
//  OSPGMovieDiscoverRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGBaseRequest.h"

typedef NS_ENUM(NSUInteger, OSPGMovieDiscoverType) {
    OSPGMovieDiscoverType_Default,
    OSPGMovieDiscoverType_Latest,
    OSPGMovieDiscoverType_Playing,
    OSPGMovieDiscoverType_Popular,
    OSPGMovieDiscoverType_TopRate,
    OSPGMovieDiscoverType_Upcoming,
};

NS_ASSUME_NONNULL_BEGIN

@interface OSPGMovieDiscoverRequest : OSPGBaseRequest

// latest只有language参数，其他所有参数都有
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, assign) OSPGMovieDiscoverType type;

@end

NS_ASSUME_NONNULL_END
