#DHSlidingCell

`DHSlidingCell` is a custom cell to be used for left and right swipe actions, and supports custom overlay images to provide a nice swipe animation feedback to the user.

![](https://github.com/deivuh/DHSlidingCell/blob/master/DHSlidingCell.gif)

`DHSlidingCell` uses ARC (Automatic Reference Counting), so it must be built with Xcode 4.5 or greater. It has been tested on iOS 7 and 8.

#Installation

- Add `DHSlidingCell.h` and `DHSlidingCell.m` to your project. Make sure to check "Copy items into destination group's folder" if the files are not already in your project's directory
- Include with `#import "DHSlidingCell.h"` to use it where you need it.

#Usage

##Storyboard/IB
###Cell setup
1.  Select the prototype cell on your Tableview and set the custom class property to `DHSlidingCell`.
2. Insert a new View from the inspector and adjust dimensions and position to your needs. This is the view that will be the sliding cell, so any subviews that you want in the cell must be inside this view.
3. Select the actual cell, and from the connections inspector link the outlet `cellContentView` to the view created on the previous step.
4. You may link the other view outlets that corresponds to the views over and under the content cell. For the views that are over, place them inside the ContentView above any other views that you may have added. For the views that are under, place them inside the actual cell and below the ContentView.

###Action handling
1. Add <DHSlidingCellDelegate> to the header file of your TableviewController, or wherever might suit your needs better.
2. Make sure to have set the delegate of the cell by linking the `delegate` outlet to your TableviewController from the connections inspector or setting them on code inside the `- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath` delegate method.
3. Handle each sliding cell action inside their respective methods

		- (void)swipedCellToLeftAtIndexPath:(NSIndexPath *)indexPath {
				//Swiped to the left
		}
		- (void)swipedCellToRightAtIndexPath:(NSIndexPath *)indexPath {
				//Swiped to the right
		}

##TL;DR
Check example project included

#License
The MIT License (MIT)

Copyright (c) 2014 David Hsieh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
