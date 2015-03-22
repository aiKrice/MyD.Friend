//
//  MenuTableViewCell.h
//  e-sante-hack
//
//  Created by Christopher Saez on 22/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *menuItemLabel;

@property (strong, nonatomic) NSString *itemName;

@end
