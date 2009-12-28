//
//  BundlePreferableClockViewController.h
//  BundlePreferableClock
//
//  Created by Steve Baker on 12/27/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BundlePreferableClockViewController : UIViewController {
#pragma mark instance variables
    BOOL show24Hour;
    NSString *timeZoneName;
    NSTimer *clockViewUpdateTimer;
    NSDateFormatter *clockFormatter;
    
    UILabel *timeLabel;
    UILabel *timeZoneLabel;
}
#pragma mark -
#pragma mark properties

@property(nonatomic,retain)IBOutlet UILabel *timeLabel;
@property(nonatomic,retain)IBOutlet UILabel *timeZoneLabel;


@end

