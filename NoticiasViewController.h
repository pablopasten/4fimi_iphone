//
//  NoticiasViewController.h
//  4fimi
//
//  Created by ryc on 15-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticiasViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *listado;
}
@property (weak, nonatomic) IBOutlet UITableView *Lista;
-(IBAction)volver:(id)sender;
@end
