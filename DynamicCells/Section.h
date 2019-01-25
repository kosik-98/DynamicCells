//
//  Sections.h
//  DynamicCells
//
//  Created by Admin on 06.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (strong, nonatomic) NSArray* array;
@property (strong, nonatomic) NSString* name;

- (id)initWithName:(NSString*)sectName andArray:(NSArray*)array;

@end
