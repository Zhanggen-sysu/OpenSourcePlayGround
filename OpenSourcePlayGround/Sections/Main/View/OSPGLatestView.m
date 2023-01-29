//
//  OSPGLatestView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGLatestView.h"
#import "OSPGMovieLatestResponse.h"
#import "OSPGTVLatestResponse.h"
#import "UIImageView+WebCache.h"

@interface OSPGLatestView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *taglineLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIView *gradientView;

@property (nonatomic, strong) OSPGMovieLatestResponse *model;
@property (nonatomic, strong) OSPGTVLatestResponse *tvModel;

@end

@implementation OSPGLatestView

- (void)setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.imageView];
    [self addSubview:self.gradientView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.taglineLabel];
}

- (void)defineLayout
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10.f);
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self).offset(-15.f);
        make.height.mas_equalTo((SCREEN_WIDTH - 30.f) * 0.563);
        make.bottom.equalTo(self).offset(-10.f);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self.gradientView).offset(10.f);
        make.trailing.equalTo(self.gradientView).offset(-10.f);
    }];
    [self.taglineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(self.nameLabel);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10.f);
    }];
    [self.gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self.imageView);
        make.height.mas_equalTo(60.f);
    }];
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapBackImg)];
        [_imageView addGestureRecognizer:ges];
    }
    return _imageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = kFont(16.f);
    }
    return _nameLabel;
}

- (UILabel *)taglineLabel
{
    if (!_taglineLabel) {
        _taglineLabel = [[UILabel alloc] init];
        _taglineLabel.textColor = [UIColor whiteColor];
        _taglineLabel.font = kFont(14.f);
    }
    return _taglineLabel;
}

- (UIView *)gradientView
{
    if (!_gradientView) {
        _gradientView = [[UIView alloc] init];
        CAGradientLayer *layer = [[CAGradientLayer alloc] init];
        layer.frame = CGRectMake(0, 0, SCREEN_WIDTH - 30.f, 60.f);
        layer.startPoint = CGPointMake(0.5, 0);
        layer.endPoint = CGPointMake(0.5, 1);
        layer.colors = @[(__bridge id)RGBAColor(0, 0, 0, 0).CGColor, (__bridge id)RGBAColor(0, 0, 0, 0.5).CGColor];
        [_gradientView.layer addSublayer:layer];
    }
    return _gradientView;
}

#pragma mark - data
- (void)updateWithModel:(OSPGMovieLatestResponse *)model
{
    if (model.identifier == self.model.identifier) {
        return;
    }
    self.model = model;
    [self.imageView sd_setImageWithURL:[OSPGCommonHelper getBackdropUrl:model.backdropPath size:OSPGBackdropSize_w780] placeholderImage:kGetImage(@"backdropDefault")];
    self.taglineLabel.text = model.tagline;
    self.nameLabel.text = model.title;
}

- (void)updateWithTVModel:(OSPGTVLatestResponse *)model
{
    if (model.identifier == self.tvModel.identifier) {
        return;
    }
    self.tvModel = model;
    [self.imageView sd_setImageWithURL:[OSPGCommonHelper getBackdropUrl:model.backdropPath size:OSPGBackdropSize_w780] placeholderImage:kGetImage(@"backdropDefault")];
    self.taglineLabel.text = model.tagline;
    self.nameLabel.text = model.name;
}

#pragma mark - action
- (void)didTapBackImg
{
    !self.tapBlock ?: self.tapBlock(self.model.identifier);
}

@end
