//
//  OSPGDiscoverCell.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/9.
//

#import "OSPGDiscoverCell.h"
#import "OSPGMovieResult.h"
#import "OSPGTVResult.h"
#import "Macros.h"
#import "OSPGCommonHelper.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "UIView+YYAdd.h"

@interface OSPGDiscoverCell ()

@property (nonatomic, strong) OSPGMovieResult *model;
@property (nonatomic, strong) OSPGTVResult *tvModel;
@property (nonatomic, strong) UIImageView *posterImg;
@property (nonatomic, strong) UIButton *rateLabel;

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
    [self.contentView addSubview:self.rateLabel];
}

- (void)defineLayout
{
    [self.posterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView.width * 1.5);
    }];
    [self.rateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self.contentView).offset(10.f);
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

- (UIButton *)rateLabel
{
    if (!_rateLabel) {
        _rateLabel = [[UIButton alloc] init];
        _rateLabel.backgroundColor = RGBAColor(0, 0, 0, 0.5);
        ViewBorderRadius(_rateLabel, 5.0f, 0, [UIColor blackColor]);
        [_rateLabel setImage:[kGetImage(@"starFullIcon") sd_resizedImageWithSize:CGSizeMake(14.f, 14.f) scaleMode:SDImageScaleModeAspectFill] forState:UIControlStateNormal];
        _rateLabel.titleLabel.font = kFont(12.f);
        _rateLabel.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
        _rateLabel.contentEdgeInsets = UIEdgeInsetsMake(2, 5, 2, 8);
    }
    return _rateLabel;
}

#pragma mark - Data
- (void)updateWithModel:(OSPGMovieResult *)result
{
    if (result.identifier == self.model.identifier) {
        return;
    }
    self.model = result;
    [self.posterImg sd_setImageWithURL:[OSPGCommonHelper getPosterUrl:result.posterPath size:OSPGPosterSize_w342] placeholderImage:[UIImage imageNamed:@"posterDefault"]];
    [self.rateLabel setTitle:[NSString stringWithFormat:@"%.1f", result.voteAverage] forState:UIControlStateNormal];
}

- (void)updateWithTVModel:(OSPGTVResult *)result
{
    if (result.identifier == self.tvModel.identifier) {
        return;
    }
    self.tvModel = result;
    [self.posterImg sd_setImageWithURL:[OSPGCommonHelper getPosterUrl:result.posterPath size:OSPGPosterSize_w342] placeholderImage:[UIImage imageNamed:@"posterDefault"]];
    [self.rateLabel setTitle:[NSString stringWithFormat:@"%.1f", result.voteAverage] forState:UIControlStateNormal];
}

@end
