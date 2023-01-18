//
//  OSPGMovieDiscoverResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGMovieDiscoverResponse.h"
#import "OSPGMovieResult.h"

@implementation OSPGMovieDiscoverResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"page": @"page",
        @"results": @"results",
        @"dates": @"dates",
        @"total_pages": @"totalPages",
        @"total_results": @"totalResults",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"results" : [OSPGMovieResult class]};
}

@end
