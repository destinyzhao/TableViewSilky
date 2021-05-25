//
//  WeiboGraphicsTextCell.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/21.
//

#import "WeiboGraphicsTextCell.h"
#import "WeiboGraphicsView.h"
#import "WeiboTextView.h"

@interface WeiboGraphicsTextCell ()

@property (nonatomic,strong) WeiboGraphicsView *graphicsView;
@property (nonatomic,strong) UIView *marginView;
@property (nonatomic,strong) WeiboTextView *textView;

@end

@implementation WeiboGraphicsTextCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setup
{
    self.graphicsView = [[WeiboGraphicsView alloc]init];
    [self addSubview:self.graphicsView];
    
    self.marginView = [[UIView alloc]init];
    [self addSubview:self.marginView];
    
    _textView = [[WeiboTextView alloc] init];
    [self addSubview:_textView];
}

- (void)setFeedModel:(FeedModel *)feedModel{
    _feedModel = feedModel;
    
    self.textView.frame = CGRectMake(WeiboCellMargin, WeiboCellTopMargin, kScreenWidth-2*WeiboCellMargin, self.feedModel.textHeight);
    
    self.marginView.frame = CGRectMake(0, self.textView.bottom, kScreenWidth, WeiboCellBottomMargin);
    
    self.graphicsView.frame = CGRectMake(WeiboCellMargin, self.marginView.bottom, kScreenWidth-WeiboCellMargin-WeiboCellMargin, feedModel.imageViewHeight);
    
    _graphicsView.urlList = feedModel.images;
    _textView.content = feedModel.text;
}




@end
