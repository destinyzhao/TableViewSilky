//
//  WeiboController.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import "WeiboController.h"
#import "WeiboAvatarView.h"
#import "WeiboToolbarView.h"
#import "WeiboGraphicsTextCell.h"

@interface WeiboController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation WeiboController

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kScreenHeight) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.allowsSelection = false;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:NSClassFromString(@"WeiboAvatarView") forHeaderFooterViewReuseIdentifier:@"WeiboAvatarView"];
        [_tableView registerClass:NSClassFromString(@"WeiboToolbarView") forHeaderFooterViewReuseIdentifier:@"WeiboToolbarView"];
        [_tableView registerClass:NSClassFromString(@"WeiboGraphicsTextCell") forCellReuseIdentifier:@"WeiboGraphicsTextCell"];
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadTestData];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataSource.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    FeedModel *feedModel = self.dataSource[section];
    WeiboAvatarView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"WeiboAvatarView"];
    headerView.feedModel = feedModel;
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    FeedModel *feedModel = self.dataSource[section];
    WeiboToolbarView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"WeiboToolbarView"];
    footerView.feedModel = feedModel;
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 46;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FeedModel *feedModel = self.dataSource[indexPath.section];
    WeiboGraphicsTextCell *graphicsTextCell = [tableView dequeueReusableCellWithIdentifier:@"WeiboGraphicsTextCell"];
    graphicsTextCell.feedModel = feedModel;

    return graphicsTextCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FeedModel *feedModel = self.dataSource[indexPath.section];
    return feedModel.imageViewHeight + feedModel.textHeight+WeiboCellBottomMargin+WeiboCellTopMargin;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
