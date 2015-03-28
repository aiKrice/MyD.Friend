//
//  AccessibilityViewController.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "AccessibilityViewController.h"

@interface AccessibilityViewController()

@property (weak, nonatomic) IBOutlet UILabel *voiceOverLabel;
@property (weak, nonatomic) IBOutlet UILabel *nightModeLabel;
@property (weak, nonatomic) IBOutlet UILabel *textFontSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *eyeTestLabel;
@property (weak, nonatomic) IBOutlet UISwitch *toggleVoice;

@property (strong, nonatomic) NSMutableArray* items;
@property (weak, nonatomic) IBOutlet UIView *acuiteView;
@property (weak, nonatomic) IBOutlet UILabel *acuiteValue;

- (IBAction)didTouchStepper:(id)sender;

@end


@implementation AccessibilityViewController

-(void) viewDidLoad{
	[super viewDidLoad];

	self.navigationItem.title = @"Accessibilité";
	self.items = [NSMutableArray arrayWithObjects:self.nightModeLabel, self.voiceOverLabel, self.eyeTestLabel, self.textFontSizeLabel, nil];
	
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTouchAcuiteView:)];
	tap.delegate = self;
	self.acuiteView.userInteractionEnabled = YES;
	[self.acuiteView addGestureRecognizer:tap];
}

- (IBAction)didTouchStepper:(id)sender {
	UIStepper *stepper = (UIStepper*) sender;
	self.voiceOverLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
	self.nightModeLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
	self.textFontSizeLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
	self.eyeTestLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
}

- (IBAction)didToggleVoice:(id)sender {
	UISwitch *voiceSwitch = (UISwitch*) sender;
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:[NSNumber numberWithBool:voiceSwitch.on] forKey:@"voice"];
	[defaults synchronize];
	if (voiceSwitch.on){
		[Utils play:@"voice_over.m4a"];
	}
}

- (IBAction)didToggleNightMode:(id)sender {
	UISwitch *nightSwitch = (UISwitch*) sender;
	if (nightSwitch.on){
		[Utils play:@"mode_nuit_on.m4a"];
		self.view.backgroundColor = [UIColor blackColor];
		[self changeColorItems:self.items withColor:[UIColor whiteColor]];
	} else {
		[Utils play:@"mode_nuit_off.m4a"];
		self.view.backgroundColor = [UIColor whiteColor];
		[self changeColorItems:self.items withColor:[UIColor blackColor]];
	}
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setObject:[NSNumber numberWithBool:nightSwitch.on] forKey:@"night"];
	[defaults synchronize];
}

-(void) changeColorItems:(NSArray*)items withColor:(UIColor*) color{
	for (UILabel *label in items){
		label.textColor = color;
	}
}

-(void) didTouchAcuiteView:(UITapGestureRecognizer*) sender{
	[Utils play:@"acuite.m4a"];
	UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
	TestAcuiteViewController *testVC = [storyboard instantiateViewControllerWithIdentifier:@"TestAcuiteViewController"];
	testVC.delegate = self;
	[self.navigationController presentViewController:testVC animated:YES completion:nil];
}

-(void) getResult:(int)result{
	self.acuiteValue.text = [NSString stringWithFormat:@"%d", result];
}
@end
