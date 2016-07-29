//
//  MensajesViewController.h
//  4fimi
//
//  Created by ryc on 12-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChartDelegate.h"
#import "PNChart.h"

@interface MensajesViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,PNChartDelegate>{
    
    NSMutableArray *listado;
   
    
    
}

@property (weak, nonatomic) IBOutlet UITableView *Lista;
@property (nonatomic)  PNLineChart * lineChart;
-(IBAction)volver:(id)sender;
@end
