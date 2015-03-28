//
//  TestAcuiteViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "TestAcuiteViewController.h"

@interface TestAcuiteViewController()

@property (strong, nonatomic) IBOutlet UIView *container;

@end

@implementation TestAcuiteViewController

-(void) viewDidLoad{
	[super viewDidLoad];
	
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchTest:)];
	tap.delegate = self;
	self.container.userInteractionEnabled = YES;
	[self.container addGestureRecognizer:tap];
	
}

-(void) didTouchTest:(UITapGestureRecognizer*) sender{
	
	[self dismissViewControllerAnimated:YES completion:^{
		[self.delegate getResult:7];
	}];
}

@end
