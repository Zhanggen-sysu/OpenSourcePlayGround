//
//  OSPGMovieDetailView.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/12.
//

#import "OSPGMovieDetailView.h"
#import "OSPGMovieDetailResponse.h"
#import "OSPGGenre.h"
#import "UIView+YYAdd.h"
#import "UIImageView+WebCache.h"

@interface OSPGMovieDetailView ()

@property (nonatomic, strong) OSPGMovieDetailResponse *detail;

@property (nonatomic, strong) UIImageView *backdropImg;
@property (nonatomic, strong) UIImageView *posterImg;

@property (nonatomic, strong) UIView *detailContent;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *tagLineLabel;
@property (nonatomic, strong) UILabel *ratingLabel;
@property (nonatomic, strong) UILabel *genreLabel;
@property (nonatomic, strong) UILabel *releaseDateLabel;
@property (nonatomic, strong) UILabel *overviewLabel;

@end

@implementation OSPGMovieDetailView

#pragma mark - UI
- (void)setupSubviews
{
    [self addSubview:self.backdropImg];
    [self addSubview:self.detailContent];
    [self addSubview:self.posterImg];
    [self.detailContent addSubview:self.titleLabel];
    [self.detailContent addSubview:self.tagLineLabel];
    [self.detailContent addSubview:self.ratingLabel];
    [self.detailContent addSubview:self.genreLabel];
    [self.detailContent addSubview:self.releaseDateLabel];
    [self.detailContent addSubview:self.overviewLabel];
}

- (void)defineLayout
{
    [self.backdropImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.height.mas_equalTo(0.563 * SCREEN_WIDTH);
    }];
    [self.detailContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backdropImg.mas_bottom);
        make.leading.trailing.bottom.equalTo(self);
    }];
    [self.posterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(128.f);
        make.height.mas_equalTo(192.f);
        make.top.equalTo(self.backdropImg.mas_bottom).offset(-32.f);
        make.leading.equalTo(self).offset(15.f);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backdropImg.mas_bottom).offset(10.f);
        make.leading.equalTo(self.posterImg.mas_trailing).offset(10.f);
        make.trailing.equalTo(self).offset(-15.f);
    }];
    [self.tagLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
    }];
    [self.ratingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tagLineLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
    }];
    [self.genreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ratingLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
    }];
    [self.releaseDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.genreLabel.mas_bottom).offset(10.f);
        make.leading.trailing.equalTo(self.titleLabel);
    }];
    [self.overviewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).offset(15.f);
        make.trailing.equalTo(self).offset(-15.f);
        make.bottom.equalTo(self.detailContent).offset(-10.f);
    }];
}

- (UIImageView *)backdropImg
{
    if (!_backdropImg) {
        _backdropImg = [[UIImageView alloc] init];
    }
    return _backdropImg;
}

- (UIView *)detailContent
{
    if (!_detailContent)
    {
        _detailContent = [[UIView alloc] init];
        _detailContent.backgroundColor = [UIColor whiteColor];
    }
    return _detailContent;
}

- (UIImageView *)posterImg
{
    if (!_posterImg) {
        _posterImg = [[UIImageView alloc] init];
        ViewBorderRadius(_posterImg, 10.f, 0, [UIColor whiteColor]);
    }
    return _posterImg;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = kBoldFont(16.f);
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)tagLineLabel
{
    if (!_tagLineLabel)
    {
        _tagLineLabel = [[UILabel alloc] init];
        _tagLineLabel.font = kFont(14.f);
        _tagLineLabel.textColor = RGBColor(128, 128, 128);
        _tagLineLabel.numberOfLines = 0;
    }
    return _tagLineLabel;
}

- (UILabel *)ratingLabel
{
    if (!_ratingLabel)
    {
        _ratingLabel = [[UILabel alloc] init];
    }
    return _ratingLabel;
}

- (UILabel *)genreLabel
{
    if (!_genreLabel)
    {
        _genreLabel = [[UILabel alloc] init];
        _genreLabel.font = kFont(14.f);
        _genreLabel.numberOfLines = 0;
    }
    return _genreLabel;
}

- (UILabel *)releaseDateLabel
{
    if (!_releaseDateLabel)
    {
        _releaseDateLabel = [[UILabel alloc] init];
        _releaseDateLabel.font = kFont(14.f);
        _releaseDateLabel.numberOfLines = 0;
    }
    return _releaseDateLabel;
}

- (UILabel *)overviewLabel
{
    if (!_overviewLabel)
    {
        _overviewLabel = [[UILabel alloc] init];
        _overviewLabel.font = kFont(14.f);
        _overviewLabel.numberOfLines = 0;
    }
    return _overviewLabel;
}

#pragma mark - data
- (void)updateWithModel:(OSPGMovieDetailResponse *)response
{
    if (response.identifier == self.detail.identifier) {
        return;
    }
    self.detail = response;
    [self.backdropImg sd_setImageWithURL:[OSPGCommonHelper getBackdropUrl:self.detail.backdropPath size:OSPGBackdropSize_w780] placeholderImage:kGetImage(@"backdropDefault")];
    [self.posterImg sd_setImageWithURL:[OSPGCommonHelper getPosterUrl:self.detail.posterPath size:OSPGPosterSize_w342] placeholderImage:kGetImage(@"posterDefault")];
    self.titleLabel.text = self.detail.title;
    if (self.detail.tagline.length > 0) {
        self.tagLineLabel.text = self.detail.tagline;
        [self.tagLineLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        }];
    } else {
        [self.tagLineLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom);
        }];
    }
    self.ratingLabel.attributedText = [OSPGCommonHelper generateRatingString:self.detail.voteAverage];
    NSMutableString *genresStr = [[NSMutableString alloc] init];
    [self.detail.genres enumerateObjectsUsingBlock:^(OSPGGenre * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (genresStr.length > 0) {
            [genresStr appendFormat:@" / %@", obj.name];
        } else {
            [genresStr appendString:obj.name];
        }
    }];
    self.genreLabel.text = genresStr;
    self.releaseDateLabel.text = [NSString stringWithFormat:@"%@ · %@", self.detail.releaseDate, [OSPGCommonHelper getRumtimeString:self.detail.runtime]];
    self.overviewLabel.text = self.detail.overview;
    
    CGFloat releaseLabelBottom =
    [OSPGCommonHelper heightWithText:self.titleLabel.text font:self.titleLabel.font width:self.titleLabel.width] +
    [OSPGCommonHelper heightWithText:self.tagLineLabel.text font:self.tagLineLabel.font width:self.tagLineLabel.width] +
    [OSPGCommonHelper heightWithText:self.ratingLabel.text font:self.ratingLabel.font width:self.ratingLabel.width] +
    [OSPGCommonHelper heightWithText:self.genreLabel.text font:self.genreLabel.font width:self.genreLabel.width] +
    [OSPGCommonHelper heightWithText:self.releaseDateLabel.text font:self.releaseDateLabel.font width:self.releaseDateLabel.width] + self.releaseDateLabel.top + self.backdropImg.bottom;
    [self.overviewLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(releaseLabelBottom > CGRectGetMaxY(self.posterImg.frame) ? self.releaseDateLabel.mas_bottom : self.posterImg.mas_bottom).offset(10.f);
    }];
}



@end
