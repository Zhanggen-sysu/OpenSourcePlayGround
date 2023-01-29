//
//  OSPGTVDetailRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseRequest.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, OSPGTVDetailType) {
    OSPGTVDetailType_Default,
    OSPGTVDetailType_Common,
    OSPGTVDetailType_Credits,
    OSPGTVDetailType_Images,
    OSPGTVDetailType_Reviews,
    OSPGTVDetailType_Similar,
};

@interface OSPGTVDetailRequest : OSPGBaseRequest

@property (nonatomic, assign) NSInteger tvId;
@property (nonatomic, assign) OSPGTVDetailType type;
@property (nonatomic, copy) NSString *language;
// only for common
@property (nonatomic, copy) NSString *appendToResponse;
// only for similar, review
@property (nonatomic, copy) NSString *page;

@end

NS_ASSUME_NONNULL_END
