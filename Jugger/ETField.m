//
//  ETFields.m
//  Jugger
//
//  Created by Barney Mattox on 5/26/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETField.h"
#import "ETJugger.h"
#import "ETJuggerTeam.h"

@implementation ETField

-(id)initWithDictionary:(NSDictionary *)aDictionary {
	if (self = [super init]) {
        // setup storage
        self.teams = [[NSMutableArray alloc] init];
        // extract dictionary
        [self copyFromDictionary:aDictionary];
        // auto-initialize
        
    }
	return self;
}

-(void)copyFromDictionary:(NSDictionary*)aDictionary {
    if ([aDictionary valueForKey:@"Name"]) self.name = [aDictionary valueForKey:@"Name"];
    if ([aDictionary valueForKey:@"Field"]) self.field = [aDictionary valueForKey:@"Field"];
    if ([aDictionary valueForKey:@"Teams"]) {
        NSArray* rawTeams = [aDictionary valueForKey:@"Teams"];
        for (NSDictionary* teamDict in rawTeams) {
            ETJuggerTeam* juggerTeam = [[ETJuggerTeam alloc] initWithDictionary:teamDict];
            [self.teams addObject:juggerTeam];
        }
    }
}

@end
