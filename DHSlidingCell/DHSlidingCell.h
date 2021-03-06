//
//  DHSlidingCell.h
//  DHSlidingCellsExample
//
//  Created by David Hsieh on 9/1/14.
//  Copyright (c) 2014 David Hsieh. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>



@protocol DHSlidingCellDelegate <NSObject>

@optional

- (void) swipedCellToLeftAtIndexPath:(NSIndexPath*)indexPath;
- (void) swipedCellToRightAtIndexPath:(NSIndexPath*)indexPath;

@end

@interface DHSlidingCell : UITableViewCell <UIAlertViewDelegate> {

    CGPoint originalCenter;
	BOOL swipeRightComplete;
    BOOL swipeLeftComplete;
    


    
    
    
    
}


@property BOOL swipeLeftEnabled, swipeRightEnabled;

@property (weak, nonatomic) IBOutlet UIView *cellContentView;
@property (weak, nonatomic) IBOutlet UIView *overLayerViewLeft;
@property (weak, nonatomic) IBOutlet UIView *overLayerViewRight;
@property (weak, nonatomic) IBOutlet UIView *underLayerViewLeft;
@property (weak, nonatomic) IBOutlet UIView *underLayerViewRight;



@property (nonatomic, assign) IBOutlet id<DHSlidingCellDelegate> delegate;


@end
