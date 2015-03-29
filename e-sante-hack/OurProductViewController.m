//
//  OurProductViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 22/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "OurProductViewController.h"

@interface OurProductViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property (weak, nonatomic) IBOutlet UIView *container;

@end

@implementation OurProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"NOS PRODUITS DE DEMAIN";
	
    // Do any additional setup after loading the view.
	//NSURL *url = [NSURL URLWithString:@"http://www.medecingeek.com/category/objets-connectes/"];
	NSURL *url = [NSURL URLWithString:@"http://www.sanofi.com/"];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	[self.webview loadRequest:request];
	
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClose:)];
	tap.delegate = self;
	self.container.userInteractionEnabled = YES;
	[self.container addGestureRecognizer:tap];
	
}

-(void) didClose:(UITapGestureRecognizer*) sender{
	CGRect frame = self.container.frame;
	frame.origin.y = self.view.frame.size.height;
	
	[UIView animateWithDuration:0.5
						  delay:0
						options: UIViewAnimationCurveEaseOut
					 animations:^{
						 self.container.frame = frame;
					 }
					 completion:^(BOOL finished){
						 NSLog(@"Done!");
					 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
