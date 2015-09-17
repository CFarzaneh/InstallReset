#import <UIKit/UIKit.h>
#import <SpringBoard/SBApplication.h>

@interface FBBundleInfo : NSObject

@property(copy, nonatomic) NSString *displayName; 

@end

@interface FBApplicationPlaceholder : FBBundleInfo

@property(readonly, nonatomic) double percentComplete;

@end

static NSDictionary *prefs;
BOOL enabled;
BOOL enabledforinstall;
BOOL enabledforuninstall;

static void installResetPrefs() {
    prefs = [[NSDictionary alloc] initWithContentsOfFile:[NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.cfarzaneh.installresetprefs.plist"]];
    enabled = [[prefs objectForKey:@"killswitch"] boolValue];
	enabledforinstall = [[prefs objectForKey:@"forinstall"] boolValue];
	enabledforuninstall = [[prefs objectForKey:@"foruninstall"] boolValue];
}


%hook FBApplicationPlaceholder

- (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4 {
	%orig;
	installResetPrefs();
	if (enabled) {
	if (enabledforinstall) {
	if (self.percentComplete == 0.96) {
		    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        		
	NSString *iconStatePlist = [@"/User/Library/SpringBoard/IconState.plist" stringByExpandingTildeInPath];
    	[[NSFileManager defaultManager] removeItemAtPath:iconStatePlist error:nil];

	GSSendAppPreferencesChanged(CFSTR("com.apple.springboard"), CFSTR("iconState"));

    });
	}
	}
	}
}

%end

%hook SBApplicationController

-(void)uninstallApplication:(SBApplication *)application {
	%orig;
	installResetPrefs();
	if (enabled) {
	if (enabledforuninstall) {
	NSString *iconStatePlist = [@"/User/Library/SpringBoard/IconState.plist" stringByExpandingTildeInPath];
    	[[NSFileManager defaultManager] removeItemAtPath:iconStatePlist error:nil];

	GSSendAppPreferencesChanged(CFSTR("com.apple.springboard"), CFSTR("iconState"));
	}
}
}

%end