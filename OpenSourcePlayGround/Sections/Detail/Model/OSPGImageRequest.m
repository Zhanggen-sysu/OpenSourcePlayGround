//
//  OSPGImageRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGImageRequest.h"

@implementation OSPGImageRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"language": @"language",
        @"include_image_language" : @"includeImageLanguage",
    };
}

- (NSString *)requestUrl
{
    return [NSString stringWithFormat:@"movie/%@/images", @(self.movieId)];
}

@end
