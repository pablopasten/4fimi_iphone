//
//  LoginComms.h
//  4fimi
//
//  Created by ryc on 18-05-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface LoginComms : NSObject{
    NSArray *JsonArrayResult;
    UIActivityIndicatorView *activityIndicator;
    NSURL *url;
    


}

@property (nonatomic,retain) NSArray *JsonArrayResult;

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;

-(void)setParameters:(UIActivityIndicatorView *)act;
-(bool)  getJsonArrayFromServer:(NSString *)Usuario:(NSString*)Password;

-(void) jsonArraySet:(NSArray *)JsonArray;
-(NSArray *) jsonArrayGet;


@end
