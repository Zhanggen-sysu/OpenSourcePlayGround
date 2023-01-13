//
//  OSPGCastSmallCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGCastSmallCell.h"
#import "UIImageView+WebCache.h"
#import "UIView+YYAdd.h"
#import "OSPGCommonHelper.h"
#import "Macros.h"
#import "Masonry.h"
#import "OSPGCast.h"

@interface OSPGCastSmallCell ()

@property (nonatomic, strong) OSPGCast *model;

@property (nonatomic, strong) UIImageView *avatarImg;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *characterLabel;

@end

@implementation OSPGCastSmallCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

- (void)setupSubviews
{
    [self.contentView addSubview:self.avatarImg];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.characterLabel];
}

- (void)defineLayout
{
    [self.avatarImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.leading.equalTo(self.contentView).offset(5.f);
        make.trailing.equalTo(self.contentView).offset(-5.f);
        make.height.equalTo(self.contentView.mas_width).offset(-10.f);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.avatarImg.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.avatarImg);
    }];
    [self.characterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.avatarImg);
    }];
}

- (UIImageView *)avatarImg
{
    if (!_avatarImg) {
        _avatarImg = [[UIImageView alloc] init];
        _avatarImg.contentMode = UIViewContentModeScaleAspectFill;
        ViewBorderRadius(_avatarImg, (self.contentView.width - 10) / 2, 0, [UIColor whiteColor]);
    }
    return _avatarImg;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.numberOfLines = 2;
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.font = kFont(14.f);
    }
    return _nameLabel;
}

- (UILabel *)characterLabel
{
    if (!_characterLabel) {
        _characterLabel = [[UILabel alloc] init];
        _characterLabel.font = kFont(14.f);
        _characterLabel.textAlignment = NSTextAlignmentCenter;
        _characterLabel.textColor = RGBColor(128, 128, 128);
    }
    return _characterLabel;
}

#pragma mark - data
- (void)updateWithModel:(OSPGCast *)model
{
    if (self.model.identifier == model.identifier) {
        return;
    }
    self.model = model;
    [self.avatarImg sd_setImageWithURL:[OSPGCommonHelper getProfileUrl:model.profilePath size:OSPGProfileSize_w185]  placeholderImage:[UIImage imageNamed:@"profileDefault"]];
    self.nameLabel.text = model.name;
    self.characterLabel.text = model.character;
}

@end
