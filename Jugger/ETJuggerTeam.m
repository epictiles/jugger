//
//  ETJuggerTeam.m
//  Jugger
//
//  Created by Barney Mattox on 5/25/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETJuggerTeam.h"
#import "ETJugger.h"

@implementation ETJuggerTeam

-(id)initWithDictionary:(NSDictionary *)aDictionary {
	if (self = [super init]) {
        // setup storage
        self.juggers = [[NSMutableArray alloc] init];
        // extract dictionary
        [self copyFromDictionary:aDictionary];
        // auto-initialize
        
    }
	return self;
}

-(void)copyFromDictionary:(NSDictionary*)aDictionary {
    if ([aDictionary valueForKey:@"Name"]) self.teamName = [aDictionary valueForKey:@"Name"];
    if ([aDictionary valueForKey:@"Category"]) self.categoryName = [aDictionary valueForKey:@"Category"];
    if ([aDictionary valueForKey:@"Juggers"]) {
        NSArray* rawJuggers = [aDictionary valueForKey:@"Juggers"];
        for (NSDictionary* juggerDict in rawJuggers) {
            [self.juggers addObject:[[ETJugger alloc] initWithDictionary:juggerDict]];
        }
    }
}




@end
