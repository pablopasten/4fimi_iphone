//
//  HistorialViewController.h
//  4fimi
//
//  Created by ryc on 13-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistorialViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
  
     NSMutableArray *listado;
    
}

@property (weak, nonatomic) IBOutlet UITableView *Lista;

-(IBAction)volver:(id)sender;
@end
