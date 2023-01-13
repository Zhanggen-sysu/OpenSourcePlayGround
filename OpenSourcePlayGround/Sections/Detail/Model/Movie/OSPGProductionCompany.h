//
//  OSPGProductionCompany.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OSPGProductionCompany : OSPGBaseModel

@property (nonatomic, assign)         NSInteger identifier;
@property (nonatomic, nullable, copy) NSString *logoPath;
@property (nonatomic, copy)           NSString *name;
@property (nonatomic, copy)           NSString *originCountry;

@end

NS_ASSUME_NONNULL_END
