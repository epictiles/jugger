//
//  ETJugger.h
//  Jugger
//
//  Created by Barney Mattox on 5/25/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, WeaponType) {
    WTNone,
    WTSwordAndBoard,
    WTFlorentine,
    WTChain,
    WTPole,
    WTMaxWeaponType
};

typedef NS_ENUM(NSUInteger, BoardSide) {
    BSLeft,
    BSRight,
    BSMaxBoardSide,
};

typedef NS_ENUM(NSUInteger, HandSide) {
    HSLeftHand,
    HSRightHand,
    HSDual,
    HSMaxHandSide,
};

typedef NS_ENUM(NSUInteger, BodyPart) {
    BPHead,
    BPBody,
    BPLogo,
    BPMaxBodyPart,
};


@interface ETJugger : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic, assign) WeaponType weaponType;
@property (nonatomic, assign) BoardSide boardSide;
@property (nonatomic, assign) HandSide handSide;
@property (nonatomic) UIColor* headColor;
@property (nonatomic) UIColor* bodyColor;
@property (nonatomic) NSString* logo;
@property (nonatomic, assign) CGPoint centerPercent;

-(id)initWithDictionary:(NSDictionary *)aDictionary;

@end
