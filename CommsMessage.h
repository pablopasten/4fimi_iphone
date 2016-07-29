//
//  CommsMessage.h
//  4fimi
//
//  Created by ryc on 12-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommsMessage : NSObject{
    
    
        UIActivityIndicatorView *activityIndicator;
        NSURL *url;

}

@property (nonatomic,retain) UIActivityIndicatorView *activityIndicator;

-(void)setParameters:(UIActivityIndicatorView *)act;
-(NSMutableArray *) getData;
-(NSMutableArray *) getDataChart;
-(NSMutableArray *) getHistorial100;

@end
