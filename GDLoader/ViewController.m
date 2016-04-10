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

    self.label = [[UIButton alloc] initWithFrame:CGRectMake(30.0, self.view.bounds.size.height - 45.0, self.view.bounds.size.width - 60.0, 30.0)];
    [self.label.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Medium" size:(11.0)]];
    [self.label setBackgroundColor:[UIColor clearColor]];
    [self.label setTitleColor:[[UIColor blackColor] colorWithAlphaComponent:0.7] forState:UIControlStateNormal];
    [self.label setTitle:@"as seen in Grado, download it now!" forState:UIControlStateNormal];
    [self.label addTarget:self action:@selector(viewAppStore)forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.label];
    
    self.gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewToggleLoader)];
    self.gesture.delegate = self;
    [self.loader addGestureRecognizer:self.gesture];
    

}

-(void)viewToggleLoader {
    if (!self.loader.animating) [self.loader beginAnimating];
    else [self.loader stopAnimating];
    
}
                  
-(void)viewAppStore {
    self.store = [[SKStoreProductViewController alloc] init];
    self.store.delegate = self;
    [self.store loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier:@"1090719110"} completionBlock:^(BOOL result, NSError *error) {
        if (result) {
            [self presentViewController:self.store animated:true completion:nil];
            
        }
        
    }];
    
    //Support more projects like this by downloading our app https://itunes.apple.com/us/app/grado-the-worlds-noticeboard/id1090719110?ls=1&mt=8

}

-(void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    [self dismissViewControllerAnimated:true completion:nil];
    
}

-(BOOL)prefersStatusBarHidden {
    return false;
    
}

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
    
}

@end
