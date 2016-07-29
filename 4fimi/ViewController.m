//
//  ViewController.m
//  4fimi
//
//  Created by ryc on 18-05-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKAccessToken.h>
#import <FBSDKCoreKit/FBSDKGraphRequest.h>
#import "LoginComms.h"
#import "MenuViewController.h"
#import "GlobalPersistance.h"
#import "AppDelegate.h"
#import "CommsSignedInFacebook.h"
#import "CrearUsuarioViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize activity,txtUser,txtPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    activity.hidden=YES;
    
    global =[[GlobalPersistance alloc]init];
    [global iniciaPerisitencia];
    
    txtPassword.text=@"12345";
    txtUser.text=@"drisopatron@miuandes.cl";
   
    //FB = [[FBSDKLoginButton alloc] init];
    //FB.readPermissions = @[@"email", @"user_friends"];
    //FB.center = CGPointMake(self.view.frame.size.width /2, self.view.frame.size.height - 40);//self.view.center;
  
    //[self.view addSubview:FB];
    
    
    //NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    //[parameters setValue:@"id,name,email" forKey:@"fields"];
    
    /*[[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         
         if (!error) {
             NSLog(@"fetched user:%@  and Email : %@", result,result[@"email"]);
         }
     }];*/

   // NSLog(@"%@",[FBSDKAccessToken currentAccessToken]);
    /*if ([FBSDKAccessToken currentAccessToken]!=nil) {
        NSLog(@"Estoy Aqui!");
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
             }
         }];
    }
    else{
        NSLog(@"ERRORRRR");
    }*/
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    if([GlobalPersistance getValueOfKey:@"NombreUsuario"]!=nil)
    {
        /*NSLog(@"Ya se habia logueado antes");
        MenuViewController *second = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
        [self presentViewController:second animated:YES completion:nil];*/
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onLogin:(id)sender{
    
    NSLog(@"apretado");
    
    NSLog(@"texto %@",txtUser.text);
    
    if([txtUser.text isEqualToString:@""] || [txtPassword.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Debes Ingresar tu usuario y contraseña"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
        
    }
    else{
        
        
        if(![self validateEmail:txtUser.text]){
        
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Debes ingresar un correo valido"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
            [self presentViewController:alertController animated:YES completion:nil];
        
        }
        else
        {
           
            
            LoginComms *lc=[LoginComms new];
            
            [lc setParameters:activity];
            if([lc getJsonArrayFromServer:txtUser.text :txtPassword.text])
            {
               NSLog(@"logueado correctamente");
                
                MenuViewController *second = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
                [self presentViewController:second animated:YES completion:nil];
            }
            else{
                UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Error en usuario y password, verifica tus datos"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
                [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    [self dismissViewControllerAnimated:YES completion:nil];
                }]];
                [self presentViewController:alertController animated:YES completion:nil];

            }
            
        }
        
    }
    
    
}


- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}

- (IBAction)Loginwithfacebookaction:(id)sender
{
    NSLog(@"AAAAAA");
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];
    
    [login logInWithReadPermissions:@[@"public_profile",@"email", @"user_friends"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error)
        {
            NSLog(@"Process error");
        }
        else if (result.isCancelled)
        {
            NSLog(@"Cancelled");
        }
        else
        {
            NSLog(@"eeexito");
            [self fetchUserInfo];
        }
    }];
    
    
    
    
    /**************************/
}


-(void)fetchUserInfo {
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
        NSLog(@"Token is available");
        NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
        [parameters setValue:@"id,name,email" forKey:@"fields"];
        
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"Fetched User Information:%@", result);
                 
                 NSDictionary *dic=result;
                 NSLog ([dic objectForKey:@"id"]);
                 //[GlobalPersistance setKey:@"idFacebook" :[dic objectForKey:@"id"]];
                 
                 CommsSignedInFacebook *csf=[CommsSignedInFacebook new];
                 
                 [csf setParameters:activity:self];
                 
                 NSString *Name=[[dic objectForKey:@"name"] substringWithRange:NSMakeRange(0,NSMaxRange([[dic objectForKey:@"name"] rangeOfString:@" "])-1)];
                
                 
                 NSLog(Name);
                  NSString *Ap1=[[dic objectForKey:@"name"] substringFromIndex:NSMaxRange([[dic objectForKey:@"name"] rangeOfString:@" "])];
                 
                 Ap1=[Ap1 substringWithRange:NSMakeRange(0,NSMaxRange([Ap1 rangeOfString:@" "])-1)];
                 NSLog (Ap1);
                 
                 if([csf CreateNewUser:Name:Ap1:[dic objectForKey:@"email"]])
                 {
                     
                     [GlobalPersistance setKey:@"IdFacebook" :[dic objectForKey:@"id"]];
                     NSLog(@"Logueado Con Facebook correctamente");
                     MenuViewController *second = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
                     [self presentViewController:second animated:YES completion:nil];

                 }
                 else{
                     //NO SE PUDO LOGUEAR CON FACEBOOK
                     
                     UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Problemas al iniciar sesión con facebook"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
                     [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                         [self dismissViewControllerAnimated:YES completion:nil];
                     }]];
                     [self presentViewController:alertController animated:YES completion:nil];
                 }
                 
             }
             else {
                 NSLog(@"Error %@",error);
             }
         }];
        
    } else {
        
        NSLog(@"User is not Logged in");
        
    }
}


-(IBAction)onCrearUsuario:(id)sender{
    CrearUsuarioViewController *second = [[CrearUsuarioViewController alloc] initWithNibName:@"CrearUsuarioViewController" bundle:nil];
    [self presentViewController:second animated:YES completion:nil];
    
}

/******************************************
 *        MANEJO DE CUADROS DE TEXTO      *
 *                                        *
 *****************************************/


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const float movementDuration = 0.3f; // tweak as needed
    int movementDistance; // tweak as needed
    if(textField == txtUser) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 100 : 30);
    }
    else if(textField == txtPassword) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 110 : 40);
    }
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        if(orientation == UIInterfaceOrientationLandscapeLeft) {
            self.view.frame = CGRectOffset(self.view.frame, movement, 0);
        }
        else if(orientation == UIInterfaceOrientationLandscapeRight) {
            self.view.frame = CGRectOffset(self.view.frame, -movement, 0);
        }
    }
    else {
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    }
    [UIView commitAnimations];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == txtUser)
    {
        [textField resignFirstResponder];
        [txtPassword becomeFirstResponder];
    }
    else if (textField ==txtPassword)
    {
        [textField resignFirstResponder];
        
    }
    
    return YES;
}



@end
