//
//  HistorialViewController.m
//  4fimi
//
//  Created by ryc on 13-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "HistorialViewController.h"
#import "CommsMessage.h"
#import "MensajeTableViewCell.h"



@interface HistorialViewController ()

@end



@implementation HistorialViewController

@synthesize Lista;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.Lista registerNib:[UINib nibWithNibName:@"MensajeTableViewCell" bundle:nil] forCellReuseIdentifier:@"CeldaMensaje"];
    
    CommsMessage *cm=[CommsMessage new];
    
    listado=[cm getHistorial100];
    
    Lista.rowHeight = UITableViewAutomaticDimension;
    Lista.estimatedRowHeight = 140;
    
    
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
    
    NSLog(@"Total %d",listado.count);
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
    /*UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
     imgView.image = [UIImage imageNamed:@"p1389216366_circle-arrow-right.png"];
     cell.imageView.image = imgView.image;*/
    
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
