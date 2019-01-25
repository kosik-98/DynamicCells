//
//  ViewController.m
//  DynamicCells
//
//  Created by Admin on 03.01.19.
//  Copyright © 2019 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong, nonatomic) NSMutableArray* sectionsArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 0, 0, 0);
    
    self.Table.contentInset = insets;
    self.Table.scrollIndicatorInsets = insets;
    self.arr = [NSMutableArray array];
    self.sectionsArray = [NSMutableArray array];
    
    for(int i = 0; i < 40; i++)
    {
        Student* obj = [[Student alloc] init];
        obj.mark = arc4random()%50/10.f;
        obj.name = [NSString stringWithFormat:@"Student %d", i];
        [self.arr addObject:obj];
    }
    
    [self sectionsFromStudents:self.arr];
}

- (void) sectionsFromStudents:(NSArray*)students
{
    NSMutableArray* goodStudents = [NSMutableArray array];
    NSMutableArray* normalStudents = [NSMutableArray array];
    NSMutableArray* badStudents = [NSMutableArray array];
    NSMutableArray* colorsArray = [NSMutableArray array];
    
    for(Student* student in students)
    {
        if(student.mark >= 4)
        {
            [goodStudents addObject:student];
        }
        else if(student.mark >= 3)
        {
            [normalStudents addObject:student];
        }
        else
        {
            [badStudents addObject:student];
        }
    }
    
    for(int i = 0; i < 10; i++)
    {
        [colorsArray addObject:[self randomColor]];
    }
    
    Section* section1 = [[Section alloc] initWithName:@"Good students" andArray:goodStudents];
    Section* section2 = [[Section alloc] initWithName:@"Normal students" andArray:normalStudents];
    Section* section3 = [[Section alloc] initWithName:@"Bad students" andArray:badStudents];
    Section* section4 = [[Section alloc] initWithName:@"Colors" andArray:colorsArray];
    
    [self.sectionsArray addObject:section1];
    [self.sectionsArray addObject:section2];
    [self.sectionsArray addObject:section3];
    [self.sectionsArray addObject:section4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIColor*)randomColor
{
    CGFloat red = arc4random()%1000 / 1000.f;
    CGFloat green = arc4random()%1000 / 1000.f;
    CGFloat blue = arc4random()%1000 / 1000.f;
    
    UIColor* color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    
    return color;
}

#pragma mark - UITableViewDataSource

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [[self.sectionsArray objectAtIndex:section] name];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sectionsArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Section* sect = [self.sectionsArray objectAtIndex:section];
    
    return [sect.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Section* sect = [self.sectionsArray objectAtIndex:indexPath.section];
    
    static NSString* studentIdentifier = @"studentCell";
    static NSString* colorIdentifier = @"colorCell";
    
    if([sect.name isEqual:@"Colors"])
    {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:colorIdentifier];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:colorIdentifier];
        }
        else
        {
            NSLog(@"Reused color cell");
        }
        
        cell.backgroundColor = [sect.array objectAtIndex:indexPath.row];
        
        return cell;
    }
    else
    {
        Student* student = [sect.array objectAtIndex:indexPath.row];
        
        static NSString* studentIdentifier = @"studentCell";
        
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:studentIdentifier];
        
        if(!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:studentIdentifier];
        }
        else
        {
            NSLog(@"Reused student cell");
        }
        
        cell.textLabel.text = student.name;
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%.1f", student.mark];
        
        if(student.mark < 3)
            cell.detailTextLabel.textColor = [UIColor redColor];
        else
            cell.detailTextLabel.textColor = [UIColor grayColor];
        
        return cell;
    }

    return nil;
}

@end
