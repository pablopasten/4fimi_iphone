//
//  CrearUsuarioViewController.h
//  4fimi
//
//  Created by ryc on 14-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrearUsuarioViewController : UIViewController{
    
    IBOutlet UITextField *nombre1;
    IBOutlet UITextField *nombre2;
    IBOutlet UITextField *apellido1;
    IBOutlet UITextField *apellido2;
    IBOutlet UITextField *twitter;
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
    IBOutlet UIScrollView *scroll;
}

@property (nonatomic, retain) IBOutlet UITextField *nombre1;
@property (nonatomic, retain) IBOutlet UITextField *nombre2;
@property (nonatomic, retain) IBOutlet UITextField *apellido1;
@property (nonatomic, retain) IBOutlet UITextField *apellido2;
@property (nonatomic, retain) IBOutlet UITextField *twitter;
@property (nonatomic, retain) IBOutlet UITextField *email;
@property (nonatomic, retain) IBOutlet UITextField *password;
@property (nonatomic, retain) IBOutlet UIScrollView *scroll;
@property (nonatomic, retain) UIActivityIndicatorView  *activity;


-(IBAction)Crear:(id)sender;

-(IBAction)volver:(id)sender;

@end
