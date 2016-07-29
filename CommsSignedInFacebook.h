//
//  CommsSignedInFacebook.h
//  4fimi
//
//  Created by ryc on 07-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommsSignedInFacebook : NSObject
{
    UIActivityIndicatorView *activityIndicator;
    UIViewController *Ventana;
    NSURL *url;
    NSURL *url2;
    
}

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;
@property (nonatomic,retain) UIViewController *Ventana;

-(void)setParameters:(UIActivityIndicatorView *)act:(UIViewController *)ventana;

-(bool) CreateNewUser:(NSString *)N1:(NSString *) A1:(NSString *)Mail;

@end
