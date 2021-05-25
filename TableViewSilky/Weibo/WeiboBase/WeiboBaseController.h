//
//  WeiboBaseController.h
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeiboBaseController : BaseViewController

@property(nonatomic,strong)NSMutableArray *dataSource;

-(void)loadTestData;

@end

NS_ASSUME_NONNULL_END
