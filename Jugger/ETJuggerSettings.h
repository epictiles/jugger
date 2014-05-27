//
//  ETJuggerSettings.h
//  Jugger
//
//  Created by Barney Mattox on 5/26/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETJuggerSettings : NSObject

@property (nonatomic) NSMutableArray* fields;

-(id)initWithDictionary:(NSDictionary *)aDictionary;

@end
