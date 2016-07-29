//
//  LoginComms.m
//  4fimi
//
//  Created by ryc on 18-05-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "LoginComms.h"
#import "Parametros.h"
#import "GlobalPersistance.h"

@implementation LoginComms
@synthesize JsonArrayResult,activityIndicator;

-(void)setParameters:(UIActivityIndicatorView *)act{
    
   
    self.activityIndicator=act;
    
}

-(bool)  getJsonArrayFromServer:(NSString *)Usuario:(NSString*)Password
{
    bool result=true; // asumo que se loguea
    NSString *Url=[NSString stringWithFormat:@"%@%@%@%@correo=%@;pass=%@",HostUrl,Port,API,ServicioLogin,Usuario,Password];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
    __block NSMutableDictionary *json = nil;
    
    NSLog(Url);
    
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
    
        NSDictionary *newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                            options:0
                                                              error:nil];
    
        NSLog(@"Sync JSON: %@", newJSON);
        NSNumber *val=@1;
    
        if([[newJSON objectForKey:@"cod_salida"] isEqualToNumber:val]){
        
            NSLog(@"FALSOOOOOO");
            result= false;
        }
    
        [self.activityIndicator stopAnimating];
        self.activityIndicator.hidden=YES;
        
        if([[newJSON objectForKey:@"cod_salida"] isEqualToNumber:@0]){
            
            //Es un usuario que tiene credenciales asi que me las guardo y aviso que puede entrar a la app
            [GlobalPersistance setKey:@"IdUsuario" :[newJSON objectForKey:@"idUsuario"]];
            [GlobalPersistance setKey:@"NombreUsuario" :[newJSON objectForKey:@"nombre"]];
            [GlobalPersistance setKey:@"Perfil" :[newJSON objectForKey:@"perfil"]];
            
            result=YES;
            
            
        }
        else{
            result=NO; //error
        }

    }
    else{
        result=false;
    }
    
    return result;
}


@end
