//
//  WeiboAvatarView.h
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import <UIKit/UIKit.h>
#import "FeedModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WeiboAvatarView : UITableViewHeaderFooterView

@property (strong, nonatomic) UIImageView *avatarImageView;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *infoLabel;

@property (strong, nonatomic) FeedModel *feedModel;

@end

NS_ASSUME_NONNULL_END
