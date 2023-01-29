//
//  OSPGTVDiscoverRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGTVDiscoverRequest.h"

@implementation OSPGTVDiscoverRequest

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
    NSMutableString *url = [[NSMutableString alloc] initWithString:@"tv/"];
    switch (self.type) {
        case OSPGTVDiscoverType_Latest:
            [url appendString:@"latest"];
            break;
        case OSPGTVDiscoverType_AiringToday:
            [url appendString:@"airing_today"];
            break;
        case OSPGTVDiscoverType_OnTheAir:
            [url appendString:@"on_the_air"];
            break;
        case OSPGTVDiscoverType_Popular:
            [url appendString:@"popular"];
            break;
        case OSPGTVDiscoverType_TopRate:
            [url appendString:@"top_rated"];
            break;
            
        default:
            break;
    }
    return url;
}

@end
