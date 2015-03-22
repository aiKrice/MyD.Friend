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

@end

@implementation OurProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	NSURL *url = [NSURL URLWithString:@"http://www.medecingeek.com/category/objets-connectes/"];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	[self.webview loadRequest:request];
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
