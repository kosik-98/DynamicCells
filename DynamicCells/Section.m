//
//  Sections.m
//  DynamicCells
//
//  Created by Admin on 06.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "Section.h"

@implementation Section


- (id)initWithName:(NSString*)sectName andArray:(NSArray*)array
{
    self = [super init];
    
    self.name = sectName;
    self.array = array;
    
    return self;
}

@end
