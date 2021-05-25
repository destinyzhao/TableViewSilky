//
//  WeiboAvatarView.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import "WeiboAvatarView.h"


@implementation WeiboAvatarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
    }
    
    return self;
    
}

- (void)setupView{
    self.avatarImageView = [UIImageView new];
    [self addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(AdaptW(5));
        make.left.mas_equalTo(AdaptW(16));
        make.width.height.mas_equalTo(AdaptW(40));
    }];
    
    self.nameLabel = [UILabel new];
    self.nameLabel.font = AdaptFont(15);
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(AdaptW(5));
        make.left.mas_equalTo(self.avatarImageView.mas_right).offset(AdaptW(10));
        make.right.mas_equalTo(AdaptW(-16));
    }];
    
    self.infoLabel = [UILabel new];
    [self addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.nameLabel.mas_bottom).mas_offset(AdaptW(1));
        make.left.mas_equalTo(self.avatarImageView.mas_right).offset(AdaptW(10));
        make.right.mas_equalTo(AdaptW(-16));
    }];
}

- (void)setFeedModel:(FeedModel *)feedModel
{
    self.nameLabel.text = feedModel.username;
    self.infoLabel.text = feedModel.createAt;

    [self.avatarImageView setImageWithURL:[NSURL URLWithString:feedModel.avatarURLString]
            placeholder:nil
                options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity | YYWebImageOptionSetImageWithFadeAnimation
               progress:^(NSInteger receivedSize, NSInteger expectedSize) {

    } transform:nil
             completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {

    }];
    
}

@end


