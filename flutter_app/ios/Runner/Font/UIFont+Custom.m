//
//  UIFont+Custom.m
//  Runner
//
//  Created by 奇亚 on 2020/11/23.
//

#import "UIFont+Custom.h"
#import "NSObject+Custom.h"
#import <CoreText/CTFontManager.h>

@implementation UIFont (Custom)
+ (void)load {
    [UIFont ct_swizzleClassMethod:@selector(systemFontOfSize:) withClassMethod:@selector(ct_systemFontOfSize:) error:nil];
    
    UIFont *rF = [UIFont ct_fontWithName:@"PolarisRegular" size:16];
    UIFont *mF = [UIFont ct_fontWithName:@"PolarisMedium" size:16];
    UIFont *bF = [UIFont ct_fontWithName:@"PolarisBold" size:16];
    NSArray *fonts = [UIFont fontNamesForFamilyName:@"Polaris"];
    
    UIFont *mmF = [UIFont ct_fontWithName:@"PolarisMedium" size:16];


}


+ (UIFont *)ct_fontWithName:(NSString *)fontName size:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:fontName size:size];
    if (!font) {
        NSString *fontResourceName = [[self __ct_fontBinder] objectForKey:fontName];
        [self ct_dynamicallyLoadFontNamed:fontResourceName];
        font = [UIFont fontWithName:fontName size:size];
        if (!font) {
            font = [UIFont ct_systemFontOfSize:size];
        }
    }
    return font;
}

#pragma mark - Pravite Method

+ (UIFont *)ct_systemFontOfSize:(CGFloat)fontSize {
    UIFont *font = [UIFont ct_fontWithName:@"PolarisRegular" size:fontSize];
    if (font) {
        return font;
    }
    return [self ct_systemFontOfSize:fontSize];
}

+ (void)ct_dynamicallyLoadFontNamed:(NSString *)name {
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *fontFileComponent = [NSString stringWithFormat:@"%@", name];
    
    NSURL *url = [bundle URLForResource:fontFileComponent withExtension:@"ttf"];
    if (!url) {
        url = [bundle URLForResource:fontFileComponent  withExtension:@"otf"];
    }
    
    NSData *fontData = [NSData dataWithContentsOfURL:url];
        
    if (fontData) {
        CFErrorRef error;
        CGDataProviderRef provider = CGDataProviderCreateWithCFData((CFDataRef)fontData);
        CGFontRef font = CGFontCreateWithDataProvider(provider);
        if (! CTFontManagerRegisterGraphicsFont(font, &error)) {
            CFStringRef errorDescription = CFErrorCopyDescription(error);
            NSLog(@"Failed to load font: %@", errorDescription);
            CFRelease(errorDescription);
        }
        CFRelease(font);
        CFRelease(provider);
    }
}


+ (NSDictionary *)__ct_fontBinder {
    return @{
        @"PolarisBold":@"PolarisBold",
        @"PolarisMedium":@"PolarisMedium",
        @"PolarisRegular":@"PolarisRegular",
    };
}

@end
