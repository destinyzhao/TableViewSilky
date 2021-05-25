//
//  WeiboBaseController.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import "WeiboBaseController.h"
#import "FeedModel.h"

@interface WeiboBaseController ()

@end

@implementation WeiboBaseController

-(NSMutableArray *)dataSource{
    if (_dataSource==nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

-(void)loadTestData{
    [self.dataSource addObjectsFromArray:[self feeds:100]];
}

-(NSArray *)feedsInFile
{
    NSMutableArray *feeds = [NSMutableArray array];
    NSInteger index = arc4random() % 8;
    NSString *filename = [NSString stringWithFormat:@"weibo_%d",(int)index];
    NSString *path = [[NSBundle mainBundle] pathForResource:filename
                                                     ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:0
                                                           error:nil];
    NSArray *items = dict[@"statuses"];
    for (NSDictionary *item in items)
    {
        FeedModel *feed = [FeedModel feed:item];
        [feeds addObject:feed];
    }
    return feeds;
}

- (NSArray *)feeds:(NSInteger)count
{
    NSArray *feeds = [self feedsInFile];
    NSInteger feedsCount = feeds.count;
    NSMutableArray *results = [NSMutableArray array];
    for (NSInteger i = 0; i < count; i++)
    {
        NSInteger index = i % feedsCount;
        [results addObject:feeds[index]];
    }
    return results;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
