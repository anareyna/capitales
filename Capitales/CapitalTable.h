//
//  CapitalTable.h
//  Capitales
//
//  Created by Ana Reyna on 27/03/14.
//  Copyright (c) 2014 Ana Reyna. All rights reserved.
//
@import UIKit;

#import <Foundation/Foundation.h>

@interface CapitalTable : NSObject

@property (strong, nonatomic) NSString *pais;
@property (strong, nonatomic) NSString *capital;
@property (strong, nonatomic) NSURL *bandera;

- (instancetype)initWithPais:(NSString *)pais capital:(NSString *)capital andBandera:(NSURL *)bandera;
- (UIImage *)imageFromServer;
@end
