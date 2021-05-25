//
//  FeedModel.h
//  TableViewSilky
//
//  Created by Destiny on 2021/5/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FeedModel : NSObject

@property (nonatomic,assign)    NSInteger   feedId;
@property (nonatomic,assign)    int64_t     userId;
@property (nonatomic,copy)      NSString    *username;
@property (nonatomic,copy)      NSString    *createAt;
@property (nonatomic,copy)      NSString    *avatarURLString;
@property (nonatomic,copy)      NSString    *text;
@property (nonatomic,strong)    NSArray     *images;
@property (nonatomic,assign)    NSInteger   commentCount;
@property (nonatomic,assign)    NSInteger   repostCount;
@property (nonatomic,assign)    NSInteger   likeCount;
@property (nonatomic,assign)    float   imageViewHeight;
@property (nonatomic,assign)    float   textHeight;

+ (instancetype)feed:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
