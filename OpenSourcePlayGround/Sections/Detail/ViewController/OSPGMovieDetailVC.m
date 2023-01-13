//
//  OSPGMovieDetailVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/11.
//

#import "OSPGMovieDetailVC.h"
#import "OSPGMovieDetailManager.h"
#import "OSPGMovieDetailView.h"
#import "OSPGCrewCastView.h"
#import "OSPGMovieDetailResponse.h"
#import "OSPGCrewCastResponse.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>
#import "YPNavigationController+Configure.h"

@interface OSPGMovieDetailVC ()<YPNavigationBarConfigureStyle>

@property (nonatomic, assign) CGFloat gradientProgress;

@property (nonatomic, strong) UIScrollView *scrollView;
// Tips: 利用这个view使得UIScrollView的contentSize自适应
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) OSPGMovieDetailView *detailView;
@property (nonatomic, strong) OSPGCrewCastView *crewcastView;

@property (nonatomic, strong) OSPGCrewCastResponse *crewcastModel;

@end

@implementation OSPGMovieDetailVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didTapAddBtn)];
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
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.detailView];
    [self.contentView addSubview:self.crewcastView];
}

- (void)defineLayout
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
    }];
    [self.crewcastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailView.mas_bottom).offset(15.f);
        make.leading.trailing.bottom.equalTo(self.contentView);
    }];
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        // Tips: 去除scrollView顶部空白区域
        if (@available(iOS 11, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            _scrollView.automaticallyAdjustsScrollIndicatorInsets = NO;
        }
    }
    return _scrollView;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] init];
        _contentView.backgroundColor = RGBColor(240, 240, 240);
    }
    return _contentView;
}

- (OSPGMovieDetailView *)detailView
{
    if (!_detailView) {
        _detailView = [[OSPGMovieDetailView alloc] init];
    }
    return _detailView;
}

- (OSPGCrewCastView *)crewcastView
{
    if (!_crewcastView) {
        _crewcastView = [[OSPGCrewCastView alloc] init];
    }
    return _crewcastView;
}

#pragma mark - UISrollviewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat headerHeight = CGRectGetHeight(self.detailView.frame);
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
            OSPGMovieDetailResponse* response = (OSPGMovieDetailResponse *)rsp;
            [self.detailView updateWithModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    
    [[OSPGMovieDetailManager sharedManager] getCastCrewWithId:self.movieId completionBlock:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        if (isSuccess) {
            self.crewcastModel = (OSPGCrewCastResponse *)rsp;
            [self.crewcastView updateWithModel:rsp];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
}

#pragma mark - action
- (void)didTapAddBtn
{
    
}


@end
