//
//  OSPGMovieDetailVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGMovieDetailVC.h"
#import "OSPGMovieDetailResponse.h"
#import "OSPGMovieDetailManager.h"
#import "UIImageView+WebCache.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>
#import "YPNavigationController+Configure.h"

@interface OSPGMovieDetailVC ()<YPNavigationBarConfigureStyle>

@property (nonatomic, strong) OSPGMovieDetailResponse *detail;
@property (nonatomic, assign) CGFloat gradientProgress;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *backdropImg;
@property (nonatomic, strong) UIImageView *posterImg;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UILabel *tagLineLabel;
@property (nonatomic, strong) UILabel *directorLabel;
@property (nonatomic, strong) UILabel *ratingLabel;
@property (nonatomic, strong) UILabel *genreLabel;
@property (nonatomic, strong) UILabel *releaseDateLabel;
@property (nonatomic, strong) UILabel *runtimeLabel;

@end

@implementation OSPGMovieDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupSubviews];
    [self defineLayout];
    [self loadData];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.backdropImg];
    [self.scrollView addSubview:self.posterImg];
    [self.scrollView addSubview:self.titleLabel];
    [self.scrollView addSubview:self.tagLineLabel];
}

- (void)defineLayout
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.backdropImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(440 / 780.f * SCREEN_WIDTH);
    }];
    [self.posterImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(128.f);
        make.height.mas_equalTo(192.f);
        make.top.equalTo(self.backdropImg.mas_bottom).offset(-32.f);
        make.left.equalTo(self.view).offset(15.f);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backdropImg.mas_bottom).offset(10.f);
        make.left.equalTo(self.posterImg.mas_right).offset(10.f);
        make.right.equalTo(self.view).offset(-15.f);
    }];
    [self.tagLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10.f);
        make.left.right.equalTo(self.titleLabel);
    }];
}

- (void)reloadUI
{
    [self.backdropImg sd_setImageWithURL:[OSPGCommonHelper getBackdropUrl:self.detail.backdropPath size:OSPGBackdropSize_w780] placeholderImage:[UIImage imageNamed:@"backdropDefault"]];
    [self.posterImg sd_setImageWithURL:[OSPGCommonHelper getPosterUrl:self.detail.posterPath size:OSPGPosterSize_w342] placeholderImage:[UIImage imageNamed:@"posterDefault"]];
    self.titleLabel.text = self.detail.title;
    self.tagLineLabel.text = self.detail.tagline;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.backgroundColor = RGBColor(240, 240, 240);
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (UIImageView *)backdropImg
{
    if (!_backdropImg) {
        _backdropImg = [[UIImageView alloc] init];
    }
    return _backdropImg;
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
    }
    return _tagLineLabel;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat headerHeight = CGRectGetHeight(self.backdropImg.frame);
    if (@available(iOS 11,*)) {
        headerHeight -= self.view.safeAreaInsets.top;
    } else {
        headerHeight -= [self.topLayoutGuide length];
    }
    
    CGFloat progress = scrollView.contentOffset.y + scrollView.contentInset.top;
    CGFloat gradientProgress = MIN(1, MAX(0, progress  / headerHeight));
    gradientProgress = gradientProgress * gradientProgress * gradientProgress * gradientProgress;
    if (gradientProgress != self.gradientProgress) {
        self.gradientProgress = gradientProgress;
        self.titleLabel.textColor = self.gradientProgress == 1 ? [self yp_navigationBarTintColor] : [UIColor clearColor];
        [self yp_refreshNavigationBarStyle];
    }
}

- (YPNavigationBarConfigurations)yp_navigtionBarConfiguration {
    YPNavigationBarConfigurations configurations = YPNavigationBarShow;
    if (@available(iOS 13.0, *)) {
        if (self.gradientProgress <= 0) {
            configurations |= YPNavigationBarBackgroundStyleTransparent;
        } else {
            configurations |= YPNavigationBarBackgroundStyleOpaque;
            configurations |= YPNavigationBarBackgroundStyleColor;
        }
    } else {
        if (self.gradientProgress < 0.5) {
            configurations |= YPNavigationBarStyleBlack;
        }
        
        if (self.gradientProgress == 1) {
            configurations |= YPNavigationBarBackgroundStyleOpaque;
        }

        configurations |= YPNavigationBarBackgroundStyleColor;
    }
    return configurations;
}

- (UIColor *)yp_navigationBarTintColor {
    return [UIColor colorWithWhite:1 - self.gradientProgress alpha:1];
}

- (UIColor *)yp_navigationBackgroundColor {
    return [UIColor colorWithWhite:1 alpha:self.gradientProgress];
}

#pragma mark - Data
- (void)loadData
{
    [[OSPGMovieDetailManager sharedManager] getMovieDetailWithId:self.movieId
                                                 completionBlock:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        if (isSuccess) {
            self.detail = (OSPGMovieDetailResponse *)rsp;
            [self reloadUI];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
}


@end
