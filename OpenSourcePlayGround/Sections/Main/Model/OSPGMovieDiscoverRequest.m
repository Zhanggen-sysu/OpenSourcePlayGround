//
//  OSPGMovieDiscoverRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGMovieDiscoverRequest.h"

@implementation OSPGMovieDiscoverRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"language": @"language",
        @"region": @"region",
        @"page": @"page",
    };
}

- (NSString *)requestUrl
{
    NSMutableString *url = [[NSMutableString alloc] initWithString:@"movie/"];
    switch (self.type) {
        case OSPGMovieDiscoverType_Latest:
            [url appendString:@"latest"];
            break;
        case OSPGMovieDiscoverType_Playing:
            [url appendString:@"now_playing"];
            break;
        case OSPGMovieDiscoverType_Popular:
            [url appendString:@"popular"];
            break;
        case OSPGMovieDiscoverType_TopRate:
            [url appendString:@"top_rated"];
            break;
        case OSPGMovieDiscoverType_Upcoming:
            [url appendString:@"upcoming"];
            break;
            
        default:
            break;
    }
    return url;
}

@end
