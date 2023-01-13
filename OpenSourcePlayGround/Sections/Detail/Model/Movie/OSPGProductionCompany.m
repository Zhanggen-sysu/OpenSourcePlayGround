//
//  OSPGProductionCompany.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGProductionCompany.h"

@implementation OSPGProductionCompany

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"logo_path": @"logoPath",
        @"name": @"name",
        @"origin_country": @"originCountry",
    };
}

@end
