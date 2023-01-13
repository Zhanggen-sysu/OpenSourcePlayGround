//
//  OSPGImageResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGImageResponse.h"
#import "OSPGBackdrop.h"
#import "OSPGPoster.h"

@implementation OSPGImageResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"backdrops": @"backdrops",
        @"posters": @"posters",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"backdrops":[OSPGBackdrop class],
        @"posters":[OSPGPoster class],
    };
}

@end
