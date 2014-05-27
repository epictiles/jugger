//
//  ETJuggerSettings.m
//  Jugger
//
//  Created by Barney Mattox on 5/26/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETJuggerSettings.h"
#import "ETField.h"

@implementation ETJuggerSettings

-(id)initWithDictionary:(NSDictionary *)aDictionary {
	if (self = [super init]) {
        // setup storage
        self.fields = [[NSMutableArray alloc] init];
        // extract dictionary
        [self copyFromDictionary:aDictionary];
        // auto-initialize
        
    }
	return self;
}

-(void)copyFromDictionary:(NSDictionary*)aDictionary {
    if ([aDictionary valueForKey:@"Fields"]) {
        NSArray* rawFields = [aDictionary valueForKey:@"Fields"];
        for (NSDictionary* fieldDict in rawFields) {
            [self.fields addObject:[[ETField alloc] initWithDictionary:fieldDict]];
        }
    }
}

@end
