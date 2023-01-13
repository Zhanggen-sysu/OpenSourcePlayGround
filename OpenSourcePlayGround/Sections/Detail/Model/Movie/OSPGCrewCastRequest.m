//
//  OSPGCrewCastRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGCrewCastRequest.h"

@implementation OSPGCrewCastRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"language": @"language",
    };
}

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"movie/%@/credits", @(self.movieId)];
}

@end
