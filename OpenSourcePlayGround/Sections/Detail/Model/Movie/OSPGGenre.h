//
//  OSPGGenre.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGGenre : OSPGBaseModel

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy)   NSString *name;

@end

NS_ASSUME_NONNULL_END
