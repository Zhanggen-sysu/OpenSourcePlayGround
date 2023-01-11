//
//  OSPGProductionCountry.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGProductionCountry.h"

@implementation OSPGProductionCountry

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"iso_3166_1": @"iso3166_1",
        @"name": @"name",
    };
}

@end
