//
//  UIView+MLKit.m
//  MLDevKit
//
//  Created by 刘双伟 on 16/7/20.
//  Copyright © 2016年 刘双伟. All rights reserved.
//

#import "UIView+MLKit.h"

@implementation UIView (MLKit)

// Borders
- (void)createBordersWithColor:(UIColor *)color withCornerRadius:(CGFloat)radius andWidth:(CGFloat)width
{
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
    self.layer.shouldRasterize = NO;
    self.layer.rasterizationScale = 2;
    self.layer.edgeAntialiasingMask = kCALayerLeftEdge | kCALayerRightEdge | kCALayerBottomEdge | kCALayerTopEdge;
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGColorRef cgColor = [color CGColor];
    self.layer.borderColor = cgColor;
    CGColorSpaceRelease(space);
}

- (void)removeBorders
{
    self.layer.borderWidth = 0;
    self.layer.cornerRadius = 0;
    self.layer.borderColor = nil;
}

- (void)setCornerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    [self.layer setMasksToBounds:YES];
}

// Shadows
- (void)createRectShadowWithOffset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius
{
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.masksToBounds = NO;
}

- (void)removeShadow
{
    [self.layer setShadowColor:[[UIColor clearColor] CGColor]];
    [self.layer setShadowOpacity:0.0f];
    [self.layer setShadowOffset:CGSizeMake(0.0f, 0.0f)];
}


// Animations
- (void)shakeView
{
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    shake.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-5.0f, 0.0f, 0.0f)], [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(5.0f, 0.0f, 0.0f)]];
    shake.autoreverses = YES;
    shake.repeatCount = 2.0f;
    shake.duration = 0.07f;
    
    [self.layer addAnimation:shake forKey:nil];
}

- (void)pulseViewWithTime:(CGFloat)seconds
{
    [UIView animateWithDuration:seconds/6 animations:^{
        [self setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
    } completion:^(BOOL finished) {
        if(finished)
        {
            [UIView animateWithDuration:seconds/6 animations:^{
                [self setTransform:CGAffineTransformMakeScale(0.96, 0.96)];
            } completion:^(BOOL finished) {
                if(finished)
                {
                    [UIView animateWithDuration:seconds/6 animations:^{
                        [self setTransform:CGAffineTransformMakeScale(1.03, 1.03)];
                    } completion:^(BOOL finished) {
                        if(finished)
                        {
                            [UIView animateWithDuration:seconds/6 animations:^{
                                [self setTransform:CGAffineTransformMakeScale(0.985, 0.985)];
                            } completion:^(BOOL finished) {
                                if(finished)
                                {
                                    [UIView animateWithDuration:seconds/6 animations:^{
                                        [self setTransform:CGAffineTransformMakeScale(1.007, 1.007)];
                                    } completion:^(BOOL finished) {
                                        if(finished)
                                        {
                                            [UIView animateWithDuration:seconds/6 animations:^{
                                                [self setTransform:CGAffineTransformMakeScale(1, 1)];
                                            } completion:^(BOOL finished) {
                                                if(finished)
                                                {
                                                    
                                                }
                                            }];
                                        }
                                    }];
                                }
                            }];
                        }
                    }];
                }
            }];
        }
    }];
}


@end
