//
//  AppDelegate.h
//  4fimi
//
//  Created by ryc on 18-05-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/CloudMessaging.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GGLInstanceIDDelegate, GCMReceiverDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(nonatomic, readonly, strong) NSString *registrationKey;
@property(nonatomic, readonly, strong) NSString *messageKey;
@property(nonatomic, readonly, strong) NSString *gcmSenderID;
@property(nonatomic, readonly, strong) NSDictionary *registrationOptions;
@end

