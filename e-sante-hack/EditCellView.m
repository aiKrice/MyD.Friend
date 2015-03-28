//
//  EditCellView.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "EditCellView.h"

@interface EditCellView()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation EditCellView

- (void)awakeFromNib {
    // Initialization code
	
	self.textField.delegate = self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setPlaceholderText:(NSString *)placeholderText{
	self.textField.placeholder = placeholderText;
}


@end
