//
//  CircleView.m
//  auditemi_ios
//
//  Created by cuelogic on 24/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "CircleView.h"

@implementation CircleView {
    float oldX, oldY;
    BOOL dragging;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self drawCircleView];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

- (void) drawCircleView {
    NSLog(@"Drawing CircleView");
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:4 * M_PI clockwise:YES];
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:bezierPath.CGPath];
    [progressLayer setStrokeColor:[UIColor redColor].CGColor];
    [progressLayer setFillColor:[UIColor clearColor].CGColor];
    [progressLayer setLineWidth:1];
    
    [self.layer addSublayer:progressLayer];
}


@end
