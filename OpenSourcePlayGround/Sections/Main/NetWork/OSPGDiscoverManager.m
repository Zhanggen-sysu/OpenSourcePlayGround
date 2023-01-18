//
//  OSPGDiscoverManager.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGDiscoverManager.h"
#import "OSPGMovieLatestResponse.h"
#import "OSPGMovieDiscoverResponse.h"

@interface OSPGDiscoverManager ()

@property (nonatomic, assign) NSInteger page;

@end

@implementation OSPGDiscoverManager

static OSPGDiscoverManager *_manager = nil;

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
   
   return [OSPGDiscoverManager sharedManager];
}

- (id)copyWithZone:(NSZone *)zone {
   
   return [OSPGDiscoverManager sharedManager];
}

- (id)mutableCopyWithZone:(NSZone *)zone {
   
   return [OSPGDiscoverManager sharedManager];
}

- (void)getDiscoverDefault:(OSPGCommonResponseBlock)block loadMore:(BOOL)loadMore
{
    self.page = loadMore ? ++self.page : 1;
    OSPGDiscoverRequest *request = [[OSPGDiscoverRequest alloc] init];
    request.sortBy = @"popularity.desc";
    request.page = [NSString stringWithFormat:@"%ld", self.page];
    [request startRequestWithRspClass:[OSPGMovieDiscoverResponse class]
                        completeBlock:block];
}

- (void)getDiscoverMovieType:(OSPGMovieDiscoverType)type loadMore:(BOOL)loadMore block:(OSPGCommonResponseBlock)block
{
    self.page = loadMore ? ++self.page : 1;
    OSPGMovieDiscoverRequest *request = [[OSPGMovieDiscoverRequest alloc] init];
    request.type = type;
    Class class;
    if (type != OSPGMovieDiscoverType_Latest) {
        class = [OSPGMovieDiscoverResponse class];
        request.page = [NSString stringWithFormat:@"%ld", self.page];
    } else {
        class = [OSPGMovieLatestResponse class];
    }
    [request startRequestWithRspClass:class completeBlock:block];
}

@end
