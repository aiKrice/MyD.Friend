//
//  TestAcuiteViewController.h
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AcuiteDelegate <NSObject>

-(void) getResult:(int) result;

@end

@interface TestAcuiteViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic) id<AcuiteDelegate> delegate;

@end
