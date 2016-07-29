//
//  MenuViewController.h
//  4fimi
//
//  Created by ryc on 06-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewCell.h"

@interface MenuViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource>{
    
    IBOutlet UIButton *btnVolver;
    IBOutlet UIImageView *fotoUsuario;
    //IBOutlet UICollectionView *Grilla;
    NSArray *dataArray;
    
}

@property (nonatomic, retain) IBOutlet UIButton *btnVolver;
@property (nonatomic, retain) IBOutlet UIImageView *fotoUsuario;
@property (weak, nonatomic) IBOutlet UICollectionView *Grilla;
@property (strong, nonatomic) NSMutableArray *Images;
-(IBAction)volver:(id)sender;

@end
