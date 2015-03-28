//
//  LabelPickerTableViewCell.h
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RendezVousPickerDelegate <NSObject>

-(void) didTouchButtonAt:(NSIndexPath*) indexPath;

@end

@interface LabelPickerTableViewCell : UITableViewCell;

@property (strong, nonatomic) NSIndexPath* indexPath;
@property (strong, nonatomic) id<RendezVousPickerDelegate> delegate;
@property (strong, nonatomic) NSString *dateRdv;

@end
