//
//  ActualizarComms.m
//  4fimi
//
//  Created by ryc on 25-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "ActualizarComms.h"
#import "Parametros.h"
#import "GlobalPersistance.h"
@implementation ActualizarComms

@synthesize activityIndicator;



-(void)setParameters:(UIActivityIndicatorView *)act{
    self.activityIndicator=act;
}

-(NSDictionary *) getDataUsuario{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@%@id_usuario=%@",HostUrl,Port,API,ServicioUsuario,[GlobalPersistance getValueOfKey:@"IdUsuario"]];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
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
    NSDictionary *newJSON ;
    if(theData!=nil){
        
        NSLog(@"Esta es la data %@",theData);
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
        
        NSLog(@"Sync JSON: %@", newJSON);
    }
    
    return newJSON;
}


-(NSDictionary *) ActualizarUsuario:(NSString*)Password:(NSString*)EmpresaActual:(NSString *)EmpresaAnterior:
(NSString*)Palabras:(NSString*)Twitter:(NSString*)Instagram{
    
   NSString *Url=[NSString stringWithFormat:@"%@%@%@%@id_usuario=%@;pass=%@;emp1=%@;emp2=%@",HostUrl,Port,API,ServicioModificarUsuario,[GlobalPersistance getValueOfKey:@"IdUsuario"],Password,EmpresaActual,EmpresaAnterior];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
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
    NSDictionary *newJSON ;
    if(theData!=nil){
        
        NSLog(@"Esta es la data %@",theData);
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
        
        NSLog(@"Sync JSON: %@", newJSON);
        
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
     
        
        if ([[newJSON objectForKey:@"cod_salida"] isEqualToNumber:@0]){
            
            if(![Twitter isEqualToString:@""]){
                NSLog(@"Actualizando twitter");
                [self ActualizarTwitter:Twitter];
            }
            
            if(![Instagram isEqualToString:@""]){
                NSLog(@"Actualizando Instagram");
                [self ActualizarInstagram:Instagram];
            }
            
            if(![Palabras isEqualToString:@""]){
                NSArray *words = [Palabras componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
             
                
                NSInteger nWords = [words count];
                NSRange wordRange = NSMakeRange(0, nWords);
                NSArray *firstWords = [[Palabras componentsSeparatedByString:@" "] subarrayWithRange:wordRange];
                NSLog(@"Actualizando palabras");
                for(NSString *p in firstWords){
                
                    [self ActualizarPalabra:p];
                }
            }
        }
        else{
            return NO;
        }

    }
    
    return newJSON;
}


-(NSDictionary *) ActualizarTwitter:(NSString*)Twitter{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@setRedes;n_usuario_red=%@;id_usuario=%@;id_red=2",HostUrl,Port,API,Twitter,[GlobalPersistance getValueOfKey:@"IdUsuario"]];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
    NSLog(Url);
    
    
    
    url = [NSURL URLWithString:Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPShouldHandleCookies:YES];
    [request setHTTPMethod:@"POSTs"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setTimeoutInterval:100.0];
    
    
    
    
    NSData *theData = [NSURLConnection sendSynchronousRequest:request
                                            returningResponse:nil
                                                        error:nil];
    NSDictionary *newJSON ;
    if(theData!=nil){
        
        NSLog(@"Esta es la data %@",theData);
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
        
        NSLog(@"Sync JSON: %@", newJSON);
    }
    
    return newJSON;
}

-(NSDictionary *) ActualizarInstagram:(NSString*)Instagram{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@setRedes;n_usuario_red=%@;id_usuario=%@;id_red=3",HostUrl,Port,API,Instagram,[GlobalPersistance getValueOfKey:@"IdUsuario"]];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
    NSLog(Url);
    
    
    
    url = [NSURL URLWithString:Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPShouldHandleCookies:YES];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setTimeoutInterval:100.0];
    
    
    
    
    NSData *theData = [NSURLConnection sendSynchronousRequest:request
                                            returningResponse:nil
                                                        error:nil];
    NSDictionary *newJSON ;
    if(theData!=nil){
        
        NSLog(@"Esta es la data %@",theData);
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
        
        NSLog(@"Sync JSON: %@", newJSON);
    }
    
    return newJSON;
}

-(NSDictionary *) ActualizarPalabra:(NSString *)Palabra{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@%@id_usuario=%@;palabra=%@",HostUrl,Port,API,ServicioSendPassword,[GlobalPersistance getValueOfKey:@"IdUsuario"],Palabra];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
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
    NSDictionary *newJSON ;
    if(theData!=nil){
        
        NSLog(@"Esta es la data %@",theData);
        
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                  options:0
                                                    error:nil];
        
        NSLog(@"Sync JSON: %@", newJSON);
    }
    
    return newJSON;
}


@end
