//
//  CapitalDetailViewController.h
//  Capitales
//
//  Created by Ana Reyna on 27/03/14.
//  Copyright (c) 2014 Ana Reyna. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CapitalTable;
@interface CapitalDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@property (strong, nonatomic) NSString *pais;
@property (strong, nonatomic) NSString *capital;
@property (strong, nonatomic) NSURL *bandera;

@property (strong,nonatomic) CapitalTable *pCapital;


@end
