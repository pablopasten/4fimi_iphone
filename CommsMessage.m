//
//  CommsMessage.m
//  4fimi
//
//  Created by ryc on 12-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "CommsMessage.h"
#import "Parametros.h"
#import "GlobalPersistance.h"



@implementation CommsMessage

@synthesize activityIndicator;



-(void)setParameters:(UIActivityIndicatorView *)act{
    self.activityIndicator=act;
}

-(NSMutableArray *) getData{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@%@id_usuario=%@",HostUrl,Port,API,ServicioHistorial,[GlobalPersistance getValueOfKey:@"IdUsuario"]];
    
    self.activityIndicator.hidden=FALSE;
    [self.activityIndicator startAnimating];
    
    NSLog(Url);
    
    
    
    url = [NSURL URLWithString:Url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPShouldHandleCookies:YES];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-type"];
    [request setTimeoutInterval:100.0];
    
    NSMutableArray *newJSON;
    
   
        NSData *theData = [NSURLConnection sendSynchronousRequest:request
                                            returningResponse:nil
                                                        error:nil];
     if(theData!=nil){
    
        NSLog(@"Esta es la data %@",theData);
    
        newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                            options:0
                                                              error:nil];
    
        NSLog(@"Sync JSON: %@", newJSON);
    }
    
    return newJSON;
}

-(NSMutableArray *) getDataChart{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@getDatosGraf;id_usuario=%@",HostUrl,Port,API,[GlobalPersistance getValueOfKey:@"IdUsuario"]];
    
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
    NSMutableArray *arr;
    
    if(theData!=nil){
    
        NSLog(@"Esta es la data %@",theData);
    
        NSMutableArray *newJSON = [NSJSONSerialization JSONObjectWithData:theData
                                                              options:0
                                                                error:nil];
        arr=[[NSMutableArray alloc] init];
    
        for(NSDictionary *dic in newJSON){
        
            [arr addObject:[dic objectForKey:@"dato"]];
        }
    
        NSLog(@"Sync JSON: %@", newJSON);
    }
    
    return arr;
}

-(NSMutableArray *) getHistorial100{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@getHistorial100;id_usuario=%@",
                   HostUrl,Port,API,[GlobalPersistance getValueOfKey:@"IdUsuario"]];
    
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
    
    NSMutableArray *newJSON ;
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
