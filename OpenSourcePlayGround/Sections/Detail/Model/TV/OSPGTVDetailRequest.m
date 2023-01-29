//
//  OSPGTVDetailRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGTVDetailRequest.h"

@implementation OSPGTVDetailRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    static NSDictionary<NSString *, NSString *> *properties;
    return properties = properties ? properties : @{
        @"language": @"language",
        @"page": @"page",
        @"append_to_response" : @"appendToResponse",
    };
}

- (NSString *)requestUrl
{
    NSMutableString *url = [[NSMutableString alloc] init];
    [url appendFormat:@"tv/%@", @(self.tvId)];
    switch (self.type) {
        case OSPGTVDetailType_Default:
            NSAssert(NO, @"Must choose one type");
            break;
        case OSPGTVDetailType_Credits:
            [url appendString:@"/credits"];
            break;
        case OSPGTVDetailType_Images:
            [url appendString:@"/images"];
            break;
        case OSPGTVDetailType_Reviews:
            [url appendString:@"/reviews"];
            break;
        case OSPGTVDetailType_Similar:
            [url appendString:@"/similar"];
            break;
        default:
            break;
    }
    return url;
}

@end
