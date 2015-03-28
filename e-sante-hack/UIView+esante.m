//
//  UIView+esante.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "UIView+esante.h"

@implementation UIView (esante)

+ (UIView *)viewFromNib:(NSString *)nibName {
	NSArray *xib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
	for (id view in xib) { // have to iterate; index varies
		if ([view isKindOfClass:[UIView class]]) return view;
	}
	return nil;
}


@end
