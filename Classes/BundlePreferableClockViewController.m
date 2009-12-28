//
//  BundlePreferableClockViewController.m
//  BundlePreferableClock
//
//  Created by Steve Baker on 12/27/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import "BundlePreferableClockViewController.h"

@implementation BundlePreferableClockViewController

#pragma mark -
#pragma mark properties

@synthesize timeLabel;
@synthesize timeZoneLabel;


NSString *TwentyFourHourPrefKey = @"24HourDisplay";
NSString *TimeZonePrefKey = @"TimeZone";
NSString *DefaultTimeZonePref = @"America/Detroit";

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

- (void)dealloc {
    self.timeLabel = nil;
    self.timeZoneLabel = nil;
    [clockViewUpdateTimer release], clockViewUpdateTimer = nil;
    [clockFormatter release], clockFormatter = nil;
    
    [super dealloc];
}

- (void)loadPrefs {
    // set app defaults
    timeZoneName = DefaultTimeZonePref;
    // read user prefs
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userTimeZone = [defaults stringForKey:TimeZonePrefKey];
    if (userTimeZone != NULL)
        timeZoneName = userTimeZone;
    [userTimeZone release];
    show24Hour = [defaults boolForKey:TwentyFourHourPrefKey];
}

- (void)setClockFormatter {
    if (nil == clockFormatter) {
        clockFormatter = [[NSDateFormatter alloc] init];
    }
    if (show24Hour)
        [clockFormatter setDateFormat:@"H:mm:ss"];
    else
        [clockFormatter setDateFormat:@"h:mm:ss a"];
    // also update time zone
    [clockFormatter setTimeZone: [NSTimeZone timeZoneWithName:timeZoneName]];
}


- (void)updateClockView {
    NSDate *dateNow = [NSDate date];
    timeLabel.text = [clockFormatter stringFromDate:dateNow];
    timeZoneLabel.text = timeZoneName;
}


- (void)startClock {
    [self updateClockView];
    if (!clockViewUpdateTimer) {
        clockViewUpdateTimer = [NSTimer scheduledTimerWithTimeInterval:0.2
                                                                target:self
                                                              selector:@selector (updateClockView)
                                                              userInfo:NULL
                                                               repeats:YES];
    }
}



/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPrefs];
    [self setClockFormatter];
    [self startClock];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


@end
