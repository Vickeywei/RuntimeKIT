//
//  RuntimeKit.m
//  RuntimeKit
//
//  Created by JennyC on 2017/3/14.
//  Copyright © 2017年 Zhang-YG. All rights reserved.
//

#import "RuntimeKit.h"
#import <objc/runtime.h>

@implementation RuntimeKit
+ (NSString *)fetchClassName:(Class)cls{
    const char *className_c = class_getName(cls);
    CFStringRef className = CFStringCreateWithCString(NULL,className_c, kCFStringEncodingUTF8);
    CFShow(className);
    NSString *name = (__bridge NSString*)className;
    CFRelease(className);
    
    return name;
}

+ (NSArray *)fetchIvarListWithClass:(Class)cls{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList(cls, &count);
    CFMutableArrayRef mutableArrayRef = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
    for (int i = 0 ; i < count; ++ i) {
        CFMutableDictionaryRef mutableDictionaryRef = CFDictionaryCreateMutable(NULL, count, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        const char *ivarName = ivar_getName(ivarList[i]);
        const char *ivarType = ivar_getTypeEncoding(ivarList[i]);
        CFStringRef keyStringRef = CFStringCreateWithCString(NULL, ivarType,kCFStringEncodingUTF8);
        CFShow(keyStringRef);
        CFStringRef valueStringRef = CFStringCreateWithCString(NULL, ivarName,kCFStringEncodingUTF8);
        CFShow(valueStringRef);
        CFDictionaryAddValue(mutableDictionaryRef,keyStringRef, valueStringRef);
        
        CFShow(mutableDictionaryRef);
        CFArrayAppendValue(mutableArrayRef,mutableDictionaryRef);
        CFRelease(mutableDictionaryRef);
        CFRelease(keyStringRef);
        CFRelease(valueStringRef);
    }
    free(ivarList);
    CFShow(mutableArrayRef);
    NSMutableArray *array = (__bridge NSMutableArray*)(mutableArrayRef);
    CFRelease(mutableArrayRef);
    return array.copy;
}

+ (NSArray *)fetchPropertyListWithClass:(Class)cls{
    unsigned int count;
    objc_property_t *propertyList = class_copyPropertyList(cls, &count);
    CFMutableArrayRef mutableArrayRef = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
    for (int i = 0 ; i < count ; ++ i) {
        const char *propertyName = property_getName(propertyList[i]);
        CFStringRef stringRef = CFStringCreateWithCString(NULL, propertyName, kCFStringEncodingUTF8);
        CFShow(stringRef);
        CFArrayAppendValue(mutableArrayRef, stringRef);
        CFRelease(stringRef);
    }
    free(propertyList);
    CFShow(mutableArrayRef);
    NSMutableArray *array = (__bridge NSMutableArray*)(mutableArrayRef);
    CFRelease(mutableArrayRef);
    return array.copy;
}

+ (NSArray *)fetchClassInstanceMethodListWithClass:(Class)cls{
    unsigned int count;
    Method *methodList = class_copyMethodList(cls, &count);
    CFMutableArrayRef mutableArrayRef = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
    for (int i = 0 ; i < count ; ++ i) {
        Method method = methodList[i];
        SEL methodName = method_getName(method);
        NSString *methodNameString = NSStringFromSelector(methodName);
        const char *methodCString = [methodNameString cStringUsingEncoding:NSUTF8StringEncoding];
        
        CFStringRef stringRef = CFStringCreateWithCString(NULL, methodCString, kCFStringEncodingUTF8);
        CFShow(stringRef);
        CFArrayAppendValue(mutableArrayRef, stringRef);
        CFRelease(stringRef);
    }
    free(methodList);
    CFShow(mutableArrayRef);
    NSMutableArray *array = (__bridge NSMutableArray*)(mutableArrayRef);
    CFRelease(mutableArrayRef);
    return array.copy;
}

+ (NSArray *)fetchProtocolListWithClass:(Class)cls{
    unsigned int count;
    __unsafe_unretained  Protocol **protocolList = class_copyProtocolList(cls, &count);
    CFMutableArrayRef mutableArrayRef = CFArrayCreateMutable(NULL, 0, &kCFTypeArrayCallBacks);
    for (int i = 0 ; i < count ; ++ i) {
        Protocol *protocol = protocolList[i];
        const char *protocolName = protocol_getName(protocol);
        CFStringRef stringRef = CFStringCreateWithCString(NULL, protocolName, kCFStringEncodingUTF8);
        CFShow(stringRef);
        CFArrayAppendValue(mutableArrayRef, stringRef);
        CFRelease(stringRef);
    }
    free(protocolList);
    CFShow(mutableArrayRef);
    NSMutableArray *array = (__bridge NSMutableArray*)(mutableArrayRef);
    CFRelease(mutableArrayRef);
    return array.copy;
}

+ (void)addMethod:(Class)cls methodSel:(SEL)methodSel methodImp:(SEL)methodImp{
    Method method = class_getInstanceMethod(cls, methodImp);
    IMP methodI = method_getImplementation(method);
    const char *types = method_getTypeEncoding(method);
    class_addMethod(cls,methodImp,methodI, types);
}

+ (void)exchangeMethod:(Class)cls originMethod:(SEL)originMethod swizzingMethod:(SEL)swizzingMethod{
    Method originM = class_getInstanceMethod(cls, originMethod);
    Method swizzingM = class_getInstanceMethod(cls, swizzingMethod);
    method_exchangeImplementations(originM, swizzingM);
}
@end
