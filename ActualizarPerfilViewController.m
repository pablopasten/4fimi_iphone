//
//  ActualizarPerfilViewController.m
//  4fimi
//
//  Created by ryc on 20-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "ActualizarPerfilViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <ImageIO/CGImageProperties.h>
#import "GlobalPersistance.h"
#import "ActualizarComms.h"

@interface ActualizarPerfilViewController ()

@end

@implementation ActualizarPerfilViewController
@synthesize imageView,Password,EmpresaAnterior,EmpresaActual,Twitter,Instagram,Palabras;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    // Do any additional setup after loading the view from its nib.
    
    actualiza=[ActualizarComms new];
    
    NSDictionary *dic=[actualiza getDataUsuario];
    
    Password.text=[dic objectForKey:@"password"];
    EmpresaActual.text=[dic objectForKey:@"emp1"];
    EmpresaAnterior.text=[dic objectForKey:@"emp2"];
    
    NSMutableArray *palabras =[dic objectForKey:@"palabras"];
    NSMutableArray *rs=[dic objectForKey:@"rs"];
    
    for(NSDictionary *d in rs){
        if([[d objectForKey:@"id_red_social"] isEqualToNumber:@2]){
            Twitter.text=[d objectForKey:@"n_usuario_red"];
        }
        else if([[d objectForKey:@"id_red_social"] isEqualToNumber:@3])
        {
            Instagram.text=[d objectForKey:@"n_usuario_red"];
        }
    }
    
    for (NSDictionary *d in palabras)
    {
        NSString *a=[NSString stringWithFormat:@"%@ ",[d objectForKey:@"palabra"]];
        Palabras.text=[Palabras.text stringByAppendingString:a];
    }
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

- (IBAction)takePhoto:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    
   
    self.imageView.image = chosenImage;
    self.imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    self.imageView.layer.cornerRadius = imageView.frame.size.height /2;
    self.imageView.clipsToBounds = YES;
    //fotoUsuario.layer.borderWidth = 3.0f;
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    
  
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = info[UIImagePickerControllerOriginalImage];
   
    
    
  
      // Save image
    //UIImageWriteToSavedPhotosAlbum(chosenImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
    NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.jpg"];
    
    
    
    // Write a UIImage to JPEG with minimum compression (best quality)
    // The value 'image' must be a UIImage object
    // The value '1.0' represents image compression quality as value from 0.0 to 1.0
    [UIImageJPEGRepresentation(image, 1.0) writeToFile:jpgPath atomically:YES];
    
    // Write image to PNG
    [UIImagePNGRepresentation(image) writeToFile:pngPath atomically:YES];
    
    // Let's check to see if files were successfully written...
    
    // Create file manager
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    // Point to Document directory
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    // Write out the contents of home directory to console
    NSLog(@"Documents directory: %@", [fileMgr contentsOfDirectoryAtPath:documentsDirectory error:&error]);
    [GlobalPersistance setKey:@"fotoUsuario" :pngPath];
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
   }

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    
    // Unable to save the image
    if (error)
        alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                           message:@"Unable to save image to Photo Album."
                                          delegate:self cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil];
    else // All is well
        alert = [[UIAlertView alloc] initWithTitle:@"Success"
                                           message:@"Image saved to Photo Album."
                                          delegate:self cancelButtonTitle:@"Ok"
                                 otherButtonTitles:nil];
    [alert show];
    
}
-(IBAction)volver:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)Actualizar:(UIButton *)sender{
    
    if([actualiza ActualizarUsuario:Password.text :EmpresaActual.text :EmpresaAnterior.text :Palabras.text :Twitter.text :Instagram.text]){
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Información"
                                                              message:@"Datos Actualizados correctamente"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];

    }
    else{
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Información"
                                                              message:@"Error al actualizar datos"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];

    }
    
}

@end
