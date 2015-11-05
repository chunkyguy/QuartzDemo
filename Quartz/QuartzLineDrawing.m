/*

File: QuartzLineDrawing.m
Abstract: Demonstrations of Quartz line drawing capabilties (LineDrawing),
including setting the stroke width (LineWidthDrawing), cap (LineCapDrawing),
join (LineJoinDrawing) and dash  (LineDashDrawing) properties

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

#import "QuartzLineDrawing.h"

@implementation LineDrawing

-(void)drawView:(QuartzView*)view inContext:(CGContextRef)context bounds:(CGRect)bounds
{
	// Drawing lines with a white stroke color
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Draw a single line from left to right
	CGContextMoveToPoint(context, 10.0, 30.0);
	CGContextAddLineToPoint(context, 310.0, 30.0);
	CGContextStrokePath(context);
	
	// Draw a connected sequence of line segments
	CGPoint addLines[] =
	{
		CGPointMake(10.0, 90.0),
		CGPointMake(70.0, 60.0),
		CGPointMake(130.0, 90.0),
		CGPointMake(190.0, 60.0),
		CGPointMake(250.0, 90.0),
		CGPointMake(310.0, 60.0),
	};
	// Bulk call to add lines to the current path.
	// Equivalent to MoveToPoint(points[0]); for(i=1; i<count; ++i) AddLineToPoint(points[i]);
	CGContextAddLines(context, addLines, sizeof(addLines)/sizeof(addLines[0]));
	CGContextStrokePath(context);
	
	// Draw a series of line segments. Each pair of points is a segment
	CGPoint strokeSegments[] =
	{
		CGPointMake(10.0, 150.0),
		CGPointMake(70.0, 120.0),
		CGPointMake(130.0, 150.0),
		CGPointMake(190.0, 120.0),
		CGPointMake(250.0, 150.0),
		CGPointMake(310.0, 120.0),
	};
	// Bulk call to stroke a sequence of line segments.
	// Equivalent to for(i=0; i<count; i+=2) { MoveToPoint(point[i]); AddLineToPoint(point[i+1]); StrokePath(); }
	CGContextStrokeLineSegments(context, strokeSegments, sizeof(strokeSegments)/sizeof(strokeSegments[0]));
}

@end

#pragma mark -

@implementation LineWidthDrawing

-(void)drawView:(QuartzView*)view inContext:(CGContextRef)context bounds:(CGRect)bounds
{
	// Drawing lines with a white stroke color
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	
	// Draw lines with a stroke width from 1-10
	for(int i = 1; i <= 10; ++i)
	{
		CGContextSetLineWidth(context, i);
		CGContextMoveToPoint(context, 10.0, i * 20.5);
		CGContextAddLineToPoint(context, 310.0, i * 20.5);
		CGContextStrokePath(context);
	}
	
	// Demonstration that stroke is even on both sides of the line
	CGContextSetLineWidth(context, 15.0);
	CGContextMoveToPoint(context, 10.0, 245.5);
	CGContextAddLineToPoint(context, 310.0, 245.5);
	CGContextStrokePath(context);

	CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
	CGContextSetLineWidth(context, 3.0);
	CGContextMoveToPoint(context, 10.0, 245.5);
	CGContextAddLineToPoint(context, 310.0, 245.5);
	CGContextStrokePath(context);
}

@end

#pragma mark -

@implementation LineCapJoinDrawing

-(void)drawView:(QuartzView*)view inContext:(CGContextRef)context bounds:(CGRect)bounds
{
	// Drawing lines with a white stroke color
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	
	// Preserve the current drawing state
	CGContextSaveGState(context);
	
	// Set the line width so that the cap is visible
	CGContextSetLineWidth(context, 20.0);
	
	// Line caps demonstration
	
	// Line cap butt, default.
	CGContextSetLineCap(context, kCGLineCapButt);
	CGContextMoveToPoint(context, 40.0, 30.0);
	CGContextAddLineToPoint(context, 280.0, 30.0);
	CGContextStrokePath(context);
	
	// Line cap round
	CGContextSetLineCap(context, kCGLineCapRound);
	CGContextMoveToPoint(context, 40.0, 65.0);
	CGContextAddLineToPoint(context, 280.0, 65.0);
	CGContextStrokePath(context);
	
	// Line cap square
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextMoveToPoint(context, 40.0, 100.0);
	CGContextAddLineToPoint(context, 280.0, 100.0);
	CGContextStrokePath(context);
	
	// Restore the previous drawing state, and save it again.
	CGContextRestoreGState(context);
	CGContextSaveGState(context);
	
	// Set the line width so that the join is visible
	CGContextSetLineWidth(context, 20.0);
	
	// Line join miter, default
	CGContextSetLineJoin(context, kCGLineJoinMiter);
	CGContextMoveToPoint(context, 40.0, 260.0);
	CGContextAddLineToPoint(context, 160.0, 140.0);
	CGContextAddLineToPoint(context, 280.0, 260.0);
	CGContextStrokePath(context);
	
	// Line join round
	CGContextSetLineJoin(context, kCGLineJoinRound);
	CGContextMoveToPoint(context, 40.0, 320.0);
	CGContextAddLineToPoint(context, 160.0, 200.0);
	CGContextAddLineToPoint(context, 280.0, 320.0);
	CGContextStrokePath(context);
	
	// Line join bevel
	CGContextSetLineJoin(context, kCGLineJoinBevel);
	CGContextMoveToPoint(context, 40.0, 380.0);
	CGContextAddLineToPoint(context, 160.0, 260.0);
	CGContextAddLineToPoint(context, 280.0, 380.0);
	CGContextStrokePath(context);

	// Restore the previous drawing state.
	CGContextRestoreGState(context);

	// Demonstrate where the path that generated each line is
	CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
	CGContextSetLineWidth(context, 3.0);
	CGContextMoveToPoint(context, 40.0, 30.0);
	CGContextAddLineToPoint(context, 280.0, 30.0);
	CGContextMoveToPoint(context, 40.0, 65.0);
	CGContextAddLineToPoint(context, 280.0, 65.0);
	CGContextMoveToPoint(context, 40.0, 100.0);
	CGContextAddLineToPoint(context, 280.0, 100.0);
	CGContextMoveToPoint(context, 40.0, 260.0);
	CGContextAddLineToPoint(context, 160.0, 140.0);
	CGContextAddLineToPoint(context, 280.0, 260.0);
	CGContextMoveToPoint(context, 40.0, 320.0);
	CGContextAddLineToPoint(context, 160.0, 200.0);
	CGContextAddLineToPoint(context, 280.0, 320.0);
	CGContextMoveToPoint(context, 40.0, 380.0);
	CGContextAddLineToPoint(context, 160.0, 260.0);
	CGContextAddLineToPoint(context, 280.0, 380.0);
	CGContextStrokePath(context);
}

@end

#pragma mark -

@implementation LineDashDrawing

-(void)drawView:(QuartzView*)view inContext:(CGContextRef)context bounds:(CGRect)bounds
{
	// Drawing lines with a white stroke color
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
	// Draw them with a 2.0 stroke width so they are a bit more visible.
	CGContextSetLineWidth(context, 2.0);
	
	// Each dash entry is a run-length in the current coordinate system.
	// For dash1 we demonstrate the effect of the number of entries in the dash array
	// when count==2, we get length 10 drawn, length 10 skipped, etc
	// when count==3, we get 10 drawn, 10 skipped, 20 draw, 10 skipped, 10 drawn, 20 skipped, etc
	// and so on
	CGFloat dash1[] = {10.0, 10.0, 20.0, 30.0, 50.0};
	
	// Different dash lengths
	for(int i = 2; i <= 5; ++i)
	{
		CGContextSetLineDash(context, 0.0, dash1, i);
		CGContextMoveToPoint(context, 10.0, (i - 1) * 20.0);
		CGContextAddLineToPoint(context, 310.0, (i - 1) * 20.0);
		CGContextStrokePath(context);
	}
	
	// For dash2 we always use count 4, but use it to demonstrate the phase
	// phase=0 starts us 0 points into the dash, so we draw 10, skip 10, draw 20, skip 20, etc.
	// phase=6 starts 6 points in, so we draw 4, skip 10, draw 20, skip 20, draw 10, skip 10, etc.
	// phase=12 stats us 12 points in, so we skip 8, draw 20, skip 20, draw 10, skip 10, etc.
	// and so on.
	CGFloat dash2[] = {10.0, 10.0, 20.0, 20.0};

	// Different dash phases
	for(int i = 0; i < 10; ++i)
	{
		CGContextSetLineDash(context, i * 6.0, dash2, 4);
		CGContextMoveToPoint(context, 10.0, (i + 6) * 20.0);
		CGContextAddLineToPoint(context, 310.0, (i + 6) * 20.0);
		CGContextStrokePath(context);
	}
}

@end
