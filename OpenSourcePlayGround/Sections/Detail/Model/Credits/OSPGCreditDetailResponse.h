//
//  OSPGCreditDetailResponse.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/29.
//

#import "OSPGBaseModel.h"
@class OSPGMedia;
@class OSPGPerson;

NS_ASSUME_NONNULL_BEGIN

@interface OSPGCreditDetailResponse : OSPGBaseModel

@property (nonatomic, copy)   NSString *creditType;
@property (nonatomic, copy)   NSString *department;
@property (nonatomic, copy)   NSString *job;
@property (nonatomic, strong) OSPGMedia *media;
@property (nonatomic, copy)   NSString *mediaType;
@property (nonatomic, copy)   NSString *identifier;
@property (nonatomic, strong) OSPGPerson *person;

@end

NS_ASSUME_NONNULL_END
