//
//  CapitalTable.m
//  Capitales
//
//  Created by Ana Reyna on 27/03/14.
//  Copyright (c) 2014 Ana Reyna. All rights reserved.
//

#import "CapitalTable.h"

@implementation CapitalTable

- (instancetype)initWithPais:(NSString *)pais capital:(NSString *)capital andBandera:(NSURL *)bandera {
    self = [super init];
    
    if (self) {
        self.pais = pais;
        self.capital = capital;
        self.bandera = bandera;
    }
    return self;
}


-(UIImage *)imageFromServer
{
    NSLog(@"Download started");
    
    NSData *data = [[NSData alloc] initWithContentsOfURL:self.bandera];
    
    NSLog(@"Data: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    UIImage *image = [[UIImage alloc] initWithData:data];
    
    NSLog(@"Image: %@", image);
    
    return image;
}

@end
