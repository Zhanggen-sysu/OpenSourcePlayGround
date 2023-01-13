//
//  OSPGSpokenLanguage.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGSpokenLanguage : OSPGBaseModel

@property (nonatomic, copy) NSString *iso639_1;
@property (nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
