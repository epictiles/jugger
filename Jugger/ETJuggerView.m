//
//  ETJuggerImageView.m
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETJuggerView.h"
#import "ColorUtils.h"

NSString* const WeaponTypeKeys[WTMaxWeaponType] = { @"none",@"swordandboard",@"florentine",@"flail",@"pole" };

NSString* const BoardSideKeys[BSMaxBoardSide] = { @"left",@"right" };

NSString* const HandSideKeys[HSMaxHandSide] = { @"lefthand",@"righthand",@"dualwield" };

NSString* const BodyPartKeys[BPMaxBodyPart] = { @"head",@"body",@"logo" };

NSString* const HeadColorHexKeys[] = {@"B48452",@"FFFFFF",@"FFDFBF",@"777777",@"333333",};

NSString* const BodyColorHexKeys[] = {
    @"5D4437",@"FFFFFF",@"698C00",@"FFFF00",@"D90000",
    @"FF73FF",@"9673FF",@"00BFFF",@"FFD24D",@"777777",
    @"222222"
};

NSString* const FileTemplate = @"%@-%@-%@.png"; // part-side-color (ie body-left-222222)

NSString* const WeaponTemplate = @"%@-%@-%@.png"; // weapon-side-hand


@interface ETJuggerView ()

@property (nonatomic, readonly) NSString* selectorString;
@property (nonatomic, readonly) NSString* bodyString;
@property (nonatomic, readonly) NSString* logoString;
@property (nonatomic, readonly) NSString* weaponString;
@property (nonatomic, readonly) NSString* headString;

@property (nonatomic, retain) UIImage* selectorImage;
@property (nonatomic, retain) UIImage* bodyImage;
@property (nonatomic, retain) UIImage* logoImage;
@property (nonatomic, retain) UIImage* weaponImage;
@property (nonatomic, retain) UIImage* headImage;

@end


@implementation ETJuggerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(instancetype)juggerView {
    ETJuggerView* juggerView = [[[NSBundle mainBundle] loadNibNamed:@"ETJuggerView" owner:nil options:nil] lastObject];
    
    NSAssert([juggerView isKindOfClass:[ETJuggerView class]],@"ETJuggerView initialized with incorrect view type from NIB");
    
    return juggerView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (NSString*)selectorString {
    return @"selector.png";
}

- (UIImage*)selectorImage {
    return [UIImage imageNamed:self.selectorString];
}

- (NSString*)bodyString {
    return [NSString stringWithFormat:FileTemplate,@"body",BoardSideKeys[self.jugger.boardSide],[self.jugger.bodyColor hexValue]];
}

- (UIImage*)bodyImage {
    return [UIImage imageNamed:self.bodyString];
}

- (NSString*)headString {
    NSLog(@"%@ (color: %@)",self.jugger.name, [self.jugger.headColor hexValue]);
    return [NSString stringWithFormat:FileTemplate,@"head",BoardSideKeys[self.jugger.boardSide],[self.jugger.headColor hexValue]];
}

- (UIImage*)headImage {
    return [UIImage imageNamed:self.headString];
}

- (NSString*)logoString {
    return [NSString stringWithFormat:FileTemplate,@"logo",BoardSideKeys[self.jugger.boardSide],self.jugger.logo];
}

- (UIImage*)logoImage {
    return [UIImage imageNamed:self.logoString];
}

- (NSString*)weaponString {
    return [NSString stringWithFormat:WeaponTemplate,WeaponTypeKeys[self.jugger.weaponType],BoardSideKeys[self.jugger.boardSide],HandSideKeys[self.jugger.handSide]];
}

- (UIImage*)weaponImage {
    return [UIImage imageNamed:self.weaponString];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    NSLog(@"newSuperview: %@",NSStringFromCGRect(newSuperview.frame));
    CGPoint center = self.jugger.centerPercent;
    self.frame = CGRectMake(center.x*newSuperview.frame.size.width-(50.0f*(1024.0f/newSuperview.frame.size.width)),
                            center.y*newSuperview.frame.size.height-(50.0f*(550.0f/newSuperview.frame.size.height)),
                            100, 100);
}

- (void)setJugger:(ETJugger *)jugger {
    _jugger = jugger;
    self.selector.image = self.selectorImage;
    self.body.image = self.bodyImage;
    self.logo.image = self.logoImage;
    self.weapon.image = self.weaponImage;
    self.head.image = self.headImage;
    self.name.text = jugger.name;
}


@end
