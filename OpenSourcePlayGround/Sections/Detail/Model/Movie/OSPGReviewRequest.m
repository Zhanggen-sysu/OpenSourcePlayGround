//
//  OSPGReviewRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGReviewRequest.h"

@implementation OSPGReviewRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"language": @"language",
        @"page": @"page",
    };
}

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"movie/%@/reviews", @(self.movieId)];
}

@end
