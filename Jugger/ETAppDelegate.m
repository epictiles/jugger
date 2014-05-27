//
//  ETAppDelegate.m
//  Jugger
//
//  Created by Barney Mattox on 5/23/14.
//  Copyright (c) 2014 Joshua Brown and Barney Mattox. All rights reserved.
//

#import "ETAppDelegate.h"
#import "ETJugger.h"
#import "ETJuggerTeam.h"
#import "ETJuggerSettings.h"
#import "ETPlayViewController.h"
#import "ETRootViewController.h"
#import "ETDataViewController.h"


#define kLevelFileName @"defaults"

@implementation ETAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    // Initialize defaults file
    [self copyDefaultsToDocuments];
    
    
    // Load Default Data
//    NSString *thePath = [[NSBundle mainBundle] pathForResource:kLevelFileName ofType:@"plist"];
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSLog(@"paths = %@", paths);
    
    NSString* thePath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"defaults.plist"];
    NSDictionary *defaults = [[NSDictionary alloc] initWithContentsOfFile:thePath];
    // Settings
    NSDictionary *rawSettings = [defaults valueForKey:@"Settings"];
    ETJuggerSettings* settings = [[ETJuggerSettings alloc] initWithDictionary:rawSettings];
    
    // Playbook
    NSArray *rawPlaybookArray = [defaults valueForKey:@"Playbook"];
    
    // Teams
    NSArray *rawTeamsArray = [defaults valueForKey:@"Teams"];
    NSMutableArray* teamsArray = [NSMutableArray array];
    int index = 0;
    for (NSDictionary* teamDict in rawTeamsArray){
        ETJuggerTeam *aTeam = [[ETJuggerTeam alloc] initWithDictionary:teamDict];
        [teamsArray addObject:aTeam];
        index++;
    }
    

    
    if ([self.window.rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* rootVC = (UITabBarController*)self.window.rootViewController;
        ETPlayViewController* playVC = (ETPlayViewController*)[[rootVC viewControllers] objectAtIndex:0];
        playVC.fieldModel = [[settings fields] objectAtIndex:0]; //TODO: Pull last viewed from defaults
        
    }
    
    

    
    
    return YES;
}

- (void)copyDefaultsToDocuments
{
    // Setup Sample File
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSString *dataPath = [[self applicationDocumentsDirectory] stringByAppendingPathComponent:@"defaults.plist"];
    NSLog(@"Datapath is %@", dataPath);

    //TODO: Remove for final release
    // Remove the existing data file to reset to defaults
//    if ([fileManager fileExistsAtPath:dataPath] == YES)
//    {
//        [fileManager removeItemAtPath:dataPath error:&error];
//    }
    // If the expected store doesn't exist, copy the default store.
    if ([fileManager fileExistsAtPath:dataPath] == NO)
    {
        NSString *sampleDataPath = [[NSBundle mainBundle] pathForResource:@"defaults" ofType:@"plist"];
        [fileManager copyItemAtPath:sampleDataPath toPath:dataPath error:&error];
    }
    
}

- (void)addToPlaybook:(ETField*)field
{
    
}

/**
 Returns the URL to the application's Documents directory.
 */
- (NSString *)applicationDocumentsDirectory
{
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths lastObject];
    
    //    return [NSURL fileURLWithPath:documentPath];
    return documentPath;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
