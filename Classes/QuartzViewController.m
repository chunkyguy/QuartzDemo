/*

File: QuartzViewController.m
Abstract: A UIViewController subclass that manages a single QuartzView and
allows the user to set the drawing delegate for that QuartzView.

Version: 2.0

Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple Inc.
("Apple") in consideration of your agreement to the following terms, and your
use, installation, modification or redistribution of this Apple software
constitutes acceptance of these terms.  If you do not agree with these terms,
please do not use, install, modify or redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and subject
to these terms, Apple grants you a personal, non-exclusive license, under
Apple's copyrights in this original Apple software (the "Apple Software"), to
use, reproduce, modify and redistribute the Apple Software, with or without
modifications, in source and/or binary forms; provided that if you redistribute
the Apple Software in its entirety and without modifications, you must retain
this notice and the following text and disclaimers in all such redistributions
of the Apple Software.
Neither the name, trademarks, service marks or logos of Apple Inc. may be used
to endorse or promote products derived from the Apple Software without specific
prior written permission from Apple.  Except as expressly stated in this notice,
no other rights or licenses, express or implied, are granted by Apple herein,
including but not limited to any patent rights that may be infringed by your
derivative works or by other works in which the Apple Software may be
incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR
DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF
CONTRACT, TORT (INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF
APPLE HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright (C) 2008 Apple Inc. All Rights Reserved.

*/

#import "QuartzViewController.h"

@implementation QuartzViewController

@synthesize barStyle, statusStyle;

-(id<QuartzViewDelegate>)quartzViewDelegate
{
	return quartzView.delegate;
}

-(void)setQuartzViewDelegate:(id<QuartzViewDelegate>)delegate
{
	quartzView.delegate = [delegate retain];
}

-(id)initWithTitle:(NSString*)title;
{
	self = [super init];
	if (self != nil)
	{
		// Initialize your view controller.
		self.title = title;

		// Create a Quartz View to embed later with a dummy rect for now.
		quartzView = [[QuartzView alloc] initWithFrame:CGRectMake(0.0, 0.0, 1.0, 1.0)];
		quartzView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		
		// Default bar style is black opaque for QuartzViewControllers.
		barStyle = UIBarStyleBlackOpaque;
		
		// Default status bar style is black opaque for QuartzViewControllers.
		statusStyle = UIStatusBarStyleBlackOpaque;
	}
	return self;
}

-(void)loadView
{
	// Create a custom view hierarchy.
	UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	view.autoresizesSubviews = YES;
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	self.view = view;
	quartzView.frame = view.bounds;
	[view addSubview:quartzView];

	[view release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview.
	// Release anything that's not essential, such as cached data.
}

-(void)dealloc
{
	[quartzView.delegate release];
	[quartzView release];
	[super dealloc];
}

#pragma mark UIViewController delegate methods

// called after this controller's view has appeared
- (void)viewWillAppear:(BOOL)animated
{
	// for aesthetic reasons make the nav bar an appropriate color (defaulting to black) for this page
	self.navigationController.navigationBar.barStyle = barStyle;
	// ditto for the status bar.
	[[UIApplication sharedApplication] setStatusBarStyle:statusStyle animated:YES];
}

@end
