//
//  OSPGMediaListVC.m
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2023/1/18.
//

#import "OSPGMediaListVC.h"
#import "OSPGMovieResult.h"
#import "OSPGTVResult.h"
#import "OSPGCopyRightView.h"
#import "CYLTabBarController.h"
#import "UIView+YYAdd.h"
#import "OSPGDiscoverManager.h"
#import "OSPGMovieDiscoverResponse.h"
#import "OSPGTVDiscoverResponse.h"
#import "MJRefresh.h"
#import "OSPGMediaListCell.h"
#import "OSPGMovieDetailVC.h"
#import <YPNavigationBarTransition/YPNavigationBarTransition.h>

@interface OSPGMediaListVC () <YPNavigationBarConfigureStyle, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<OSPGMovieResult *> *data;
@property (nonatomic, strong) NSMutableArray<OSPGTVResult *> *tvData;
@property (nonatomic, assign) OSPGMovieDiscoverType type;
@property (nonatomic, assign) OSPGTVDiscoverType tvType;
@property (nonatomic, assign) BOOL isMovie;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation OSPGMediaListVC

- (instancetype)initWithTitle:(NSString *)title type:(OSPGMovieDiscoverType)type
{
    if (self = [super init]) {
        self.navigationItem.title = title;
        self.type = type;
        self.isMovie = YES;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title tvType:(OSPGTVDiscoverType)type
{
    if (self = [super init]) {
        self.navigationItem.title = title;
        self.tvType = type;
        self.isMovie = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
    [self defineLayout];
    [self loadDataWithMore:NO];
}

#pragma mark - Data
- (void)loadDataWithMore:(BOOL)loadMore
{
    if (self.isMovie) {
        [[OSPGDiscoverManager sharedManager] getDiscoverMovieType:self.type
                                                         loadMore:loadMore
                                                            block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
            if (isSuccess) {
                OSPGMovieDiscoverResponse *response = (OSPGMovieDiscoverResponse *)rsp;
                if (loadMore) {
                    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
                    NSInteger cnt = self.data.count;
                    [response.results enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [indexPaths addObject:[NSIndexPath indexPathForRow:cnt+idx inSection:0]];
                    }];
                    [self.data addObjectsFromArray:response.results];
                    // 局部刷新
                    [self.tableView beginUpdates];
                    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
                    [self.tableView endUpdates];
                } else {
                    // 全局刷新
                    self.data = [response.results mutableCopy];
                    [self.tableView reloadData];
                }
            } else {
                [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
            }
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }];
    } else {
        [[OSPGDiscoverManager sharedManager] getDiscoverTVType:self.tvType
                                                      loadMore:loadMore
                                                         block:^(BOOL isSuccess, id  _Nullable rsp, NSString * _Nullable errorMessage) {
            if (isSuccess) {
                OSPGTVDiscoverResponse *response = (OSPGTVDiscoverResponse *)rsp;
                if (loadMore) {
                    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
                    NSInteger cnt = self.tvData.count;
                    [response.results enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                        [indexPaths addObject:[NSIndexPath indexPathForRow:cnt+idx inSection:0]];
                    }];
                    [self.tvData addObjectsFromArray:response.results];
                    // 局部刷新
                    [self.tableView beginUpdates];
                    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
                    [self.tableView endUpdates];
                } else {
                    // 全局刷新
                    self.tvData = [response.results mutableCopy];
                    [self.tableView reloadData];
                }
            } else {
                [OSPGCommonHelper showMessage:errorMessage inView:self.view duration:1];
            }
            [self.tableView.mj_header endRefreshing];
            [self.tableView.mj_footer endRefreshing];
        }];
    }
}

#pragma mark - UI
- (void)setupSubviews
{
    [self.view addSubview:self.tableView];
}

- (void)defineLayout
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.equalTo(self.view).offset(self.navigationController.navigationBar.height);
            make.bottom.equalTo(self.view).offset(-self.cyl_tabBarController.tabBarHeight);
        }
        make.leading.trailing.equalTo(self.view);
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self loadDataWithMore:NO];
        }];
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self loadDataWithMore:YES];
        }];
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OSPGMediaListCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([OSPGMediaListCell class])];
    if (!cell) {
        cell = [[OSPGMediaListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([OSPGMediaListCell class])];
    }
    if (self.isMovie) {
        OSPGMovieResult *model = [self.data objectAtIndex:indexPath.row];
        [cell updateWithModel:model];
    } else {
        OSPGTVResult *model = [self.tvData objectAtIndex:indexPath.row];
        [cell updateWithTVModel:model];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.isMovie ? self.data.count : self.tvData.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // tips: 下一页的返回按钮需要在上一页设置才有效
    self.navigationItem.backButtonTitle = @"";
    if (self.isMovie) {
        OSPGMovieResult *model = [self.data objectAtIndex:indexPath.row];
        OSPGMovieDetailVC *vc = [[OSPGMovieDetailVC alloc] init];
        vc.movieId = model.identifier;
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        
    }
}

#pragma mark - YPNavigationBarConfigureStyle
- (YPNavigationBarConfigurations)yp_navigtionBarConfiguration
{
    return YPNavigationBarBackgroundStyleOpaque | YPNavigationBarShow;
}

- (UIColor *)yp_navigationBarTintColor
{
    return [UIColor blackColor];
}
@end
