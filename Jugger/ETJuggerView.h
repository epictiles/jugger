//
//  ETJuggerImageView.h
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ETJugger.h"


typedef NS_ENUM(NSUInteger, JuggerStack) {
    JSSelector,
    JSBody,
    JSLogo,
    JSWeapon,
    JSHead,
    JSMaxJuggerStack,
};

extern NSString* const WeaponTypeKeys[WTMaxWeaponType];
extern NSString* const BoardSideKeys[BSMaxBoardSide];
extern NSString* const HandSideKeys[HSMaxHandSide];
extern NSString* const BodyPartKeys[BPMaxBodyPart];
extern NSString* const FileTemplate;
extern NSString* const WeaponTemplate;


@interface ETJuggerView : UIView

@property (nonatomic) ETJugger* jugger;
@property (nonatomic, retain) IBOutlet UIImageView* selector;
@property (nonatomic, retain) IBOutlet UIImageView* body;
@property (nonatomic, retain) IBOutlet UIImageView* logo;
@property (nonatomic, retain) IBOutlet UIImageView* weapon;
@property (nonatomic, retain) IBOutlet UIImageView* head;
@property (nonatomic, retain) IBOutlet UILabel* name;

+(instancetype)juggerView;

@end
