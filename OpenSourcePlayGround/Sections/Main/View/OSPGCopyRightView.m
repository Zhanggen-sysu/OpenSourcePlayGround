//
//  OSPGCopyRightView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/16.
//

#import "OSPGCopyRightView.h"

@interface OSPGCopyRightView ()

@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation OSPGCopyRightView

- (void)setupSubviews
{
    self.backgroundColor = RGBColor(240.f, 240.f, 240.f);
    [self addSubview:self.tipsLabel];
}

- (void)defineLayout
{
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UILabel *)tipsLabel
{
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc] init];
        _tipsLabel.font = kFont(12.f);
        _tipsLabel.textColor = RGBColor(128.f, 128.f, 128.f);
        _tipsLabel.textAlignment = NSTextAlignmentCenter;
        _tipsLabel.text = @"Copyright ©️ The Movie Database (TMDB)";
    }
    return _tipsLabel;
}

@end
