//
//  WeiboToolbarView.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import "WeiboToolbarView.h"

@interface WeiboToolbarView ()

@property (nonatomic,strong) UIView *sectionView;

@end

@implementation WeiboToolbarView

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
    
    NSArray *imgAry = @[@"retweet",@"comment",@"like"];
    
    NSMutableArray *tolAry = [NSMutableArray new];
    for (int i = 0; i < imgAry.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:imgAry[i]] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [btn setTag:i+1000];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        [self addSubview:btn];
        [tolAry addObject:btn];
    }
    //水平方向控件间隔固定等间隔
    [tolAry mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    self.sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 38, kScreenWidth, 8)];
    self.sectionView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.2];
    [self addSubview:self.sectionView];
}

- (void)setFeedModel:(FeedModel *)feedModel{
    _feedModel = feedModel;
    NSArray *dataArray = @[@"转发",[NSString stringWithFormat:@"%ld",feedModel.commentCount],[NSString stringWithFormat:@"%ld",feedModel.likeCount]];
    for (int i = 0; i < dataArray.count; i ++) {
        UIButton *btn = [self viewWithTag:1000+i];
        [btn setTitle:dataArray[i] forState:UIControlStateNormal];
    }
}

@end
