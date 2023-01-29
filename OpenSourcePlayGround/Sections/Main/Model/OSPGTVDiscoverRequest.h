//
//  OSPGTVDiscoverRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, OSPGTVDiscoverType) {
    OSPGTVDiscoverType_Default,
    OSPGTVDiscoverType_Latest,
    OSPGTVDiscoverType_AiringToday,
    OSPGTVDiscoverType_OnTheAir,
    OSPGTVDiscoverType_Popular,
    OSPGTVDiscoverType_TopRate,
};

@interface OSPGTVDiscoverRequest : OSPGBaseRequest

// latest没有language字段
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *page;
@property (nonatomic, assign) OSPGTVDiscoverType type;

@end

NS_ASSUME_NONNULL_END
