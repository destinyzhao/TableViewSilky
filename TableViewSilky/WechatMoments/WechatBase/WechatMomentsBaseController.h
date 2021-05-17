//
//  WechatMomentsBaseController.h
//  TableViewSilky
//
//  Created by Destiny on 2021/5/14.
//

#import <UIKit/UIKit.h>
#import "MessageInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WechatMomentsBaseController : BaseViewController

@property(nonatomic,strong)NSMutableArray *dataSource;

#pragma mark 从本地获取朋友圈的测试数据
-(void)getTestData;

@end

NS_ASSUME_NONNULL_END
