//
//  CommsCreaUSuario.h
//  4fimi
//
//  Created by ryc on 22-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommsCreaUSuario : NSObject{
    
    
    UIActivityIndicatorView *activityIndicator;
    NSURL *url;
    IBOutlet UIActivityIndicatorView *activity;
}

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;

-(void)setParameters:(UIActivityIndicatorView *)act;
-(bool) setData:(NSString*)Nombre1:(NSString*)Nombre2:(NSString*)Apellido1:
 Apellido2:(NSString*)Correo:(NSString*)Password:(NSString*)Twitter:(NSString*)KeyMovil;
@end
