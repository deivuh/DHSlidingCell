//
//  DHSlidingCell.m
//  DHSlidingCellsSample
//
//  Created by David Hsieh on 9/1/14.
//  Copyright (c) 2014 David Hsieh. All rights reserved.
//

#define ANIMATION_TIME 0.3f


#import "DHSlidingCell.h"



@implementation DHSlidingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        

    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        

        UIGestureRecognizer* recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        recognizer.delegate = self;
        [self addGestureRecognizer:recognizer];
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{

            self.cellContentView.layer.cornerRadius = 7.0f;
            self.cellContentView.clipsToBounds = YES;
            
            self.overLayerViewLeft.alpha = 0.0f;
            self.overLayerViewRight.alpha = 0.0f;
        });

    }
    return self;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];


}


-(BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer {
    
    if ([gestureRecognizer class] == [UIPanGestureRecognizer class]) {

        CGPoint translation = [gestureRecognizer translationInView:self.cellContentView.superview];

        if (fabsf(translation.x) > fabsf(translation.y)) {
            return YES;
        }
    }
    

    return NO;
}

-(void)handlePan:(UIPanGestureRecognizer *)recognizer {
    

    // 1
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        // if the gesture has just started, record the current centre location
        originalCenter = self.cellContentView.center;
        
        
    }
    
    // 2
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        // translate the center
        

        CGPoint translation = [recognizer translationInView:self.cellContentView];
        
      

        if (!self.swipeRightEnabled && translation.x > 0) {
            translation.x = 0;
            return;
        }
        
        if (!self.swipeLeftEnabled && translation.x < 0) {
            translation.x = 0;
            return;
        }
        
        _underLayerViewLeft.alpha = (float)abs(translation.x)/150;
        _underLayerViewRight.alpha = (float)abs(translation.x)/150;
        _overLayerViewLeft.alpha = (float)-translation.x/150;
        _overLayerViewRight.alpha = (float)translation.x/150;

        
    


        
        self.cellContentView.center = CGPointMake(originalCenter.x + translation.x, originalCenter.y);

        swipeLeftComplete = self.cellContentView.frame.origin.x < -self.cellContentView.frame.size.width / 2;
        swipeRightComplete = self.cellContentView.frame.origin.x > self.cellContentView.frame.size.width / 2;
    }
    
    // 3
    if (recognizer.state == UIGestureRecognizerStateEnded) {

        CGRect originalFrame = CGRectMake(10, self.cellContentView.frame.origin.y,
                                          self.cellContentView.bounds.size.width, self.cellContentView.bounds.size.height);
        
        if (!swipeRightComplete && !swipeLeftComplete) {

            [UIView animateWithDuration:ANIMATION_TIME
                             animations:^{
                                 self.cellContentView.frame = originalFrame;
                                 _overLayerViewLeft.alpha = 0.0f;
                                 _overLayerViewRight.alpha = 0.0f;
                                 _underLayerViewLeft.alpha = 0.0f;
                                 _underLayerViewRight.alpha = 0.0f;
                             }
             ];
            
            

        }
        
        if (swipeRightComplete) {
            
            
            [UIView animateWithDuration:ANIMATION_TIME
                             animations:^{
                                 self.cellContentView.frame = originalFrame;
                                 _overLayerViewLeft.alpha = 0.0f;
                                 _overLayerViewRight.alpha = 0.0f;
                                 _underLayerViewLeft.alpha = 0.0f;
                                 _underLayerViewRight.alpha = 0.0f;
                             }
             ];
            


            [self swipedRightDelegate];


        }
        
        if (swipeLeftComplete) {

            [UIView animateWithDuration:ANIMATION_TIME
                             animations:^{
                                 self.cellContentView.frame = originalFrame;
                                 _overLayerViewLeft.alpha = 0.0f;
                                 _overLayerViewRight.alpha = 0.0f;
                                 _underLayerViewLeft.alpha = 0.0f;
                                 _underLayerViewRight.alpha = 0.0f;
                             }
             ];
           

            
            [self swipedLeftDelegate];
        }
    }
}

- (void)swipedLeftDelegate {
    NSIndexPath *indexPath = [(UITableView*)self.superview.superview indexPathForCell:self];

    [self.delegate swipedCellToLeftAtIndexPath:indexPath];
}

- (void)swipedRightDelegate {
    NSIndexPath *indexPath = [(UITableView*)self.superview.superview indexPathForCell:self];

    [self.delegate swipedCellToRightAtIndexPath:indexPath];
}



@end
