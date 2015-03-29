//
//  ConseilViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 29/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "ConseilViewController.h"

@interface ConseilViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *adviceTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ConseilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	self.titleLabel.text = self.titleAdvice;
	self.adviceTextView.text = self.adviceContent;
	self.imageView.image = [UIImage imageNamed:self.adviceImage];
	
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
