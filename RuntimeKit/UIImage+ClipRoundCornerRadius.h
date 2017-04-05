//
//  UIImage+ClipRoundCornerRadius.h
//  UserNotification
//
//  Created by JennyC on 2017/3/15.
//  Copyright © 2017年 Zhang-YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ClipRoundCornerRadius)
+ (UIImage *)lq_clipImageWithCornerRadius:(CGFloat)cornerRadius setImage:(UIImage *)image backgroundColor:(UIColor *)color withDrawRect:(CGRect)rect setContentMode:(UIViewContentMode)contentMode;
@end
