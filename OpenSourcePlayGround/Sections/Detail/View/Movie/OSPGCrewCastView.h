//
//  OSPGCrewCastView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGBaseView.h"

@class OSPGCrewCastResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGCrewCastView : OSPGBaseView

- (void)updateWithModel:(OSPGCrewCastResponse *)model;

@end

NS_ASSUME_NONNULL_END
