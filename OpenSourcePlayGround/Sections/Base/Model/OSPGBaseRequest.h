//
//  OSPGBaseRequest.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "YTKBaseRequest.h"
#import "NSObject+YYModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^OSPGCommonResponseBlock)(BOOL isSuccess, id _Nullable rsp, NSString * _Nullable errorMessage);

@interface OSPGBaseRequest : YTKBaseRequest

- (NSDictionary *)jsonDictionary;

- (void)startRequestWithRspClass:(Class)rspClass
                   completeBlock:(OSPGCommonResponseBlock)block;
@end

NS_ASSUME_NONNULL_END
