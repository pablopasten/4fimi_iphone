//
//  NoticiasViewController.m
//  4fimi
//
//  Created by ryc on 15-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "NoticiasViewController.h"
#import "NoticiasTableViewCell.h"
#import "NoticiasComms.h"
@interface NoticiasViewController ()

@end

@implementation NoticiasViewController
@synthesize Lista;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.Lista registerNib:[UINib nibWithNibName:@"NoticiasTableViewCell" bundle:nil] forCellReuseIdentifier:@"CeldaNoticias"];
    
    NoticiasComms *nc=[NoticiasComms new];
    Lista.rowHeight = UITableViewAutomaticDimension;
    Lista.estimatedRowHeight = 140;

    
    listado=[nc getData];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
    
    
    static NSString *CellIdentifier = @"CeldaNoticias";
    
    
    NoticiasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    int row= [indexPath row];
    NSDictionary *dic= [listado objectAtIndex:row];
    
    NSLog([dic objectForKey:@"comentario"]);
    cell.Titulo.text=[dic objectForKey:@"titulo"];
    cell.Contenido.text=[dic objectForKey:@"contenido"];
    
    NSString *u= [NSString stringWithFormat:[dic objectForKey:@"foto"]];
    NSURL *url = [NSURL URLWithString:u];
   
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    
    UIImage *tmpImage = [[UIImage alloc] initWithData:data];
     cell.foto.image = tmpImage;
    
    
    
    UIView * additionalSeparator = [[UIView alloc] initWithFrame:CGRectMake(0,cell.frame.size.height-3,cell.frame.size.width,3)];
    additionalSeparator.backgroundColor = [UIColor grayColor];
    [cell addSubview:additionalSeparator];
    return cell;
    
}

-(IBAction)volver:(id)sender{
    [self dismissModalViewControllerAnimated:YES];
}


@end
