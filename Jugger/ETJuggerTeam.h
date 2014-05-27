//
//  ETJuggerTeam.h
//  Jugger
//
//  Created by Barney Mattox on 5/25/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETJuggerTeam : NSObject

@property (nonatomic) NSString* teamName;
@property (nonatomic) NSString* categoryName;
@property (nonatomic) NSMutableArray* juggers;

-(id)initWithDictionary:(NSDictionary *)aDictionary;

@end
