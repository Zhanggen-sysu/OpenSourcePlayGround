//
//  OSPGBaseRequest.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGBaseRequest.h"

@implementation OSPGBaseRequest

+ (NSDictionary<NSString *, NSString *> *)properties
{
    NSAssert(NO, @"Must override");
    return nil;
}


- (NSDictionary *)jsonDictionary
{
    id dict = [[self dictionaryWithValuesForKeys:[self class].properties.allValues] mutableCopy];

    for (id jsonName in [self class].properties) {
        id propertyName = [self class].properties[jsonName];
        if (!dict[propertyName] || [dict[propertyName] isEqual:[NSNull null]]) {
            [dict removeObjectForKey:propertyName];
            continue;
        }
        if (![jsonName isEqualToString:propertyName]) {
            dict[jsonName] = dict[propertyName];
            [dict removeObjectForKey:propertyName];
        }
    }
    [dict setObject:@"748c16b2d0a067ab5e9055e41fc2754b" forKey:@"api_key"];
    return dict;
}

- (void)startRequestWithRspClass:(Class)rspClass
                   completeBlock:(OSPGCommonResponseBlock)block
{
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        id rsp = nil;
        if ([rspClass respondsToSelector:@selector(modelWithJSON:)]) {
            rsp = [rspClass modelWithJSON:request.responseString];
        }
        if (rsp) {
            !block ?: block(YES, rsp, nil);
        } else {
            !block ?: block(NO, rsp, @"unable to convert model");
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        !block ?: block(NO, nil, [request.responseObject objectForKey:@"status_message"]);
    }];
}

@end
