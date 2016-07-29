//
//  MenuViewController.m
//  4fimi
//
//  Created by ryc on 06-07-16.
//  Copyright © 2016 ryc. All rights reserved.
//

#import "MenuViewController.h"
#import "GlobalPersistance.h"
#import "MyCollectionViewCell.h"
#import "MensajesViewController.h"
#import "HistorialViewController.h"
#import "NoticiasViewController.h"
#import "ActualizarPerfilViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

@synthesize fotoUsuario,Grilla,Images;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.Grilla registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:[NSBundle mainBundle]]
        forCellWithReuseIdentifier:@"Celda"];
    
      Images = [@[@"ic_forum_white_36pt.png",
                @"ic_face_white_36pt.png",
                @"ic_restore_white_36pt.png",
                @"ic_import_contacts_white_36pt.png",
                @"ic_mail_white_36pt.png"
                ] mutableCopy];
   
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

-(IBAction)volver:(id)sender{
    [GlobalPersistance resetDefaults];
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:
(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView
    numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%d",Images.count);
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                 cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Entreeee");
    MyCollectionViewCell *myCell = [collectionView
                                     dequeueReusableCellWithReuseIdentifier:@"Celda"
                                     forIndexPath:indexPath];
    
     
    UIImage *image;
    int row = [indexPath row];
    NSLog(@"Esta es el numero %@",Images[row]);
    
    image = [UIImage imageNamed:Images[row]];
    
    
    myCell.imageView.image = image;
    
    return myCell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    int row = [indexPath row];
   
    
    switch (row)
    
    {
        case 0:
        {
            NSLog(@"Toqué el 0");
            MensajesViewController *second = [[MensajesViewController alloc] initWithNibName:@"MensajesViewController" bundle:nil];
            [self presentViewController:second animated:YES completion:nil];
        }
        break;
        case 1:
        {
            NSLog(@"Toqué el 1");
            ActualizarPerfilViewController *second = [[ActualizarPerfilViewController alloc] initWithNibName:@"ActualizarPerfilViewController" bundle:nil];
            [self presentViewController:second animated:YES completion:nil];
        }
        break;
        case 2:
        {
            NSLog(@"Toqué el 2");
            NSLog(@"Toqué el 0");
            HistorialViewController *second = [[HistorialViewController alloc] initWithNibName:@"HistorialViewController" bundle:nil];
            [self presentViewController:second animated:YES completion:nil];
        }
        break;
        case 3:
        {
            NSLog(@"Toqué el 3");
            NoticiasViewController *second = [[NoticiasViewController alloc] initWithNibName:@"NoticiasViewController" bundle:nil];
            [self presentViewController:second animated:YES completion:nil];
        }
        break;
        case 4:
        {
            NSLog(@"Toqué el 4");
        }
            break;
            
    
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if([GlobalPersistance getValueOfKey:@"IdFacebook"]!=nil){
        NSString *u= [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large",[GlobalPersistance getValueOfKey:@"IdFacebook"]];
        NSURL *url = [NSURL URLWithString:u];
        
        NSData *data = [[NSData alloc] initWithContentsOfURL:url];
        
        UIImage *tmpImage = [[UIImage alloc] initWithData:data];
        
        
        fotoUsuario.image = tmpImage;
    }
    else{
        NSLog(@"Entre al primer IF");
        //NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.png"];
        if([GlobalPersistance getValueOfKey:@"fotoUsuario"]!=nil){
            NSLog(@"Entre al segundo IF");
            NSString  *pngPath = [GlobalPersistance getValueOfKey:@"fotoUsuario"];
            UIImage *graphImage = [[UIImage alloc] initWithContentsOfFile: pngPath];
            
            fotoUsuario.image=graphImage;
            fotoUsuario.center = CGPointMake(100.0, 100.0);
            
            //rotate rect
            fotoUsuario.transform = CGAffineTransformMakeRotation(M_PI_2);
        }
    }
    fotoUsuario.layer.cornerRadius = fotoUsuario.frame.size.width / 2;
    fotoUsuario.layer.cornerRadius = fotoUsuario.frame.size.height /2;
    fotoUsuario.clipsToBounds = YES;
    //fotoUsuario.layer.borderWidth = 3.0f;
    fotoUsuario.layer.borderColor = [UIColor whiteColor].CGColor;
    //fotoUsuario.layer.cornerRadius = 10.0f;

}

@end
