//
//  FirstGameAppDelegate.h
//  FirstGame
//
//  Created by Anthony Feick on 2/18/11.
//  Copyright W3i 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface FirstGameAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
