//
//  WechatMomentsBaseController.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/14.
//

#import "WechatMomentsBaseController.h"

@interface WechatMomentsBaseController ()

@end

@implementation WechatMomentsBaseController

-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(void)getTestData{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"]]];
    NSDictionary * jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    for (NSDictionary *eachDic in jsonDic[@"data"][@"rows"]) {
        MessageInfoModel *messageModel = [[MessageInfoModel alloc] initWithDic:eachDic];
        [self.dataSource addObject:messageModel];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"朋友圈";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
