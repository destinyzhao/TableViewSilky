//
//  WeiboToolbarView.h
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import <UIKit/UIKit.h>
#import "FeedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeiboToolbarView : UITableViewHeaderFooterView

@property (strong, nonatomic) FeedModel *feedModel;

@end

NS_ASSUME_NONNULL_END
