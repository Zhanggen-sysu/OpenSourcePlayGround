//
//  OSPGReviewView.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/13.
//

#import "OSPGBaseView.h"

@class OSPGReviewResponse;
NS_ASSUME_NONNULL_BEGIN

@interface OSPGReviewView : OSPGBaseView

- (void)updateWithModel:(OSPGReviewResponse *)model;

@end

NS_ASSUME_NONNULL_END
