//
//  ETJugger.m
//  Jugger
//
//  Created by Barney Mattox on 5/25/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETJugger.h"
#import "ColorUtils.h"

@implementation ETJugger

-(id)initWithDictionary:(NSDictionary *)aDictionary {
	if (self = [super init]) {
        [self copyFromDictionary:aDictionary];
        // auto-initialize
    }
	return self;
}

-(void)copyFromDictionary:(NSDictionary*)aDictionary {
    if ([aDictionary valueForKey:@"Name"]) self.name = [aDictionary valueForKey:@"Name"];
    if ([aDictionary valueForKey:@"Weapon"]) self.weaponType = [[aDictionary valueForKey:@"Weapon"] integerValue];
    if ([aDictionary valueForKey:@"Hand"]) self.handSide = [[aDictionary valueForKey:@"Hand"] integerValue];
    if ([aDictionary valueForKey:@"HeadColor"]) self.headColor = [UIColor colorWithString:
                                                                  [aDictionary valueForKey:@"HeadColor"]];
    if ([aDictionary valueForKey:@"BodyColor"]) self.bodyColor = [UIColor colorWithString:
                                                                  [aDictionary valueForKey:@"BodyColor"]];
    if ([aDictionary valueForKey:@"Logo"]) self.logo = [aDictionary valueForKey:@"Logo"];
    NSLog(@"set - %@ (color: %@)",self.name, [self.headColor hexValue]);

    
    
    // BoardSide will not be present for team definitions, defaults to Left facing; but is used in Playbook and Fields
    if ([aDictionary valueForKey:@"BoardSide"]) self.boardSide = [[aDictionary valueForKey:@"BoardSide"] integerValue];
    // CenterPercent will not be present for team definitions, defaults to 0,0; but is used in Playbook and Fields
    if ([aDictionary valueForKey:@"CenterPercent"]) self.centerPercent = CGPointFromString([aDictionary valueForKey:@"CenterPercent"]);
    
}


@end
