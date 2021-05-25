//
//  Macro.h
//  ScaleWithScreen
//
//  Created by Destiny on 2021/4/14.
//

#ifndef Macro_h
#define Macro_h

#import "FitScaleHelper.h"

// 基准屏幕宽度(iphone 6)
#define kDesignWidth 375.0
// 以屏幕宽度为固定比例关系，来计算对应的值。
#define AdaptW(floatValue) [FitScaleHelper adaptWidthWithValue:floatValue]
// 适配字体
#define AdaptFont(floatValue) [FitScaleHelper adaptFontWithValue:floatValue]
#define AdaptFontWithNameAndValue(fontName,floatValue) [FitScaleHelper adaptFontWithName:fontName Value:floatValue]

#define OneImageRatio (0.618)
#define OtherImageRatio (0.309)
#define ImageHorizontalMargin (15)
#define ImageVerticalMargin  (5)
#define WeiboCellMargin (15)
#define WeiboCellTopMargin (8)
#define WeiboCellBottomMargin (15)
#define WeiboSectionViewHeight (8)


#endif /* Macro_h */
