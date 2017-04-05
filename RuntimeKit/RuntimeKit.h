//
//  RuntimeKit.h
//  RuntimeKit
//
//  Created by JennyC on 2017/3/14.
//  Copyright © 2017年 Zhang-YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RuntimeKit : NSObject
+ (NSString *)fetchClassName:(Class)cls;
+ (NSArray *)fetchIvarListWithClass:(Class)cls;
+ (NSArray *)fetchPropertyListWithClass:(Class)cls;
+ (NSArray *)fetchClassInstanceMethodListWithClass:(Class)cls;
+ (NSArray *)fetchProtocolListWithClass:(Class)cls;
+ (void)addMethod:(Class)cls methodSel:(SEL)methodSel methodImp:(SEL)methodSel;
+ (void)exchangeMethod:(Class)cls originMethod:(SEL)originMethod swizzingMethod:(SEL)swizzingMethod;
@end
