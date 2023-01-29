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
#import "OSPGTVDiscoverResponse.h"
#import "OSPGTVLatestResponse.h"
#import "OSPGDiscoverCell.h"
#import "OSPGDiscoverView.h"
#import "OSPGLatestView.h"
#import "OSPGCopyRightView.h"
#import "MJRefresh.h"
#import "OSPGMovieDetailVC.h"
#import "OSPGMovieResult.h"
#import "CYLTabBarController.h"
#import "OSPGMediaListVC.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>

@interface OSPGMainVC () <YPNavigationBarConfigureStyle, JXCategoryViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *segmentView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) OSPGLatestView *latestView;
@property (nonatomic, strong) OSPGDiscoverView *playingView;
@property (nonatomic, strong) OSPGDiscoverView *popularView;
@property (nonatomic, strong) OSPGDiscoverView *topRateView;
@property (nonatomic, strong) OSPGDiscoverView *upcomingView;
@property (nonatomic, strong) OSPGCopyRightView *copyrightView;

@property (nonatomic, strong) UIScrollView *tvScrollView;
@property (nonatomic, strong) UIView *tvContentView;
@property (nonatomic, strong) OSPGLatestView *tvLatestView;
@property (nonatomic, strong) OSPGDiscoverView *tvAiringTodayView;
@property (nonatomic, strong) OSPGDiscoverView *tvOnTheAirView;
@property (nonatomic, strong) OSPGDiscoverView *tvTopRateView;
@property (nonatomic, strong) OSPGDiscoverView *tvPopularView;
@property (nonatomic, strong) OSPGCopyRightView *tvCopyrightView;

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
    
    [[OSPGDiscoverManager sharedManager] getDiscoverTVType:OSPGTVDiscoverType_Latest loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGTVLatestResponse *response = (OSPGTVLatestResponse *)rsp;
            [self.tvLatestView updateWithTVModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverTVType:OSPGTVDiscoverType_AiringToday loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        [OSPGCommonHelper hideLoadingInView:self.view animated:YES];
        if (isSuccess) {
            OSPGTVDiscoverResponse *response = (OSPGTVDiscoverResponse *)rsp;
            [self.tvAiringTodayView updateWithTVModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverTVType:OSPGTVDiscoverType_OnTheAir loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGTVDiscoverResponse *response = (OSPGTVDiscoverResponse *)rsp;
            [self.tvOnTheAirView updateWithTVModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverTVType:OSPGTVDiscoverType_TopRate loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGTVDiscoverResponse *response = (OSPGTVDiscoverResponse *)rsp;
            [self.tvTopRateView updateWithTVModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
    [[OSPGDiscoverManager sharedManager] getDiscoverTVType:OSPGTVDiscoverType_Popular loadMore:NO block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
        StrongSelfReturnNil(self);
        if (isSuccess) {
            OSPGTVDiscoverResponse *response = (OSPGTVDiscoverResponse *)rsp;
            [self.tvPopularView updateWithTVModel:response];
        } else {
            [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
        }
    }];
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.view addSubview:self.segmentView];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.contentView];
    [self.contentView addSubview:self.latestView];
    [self.contentView addSubview:self.playingView];
    [self.contentView addSubview:self.popularView];
    [self.contentView addSubview:self.topRateView];
    [self.contentView addSubview:self.upcomingView];
    [self.contentView addSubview:self.copyrightView];
    
    [self.view addSubview:self.tvScrollView];
    [self.tvScrollView addSubview:self.tvContentView];
    [self.tvContentView addSubview:self.tvLatestView];
    [self.tvContentView addSubview:self.tvAiringTodayView];
    [self.tvContentView addSubview:self.tvOnTheAirView];
    [self.tvContentView addSubview:self.tvPopularView];
    [self.tvContentView addSubview:self.tvTopRateView];
    [self.tvContentView addSubview:self.tvCopyrightView];
}

- (void)defineLayout
{
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.view).offset(self.navigationController.navigationBar.height);
        }
        make.height.mas_equalTo(40.f);
        make.leading.equalTo(self.view).offset(15.f);
        make.trailing.equalTo(self.view).offset(-15.f);
    }];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentView.mas_bottom).offset(10.f);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
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
        make.leading.trailing.bottom.equalTo(self.contentView);
        make.top.equalTo(self.upcomingView.mas_bottom);
    }];
    
    [self.tvScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.segmentView.mas_bottom).offset(10.f);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.bottom.equalTo(self.view).offset(-self.cyl_tabBarController.tabBarHeight);
        }
        make.leading.trailing.equalTo(self.view);
    }];
    [self.tvContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tvScrollView);
        make.width.equalTo(self.tvScrollView);
    }];
    [self.tvLatestView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.tvContentView);
    }];
    [self.tvAiringTodayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tvLatestView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.tvContentView);
    }];
    [self.tvOnTheAirView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tvAiringTodayView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.tvContentView);
    }];
    [self.tvPopularView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tvOnTheAirView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.tvContentView);
    }];
    [self.tvTopRateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tvPopularView.mas_bottom).offset(15.f);
        make.leading.trailing.equalTo(self.tvContentView);
    }];
    [self.tvCopyrightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50.f);
        make.leading.trailing.bottom.equalTo(self.tvContentView);
        make.top.equalTo(self.tvTopRateView.mas_bottom);
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

