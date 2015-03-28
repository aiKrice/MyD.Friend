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

@end
