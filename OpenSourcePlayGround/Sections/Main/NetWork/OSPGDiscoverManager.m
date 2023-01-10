//
//  OSPGDiscoverManager.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGDiscoverManager.h"
#import "OSPGDiscoverResponse.h"

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
    [request startRequestWithRspClass:[OSPGDiscoverResponse class]
                        completeBlock:block];
}

@end
