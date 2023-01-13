//
//  OSPGReviewAuthorDetails.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewAuthorDetails.h"

@implementation OSPGReviewAuthorDetails

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"name": @"name",
        @"username": @"username",
        @"avatar_path": @"avatarPath",
        @"rating": @"rating",
    };
}

@end
