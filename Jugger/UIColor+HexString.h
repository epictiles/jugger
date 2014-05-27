//
//  UIColor+HexString.h
//  StoryFlow
//
//  Created by Barney Mattox on 5/4/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HexString)

+ (UIColor *)colorFromHexString:(NSString *)hexString;
- (NSString *) hexString;
- (NSString *) hexValue;

@end
