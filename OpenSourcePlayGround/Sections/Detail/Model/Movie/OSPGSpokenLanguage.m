//
//  OSPGSpokenLanguage.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGSpokenLanguage.h"

@implementation OSPGSpokenLanguage

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"iso_639_1": @"iso639_1",
        @"name": @"name",
    };
}

@end
