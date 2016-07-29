//
//  ViewController.h
//  4fimi
//
//  Created by ryc on 18-05-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "GlobalPersistance.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UIButton *btnLogin;
    IBOutlet UIButton *btnCreateUser;
    
    IBOutlet UITextField *txtUser;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIActivityIndicatorView *activity;
    IBOutlet FBSDKLoginButton *FB;
    GlobalPersistance *global;
}

@property (nonatomic, retain) IBOutlet UITextField *txtUser;
@property (nonatomic, retain) IBOutlet UITextField *txtPassword;
@property (nonatomic, retain) IBOutlet UIButton *btnLogin;
@property (nonatomic, retain) IBOutlet UIButton *btnCreateUser;
@property (nonatomic, retain) IBOutlet FBSDKLoginButton *FB;
@property (nonatomic, retain) UIActivityIndicatorView  *activity;



//ACCIONES Y METODOS


-(IBAction)onLogin:(id)sender;
-(IBAction)Loginwithfacebookaction:(id)sender;
-(IBAction)onCrearUsuario:(id)sender;

@end

