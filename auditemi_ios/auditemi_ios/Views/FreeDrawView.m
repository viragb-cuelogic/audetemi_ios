//
//  FreeDrawView.m
//  auditemi_ios
//
//  Created by cuelogic on 25/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "FreeDrawView.h"

@implementation FreeDrawView {
    UIBezierPath *path;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor clearColor]];
        path = [UIBezierPath bezierPath];
        [path setLineWidth:3.0];
        [self drawFreeDrawView];
    }
    return self;
}

- (void) drawFreeDrawView {
    path = [UIBezierPath bezierPath];
    [path setLineWidth:3.0];
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:path.CGPath];
    [progressLayer setLineWidth:3];
    
    [self.layer addSublayer:progressLayer];
    
}

- (void)drawRect:(CGRect)rect {
    [[UIColor blackColor] setStroke];
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}


@end
