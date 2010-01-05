//
//  BundlePreferableClockAppDelegate.m
//  BundlePreferableClock
//
//  Created by Steve Baker on 12/27/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import "BundlePreferableClockAppDelegate.h"
#import "BundlePreferableClockViewController.h"

@implementation BundlePreferableClockAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release], viewController = nil;
    [window release], window = nil;
    [super dealloc];
}


@end
