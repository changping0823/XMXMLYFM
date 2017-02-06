//
//  UIButton+Extension.h
//  yangche51
//
//  Created by 任长平 on 2016/11/24.
//  Copyright © 2016年 ShangHaiYangChe51. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XMImagePosition) {
    /* 图片在左，文字在右，默认 */
    XMImagePositionLeft = 0,              //
    /* 图片在右，文字在左 */
    XMImagePositionRight = 1,             //
    /* 图片在上，文字在下 */
    XMImagePositionTop = 2,               //
    /* 图片在下，文字在上 */
    XMImagePositionBottom = 3,            //
};

@interface UIButton (Extension)
/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 *
 *  @param spacing 图片和文字的间隔
 */
- (void)setImagePosition:(XMImagePosition)postion spacing:(CGFloat)spacing;


@end
