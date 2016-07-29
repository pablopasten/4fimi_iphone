//
//  MensajeTableViewCell.h
//  4fimi
//
//  Created by ryc on 12-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MensajeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *Rs;
@property (strong, nonatomic) IBOutlet UIImageView *Type;
@property (strong, nonatomic) IBOutlet UILabel *Content;
@property (strong, nonatomic) IBOutlet UILabel *Date;

@end
