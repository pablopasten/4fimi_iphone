//
//  GlobalPersistance.m
//  4fimi
//
//  Created by ryc on 07-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "GlobalPersistance.h"

@implementation GlobalPersistance

static NSUserDefaults * persist;

-(void) iniciaPerisitencia
{
    //persist=[NSUserDefaults standardUserDefaults];
    persist=[[NSUserDefaults alloc] initWithSuiteName:@"fimi"];
    
}

+(void) setKey :(NSString *) KeyName :(NSString *) Value
{
    [persist setObject:Value forKey:KeyName];
    [persist synchronize];
}

+(NSString*) getValueOfKey: (NSString *)Key
{
    
    return [persist stringForKey:Key];
}

+(void)resetDefaults {
    NSDictionary * dict = [persist dictionaryRepresentation];
    for (id key in dict) {
        [persist removeObjectForKey:key];
    }
    [persist synchronize];
}

@end
