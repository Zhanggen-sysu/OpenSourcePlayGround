//
//  OSPGTVDetailManager.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGTVDetailManager.h"
#import "OSPGTVDetailRequest.h"
#import "OSPGTVLatestResponse.h"
#import "OSPGCrewCastResponse.h"
#import "OSPGImageResponse.h"
#import "OSPGReviewResponse.h"
#import "OSPGTVDiscoverResponse.h"

@interface OSPGTVDetailManager ()

@property (nonatomic, assign) NSInteger reviewPage;
@property (nonatomic, assign) NSInteger similarPage;

@end

@implementation OSPGTVDetailManager

static OSPGTVDetailManager *_manager = nil;

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_manager) {
            _manager = [[super allocWithZone:NULL] init];
        }
    });
    return _manager;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
   return [OSPGTVDetailManager sharedManager];
}

- (id)copyWithZone:(NSZone *)zone
{
   return [OSPGTVDetailManager sharedManager];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
   return [OSPGTVDetailManager sharedManager];
}


- (void)getTVDetailWithId:(NSInteger)tvId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGTVDetailRequest *request = [[OSPGTVDetailRequest alloc] init];
    request.tvId = tvId;
    request.type = OSPGTVDetailType_Common;
    [request startRequestWithRspClass:[OSPGTVLatestResponse class]
                        completeBlock:block];
}

- (void)getCastCrewWithId:(NSInteger)tvId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGTVDetailRequest *request = [[OSPGTVDetailRequest alloc] init];
    request.tvId = tvId;
    request.type = OSPGTVDetailType_Credits;
    [request startRequestWithRspClass:[OSPGCrewCastResponse class]
                        completeBlock:block];
}

- (void)getImagesWithId:(NSInteger)tvId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGTVDetailRequest *request = [[OSPGTVDetailRequest alloc] init];
    request.tvId = tvId;
    request.type = OSPGTVDetailType_Images;
    [request startRequestWithRspClass:[OSPGImageResponse class]
                        completeBlock:block];
}

- (void)getReviewsWithId:(NSInteger)tvId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block
{
    self.reviewPage = loadMore ? ++self.reviewPage : 1;
    OSPGTVDetailRequest *request = [[OSPGTVDetailRequest alloc] init];
    request.tvId = tvId;
    request.type = OSPGTVDetailType_Reviews;
    request.page = [NSString stringWithFormat:@"%ld", self.reviewPage];;
    [request startRequestWithRspClass:[OSPGReviewResponse class] completeBlock:block];
}

- (void)getSimilarWithId:(NSInteger)tvId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block
{
    self.similarPage = loadMore ? ++self.similarPage : 1;
    OSPGTVDetailRequest *request = [[OSPGTVDetailRequest alloc] init];
    request.tvId = tvId;
    request.type = OSPGTVDetailType_Similar;
    request.page = [NSString stringWithFormat:@"%ld", self.similarPage];;
    [request startRequestWithRspClass:[OSPGTVDiscoverResponse class] completeBlock:block];
}

@end