- (JXCategoryTitleView *)segmentView
{
    if (!_segmentView) {
        _segmentView = [[JXCategoryTitleView alloc] init];
        _segmentView.titles = @[@"Movie", @"TV Series"];
        _segmentView.delegate = self;
        _segmentView.layer.cornerRadius = 20.f;
        _segmentView.layer.masksToBounds = YES;
        _segmentView.layer.borderColor = kMainColor.CGColor;
        _segmentView.layer.borderWidth = 2.f;
        _segmentView.cellSpacing = 0;
        _segmentView.cellWidth = (SCREEN_WIDTH - 30) / 2;
        _segmentView.titleColor = kMainColor;
        _segmentView.titleSelectedColor = [UIColor whiteColor];
        _segmentView.titleLabelMaskEnabled = YES;
        _segmentView.titleFont = kBoldFont(16.f);
        
        JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
        backgroundView.indicatorHeight = 40.f;
        backgroundView.indicatorWidthIncrement = 0;
        backgroundView.indicatorColor = kMainColor;
        _segmentView.indicators = @[backgroundView];
    }
    return _segmentView;
}

- (OSPGLatestView *)latestView
{
    if (!_latestView) {
        _latestView = [[OSPGLatestView alloc] init];
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
        _playingView.didTapItemBlock = ^(NSInteger movieId) {
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
        _popularView.didTapItemBlock = ^(NSInteger movieId) {
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
        _topRateView.title = @"Top Rated";
        WeakSelf(self);
        _topRateView.didTapItemBlock = ^(NSInteger movieId) {
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
        _upcomingView.didTapItemBlock = ^(NSInteger movieId) {
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

- (UIScrollView *)tvScrollView
{
    if (!_tvScrollView) {
        _tvScrollView = [[UIScrollView alloc] init];
        _tvScrollView.showsVerticalScrollIndicator = NO;
        // Tips: 去除scrollView顶部空白区域
        if (@available(iOS 11, *)) {
            _tvScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            _tvScrollView.automaticallyAdjustsScrollIndicatorInsets = NO;
        }
        _tvScrollView.hidden = YES;
    }
    return _tvScrollView;
}

- (UIView *)tvContentView
{
    if (!_tvContentView) {
        _tvContentView = [[UIView alloc] init];
        _tvContentView.backgroundColor = RGBColor(240, 240, 240);
    }
    return _tvContentView;
}

- (OSPGLatestView *)tvLatestView
{
    if (!_tvLatestView) {
        _tvLatestView = [[OSPGLatestView alloc] init];
        WeakSelf(self);
        _tvLatestView.tapBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            
        };
    }
    return _tvLatestView;
}

- (OSPGDiscoverView *)tvAiringTodayView
{
    if (!_tvAiringTodayView) {
        _tvAiringTodayView = [[OSPGDiscoverView alloc] init];
        _tvAiringTodayView.title = @"TV Airing Today";
        WeakSelf(self);
        _tvAiringTodayView.didTapItemBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            
        };
        _tvAiringTodayView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showTVListWithTitle:@"TV Airing Today" type:OSPGTVDiscoverType_AiringToday];
        };
    }
    return _tvAiringTodayView;
}

- (OSPGDiscoverView *)tvOnTheAirView
{
    if (!_tvOnTheAirView) {
        _tvOnTheAirView = [[OSPGDiscoverView alloc] init];
        _tvOnTheAirView.title = @"TV On The Air";
        WeakSelf(self);
        _tvOnTheAirView.didTapItemBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
        };
        _tvOnTheAirView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showTVListWithTitle:@"TV On The Air" type:OSPGTVDiscoverType_OnTheAir];
        };
    }
    return _tvOnTheAirView;
}

- (OSPGDiscoverView *)tvPopularView
{
    if (!_tvPopularView) {
        _tvPopularView = [[OSPGDiscoverView alloc] init];
        _tvPopularView.title = @"Popular";
        WeakSelf(self);
        _tvPopularView.didTapItemBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
            
        };
        _tvPopularView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showTVListWithTitle:@"Popular" type:OSPGTVDiscoverType_Popular];
        };
    }
    return _tvPopularView;
}

- (OSPGDiscoverView *)tvTopRateView
{
    if (!_tvTopRateView) {
        _tvTopRateView = [[OSPGDiscoverView alloc] init];
        _tvTopRateView.title = @"Top Rated";
        WeakSelf(self);
        _tvTopRateView.didTapItemBlock = ^(NSInteger movieId) {
            StrongSelfReturnNil(self);
        };
        _tvTopRateView.didTapShowMoreBlock = ^{
            StrongSelfReturnNil(self);
            [self showTVListWithTitle:@"Top Rated" type:OSPGTVDiscoverType_TopRate];
        };
    }
    return _tvTopRateView;
}

- (OSPGCopyRightView *)tvCopyrightView
{
    if (!_tvCopyrightView) {
        _tvCopyrightView = [[OSPGCopyRightView alloc] init];
    }
    return _tvCopyrightView;
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

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index
{
    if (index == 0) {
        self.scrollView.hidden = NO;
        self.tvScrollView.hidden = YES;
    } else if (index == 1) {
        self.scrollView.hidden = YES;
        self.tvScrollView.hidden = NO;
    }
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
    OSPGMediaListVC *vc = [[OSPGMediaListVC alloc] initWithTitle:title type:type];
    self.navigationItem.backButtonTitle = @"";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showTVListWithTitle:(NSString *)title type:(OSPGTVDiscoverType)type
{
    OSPGMediaListVC *vc = [[OSPGMediaListVC alloc] initWithTitle:title tvType:type];
    self.navigationItem.backButtonTitle = @"";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
