#import <Preferences/Preferences.h>

@interface installresetprefsListController: PSListController {
}
@end

@implementation installresetprefsListController
- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"installresetprefs" target:self] retain];
	}
	return _specifiers;
}
-(void)openTwitterLink:(id)arg1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/persian_cam"]];
}

-(void)installPrefsDonate:(id)arg1 {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://bit.ly/1N2lQve"]];
}

@end

// vim:ft=objc
