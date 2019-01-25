//
//  ViewController.h
//  DynamicCells
//
//  Created by Admin on 03.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"
#import "Section.h"

@interface ViewController : UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *Table;
@property (strong, nonatomic) NSMutableArray* arr;
-(UIColor*)randomColor;

@end

