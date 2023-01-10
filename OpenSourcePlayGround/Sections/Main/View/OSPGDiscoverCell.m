//
//  OSPGDiscoverCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGDiscoverCell.h"
#import "OSPGDiscoverResult.h"
#import "Macros.h"
#import "OSPGCommonHelper.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "UIView+YYAdd.h"

@interface OSPGDiscoverCell ()

@property (nonatomic, strong) OSPGDiscoverResult *model;
@property (nonatomic, strong) UIImageView *posterImg;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *subLabel;

@end

@implementation OSPGDiscoverCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.contentView addSubview:self.posterImg];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.subLabel];
}

- (void)defineLayout
{
    [self.posterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView.width * 1.5);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.posterImg.mas_bottom).offset(10.f);
        make.left.right.equalTo(self.contentView);
    }];
    [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(5.f);
        make.left.right.equalTo(self.contentView);
    }];
}

- (UIImageView *)posterImg
{
    if (!_posterImg) {
        _posterImg = [[UIImageView alloc] init];
        ViewBorderRadius(_posterImg, 5.0f, 0, [UIColor whiteColor]);
    }
    return _posterImg;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont boldSystemFontOfSize:12];
        _nameLabel.numberOfLines = 1;
    }
    return _nameLabel;
}

- (UILabel *)subLabel
{
    if (!_subLabel) {
        _subLabel = [[UILabel alloc] init];
        _subLabel.font = [UIFont systemFontOfSize:10];
        _subLabel.textColor = RGBColor(128, 128, 128);
        _subLabel.numberOfLines = 1;
    }
    return _subLabel;
}

#pragma mark - Data
- (void)updateWithModel:(OSPGDiscoverResult *)result
{
    if (result.identifier == self.model.identifier) {
        return;
    }
    self.model = result;
    self.nameLabel.text = result.title;
    NSString *releaseDate = [[OSPGCommonHelper sharedManager] dateFormateConvertString:result.releaseDate
                                                                           fromFormate:OSPGDateFormate_yyyyMMdd
                                                                             toFormate:OSPGDateFormate_MMMdyyyy];
    self.subLabel.text = [NSString stringWithFormat:@"%@ - %@", releaseDate, result.originalLanguage];
    NSString *posterPath = [NSString stringWithFormat:@"%@/w342%@", API_IMG_BASEURL, result.posterPath];
    [self.posterImg sd_setImageWithURL:[NSURL URLWithString:posterPath] placeholderImage:[UIImage imageNamed:@""]];
}

@end