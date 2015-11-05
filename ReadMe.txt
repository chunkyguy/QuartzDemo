QuartzDemo

QuartzDemo is an iPhone OS application that demonstrates many of the Quartz2D APIs made available by the CoreGraphics framework. Quartz2D forms the foundation of all drawing on iPhone OS and provides facilities for drawing lines, polygons, curves, images, gradients, PDF and many other graphical facilities.

In this sample stroked paths are typically drawn in white. Lines and other graphical elements drawn in red are meant to show some aspect of how the element was constructed, such as the path used to construct the object, or a clipping rectangle used to limit drawing to a particular area and are not part of the actual demonstrated result. Filled paths and areas use colors other than red, with a red fill used to similar effect as with stroked paths.

Build Requirements

iPhone SDK 3.0

Runtime Requirements

iPhone OS 3.0

Source File List

Classes/AppDelegate.h/m:
The application delegate. It creates and sets up the view & navigation controllers for the application.

Classes/MainViewController.h/m:
Implements the main interface to the demo application, allowing the user to display which of Quartz's drawing facilities to demonstrate.

Classes/QuartzView.h/m:
A UIView subclass that is the super class of the other views demonstrated in this sample.

Classes/QuartzViewController.h/m:
A UIViewController subclass that manages a single QuartzView and allows the user to zoom and pan around the hosted QuartzView.

Classes/QuartzBlendingViewController.h/m:
A QuartzViewController subclass that manages a single QuartzView (that is expected to be of type QuartzBlendingView). This view controller also implements a UIPickerView to allow for the selection of foreground color, background color and blending mode.

Quartz/QuartzLineDrawing.h/m:
Demonstrations of Quartz line drawing capabilties (LineDrawingView), including setting the stroke width (LineWidthDrawingView), cap & join (LineCapJoinDrawingView) and dash (LineDashDrawingView) properties
Demonstrated APIs: CGContextSetRGBStrokeColor, CGContextStrokePath, CGContextMoveToPoint, CGContextAddLineToPoint, CGContextAddLines, CGContextStrokeLineSegments, CGContextSetLineWidth, CGContextSetLineCap, CGContextSetLineJoin, CGContextSetLineDash, CGContextSaveGState, CGContextRestoreGState.

Quartz/QuartzPolyDrawing.h/m:
Demonstrations of using Quartz to stroke & fill rectangles (RectDrawingView) and polygons (PolyDrawingView).
Demonstrated APIs: CGContextSetRGBFillColor, CGContextAddRect, CGContextStrokeRect, CGContextAddRects, CGContextFillRect, CGContextFillPath, CGContextSaveGState, CGContextRestoreGState, CGContextClosePath, CGContextEOFillPath, CGContextDrawPath.

Quartz/QuartzCurveDrawing.h/m:
Demonstrates how to use Quartz to draw ellipses & arcs (EllipseArcDrawingView) and bezier & quadratic curves (BezierDrawingView).
Demonstrated APIs: CGContextAddEllipseInRect, CGContextFillEllipseInRect, CGContextAddArc, CGContextAddArcToPoint, CGContextAddCurveToPoint, CGContextAddQuadCurveToPoint.

Quartz/QuartzImageDrawing.h/m:
Demonstrations of using Quartz for drawing images (ImageDrawingView) and PDF files (PDFDrawingView)
Demonstrated APIs: CGContextDrawImage, CGContextClipToRect, CGContextDrawTiledImage, CGPDFDocumentCreateWithURL, CGContextTranslateCTM, CGContextScaleCTM, CGPDFDocumentGetPage, CGPDFPageGetDrawingTransform, CGContextConcatCTM, CGContextDrawPDFPage.

Quartz/QuartzRenderedDrawing.h/.m
Demonstrations of using Quartz for drawing gradients (GradientDrawingView) and patterns (PatternDrawingView)
Demonstrated APIs: CGGradientCreateWithColorComponents, CGContextDrawLinearGradient, CGContextDrawRadialGradient, CGPatternCreate, CGColorSpaceCreatePattern, CGColorCreateWithPattern, CGColorSpaceCreateDeviceRGB, CGContextSetFillColorWithColor, CGContextSetStrokeColorWithColor, CGContextSetFillColorSpace, CGContextSetFillPattern, CGContextSetStrokeColorSpace, CGContextSetStrokePattern.

Quartz/QuartzBlending.h/.m
Demonstrations of Quartz Blending modes (QuartzBlendingView)
Demonstrated APIs: CGContextSetGrayFillColor, CGContextFillRect, CGContextSetBlendMode, CGContextSetFillColorWithColor.

main.m:
The application's main entry point.

Changes From Previous Versions

2.2: Changed the demo classes to be subclasses of the QuartzView class. Improved QuartzViewController to allow the user to zoom and pan the demo views, and to improve its low memory handling. Added a Blending demo.
2.1: Fixed a memory management error in the MainViewController.
2.0: First public release.
1.3: Now uses nibs. Moved gradient drawing into QuartzRenderedDrawing.h/.m and added a pattern drawing demo.
1.2: Updated for Beta 5 for changes to UITableViewDelegate.
1.1: Updated for Beta 4 for changes to UINavigationBarController and UINavigationBar.

Copyright (C) 2008 Apple Inc. All rights reserved.