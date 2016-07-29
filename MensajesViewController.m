//
//  MensajesViewController.m
//  4fimi
//
//  Created by ryc on 12-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "MensajesViewController.h"
#import "MensajeTableViewCell.h"
#import "CommsMessage.h"
#import "PNChart.h"

@interface MensajesViewController ()

@end


@implementation MensajesViewController

@synthesize Lista,lineChart;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.Lista registerNib:[UINib nibWithNibName:@"MensajeTableViewCell" bundle:nil] forCellReuseIdentifier:@"CeldaMensaje"];
   
    // Do any additional setup after loading the view from its nib.
    
   /* [self.Lista registerNib:[UINib nibWithNibName:@"MensajeTableViewCell" bundle:[NSBundle mainBundle]]
  forCellWithReuseIdentifier:@"CeldaMensaje"];*/
    
    CommsMessage *cm=[CommsMessage new];
    
    
    listado=[cm getData];
    
    Lista.rowHeight = UITableViewAutomaticDimension;
    Lista.estimatedRowHeight = 140;
    
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 150.0)];
    [lineChart setXLabels:@[@"d1",@"d2",@"d3",@"d4",@"d5",@"d6",@"d7"]];
    
    // Line Chart No.1
    //NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2,@100,@2];
    NSArray * data01Array = [cm getDataChart];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    // Line Chart No.2
    /*NSArray * data02Array = @[@20.1, @180.1, @26.4, @202.2, @126.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNTwitterColor;
    data02.itemCount = lineChart.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };*/
    
    lineChart.chartData = @[data01];
    [lineChart strokeChart];
    
    [self.view addSubview:lineChart];
    
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if(listado.count==0)
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@"Error de conexión al servidor"  message:nil  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}


- (void)userClickedOnLineKeyPoint:(CGPoint)point lineIndex:(NSInteger)lineIndex pointIndex:(NSInteger)pointIndex{
    NSLog(@"Click Key on line %f, %f line index is %d and point index is %d",point.x, point.y,(int)lineIndex, (int)pointIndex);
}

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    NSLog(@"Click on line %f, %f, line index is %d",point.x, point.y, (int)lineIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableView Datasource -

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return listado.count;
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
           return 97; //a default size if the cell index path is anything other than the 1st or second row.
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *CellIdentifier = @"CeldaMensaje";
    
    
    MensajeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    int row= [indexPath row];
    NSDictionary *dic= [listado objectAtIndex:row];
    
    NSLog([dic objectForKey:@"comentario"]);
    cell.Content.text=[dic objectForKey:@"comentario"];
    cell.Date.text=[dic objectForKey:@"fecha"];
    
    if([[dic objectForKey:@"tipo_comentario"] isEqualToString:@"negativo"]){
    
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"ic_sentiment_dissatisfied_black_18dp.png"];
        cell.Type.image = imgView.image;
    }
    else{
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"ic_sentiment_satisfied_black_18dp.png"];
        cell.Type.image = imgView.image;
        
    }
    
    if([[dic objectForKey:@"id_red_social"] isEqualToNumber:@3]){
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"instas.png"];
        cell.Rs.image = imgView.image;
    }
    else if([[dic objectForKey:@"id_red_social"] isEqualToNumber:@2])
    {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"twittercirc.png"];
        cell.Rs.image = imgView.image;

    }
    else if([[dic objectForKey:@"id_red_social"] isEqualToNumber:@4])
    {
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        imgView.image = [UIImage imageNamed:@"googles.png"];
        cell.Rs.image = imgView.image;

    }
    

    

    /*UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
     imgView.image = [UIImage imageNamed:@"p1389216366_circle-arrow-right.png"];
     cell.imageView.image = imgView.image;*/
    
    
        
        UIView * additionalSeparator = [[UIView alloc] initWithFrame:CGRectMake(0,cell.frame.size.height-3,cell.frame.size.width,3)];
    additionalSeparator.backgroundColor = [UIColor grayColor];
    [cell addSubview:additionalSeparator];
    return cell;
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)volver:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}

@end
