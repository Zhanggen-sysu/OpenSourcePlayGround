//
//  OSPGMovieDetailRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGMovieDetailRequest.h"

@implementation OSPGMovieDetailRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"language": @"language",
    };
}

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"movie/%@", @(self.movieId)];
}

@end
