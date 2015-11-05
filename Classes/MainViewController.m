/*
     File: MainViewController.m
 Abstract: Implements the main interface to the demo application, allowing the user to display which of Quartz's drawing facilities to demonstrate.
  Version: 2.2
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2009 Apple Inc. All Rights Reserved.
 
*/

#import "MainViewController.h"
#import "QuartzViewController.h"
#import "QuartzLineDrawing.h"
#import "QuartzPolyDrawing.h"
#import "QuartzCurveDrawing.h"
#import "QuartzImageDrawing.h"
#import "QuartzRenderedDrawing.h"
#import "QuartzBlending.h"
#import "QuartzBlendingViewController.h"

#define kCellIdentifier @"com.apple.samplecode.QuartzDemo.QuartzTableSelectionCellIdentifier"

@interface MainViewController()
@end

@implementation MainViewController

-(void)awakeFromNib
{	
	// create our view controllers
	QuartzViewController *controller;
	menuList = [[NSMutableArray alloc] init];
	
	// Line drawing demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[LineDrawingView class]];
	controller.title = @"Lines";
	controller.demoInfo = @"LineDrawingView(QuartzLineDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Rectangle drawing demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[RectDrawingView class]];
	controller.title = @"Rectangles";
	controller.demoInfo = @"RectDrawingView(QuartzPolyDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Polygon drawing demo
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[PolyDrawingView class]];
	controller.title = @"Polygons";
	controller.demoInfo = @"PolyDrawingView(QuartzPolyDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Ellipses, arcs, and as a bonus round-rects!
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[EllipseArcDrawingView class]];
	controller.title = @"Ellipses & Arcs";
	controller.demoInfo = @"EllipseArcDrawingView(QuartzCurveDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Bezier and Quadratic curves
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[BezierDrawingView class]];
	controller.title = @"Beziers & Quadratics";
	controller.demoInfo = @"BezierDrawingView(QuartzCurveDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Images (drawing once and tiling an image)
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[ImageDrawingView class]];
	controller.title = @"Images & Tiling";
	controller.demoInfo = @"ImageDrawingView(QuartzImageDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Drawing a PDF page
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[PDFDrawingView class]];
	controller.title = @"PDF";
	controller.demoInfo = @"PDFDrawingView(QuartzImageDrawing.m)";
	// Since the PDF page is primarily white, we'll use the default status bar style rather than the black status bar style.
	controller.statusStyle = UIStatusBarStyleDefault;
	[menuList addObject:controller];
	[controller release];

	// Drawing Patterns
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[PatternDrawingView class]];
	controller.title = @"Patterns";
	controller.demoInfo = @"PatternDrawingView(QuartzRenderedDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Drawing Linear and Radial Gradients
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[GradientDrawingView class]];
	controller.title = @"Gradients";
	controller.demoInfo = @"GradientDrawingView(QuartzRenderedDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Showing the effect of stroke width
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[LineWidthDrawingView class]];
	controller.title = @"Stroke Width";
	controller.demoInfo = @"LineWidthDrawingView(QuartzLineDrawing.m)";
	[menuList addObject:controller];
	[controller release];
	
	// Showing the effects of line caps & joins
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[LineCapJoinDrawingView class]];
	controller.title = @"Caps & Joins";
	controller.demoInfo = @"LineCapJoinDrawingView(QuartzLineDrawing.m)";
	[menuList addObject:controller];
	[controller release];
	
	// Showing the effects of line dash patterns
	controller = [[QuartzViewController alloc] initWithNibName:@"DemoView" viewClass:[LineDashDrawingView class]];
	controller.title = @"Dash Patterns";
	controller.demoInfo = @"LineDashDrawingView(QuartzLineDrawing.m)";
	[menuList addObject:controller];
	[controller release];

	// Blending Demo
	// Blending demo won't scroll for some reason...
	controller = [[QuartzBlendingViewController alloc] initWithNibName:@"BlendView" viewClass:[QuartzBlendingView class]];
	controller.title = @"Blending Demo";
	controller.demoInfo = @"QuartzBlending(QuartzBlending.m)";
	[menuList addObject:controller];
	[controller release];
}

- (void)dealloc
{
	[menuList release];
	[super dealloc];
}

#pragma mark UIViewController delegate

- (void)viewWillAppear:(BOOL)animated
{
	// this UIViewController is about to appear
	// make sure we remove the current selection from our table view
	NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
	[self.tableView deselectRowAtIndexPath:tableSelection animated:NO];
	// Set the navbar style to its default color for the list view.
	self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
	// Set the status bar to its default color for the list view.
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

#pragma mark UITableView delegate methods

// the table's selection has changed, switch to that item's UIViewController
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UIViewController *targetViewController = [menuList objectAtIndex: indexPath.row];
	[[self navigationController] pushViewController:targetViewController animated:YES];
}

#pragma mark UITableView data source methods

// tell our table how many sections or groups it will have (always 1(our case)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

// tell our table how many rows it will have,(our case the size of our menuList
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [menuList count];
}

// tell our table what kind of cell to use and its title for the given row
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier] autorelease];
	}
	QuartzViewController *vc = [menuList objectAtIndex:indexPath.row];
	cell.textLabel.text = vc.title;
	cell.detailTextLabel.text = vc.demoInfo;
	cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	return cell;
}

@end

