//
//  ViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 21/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)awakeFromNib
{
	self.menuPreferredStatusBarStyle = UIStatusBarStyleLightContent;
	self.contentViewShadowColor = [UIColor blackColor];
	self.contentViewShadowOffset = CGSizeMake(0, 0);
	self.contentViewShadowOpacity = 0.6;
	self.contentViewShadowRadius = 12;
	self.contentViewShadowEnabled = YES;
	
	self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
	self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
	
	//self.delegate = self;
}

@end
