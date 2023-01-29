//
//  OSPGCreatedBy.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGCreatedBy.h"

@implementation OSPGCreatedBy

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"credit_id": @"creditID",
        @"name": @"name",
        @"gender": @"gender",
        @"profile_path": @"profilePath",
    };
}

@end
