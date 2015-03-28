//
//  Utils.h
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+(void) play:(NSString*)name;
+(void) displayNotification:(NSDate*) date withMessage:(NSString*) message sender:(id) sender userInfo:(NSDictionary*) info;

@end
