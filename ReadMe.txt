QuartzDemo

QuartzDemo is an iPhone OS application that demonstrates many of the Quartz2D APIs made available by the CoreGraphics framework. Quartz2D forms the foundation of all drawing on iPhone OS and provides facilities for drawing lines, polygons, curves, images, gradients, PDF and many other graphical facilities.

In this sample stroked paths are typically drawn in white. Lines and other graphical elements drawn in red are meant to show some aspect of how the element was constructed, such as the path used to construct the object, or a clipping rectangle used to limit drawing to a particular area and are not part of the actual demonstrated result. Filled paths and areas use colors other than red, with a red fill used to similar effect as with stroked paths.

Build Requirements

Mac OS X 10.5.3, Xcode 3.1, iPhone OS 2.0

Runtime Requirements

Mac OS X 10.5.3, iPhone OS 2.0

Source File List

Classes/AppDelegate.h/m:
The application delegate. It creates and sets up the view & navigation controllers for the application.

Classes/MainViewController.h/m:
Implements the main interface to the demo application, allowing the user to display which of Quartz's drawing facilities to demonstrate.

Classes/QuartzView.h/m:
A UIView subclass that delegates its drawing to another option. Also defines the QuartzViewDelegate protocol that an object can conform to in order to implement drawing into a QuartzView.

Classes/QuartzViewController.h/m:
A UIViewController subclass that manages a single QuartzView and allows the user to set the drawing delegate for that QuartzView.

Quartz/QuartzLineDrawing.h/m:
Demonstrations of Quartz line drawing capabilties (LineDrawing), including setting the stroke width (LineWidthDrawing), cap & join (LineCapJoinDrawing) and dash (LineDashDrawing) properties
Demonstrated APIs: CGContextSetRGBStrokeColor, CGContextStrokePath, CGContextMoveToPoint, CGContextAddLineToPoint, CGContextAddLines, CGContextStrokeLineSegments, CGContextSetLineWidth, CGContextSetLineCap, CGContextSetLineJoin, CGContextSetLineDash, CGContextSaveGState, CGContextRestoreGState.

Quartz/QuartzPolyDrawing.h/m:
Demonstrations of using Quartz to stroke & fill rectangles (RectDrawing) and polygons (PolyDrawing).
Demonstrated APIs: CGContextSetRGBFillColor, CGContextAddRect, CGContextStrokeRect, CGContextAddRects, CGContextFillRect, CGContextFillPath, CGContextSaveGState, CGContextRestoreGState, CGContextClosePath, CGContextEOFillPath, CGContextDrawPath.

Quartz/QuartzCurveDrawing.h/m:
Demonstrates how to use Quartz to draw ellipses & arcs (EllipseArcDrawing) and bezier & quadratic curves (BezierDrawing).
Demonstrated APIs: CGContextAddEllipseInRect, CGContextFillEllipseInRect, CGContextAddArc, CGContextAddArcToPoint, CGContextAddCurveToPoint, CGContextAddQuadCurveToPoint.

Quartz/QuartzImageDrawing.h/m:
Demonstrations of using Quartz for drawing images (ImageDrawing) and PDF files (PDFDrawing)
Demonstrated APIs: CGContextDrawImage, CGContextClipToRect, CGContextDrawTiledImage, CGPDFDocumentCreateWithURL, CGContextTranslateCTM, CGContextScaleCTM, CGPDFDocumentGetPage, CGPDFPageGetDrawingTransform, CGContextConcatCTM, CGContextDrawPDFPage.

Quartz/QuartzRenderedDrawing.h/.m
Demonstrations of using Quartz for drawing gradients (GradientDrawing) and patterns (PatternDrawing)
Demonstrated APIs: CGGradientCreateWithColorComponents, CGContextDrawLinearGradient, CGContextDrawRadialGradient, CGPatternCreate, CGColorSpaceCreatePattern, CGColorCreateWithPattern, CGColorSpaceCreateDeviceRGB, CGContextSetFillColorWithColor, CGContextSetStrokeColorWithColor, CGContextSetFillColorSpace, CGContextSetFillPattern, CGContextSetStrokeColorSpace, CGContextSetStrokePattern.

main.m:
The application's main entry point.

Changes From Previous Versions

2.0: First public release.
1.3: Now uses nibs. Moved gradient drawing into QuartzRenderedDrawing.h/.m and added a pattern drawing demo.
1.2: Updated for Beta 5 for changes to UITableViewDelegate.
1.1: Updated for Beta 4 for changes to UINavigationBarController and UINavigationBar.

Copyright (C) 2008 Apple Inc. All rights reserved.