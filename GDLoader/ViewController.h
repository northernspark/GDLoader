//
//  ViewController.h
//  GDLoader
//
//  Created by Joe Barbour on 07/04/2016.
//  Copyright © 2016 NorthernSpark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "GDLoader.h"

@interface ViewController : UIViewController <UIGestureRecognizerDelegate, SKStoreProductViewControllerDelegate>

@property (nonatomic, strong) GDLoader *loader;
@property (nonatomic, strong) UITapGestureRecognizer *gesture;
@property (nonatomic, strong) UIButton *label;
@property (nonatomic, strong) SKStoreProductViewController *store;

@end

