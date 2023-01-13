//
//  OSPGReviewResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewResponse.h"
#import "OSPGReviewResult.h"

@implementation OSPGReviewResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"page": @"page",
        @"results": @"results",
        @"total_pages": @"totalPages",
        @"total_results": @"totalResults",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"results" : [OSPGReviewResult class],
    };
}

@end
