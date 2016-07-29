//
//  MensajeTableViewCell.m
//  4fimi
//
//  Created by ryc on 12-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "MensajeTableViewCell.h"

@implementation MensajeTableViewCell
@synthesize Content;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)viewDidLoad
{
    
    Content.lineBreakMode = NSLineBreakByWordWrapping;
    Content.numberOfLines = 0;
}



@end
