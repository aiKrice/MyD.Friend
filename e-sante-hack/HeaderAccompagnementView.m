//
//  HeaderAccompagnementView.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "HeaderAccompagnementView.h"

@interface HeaderAccompagnementView()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;


@end

@implementation HeaderAccompagnementView

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder {
	
	if ([self.subviews count] == 0){
		HeaderAccompagnementView *header = (HeaderAccompagnementView*) [UIView viewFromNib:@"HeaderAccompagnementView"];
		header.frame = self.frame;
			header.autoresizingMask = self.autoresizingMask;
			header.translatesAutoresizingMaskIntoConstraints = self.translatesAutoresizingMaskIntoConstraints;
		return header;
	}
	
	return self;
}

-(void) setHeaderText:(NSString *)headerText{
	_headerText = headerText;
	self.headerLabel.text = headerText;
}

@end
