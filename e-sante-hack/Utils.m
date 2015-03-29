//
//  Utils.m
//  e-sante-hack
//
//  Created by Christopher Saez on 28/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "Utils.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>
#import <AFSoundManager/AFSoundManager.h>

@implementation Utils

+(void) play:(NSString*) name{
	
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	if ([[defaults objectForKey:@"voice"] boolValue] == YES){
		AFSoundItem *item = [[AFSoundItem alloc] initWithLocalResource:name atPath:nil];
		AFSoundPlayback *player = [[AFSoundPlayback alloc] initWithItem:item];
		
		[player play];
		[player listenFeedbackUpdatesWithBlock:^(AFSoundItem *item) {
			NSLog(@"Item duration: %ld - time elapsed: %ld", (long)item.duration, (long)item.timePlayed);
		} andFinishedBlock:^(void) {
			NSLog(@"Track finished playing");
		}];
	}
}

+(void) displayNotification:(NSDate*) date withMessage:(NSString*) message sender:(id) sender userInfo:(NSDictionary*) info{
	UILocalNotification* localNotification = [[UILocalNotification alloc] init];
	localNotification.userInfo = info;
	localNotification.fireDate = date;
	localNotification.alertBody = message;
	localNotification.soundName = UILocalNotificationDefaultSoundName;
	localNotification.timeZone = [NSTimeZone defaultTimeZone];
	localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
	
	NSSet *set = nil;
	if ([[info objectForKey:@"type"] isEqualToString:@"rdv"]){
		UIMutableUserNotificationAction *action = [[UIMutableUserNotificationAction alloc] init];
		action.destructive = YES;
		action.identifier = @"rdv";
		action.title = @"Planifier un nouveau rendez vous";
		action.activationMode = UIUserNotificationActivationModeForeground;
		UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc] init];
		category.identifier = @"rdv";
		[category setActions:@[action] forContext:UIUserNotificationActionContextDefault];
		[category setActions:@[action] forContext:UIUserNotificationActionContextMinimal];
		localNotification.category = @"rdv";
		set = [NSSet setWithObject:category];
	
	}
	UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
	UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:set];
	
	[[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
	
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	
	// Request to reload table view data
	[[NSNotificationCenter defaultCenter] postNotificationName:@"reloadData" object:sender];

}

@end
