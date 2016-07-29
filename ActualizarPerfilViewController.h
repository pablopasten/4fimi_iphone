//
//  ActualizarPerfilViewController.h
//  4fimi
//
//  Created by ryc on 20-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActualizarComms.h"

@interface ActualizarPerfilViewController : UIViewController<UIImagePickerControllerDelegate>{
    ActualizarComms *actualiza;
    IBOutlet UITextField *Password;
    IBOutlet UITextField *EmpresaActual;
    IBOutlet UITextField *EmpresaAnterior;
    IBOutlet UITextField *Palabras;
    IBOutlet UITextField *Twitter;
    IBOutlet UITextField *Instagram;
    
}



@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UITextField *Password;
@property (nonatomic, retain) IBOutlet UITextField *EmpresaActual;
@property (nonatomic, retain) IBOutlet UITextField *EmpresaAnterior;
@property (nonatomic, retain) IBOutlet UITextField *Palabras;
@property (nonatomic, retain) IBOutlet UITextField *Twitter;
@property (nonatomic, retain) IBOutlet UITextField *Instagram;


- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)selectPhoto:(UIButton *)sender ;
- (IBAction)Actualizar:(UIButton *)sender ;
-(IBAction)volver:(id)sender;



@end
