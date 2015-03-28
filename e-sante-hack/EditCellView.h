//
//  EditCellView.h
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ValidatePickerDelegate <NSObject>

-(void) didValidatePicker:(NSDate*) date forIndexPath:(NSIndexPath*) indexPath;

@end

@interface EditCellView : UITableViewCell<UITextFieldDelegate>

@property (strong, nonatomic) NSString *placeholderText;
@property (strong, nonatomic) NSIndexPath *indexPath;

@property (strong, nonatomic) id<ValidatePickerDelegate> delegate;

@end
