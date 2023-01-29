//
//  OSPGCreditDetailResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGCreditDetailResponse.h"

@implementation OSPGCreditDetailResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"credit_type": @"creditType",
        @"department": @"department",
        @"job": @"job",
        @"media": @"media",
        @"media_type": @"mediaType",
        @"id": @"identifier",
        @"person": @"person",
    };
}

@end
