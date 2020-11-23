//
//  NSObject+Custom.h
//  Runner
//
//  Created by 奇亚 on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Custom)
+ (BOOL)ct_swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)ct_swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;
@end

NS_ASSUME_NONNULL_END
