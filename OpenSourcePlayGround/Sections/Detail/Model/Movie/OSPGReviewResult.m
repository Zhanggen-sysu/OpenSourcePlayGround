//
//  OSPGReviewResult.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewResult.h"

@implementation OSPGReviewResult

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"author": @"author",
        @"author_details": @"authorDetails",
        @"content": @"content",
        @"created_at": @"createdAt",
        @"id": @"identifier",
        @"updated_at": @"updatedAt",
        @"url": @"url",
    };
}

@end
