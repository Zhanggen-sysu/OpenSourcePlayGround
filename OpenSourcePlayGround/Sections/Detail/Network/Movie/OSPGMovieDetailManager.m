//
//  OSPGMovieDetailManager.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGMovieDetailManager.h"
#import "OSPGMovieDetailResponse.h"
#import "OSPGMovieDetailRequest.h"
#import "OSPGCrewCastResponse.h"
#import "OSPGImageResponse.h"
#import "OSPGReviewResponse.h"
#import "OSPGDiscoverResponse.h"

@interface OSPGMovieDetailManager ()

@property (nonatomic, assign) NSInteger reviewPage;
@property (nonatomic, assign) NSInteger similarPage;

@end

@implementation OSPGMovieDetailManager

static OSPGMovieDetailManager *_manager = nil;

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

+ (id)allocWithZone:(struct _NSZone *)zone {
   
   return [OSPGMovieDetailManager sharedManager];
}

- (id)copyWithZone:(NSZone *)zone {
   
   return [OSPGMovieDetailManager sharedManager];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
   
   return [OSPGMovieDetailManager sharedManager];
}

- (void)getMovieDetailWithId:(NSInteger)movieId
             completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGMovieDetailRequest *request = [[OSPGMovieDetailRequest alloc] init];
    request.movieId = movieId;
    request.type = OSPGMovieDetailType_Common;
    [request startRequestWithRspClass:[OSPGMovieDetailResponse class]
                        completeBlock:block];
}

- (void)getCastCrewWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGMovieDetailRequest *request = [[OSPGMovieDetailRequest alloc] init];
    request.movieId = movieId;
    request.type = OSPGMovieDetailType_CrewCast;
    [request startRequestWithRspClass:[OSPGCrewCastResponse class]
                        completeBlock:block];
}

- (void)getImagesWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGMovieDetailRequest *requst = [[OSPGMovieDetailRequest alloc] init];
    requst.movieId = movieId;
    requst.type = OSPGMovieDetailType_Image;
    [requst startRequestWithRspClass:[OSPGImageResponse class] completeBlock:block];
}


- (void)getReviewsWithId:(NSInteger)movieId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block
{
    self.reviewPage = loadMore ? ++self.reviewPage : 1;
    OSPGMovieDetailRequest *request = [[OSPGMovieDetailRequest alloc] init];
    request.movieId = movieId;
    request.type = OSPGMovieDetailType_Review;
    request.page = [NSString stringWithFormat:@"%ld", self.reviewPage];;
    [request startRequestWithRspClass:[OSPGReviewResponse class] completeBlock:block];
}

- (void)getSimilarWithId:(NSInteger)movieId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block
{
    self.similarPage = loadMore ? ++self.similarPage : 1;
    OSPGMovieDetailRequest *request = [[OSPGMovieDetailRequest alloc] init];
    request.movieId = movieId;
    request.type = OSPGMovieDetailType_Similar;
    request.page = [NSString stringWithFormat:@"%ld", self.similarPage];
    [request startRequestWithRspClass:[OSPGDiscoverResponse class] completeBlock:block];
}

@end
