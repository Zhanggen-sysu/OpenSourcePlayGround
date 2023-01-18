//
//  OSPGDate.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGDate.h"

@implementation OSPGDate

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"maximum": @"maximum",
        @"minimum": @"minimum",
    };
}

@end
