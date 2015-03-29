//
//  AppDelegate.m
//  e-sante-hack
//
//  Created by Christopher Saez on 21/03/15.
//  Copyright (c) 2015 solumobile. All rights reserved.
//

#import "AppDelegate.h"
#import "AlertViewController.h"
#import <SIOSocket/SIOSocket.h>


@interface AppDelegate ()

@property (strong, nonatomic) SIOSocket *socket;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	[SIOSocket socketWithHost: @"http://10.10.10.53:3000" response: ^(SIOSocket *socket) {
		self.socket = socket;
		socket.onConnect = ^(){
			[self.socket on:@"history" callback: ^(SIOParameterArray *args) {
				NSDictionary *dict = [args objectAtIndex:0];
				if ([[dict objectForKey:@"glycemie"] integerValue] > 10){
					[Utils play:@"anomalie.m4a"];
					RESideMenu *controller = (RESideMenu*)self.window.rootViewController;
					UIViewController *controllers = controller.contentViewController;
					if ([controllers isKindOfClass:[UINavigationController class]]){
						UINavigationController *nv = (UINavigationController*) controllers;
						UIStoryboard *s = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
						AlertViewController *alert = [s instantiateViewControllerWithIdentifier:@"AlertViewController"];
						[nv presentViewController:alert animated:YES completion:nil];
					}
				}
			 }];
		};
		
		socket.onError = ^(NSDictionary *errorInfo){
			NSLog(@"Error");
		};
		

	}];

	return YES;

}



- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(NSString *)identifier forLocalNotification:(UILocalNotification *)notification completionHandler:(void(^)())completionHandler{
	completionHandler();
}

- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 application.applicationIconBadgeNumber = 0;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
