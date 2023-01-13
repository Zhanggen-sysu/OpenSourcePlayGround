//
//  OSPGCrewCastResponse.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGCrewCastResponse.h"
#import "OSPGCast.h"
#import "OSPGCrew.h"

@implementation OSPGCrewCastResponse

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"id": @"identifier",
        @"cast": @"cast",
        @"crew": @"crew",
    };
}

+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass
{
    return @{
        @"cast":[OSPGCast class],
        @"crew":[OSPGCrew class],
    };
}



@end
