//
//  OSPGDiscoverResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGDiscoverResponse.h"
#import "OSPGDiscoverResult.h"

@implementation OSPGDiscoverResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"page": @"page",
        @"results": @"results",
        @"total_results": @"totalResults",
        @"total_pages": @"totalPages",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{@"results" : [OSPGDiscoverResult class]};
}

@end
