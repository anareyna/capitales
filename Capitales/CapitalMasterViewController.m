//
//  CapitalMasterViewController.m
//  Capitales
//
//  Created by Ana Reyna on 27/03/14.
//  Copyright (c) 2014 Ana Reyna. All rights reserved.
//

#import "CapitalMasterViewController.h"
#import "CapitalTable.h"
#import "CapitalDetailViewController.h"

@interface CapitalMasterViewController () <UITableViewDataSource, UITableViewDelegate>
/*{
    NSMutableArray *_objects;
}
 */
@property (strong, nonatomic) NSArray *plist;
@property (strong, nonatomic) NSMutableArray *capitales;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation CapitalMasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (NSArray *)plist {
    if (!_plist) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"capitales" ofType:@"plist"];
        _plist = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _plist;
}

- (NSMutableArray *)capitales
{
    if (!_capitales)
    {
        _capitales = [[NSMutableArray alloc] init];
    }
    return _capitales;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.plist enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         CapitalTable *capital = [[CapitalTable alloc] initWithPais:obj[@"pais"] capital:obj[@"capital"] andBandera:[NSURL URLWithString:obj[@"bandera"]]];
         [self.capitales addObject:capital];
     }];
    
    
    //self.navigationItem.title= self.navTitle;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.capitales count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    CapitalTable *capitales = self.capitales[indexPath.row];
    cell.textLabel.text = capitales.pais;
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CapitalTable *capital = self.capitales[indexPath.row];
        
        CapitalDetailViewController *vc = segue.destinationViewController;
        vc.capital = capital.capital;
        vc.pais = capital.pais;
        vc.bandera = capital.bandera;
        vc.pCapital = capital;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}


@end
