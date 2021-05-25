//
//  WeiboGraphicsView.m
//  TableViewSilky
//
//  Created by Destiny on 2021/5/21.
//

#import "WeiboGraphicsView.h"
#import "FeedModel.h"

@interface WeiboGraphicsView ()

@property (nonatomic,strong) NSArray *imageViews;

@end

@implementation WeiboGraphicsView

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

- (void)setup
{
    NSMutableArray *imageViews = [NSMutableArray array];
    for (NSInteger i = 0; i < 9; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.hidden = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(onTap:)];
        [imageView addGestureRecognizer:tap];
        [imageView setUserInteractionEnabled:YES];
        
        [imageViews addObject:imageView];
        [self addSubview:imageView];
    }
    _imageViews = imageViews;
}

- (void)onTap:(UITapGestureRecognizer *)tap
{
    UIView *view = tap.view;
    if (view)
    {
        NSInteger index = [self.imageViews indexOfObject:view];
        NSLog(@"你点击了：%ld",index);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = MIN(self.imageViews.count,self.urlList.count);
    CGFloat width = self.bounds.size.width;
    CGFloat contraintWidth = width - ImageHorizontalMargin - ImageHorizontalMargin;
    if (count == 1)
    {
        CGFloat size = contraintWidth * OneImageRatio;
        UIImageView *imageView = self.imageViews.firstObject;
        [imageView setFrame:CGRectMake(ImageHorizontalMargin, ImageVerticalMargin, size, size)];
    }
    else
    {
        CGFloat size = contraintWidth * OtherImageRatio;
        CGFloat gap = (contraintWidth - 3 * size) / 2.0;
        for (NSInteger i = 0; i < count; i++)
        {
            NSInteger row = i / 3;
            NSInteger column = i % 3;
            CGRect frame = CGRectMake(ImageHorizontalMargin + column * (gap + size),
                                      ImageVerticalMargin + row * (size + ImageVerticalMargin),
                                      size,
                                      size);
            [self.imageViews[i] setFrame:frame];
        }
    }
}

- (void)setUrlList:(NSArray *)urlList{
    _urlList = urlList;
    for (NSInteger i = 0; i < [urlList count] && i < [self.imageViews count]; i++)
    {
        UIImageView *imageView = self.imageViews[i];
        NSURL *url = [NSURL URLWithString:urlList[i]];
        [imageView setImageWithURL:url placeholder:nil];
        [imageView setHidden:NO];
    }
    
    for (NSInteger i = [urlList count]; i < [self.imageViews count]; i++){
        [self.imageViews[i] setHidden:YES];
    }
}


@end
