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
        @"page": @"page",
        @"include_image_language" : @"includeImageLanguage",
    };
}

- (NSString *)requestUrl
{
    NSMutableString *url = [[NSMutableString alloc] init];
    [url appendFormat:@"movie/%@", @(self.movieId)];
    switch (self.type) {
        case OSPGMovieDetailType_Default:
            NSAssert(NO, @"Must choose one type");
            break;
        case OSPGMovieDetailType_CrewCast:
            [url appendString:@"/credits"];
            break;
        case OSPGMovieDetailType_Image:
            [url appendString:@"/images"];
            break;
        case OSPGMovieDetailType_Review:
            [url appendString:@"/reviews"];
            break;
        case OSPGMovieDetailType_Similar:
            [url appendString:@"/similar"];
            break;
        default:
            break;
    }
    return url;
}

@end
