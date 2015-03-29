//
//  HomeViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 22/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//
#import "AppDelegate.h"
#import "HomeViewController.h"

@interface HomeViewController()

@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UILabel *dernierRdvLabel;
@property (weak, nonatomic) IBOutlet UILabel *derniereAlerteLabel;


@end

@implementation HomeViewController

-(void) viewDidLoad{
	[super viewDidLoad];
	
	self.navigationItem.title = @"Récapitulatif";

	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/history/graph", kFullUrl]];
	NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:url];
	
	[self.webview loadRequest:req];
	
}

-(void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	AppDelegate *delegate = [UIApplication sharedApplication].delegate;
	if (delegate.isRdv){
		self.dernierRdv = @"29 mars 2015";
	}
	
	if (delegate.isAlerte){
		self.derniereAlerte = @"29 mars 2015";
	}
}

-(void) setDerniereAlerte:(NSString *)derniereAlerte{
	_derniereAlerte = derniereAlerte;
	self.derniereAlerteLabel.text = derniereAlerte;
}

-(void) setDernierRdv:(NSString *)dernierRdv{
	_dernierRdv = dernierRdv;
	self.dernierRdvLabel.text = dernierRdv;
}


- (IBAction)refresh:(id)sender {
	[self.webview reload];
}




@end
