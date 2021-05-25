//
//  WeiboTextView.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/21.
//

#import "WeiboTextView.h"

@interface WeiboTextView ()

@property (nonatomic,strong) UILabel *contentLabel;

@end

@implementation WeiboTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    self = [super init];
    if(self){
        [self setup];
    }
    return self;
}

- (void)setup{
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = AdaptFontWithNameAndValue(@"PingFangSC-Regular", 17);
    _contentLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
}

- (void)setContent:(NSString *)content{
    _contentLabel.text = content;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _contentLabel.frame = CGRectMake(WeiboCellMargin, 0, self.bounds.size.width - WeiboCellMargin - WeiboCellMargin, self.bounds.size.height);
}


@end
