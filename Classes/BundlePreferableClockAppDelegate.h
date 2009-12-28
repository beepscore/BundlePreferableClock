//
//  BundlePreferableClockAppDelegate.h
//  BundlePreferableClock
//
//  Created by Steve Baker on 12/27/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BundlePreferableClockViewController;

@interface BundlePreferableClockAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    BundlePreferableClockViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet BundlePreferableClockViewController *viewController;

@end

