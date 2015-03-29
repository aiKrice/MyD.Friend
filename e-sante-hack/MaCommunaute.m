//
//  MaCommunauté.m
//  e-sante-hack
//
//  Created by Christopher Saez on 27/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "MaCommunaute.h"

@interface MaCommunaute()
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIView *landing;

@end

@implementation MaCommunaute


-(void) viewDidLoad{
	[super viewDidLoad];
	self.navigationItem.title = @"MA COMMUNTÉ";
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchView:)];
	tap.delegate = self;
	self.landing.userInteractionEnabled = YES;
	[self.landing addGestureRecognizer:tap];

	NSURL *url = [NSURL URLWithString:@"http://forum.doctissimo.fr/sante/diabete/liste_sujet-1.htm#block_topics_list"];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	[self.webview loadRequest:request];

}

-(void) didTouchView:(UITapGestureRecognizer*) sender{
	CGRect frame = self.landing.frame;
	frame.origin.y = self.view.frame.size.height;
	
	[UIView animateWithDuration:0.5
						  delay:0
						options: UIViewAnimationCurveEaseOut
					 animations:^{
						 self.landing.frame = frame;
					 }
					 completion:^(BOOL finished){
						 NSLog(@"Done!");
					 }];

}


@end
