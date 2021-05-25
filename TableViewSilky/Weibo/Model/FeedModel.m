//
//  FeedModel.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import "FeedModel.h"

@implementation FeedModel

+ (instancetype)feed:(NSDictionary *)item
{
    FeedModel *feed = [FeedModel new];
    feed.feedId = [item[@"id"] integerValue];
    feed.username = item[@"user"][@"screen_name"];
    feed.userId = [item[@"user"][@"id"] longLongValue];
    feed.createAt = item[@"created_at"];
    feed.avatarURLString = item[@"user"][@"avatar_large"];
    
    feed.text = item[@"text"];
    if(feed.text.length > 0){
        feed.textHeight = [self getTextHeight:feed.text]+WeiboCellTopMargin;
    }
    
    NSMutableArray *images = [NSMutableArray array];
    NSArray *imageIds = item[@"pic_ids"];
    if ([imageIds isKindOfClass:[NSArray class]]){
        for (NSString *imageId in imageIds){
            NSString *url = item[@"pic_infos"][imageId][@"thumbnail"][@"url"];
            if ([url length]){
                [images addObject:url];
            }
        }
    }
    
    if ([images count]){
        feed.images = images;
        feed.imageViewHeight = [self getImageViewheight:images]+WeiboCellTopMargin;
    }
    
    feed.repostCount = [item[@"reposts_count"] integerValue];
    feed.commentCount= [item[@"comments_count"] integerValue];
    feed.likeCount = [item[@"attitudes_count"] integerValue];
    return feed;
}

+ (CGFloat)getImageViewheight:(NSArray *)images
{
    CGFloat contraintWidth = kScreenWidth - ImageHorizontalMargin - ImageHorizontalMargin;
    NSInteger count = MIN(9,images.count);
    NSInteger rows = (count + 2) / 3;
    CGFloat ratio = count == 1 ? OneImageRatio : OtherImageRatio;
    return ratio * rows * contraintWidth + (rows + 1) * ImageVerticalMargin;
}

+ (CGFloat)getTextHeight:(NSString *)text
{
    UIFont *font = AdaptFontWithNameAndValue(@"PingFangSC-Regular", 17);
    
    NSMutableParagraphStyle *muStyle = [[NSMutableParagraphStyle alloc]init];
    muStyle.alignment = NSTextAlignmentLeft;//对齐方式
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    [attrString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attrString.length)];
    [attrString addAttribute:NSParagraphStyleAttributeName value:muStyle range:NSMakeRange(0, attrString.length)];
    
    if ([attrString.string isMoreThanOneLineWithSize:CGSizeMake(kScreenWidth-WeiboCellMargin-WeiboCellMargin, CGFLOAT_MAX) font:font lineSpaceing:3.0]) {//margin
        muStyle.lineSpacing = 3.0;//设置行间距离
    }else{
        muStyle.lineSpacing = CGFLOAT_MIN;//设置行间距离
    }
    
    //算text的layout
    CGFloat textHeight = [attrString.string boundingRectWithSize:CGSizeMake(kScreenWidth-WeiboCellMargin-WeiboCellMargin, CGFLOAT_MAX) font:font lineSpacing:3.0].height+0.5;
    
    return textHeight;
}




@end
