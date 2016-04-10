//
//  GDLoader.h
//  GDLoader
//
//  Created by Joe Barbour on 07/04/2016.
//  Copyright © 2016 NorthernSpark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDLoader : UIView

@property (nonatomic) int circles;
@property (nonatomic) UIColor *colour;
@property (nonatomic) float size;
@property (nonatomic) float duration;
@property (nonatomic) BOOL hidesWhenStopped;
@property (nonatomic) BOOL animating;

-(void)beginAnimating;
-(void)stopAnimating;

@end
