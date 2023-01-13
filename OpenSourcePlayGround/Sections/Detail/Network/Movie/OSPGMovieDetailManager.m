//
//  OSPGMovieDetailManager.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGMovieDetailManager.h"
#import "OSPGMovieDetailResponse.h"
#import "OSPGMovieDetailRequest.h"
#import "OSPGCrewCastRequest.h"
#import "OSPGCrewCastResponse.h"
#import "OSPGImageRequest.h"
#import "OSPGImageResponse.h"
#import "OSPGReviewRequest.h"
#import "OSPGReviewResponse.h"

@interface OSPGMovieDetailManager ()

@property (nonatomic, assign) NSInteger reviewPage;

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
    [request startRequestWithRspClass:[OSPGMovieDetailResponse class]
                        completeBlock:block];
}

- (void)getCastCrewWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGCrewCastRequest *request = [[OSPGCrewCastRequest alloc] init];
    request.movieId = movieId;
    [request startRequestWithRspClass:[OSPGCrewCastResponse class]
                        completeBlock:block];
}

- (void)getImagesWithId:(NSInteger)movieId completionBlock:(OSPGCommonResponseBlock)block
{
    OSPGImageRequest *requst = [[OSPGImageRequest alloc] init];
    requst.movieId = movieId;
    [requst startRequestWithRspClass:[OSPGImageResponse class] completeBlock:block];
}


- (void)getReviewsWithId:(NSInteger)movieId loadMore:(BOOL)loadMore completionBlock:(OSPGCommonResponseBlock)block
{
    self.reviewPage = loadMore ? ++self.reviewPage : 1;
    OSPGReviewRequest *request = [[OSPGReviewRequest alloc] init];
    request.movieId = movieId;
    request.page = self.reviewPage;
    [request startRequestWithRspClass:[OSPGReviewResponse class] completeBlock:block];
}

@end
