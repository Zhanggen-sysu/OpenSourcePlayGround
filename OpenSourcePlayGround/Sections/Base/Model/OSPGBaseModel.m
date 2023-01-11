//
//  OSPGBaseModel.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGBaseModel.h"

@interface OSPGBaseModel ()<YYModel>

@end

@implementation OSPGBaseModel

+ (NSDictionary<NSString *, NSString *> *)properties
{
    NSAssert(NO, @"Must override");
    return nil;
}

#pragma mark - YYModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper
{
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [[self properties] enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [dict setObject:key forKey:obj];
    }];
    return dict;
}

@end
