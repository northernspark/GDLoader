//
//  ViewController.h
//  GDLoader
//
//  Created by Joe Barbour on 07/04/2016.
//  Copyright © 2016 NorthernSpark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDLoader.h"

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (nonatomic, strong) GDLoader *loader;
@property (nonatomic, strong) UITapGestureRecognizer *gesture;

@end

