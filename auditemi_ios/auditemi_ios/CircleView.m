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

-(void) awakeFromNib
{
    [self setUserInteractionEnabled:YES];
}

- (void) drawCircleView {
    NSLog(@"Drawing CircleView");
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath addArcWithCenter:CGPointMake(50, 50) radius:50 startAngle:0 endAngle:4 * M_PI clockwise:YES];
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:bezierPath.CGPath];
    [progressLayer setStrokeColor:[UIColor redColor].CGColor];
    [progressLayer setFillColor:[UIColor clearColor].CGColor];
    [progressLayer setLineWidth:1];
    
    [self.layer addSublayer:progressLayer];
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    oldX = touchLocation.x;
    oldY = touchLocation.y;
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    
    CGRect frame = self.frame;
    frame.origin.x = self.frame.origin.x + touchLocation.x - oldX;
    frame.origin.y =  self.frame.origin.y + touchLocation.y - oldY;
    self.frame = frame;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}


- (void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}


@end
