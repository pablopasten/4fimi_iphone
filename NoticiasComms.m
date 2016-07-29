//
//  NoticiasComms.m
//  4fimi
//
//  Created by ryc on 15-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "NoticiasComms.h"
#import "Parametros.h"
#import "GlobalPersistance.h"


@implementation NoticiasComms
@synthesize activityIndicator;



-(void)setParameters:(UIActivityIndicatorView *)act{
    self.activityIndicator=act;
}

-(NSMutableArray *) getData{
    
    NSString *Url=[NSString stringWithFormat:@"%@%@%@getNoticias",HostUrl,Port,API];
    
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
