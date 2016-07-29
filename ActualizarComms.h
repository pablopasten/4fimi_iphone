//
//  ActualizarComms.h
//  4fimi
//
//  Created by ryc on 25-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface ActualizarComms : NSObject{
    
    UIActivityIndicatorView *activityIndicator;
    NSURL *url;
    
}

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;

-(void)setParameters:(UIActivityIndicatorView *)act;
-(NSDictionary*) getDataUsuario;

-(NSDictionary *) ActualizarUsuario:(NSString*)Password:(NSString*)EmpresaActual:(NSString *)EmpresaAnterior:
(NSString*)Palabras:(NSString*)Twitter:(NSString*)Instagram;
-(NSDictionary *) ActualizarTwitter:(NSString*)Twitter;
-(NSDictionary *) ActualizarTwitter:(NSString*)Instagram;
-(NSDictionary *) ActualizarPalabra:(NSString*)Palabra;


@end
