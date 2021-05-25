//
//  ViewController.m
//  TableViewSilky
//
//  Created by Destiny on 2021/4/25.
//

#import "ViewController.h"
#import "FPSDisplay.h"
#import "WechatMomentsController.h"
#import "WeiboController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataList;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [FPSDisplay shareFPSDisplay];
    
    self.dataList = @[@"微信朋友圈",@"微博"];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = [self.dataList objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            WechatMomentsController *momentsVC = [[WechatMomentsController alloc]init];
            [self.navigationController pushViewController:momentsVC animated:YES];
        }
            break;
        case 1:
        {
            WeiboController *momentsVC = [[WeiboController alloc]init];
            [self.navigationController pushViewController:momentsVC animated:YES];
        }
            break;
        default:
            break;
    }
   
}


@end
