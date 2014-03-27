//
//  CapitalDetailViewController.m
//  Capitales
//
//  Created by Ana Reyna on 27/03/14.
//  Copyright (c) 2014 Ana Reyna. All rights reserved.
//

@import MapKit;
@import CoreLocation;

#import "CapitalDetailViewController.h"

@interface CapitalDetailViewController () <MKMapViewDelegate>

@property (strong, nonatomic) CLGeocoder *geocoder;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *lblPais;
@property (weak, nonatomic) IBOutlet UILabel *lblCapital;

/* - (void)configureView;*/
@end

@implementation CapitalDetailViewController

- (CLGeocoder *)geocoder
{
    if (!_geocoder)
    {
        _geocoder = [[CLGeocoder alloc] init];
    }
    return _geocoder;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
       /* [self configureView]; */
    }
}


/*
- (void)configureView
{
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];

    [_lblPais setText:self.pais];
    [_lblCapital setText:self.capital];
    
    /*[self configureView];*/
    
    
    [self.geocoder geocodeAddressString:self.capital completionHandler:^(NSArray *placemarks, NSError *error)
     {
         if (!error)
         {
             if ([placemarks count])
             {
                 CLPlacemark *placemark = [placemarks firstObject];
                 
                 self.mapView.region = MKCoordinateRegionMakeWithDistance(placemark.location.coordinate, 250, 250);
                 
                 MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                 annotation.coordinate = placemark.location.coordinate;
                 annotation.title = self.capital;
                 [self.mapView addAnnotation:annotation];
             }
         }
     }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) return nil;
    
    MKPinAnnotationView *pin = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"Pin"];
    pin.annotation = annotation;
    pin.pinColor = MKPinAnnotationColorRed;
    return pin;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
