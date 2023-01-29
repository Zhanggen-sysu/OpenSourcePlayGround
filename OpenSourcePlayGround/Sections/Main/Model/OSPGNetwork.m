//
//  OSPGNetwork.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGNetwork.h"

@implementation OSPGNetwork

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"name": @"name",
        @"logo_path": @"logoPath",
        @"origin_country": @"originCountry",
    };
}


@end
