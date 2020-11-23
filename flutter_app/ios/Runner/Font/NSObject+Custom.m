//
//  NSObject+Custom.m
//  Runner
//
//  Created by 奇亚 on 2020/11/23.
//

#import "NSObject+Custom.h"
#import <objc/runtime.h>
@implementation NSObject (Custom)

+ (BOOL)ct_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_ {
    Method origMethod = class_getInstanceMethod(self, origSel_);
    if (!origMethod) {
        NSLog(@"origMethod is nil");
        return NO;
    }

    Method altMethod = class_getInstanceMethod(self, altSel_);
    if (!altMethod) {
        NSLog(@"altMethod is nil");
        return NO;
    }

    class_addMethod(self,
                    origSel_,
                    class_getMethodImplementation(self, origSel_),
                    method_getTypeEncoding(origMethod));
    class_addMethod(self,
                    altSel_,
                    class_getMethodImplementation(self, altSel_),
                    method_getTypeEncoding(altMethod));

    method_exchangeImplementations(class_getInstanceMethod(self, origSel_), class_getInstanceMethod(self, altSel_));
    return YES;
}

+ (BOOL)ct_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_ {
    return [object_getClass((id)self) ct_swizzleMethod:origSel_ withMethod:altSel_ error:error_];
}

@end
