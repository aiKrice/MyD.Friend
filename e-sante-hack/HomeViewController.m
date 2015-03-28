//
//  HomeViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 22/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController()

@property (weak, nonatomic) IBOutlet UIWebView *webview;


@end

@implementation HomeViewController

-(void) viewDidLoad{
	[super viewDidLoad];

	NSURL *url = [NSURL URLWithString:@"http://10.10.10.53:3000/history/graph"];
	NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
	
	[self.webview loadRequest:req];
	
	
	
}
	
- (IBAction)refresh:(id)sender {
	[self.webview reload];
}


@end
