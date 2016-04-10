//
//  ViewController.m
//  GDLoader
//
//  Created by Joe Barbour on 07/04/2016.
//  Copyright © 2016 NorthernSpark. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated {
    [self.loader beginAnimating];
    
}

-(void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loader = [[GDLoader alloc] initWithFrame:CGRectMake(self.view.center.x - 80.0, self.view.center.y - 55.0, 160.0, 110.0)];
    self.loader.backgroundColor = [UIColor clearColor];
    self.loader.colour = [UIColor colorWithRed:54.0/255.0 green:211.0/255.0 blue:143.0/255.0 alpha:1.0];
    self.loader.hidesWhenStopped = true;
    [self.view addSubview:self.loader];

    self.gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewToggleLoader)];
    self.gesture.delegate = self;
    [self.view addGestureRecognizer:self.gesture];
    
}

-(void)viewToggleLoader {
    if (!self.loader.animating) [self.loader beginAnimating];
    else [self.loader stopAnimating];
    
}

-(BOOL)prefersStatusBarHidden {
    return false;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
    
}

@end
