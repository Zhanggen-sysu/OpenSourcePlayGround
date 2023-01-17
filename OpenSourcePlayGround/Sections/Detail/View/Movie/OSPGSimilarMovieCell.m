//
//  OSPGSimilarMovieCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/17.
//

#import "OSPGSimilarMovieCell.h"
#import "OSPGDiscoverResult.h"
#import "OSPGCommonHelper.h"
#import "UIImageView+WebCache.h"
#import "UIView+YYAdd.h"
#import "Macros.h"
#import "Masonry.h"

@interface OSPGSimilarMovieCell ()

@property (nonatomic, strong) OSPGDiscoverResult *model;
@property (nonatomic, strong) UIImageView *posterImg;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *rateLabel;

@end

@implementation OSPGSimilarMovieCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self  = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self defineLayout];
    }
    return self;
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.contentView addSubview:self.posterImg];
    [self.contentView addSubview:self.rateLabel];
    [self.contentView addSubview:self.nameLabel];
}

- (void)defineLayout
{
    [self.posterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView.width * 1.5f);
    }];
    [self.rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.posterImg.mas_bottom).offset(5.f);
        make.trailing.leading.equalTo(self.posterImg);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rateLabel.mas_bottom).offset(5.f);
        make.leading.trailing.equalTo(self.posterImg);
    }];
}

- (UIImageView *)posterImg
{
    if (!_posterImg) {
        _posterImg = [[UIImageView alloc] init];
        ViewBorderRadius(_posterImg, 5, 0, [UIColor whiteColor]);
    }
    return _posterImg;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = kFont(14.f);
        _nameLabel.numberOfLines = 2;
    }
    return _nameLabel;
}

- (UILabel *)rateLabel
{
    if (!_rateLabel) {
        _rateLabel = [[UILabel alloc] init];
    }
    return _rateLabel;
}

#pragma mark - Data
- (void)updateWithModel:(OSPGDiscoverResult *)model
{
    if (self.model.identifier == model.identifier) {
        return;
    }
    self.nameLabel.text = model.title;
    [self.posterImg sd_setImageWithURL:[OSPGCommonHelper getPosterUrl:model.posterPath size:OSPGPosterSize_w342] placeholderImage:kGetImage(@"posterDefault")];
    NSMutableAttributedString *ratingStr = [[NSMutableAttributedString alloc] init];
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = kGetImage(@"starFullIcon");
    attach.bounds = CGRectMake(0, -2, 14.f, 14.f);
    NSDictionary *attri = @{
        NSFontAttributeName: kFont(14.f),
    };
    [ratingStr appendAttributedString:[NSAttributedString attributedStringWithAttachment:attach]];
    [ratingStr appendAttributedString:[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %.1f", model.voteAverage] attributes:attri]];
    self.rateLabel.attributedText = ratingStr;
}

@end
