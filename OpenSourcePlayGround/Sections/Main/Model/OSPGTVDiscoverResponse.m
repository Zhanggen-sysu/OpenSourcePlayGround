//
//  OSPGTVDiscoverResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGTVDiscoverResponse.h"
#import "OSPGTVResult.h"

@implementation OSPGTVDiscoverResponse

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
    return @{
        @"results":[OSPGTVResult class],
    };
}

@end
