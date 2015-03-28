//
//  CommonViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 22/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "CommonViewController.h"
#import <RESideMenu/RESideMenu.h>

@implementation CommonViewController


-(void) viewDidLoad{
	[super viewDidLoad];
	
	if (self.navigationController.viewControllers.count == 1) { // On ne met le bouton du menu hamburger que si il est premier dans la hierarchie
		UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"hamburger"] style:UIBarButtonItemStylePlain target:self action:@selector(didTouchMenuButton)];
		[self.navigationItem setLeftBarButtonItem:leftBarButton];
		[self.navigationController.navigationBar setTintColor:UIColorFromRGB(0x10C3FF)];
	}
}

-(void) didTouchMenuButton{
	[self.sideMenuViewController presentLeftMenuViewController];
	[Utils play:@"open_menu.m4a"];
}

@end
