//
//  CrearUsuarioViewController.m
//  4fimi
//
//  Created by ryc on 14-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "CrearUsuarioViewController.h"
#import "CommsCreaUSuario.h"
#import "MenuViewController.h"

@interface CrearUsuarioViewController ()

@end

@implementation CrearUsuarioViewController
@synthesize nombre1,nombre2,apellido1,apellido2,twitter,email,password,activity;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


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
    if(textField == nombre1) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 100 : 30);
    }
    else if(textField == nombre2) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 110 : 40);
    }
    else if(textField == apellido1) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 120 : 50);
    }
    else if(textField ==apellido2 ) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 130 : 60);
    }
    else if(textField ==twitter ) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 150 : 90);
    }
    else if(textField ==email ) {
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 180 : 130);
    }
    else if(textField ==password ) {
        NSLog(@"eeeeee");
        movementDistance = ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? 200 : 150);
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
    if (textField == nombre1)
    {
        [textField resignFirstResponder];
        [nombre2 becomeFirstResponder];
    }
    else if (textField == nombre2)
    {
        [textField resignFirstResponder];
        [apellido1 becomeFirstResponder];
    }
    else if (textField == apellido1)
    {
        [textField resignFirstResponder];
        [apellido2 becomeFirstResponder];
    }
    else if (textField == apellido2)
    {
        [textField resignFirstResponder];
        [twitter becomeFirstResponder];
    }
    else if (textField == twitter)
    {
        [textField resignFirstResponder];
        [email becomeFirstResponder];
    }

    else if (textField == email)
    {
        [textField resignFirstResponder];
        [password becomeFirstResponder];
    }

    else if (textField ==password)
    {
        [textField resignFirstResponder];
        
    }
    
    return YES;
}


-(IBAction)volver:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

-(IBAction)Crear:(id)sender{
    
    CommsCreaUSuario *ccu=[CommsCreaUSuario new];
    
    //[ccu setParameters:activity];
    
    if([nombre1.text isEqualToString:@""]||[apellido1.text isEqualToString:@""]||[email.text isEqualToString:@""]||[password.text isEqualToString:@""]){
        
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Los campos Primer nombre,Apellido paterno, email y password son obligatorios."  message:nil  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else{
        if([ccu setData:nombre1.text :nombre2.text :apellido1.text :apellido2.text :email.text :password.text :twitter.text :@"123455"]){
            MenuViewController *second = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
            [self presentViewController:second animated:YES completion:nil];
        }
        else{
            UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"No hemos podido crear tu usuario."  message:nil  preferredStyle:UIAlertControllerStyleAlert];
            [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            }]];
            [self presentViewController:alertController animated:YES completion:nil];
        
        }
    }

}

@end
