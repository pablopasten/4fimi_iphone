//
//  NoticiasTableViewCell.h
//  4fimi
//
//  Created by ryc on 15-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticiasTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *foto;
@property (strong, nonatomic) IBOutlet UILabel *Titulo;
@property (strong, nonatomic) IBOutlet UITextView *Contenido;
@end
