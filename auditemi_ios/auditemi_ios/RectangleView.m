//
//  RectangleView.m
//  auditemi_ios
//
//  Created by cuelogic on 24/09/15.
//  Copyright (c) 2015 cuelogic. All rights reserved.
//

#import "RectangleView.h"

@implementation RectangleView {
    float oldX, oldY;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self drawRectangleView];
        
        UIPinchGestureRecognizer *uiPinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]
                                                              initWithTarget:self action:@selector(pinchGestureAction:)];
        uiPinchGestureRecognizer.delegate = self;
        [self addGestureRecognizer:uiPinchGestureRecognizer];
    }
    return self;
}

- (void)pinchGestureAction:(UIPinchGestureRecognizer*)recognizer {
    NSLog(@"pinch begin, scale: %f",recognizer.scale);
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (void) drawRectangleView {
    NSLog(@"Drawing RectangleView");

    UIBezierPath *aPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 120, 120) cornerRadius:0.0];
    
    CAShapeLayer *progressLayer = [[CAShapeLayer alloc] init];
    [progressLayer setPath:aPath.CGPath];
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

    if((self.frame.origin.x + touchLocation.x - oldX) <= 0 ||
       (self.frame.origin.x + touchLocation.x + oldX) >= self.superview.frame.size.width) {
        oldX = touchLocation.x;
        return;
    }
    
    if((self.frame.origin.y + touchLocation.y - oldY) <= 0 ||
       (self.frame.origin.y + touchLocation.y + oldY) >= self.superview.frame.size.height ) {
        oldY = touchLocation.y;
        return;
    }
    
    if((self.frame.origin.x + touchLocation.x + self.frame.size.width - oldX ) >= self.superview.frame.size.width) {
        oldX = touchLocation.x;
        return;
    }
    
    if((self.frame.origin.y + touchLocation.y + self.frame.size.height - oldY ) >= self.superview.frame.size.height){
        oldY = touchLocation.y;
        return;
    }
    
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

