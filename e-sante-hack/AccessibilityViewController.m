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

- (IBAction)didTouchStepper:(id)sender;

@end


@implementation AccessibilityViewController
- (IBAction)didTouchStepper:(id)sender {
	UIStepper *stepper = (UIStepper*) sender;
	self.voiceOverLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
	self.nightModeLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
	self.textFontSizeLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
	self.eyeTestLabel.font = [self.voiceOverLabel.font fontWithSize:[stepper value]];
}

@end
