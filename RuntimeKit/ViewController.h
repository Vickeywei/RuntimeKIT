//
//  ViewController.h
//  RuntimeKit
//
//  Created by JennyC on 2017/3/14.
//  Copyright © 2017年 Zhang-YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationBarDelegate,UINavigationControllerDelegate>
{
    NSString *lq_name;
    NSString *lq_nickName;
    NSUInteger *lq_age;
    NSDate *lq_birthday;
}

@end

