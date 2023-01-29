//
//  OSPGPerson.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGPerson.h"

@implementation OSPGPerson

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"adult": @"isAdult",
        @"id": @"identifier",
        @"name": @"name",
        @"original_name": @"originalName",
        @"media_type": @"mediaType",
        @"popularity": @"popularity",
        @"gender": @"gender",
        @"known_for_department": @"knownForDepartment",
        @"profile_path": @"profilePath",
    };
}

@end
