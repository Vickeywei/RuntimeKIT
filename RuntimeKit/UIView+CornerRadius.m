//
//  UIView+CornerRadius.m
//  UserNotification
//
//  Created by JennyC on 2017/3/15.
//  Copyright © 2017年 Zhang-YG. All rights reserved.
//

#import "UIView+CornerRadius.h"
#import "UIImage+ClipRoundCornerRadius.h"
@implementation UIView (CornerRadius)
-(void)setCornerRadiusWithRadius:(CGFloat)radius backgroundColor:(UIColor*)backgroundColor contentModel:(UIViewContentMode)contentModel backgroundImage:(UIImage*)backgroundImage{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, backgroundColor.CGColor);
    CGContextMoveToPoint(contextRef,0, height *0.5);
    CGContextAddArcToPoint(contextRef, 0,0,width *0.5,0, radius);
    CGContextAddArcToPoint(contextRef, width,0,width,height *0.5, radius);
    CGContextAddArcToPoint(contextRef, width,height,width *0.5,height, radius);
    CGContextAddArcToPoint(contextRef, 0,height,0,height * 0.5, radius);
    CGContextClosePath(contextRef);
    CGContextDrawPath(contextRef, kCGPathFill);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    self.backgroundColor = [UIColor clearColor];
    if (image) {
        if ([self isMemberOfClass:[UIView class]]) {
            
            self.layer.contents = (__bridge id)image.CGImage;
        }
        else if ([self isMemberOfClass:[UILabel class]]){
            self.layer.backgroundColor = [UIColor colorWithPatternImage:image].CGColor;
            
        }
        else if ([self isMemberOfClass:[UIButton class]]){
            image = [UIImage lq_clipImageWithCornerRadius:radius setImage:backgroundImage backgroundColor:backgroundColor withDrawRect:self.bounds setContentMode:contentModel];
            [((UIButton *)self) setBackgroundImage:image forState:UIControlStateNormal];
        }
        else if ([self isMemberOfClass:[UIImageView class]]){
            image = [UIImage lq_clipImageWithCornerRadius:radius setImage:backgroundImage backgroundColor:backgroundColor withDrawRect:self.bounds setContentMode:contentModel];
            ((UIImageView *)self).image = image;
        }
        
    }
    UIGraphicsEndImageContext();
}
@end
