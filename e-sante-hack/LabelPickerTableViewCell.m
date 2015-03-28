//
//  LabelPickerTableViewCell.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "LabelPickerTableViewCell.h"

@interface LabelPickerTableViewCell()

@property (strong, nonatomic) IBOutlet UILabel* labelRdv;

@end

@implementation LabelPickerTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didTouchRendezVous:(id)sender {
	[self.delegate didTouchButtonAt:self.indexPath];
}

-(void) setDateRdv:(NSString *)dateRdv{
	_dateRdv = dateRdv;
	self.labelRdv.text = self.dateRdv;
}

@end
