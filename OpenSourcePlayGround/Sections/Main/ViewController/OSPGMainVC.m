//
//  OSPGMainVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//

#import "OSPGMainVC.h"
#import "JXCategoryView.h"
#import "UIView+YYAdd.h"
#import "OSPGDiscoverManager.h"
#import "OSPGMovieDiscoverResponse.h"
#import "OSPGMovieLatestResponse.h"
#import "OSPGDiscoverCell.h"
#import "OSPGDiscoverView.h"
#import "OSPGMovieLatestView.h"
#import "OSPGCopyRightView.h"
#import "MJRefresh.h"
#import "OSPGMovieDetailVC.h"
#import "OSPGMovieResult.h"
#import "CYLTabBarController.h"
#import "OSPGMovieListVC.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>

@interface OSPGMainVC () <YPNavigationBarConfigureStyle>

@property (nonatomic, strong) JXCategoryTitleView *segmentView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) OSPGMovieLatestView *latestView;
@property (nonatomic, strong) OSPGDiscoverView *playingView;
@property (nonatomic, strong) OSPGDiscoverView *popularView;
@property (nonatomic, strong) OSPGDiscoverView *topRateView;
@property (nonatomic, strong) OSPGDiscoverView *upcomingView;
@property (nonatomic, strong) OSPGCopyRightView *copyrightView;

@end

@implementation OSPGMainVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Discover";
    [self setupSubviews];
    [self defineLayout];
    [self loadData];
}

#pragma mark - Data
- (void)loadData
{
    [OSPGCommonHelper showLoadingInView:self.view animated:YES];
    WeakSelf(self);
    [[OSPGDiscoverManager sharedManager] getDiscoverMovieType:OSPGMovieDiscoverType_Latest loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGMovieLatestResponse *response = (OSPGMovieLatestResponse *)rsp;
            [self.latestView updateWithModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverMovieType:OSPGMovieDiscoverType_Playing loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        [OSPGCommonHelper hideLoadingInView:self.view animated:YES];
        if (isSuccess) {
            OSPGMovieDiscoverResponse *response = (OSPGMovieDiscoverResponse *)rsp;
            [self.playingView updateWithModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverMovieType:OSPGMovieDiscoverType_Popular loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGMovieDiscoverResponse *response = (OSPGMovieDiscoverResponse *)rsp;
            [self.popularView updateWithModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverMovieType:OSPGMovieDiscoverType_TopRate loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGMovieDiscoverResponse *response = (OSPGMovieDiscoverResponse *)rsp;
            [self.topRateView updateWithModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverMovieType:OSPGMovieDiscoverType_Upcoming loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGMovieDiscoverResponse *response = (OSPGMovieDiscoverResponse *)rsp;
            [self.upcomingView updateWithModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.latestView];
    [self.contentView addSubview:self.playingView];
    [self.contentView addSubview:self.popularView];
    [self.contentView addSubview:self.topRateView];
    [self.contentView addSubview:self.upcomingView];
    [self.contentView addSubview:self.copyrightView];
}

- (void)defineLayout
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.equalTo(self.view).offset(self.navigationController.navigationBar.height);
            make.bottom.equalTo(self.view).offset(-self.cyl_tabBarController.tabBarHeight);
        }
        make.leading.trailing.equalTo(self.view);
    }];
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    [self.latestView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
    }];
    [self.playingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.latestView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.popularView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.playingView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.topRateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.popularView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.upcomingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topRateView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.contentView);
    }];
    [self.copyrightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50.f);
        make.bottom.equalTo(self.contentView);
        make.leading.trailing.equalTo(self.contentView);
        make.top.equalTo(self.upcomingView.mas_bottom);
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

- (OSPGMovieLatestView *)latestView
{
    if (!_latestView) {
        _latestView = [[OSPGMovieLatestView alloc] init];
        WeakSelf(self);
        _latestView.tapBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            [self showMovieDetail:movieId];
        };
    }
    return _latestView;
}

- (OSPGDiscoverView *)playingView
{
    if (!_playingView) {
        _playingView = [[OSPGDiscoverView alloc] init];
        _playingView.title = @"Now Playing";
        WeakSelf(self);
        _playingView.didTapMovieBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            [self showMovieDetail:movieId];
        };
        _playingView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showMovieListWithTitle:@"Now Playing" type:OSPGMovieDiscoverType_Playing];
        };
    }
    return _playingView;
}

- (OSPGDiscoverView *)popularView
{
    if (!_popularView) {
        _popularView = [[OSPGDiscoverView alloc] init];
        _popularView.title = @"Popular";
        WeakSelf(self);
        _popularView.didTapMovieBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            [self showMovieDetail:movieId];
        };
        _popularView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showMovieListWithTitle:@"Popular" type:OSPGMovieDiscoverType_Popular];
        };
    }
    return _popularView;
}

- (OSPGDiscoverView *)topRateView
{
    if (!_topRateView) {
        _topRateView = [[OSPGDiscoverView alloc] init];
        _topRateView.title = @"Top Rate";
        WeakSelf(self);
        _topRateView.didTapMovieBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            [self showMovieDetail:movieId];
        };
        _topRateView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showMovieListWithTitle:@"Top Rate" type:OSPGMovieDiscoverType_TopRate];
        };
    }
    return _topRateView;
}

- (OSPGDiscoverView *)upcomingView
{
    if (!_upcomingView) {
        _upcomingView = [[OSPGDiscoverView alloc] init];
        _upcomingView.title = @"Upcoming";
        WeakSelf(self);
        _upcomingView.didTapMovieBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            [self showMovieDetail:movieId];
        };
        _upcomingView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showMovieListWithTitle:@"Upcoming" type:OSPGMovieDiscoverType_Upcoming];
        };
    }
    return _upcomingView;
}

- (OSPGCopyRightView *)copyrightView
{
    if (!_copyrightView) {
        _copyrightView = [[OSPGCopyRightView alloc] init];
    }
    return _copyrightView;
}

#pragma mark - YPNavigationBarConfigureStyle
- (YPNavigationBarConfigurations) yp_navigtionBarConfiguration
{
    return YPNavigationBarBackgroundStyleOpaque | YPNavigationBarShow;
}

- (UIColor *) yp_navigationBarTintColor
{
    return [UIColor blackColor];
}

#pragma mark - private
- (void)showMovieDetail:(NSInteger)movieId
{
    OSPGMovieDetailVC *vc = [[OSPGMovieDetailVC alloc] init];
    vc.movieId = movieId;
    // tips: 下一页的返回按钮需要在上一页设置才有效
    self.navigationItem.backButtonTitle = @"";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showMovieListWithTitle:(NSString *)title type:(OSPGMovieDiscoverType)type
{
    OSPGMovieListVC *vc = [[OSPGMovieListVC alloc] initWithTitle:title type:type];
    self.navigationItem.backButtonTitle = @"";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
