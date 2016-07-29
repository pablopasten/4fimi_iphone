//
//  GlobalPersistance.h
//  4fimi
//
//  Created by ryc on 07-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalPersistance : NSObject

{
}

-(void) iniciaPerisitencia;

+(void) setKey :(NSString *) KeyName :(NSString *) Value;

+(NSString*) getValueOfKey: (NSString *)Key;
+(void)resetDefaults;

@end
