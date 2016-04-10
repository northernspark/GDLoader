//
//  GDLoader.m
//  GDLoader
//
//  Created by Joe Barbour on 07/04/2016.
//  Copyright © 2016 NorthernSpark. All rights reserved.
//

#import "GDLoader.h"

@implementation GDLoader

-(void)drawRect:(CGRect)rect {
    if (self.circles == 0) self.circles = 4;
    if (self.size == 0) self.size = (self.bounds.size.width / 2.5) / self.circles;
    if (self.duration == 0) self.duration = 0.9;
    if (self.hidesWhenStopped) self.alpha = 0.0;
    if (!self.colour) self.colour = [UIColor colorWithWhite:0.5 alpha:0.9];

    for (int i = 0;i < self.circles; i++) {
        UIView *container = [[UIView alloc] initWithFrame:CGRectMake((self.bounds.size.width / self.circles) * i, (self.bounds.size.height / 2)- ((self.bounds.size.width / self.circles) / 2), (self.bounds.size.width / self.circles), (self.bounds.size.width / self.circles))];
        container.backgroundColor = [UIColor clearColor];
        [self addSubview:container];
        
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        layer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake((container.bounds.size.width / 2) - (self.size / 2), (container.bounds.size.height / 2) - (self.size / 2), self.size, self.size) cornerRadius:MAXFLOAT].CGPath;
        layer.fillRule = kCAFillRuleEvenOdd;
        layer.fillColor = self.colour.CGColor;
        layer.lineJoin = kCALineJoinBevel;
        [container.layer addSublayer:layer];
        
    }
    
}

-(void)beginAnimating {
    int delay = 0;
    for(UIView *view in self.subviews) {
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 1.0;
            
        }];
        
        delay++;
        
        CAAnimationGroup *group = [CAAnimationGroup animation];
        group.duration = self.duration;
        group.removedOnCompletion = false;
        group.repeatCount = MAXFLOAT;
        group.autoreverses = true;
        group.beginTime = 0.4 * delay;

        CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scale.fromValue = [NSNumber numberWithFloat:0.8];
        scale.toValue = [NSNumber numberWithFloat:1.05];
        scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        CABasicAnimation *alpha = [CABasicAnimation animationWithKeyPath:@"opacity"];
        alpha.fromValue = [NSNumber numberWithFloat:0.2];
        alpha.toValue = [NSNumber numberWithFloat:1.0];
        alpha.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

        group.animations = @[scale, alpha];
        [view.layer addAnimation:group forKey:@"group"];
        
    }
    
    self.animating = true;
    
}

-(void)stopAnimating {
    if (self.hidesWhenStopped) {
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            self.animating = false;
            for(UIView *view in self.subviews) {
                [view.layer removeAllAnimations];
                
            }

        }];
        
    }
    
}


@end
