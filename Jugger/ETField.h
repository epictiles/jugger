//
//  ETFields.h
//  Jugger
//
//  Created by Barney Mattox on 5/26/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETField : NSObject

@property (nonatomic, copy) NSString* field;
@property (nonatomic, copy) NSString* name;
@property (nonatomic) NSMutableArray* teams;

-(id)initWithDictionary:(NSDictionary *)aDictionary;

@end
