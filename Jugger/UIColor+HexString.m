//
//  UIColor+HexString.m
//  StoryFlow
//
//  Created by Barney Mattox on 5/4/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "UIColor+HexString.h"

@implementation UIColor (HexString)

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    colorString = [colorString stringByReplacingOccurrencesOfString: @"0X" withString: @""];
    NSScanner *scanner = [NSScanner scannerWithString:colorString];
//    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    switch ([scanner scanLocation]) {
        case 3:
            return [UIColor colorWithRed:((rgbValue & 0xF00) >> 8)/16.0 green:((rgbValue & 0xF0) >> 4)/16.0 blue:(rgbValue & 0xF)/16.0 alpha:1.0];
            break;
        case 4:
            return [UIColor colorWithRed:((rgbValue & 0xF00) >> 8)/16.0 green:((rgbValue & 0xF0) >> 4)/16.0 blue:(rgbValue & 0xF)/16.0 alpha:((rgbValue & 0xF000) >> 16)/16.0];
            break;
        case 6:
            return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/256.0 green:((rgbValue & 0xFF00) >> 8)/256.0 blue:(rgbValue & 0xFF)/256.0 alpha:1.0];
            break;
        case 8:
            return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/256.0 green:((rgbValue & 0xFF00) >> 8)/256.0 blue:(rgbValue & 0xFF)/256.0 alpha:((rgbValue & 0xFF000000) >> 24)/256.0];
            break;
        default:
            break;
    }
    return nil;
}


- (NSString *) hexString {
    return [NSString stringWithFormat:@"#%@",[self hexValue]];
}

- (NSString *) hexValue {
    UIColor* fourPart;
    
//    // If Monochromatic
//    if (CGColorGetNumberOfComponents(self.CGColor) < 4) {
//        const CGFloat *components = CGColorGetComponents(self.CGColor);
//        fourPart = [UIColor colorWithRed:components[0] green:components[0] blue:components[0] alpha:components[1]];
//    }
//    // If Not RGB Color
//    if (CGColorSpaceGetModel(CGColorGetColorSpace(fourPart.CGColor)) != kCGColorSpaceModelRGB) {
//        return [NSString stringWithFormat:@"FFFFFF"];
//    }
    return [NSString stringWithFormat:@"%02X%02X%02X", (int)((CGColorGetComponents(self.CGColor))[0]*255.0), (int)((CGColorGetComponents(self.CGColor))[1]*255.0), (int)((CGColorGetComponents(self.CGColor))[2]*255.0)];
}


//- (NSString *) htmlFromUIColor:(UIColor *)_color {
//    if (CGColorGetNumberOfComponents(_color.CGColor) < 4) {
//        const CGFloat *components = CGColorGetComponents(_color.CGColor);
//        _color = [UIColor colorWithRed:components[0] green:components[0] blue:components[0] alpha:components[1]];
//    }
//    if (CGColorSpaceGetModel(CGColorGetColorSpace(_color.CGColor)) != kCGColorSpaceModelRGB) {
//        return [NSString stringWithFormat:@"#FFFFFF"];
//    }
//    return [NSString stringWithFormat:@"#%02X%02X%02X", (int)((CGColorGetComponents(_color.CGColor))[0]*255.0), (int)((CGColorGetComponents(_color.CGColor))[1]*255.0), (int)((CGColorGetComponents(_color.CGColor))[2]*255.0)];
//}


@end
