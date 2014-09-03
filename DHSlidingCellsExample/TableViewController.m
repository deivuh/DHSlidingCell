//
//  TableViewController.m
//  DHSlidingCellsExample
//
//  Created by David Hsieh on 9/2/14.
//  Copyright (c) 2014 David Hsieh. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DHSlidingCell *cell;
    
    if (indexPath.section == 0)
        cell = [tableView dequeueReusableCellWithIdentifier:@"slidingCellOver" forIndexPath:indexPath];
    else
        cell = [tableView dequeueReusableCellWithIdentifier:@"slidingCellUnder" forIndexPath:indexPath];
    
    
    cell.delegate = self;

    UILabel *cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.origin.x-6, cell.bounds.origin.y-6, cell.frame.size.width, cell.frame.size.height)];
    
    cellLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20.0f];
    cellLabel.numberOfLines = 1;
    cellLabel.textColor = [UIColor whiteColor];
    cellLabel.textAlignment = NSTextAlignmentCenter;
    

    
    cellLabel.text = @"TEST";
    [cell.cellContentView insertSubview:cellLabel atIndex:0];
    
    switch (indexPath.row) {
            
        case 0:
            cell.swipeRightEnabled = YES;
            cellLabel.text = @"Swipe right only";
            break;
            
        case 1:
            cell.swipeLeftEnabled = YES;
            cellLabel.text = @"Swipe left only";
            break;
            
        default:
            cell.swipeRightEnabled = YES;
            cell.swipeLeftEnabled = YES;
            cellLabel.text = @"Both";
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Under";
    } else
        return @"Over";
}


- (void)swipedCellToLeftAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Swiped left on section %ld row %ld", indexPath.section, indexPath.row);
    
}

- (void)swipedCellToRightAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Swiped right on section %ld row %ld", indexPath.section, indexPath.row);
}

@end
