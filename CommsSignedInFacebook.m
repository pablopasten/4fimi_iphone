//
//  CommsSignedInFacebook.m
//  4fimi
//
//  Created by ryc on 07-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "CommsSignedInFacebook.h"
#import "Parametros.h"
#import "GlobalPersistance.h"

@implementation CommsSignedInFacebook
@synthesize activityIndicator,Ventana;



-(void)setParameters:(UIActivityIndicatorView *)act:(UIViewController*)ventana{
    self.activityIndicator=act;
    self.Ventana=ventana;
}

-(bool) CreateNewUser:(NSString *)N1:(NSString *) A1:(NSString *)Mail{
    
    bool resultado=YES; // asumo que se inscribe en la bd;
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@%@nombre1=%@;nombre2=_;apellido1=%@;apellido2=_;correo=%@;password=123456;twitter=sin_info;keyMovil=na",HostUrl,Port,API,ServicioCreaUsuario,N1,A1,Mail];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
    //NSLog(Url);
   
    
    
    url = [NSURL URLWithString:Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPShouldHandleCookies:YES];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setTimeoutInterval:100.0];
    
    
    
    
    NSData *theData = [NSURLConnection sendSynchronousRequest:request
                                            returningResponse:nil
                                                        error:nil];
    if (theData!=nil){
    NSLog(@"Esta es la data %@",theData);
    
    NSDictionary *newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                            options:0
                                                              error:nil];
    
    NSLog(@"Sync JSON: %@", newJSON);
    NSNumber *val=@1;
    if([[newJSON objectForKey:@"cod_salida"] isEqualToNumber:val]){
    
        if([[newJSON objectForKey:@"des_salida"] isEqualToString:@"ya existe!!"]){
            
            NSString *Url2=[NSString stringWithFormat:@"%@%@%@%@correo=%@",HostUrl,Port,API,LoginFacebook,Mail];
            
            NSLog(Url2);
            url2 = [NSURL URLWithString:Url2];
            NSMutableURLRequest *request2 = [NSMutableURLRequest requestWithURL:url2];
            
            [request2 setHTTPShouldHandleCookies:YES];
            [request2 setHTTPMethod:@"GET"];
            [request2 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
            [request2 setTimeoutInterval:100.0];
            
            NSData *theDatas = [NSURLConnection sendSynchronousRequest:request2
                                                    returningResponse:nil
                                                                error:nil];
            
            NSLog(@"Esta es la data %@",theDatas);
            
            NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:theDatas
                                                                    options:0
                                                                      error:nil];
            NSLog(@"Sync JSON2: %@", JSON);
            
            
            if([[JSON objectForKey:@"cod_salida"] isEqualToNumber:@0]){
                
                //Es un usuario que tiene credenciales asi que me las guardo y aviso que puede entrar a la app
                [GlobalPersistance setKey:@"IdUsuario" :[JSON objectForKey:@"idUsuario"]];
                [GlobalPersistance setKey:@"NombreUsuario" :[JSON objectForKey:@"nombre"]];
                [GlobalPersistance setKey:@"Perfil" :[JSON objectForKey:@"perfil"]];
                
                resultado=YES;
                
                
            }
            else{
                resultado=NO; //error
            }

            
        }
        else
        {
           resultado=NO; //error
        }
        
        
    }
    else{
        //Lo Inscribio como nuevo usuario con facebook ya que no existia
        
        //TODO: debo hacer esto!!
        
    }
    }
    else{
        
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Error de Conexion a la Red"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self.Ventana dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self.Ventana presentViewController:alertController animated:YES completion:nil];

        return nil;
    }

    
    return resultado;
}
  
    
  



@end
