//
//  CommsCreaUSuario.m
//  4fimi
//
//  Created by ryc on 22-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "CommsCreaUSuario.h"

#import "Parametros.h"
#import "GlobalPersistance.h"
#import "LoginComms.h"
@implementation CommsCreaUSuario

@synthesize activityIndicator;



-(void)setParameters:(UIActivityIndicatorView *)act{
    self.activityIndicator=act;
}

-(bool) setData:(NSString*)Nombre1:(NSString*)Nombre2:(NSString*)Apellido1:
(NSString*)Apellido2:(NSString*)Correo:(NSString*)Password:(NSString*)Twitter:(NSString*)KeyMovil
{
    
    
    if([Twitter isEqualToString:@""]){
        Twitter=@"sin_info";
        
    }
    
    if([Twitter isEqualToString:@""]){
        Twitter=@"sin_info";
        
    }
    NSString *Url=[NSString stringWithFormat:@"%@%@%@%@nombre1=%@;nombre2=%@;apellido1=%@;apellido2=%@;correo=%@;password=%@;twitter=%@;keyMovil=%@",HostUrl,Port,API,ServicioCreaUsuario,Nombre1,Nombre2,Apellido1,Apellido2,Correo,Password,Twitter,KeyMovil];
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
    NSLog(Url);
    
    
    
    url = [NSURL URLWithString:Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPShouldHandleCookies:YES];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setTimeoutInterval:100.0];
    
    NSDictionary *newJSON;
    
    
    NSData *theData = [NSURLConnection sendSynchronousRequest:request
                                            returningResponse:nil
                                                        error:nil];
    if(theData!=nil){
        
        NSLog(@"Esta es la data %@",theData);
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
        
        NSLog(@"Sync JSON: %@", newJSON);
        
        if([[newJSON objectForKey:@"cod_salida"] isEqualToNumber:@1]){
            
            return NO;
        }
        else{
            LoginComms *lg=[LoginComms new];
            
            return [lg getJsonArrayFromServer:Correo:Password];
            
        }
    }
    
    
    
    
    return YES;
}


@end
