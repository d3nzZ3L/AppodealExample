//
//  AppDelegate.m
//  AppodealExample
//
//  Created by Denis Borodavchenko on 14/10/2019.
//  Copyright © 2019 Denis Borodavchenko. All rights reserved.
//

#import "AppDelegate.h"
#import <Appodeal/Appodeal.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    AppodealAdType types = AppodealAdTypeInterstitial | AppodealAdTypeNativeAd;
    [Appodeal setTestingEnabled:YES];
    [Appodeal setLogLevel:APDLogLevelDebug];
    [Appodeal initializeWithApiKey:@"502ca56c1b2fadf8a5101a267f9b72ea77eb297adbc64353" types:types hasConsent:YES];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
