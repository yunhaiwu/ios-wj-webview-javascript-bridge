//
//  AppDelegate.m
//  WJWebViewJavascriptBridge-example
//
//  Created by 吴云海 on 16/6/24.
//  Copyright © 2016年 wuyunhai. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleUIWebViewController.h"
#import "ExampleWKWebViewController.h"
//#import "CocoaLumberjack.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //配置CocoaLumberjack日志
//#ifdef DEBUG
//    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelAll];
//#else
//    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelError];
//#endif
//    
//    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    
    // 1. Create the UIWebView example
    ExampleUIWebViewController* UIWebViewExampleController = [[ExampleUIWebViewController alloc] init];
    UIWebViewExampleController.tabBarItem.title             = @"UIWebView";
    
    // 2. Create the tab footer and add the UIWebView example
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController addChildViewController:UIWebViewExampleController];
    
    // 3. Create the  WKWebView example for devices >= iOS 8
    Class wkWebViewClass = NSClassFromString(@"WKWebView");
    if(wkWebViewClass) {
        ExampleWKWebViewController* WKWebViewExampleController = [[ExampleWKWebViewController alloc] init];
        WKWebViewExampleController.tabBarItem.title             = @"WKWebView";
        [tabBarController addChildViewController:WKWebViewExampleController];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
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
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
