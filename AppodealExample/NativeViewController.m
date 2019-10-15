//
//  NativeViewController.m
//  AppodealExample
//
//  Created by Denis Borodavchenko on 14/10/2019.
//  Copyright © 2019 Denis Borodavchenko. All rights reserved.
//

#import "NativeViewController.h"
#import <Appodeal/Appodeal.h>
#import "APDNativeView.h"

@interface NativeViewController () <APDNativeAdQueueDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) APDNativeAdQueue* nativeAdQueue;
@property (nonatomic, strong) NSMapTable <NSIndexPath *,__kindof APDNativeAd *>* nativeAdStack;
@property (nonatomic, strong) APDNativeAd * nativeAd;
@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.nativeAdStack = [NSMapTable strongToStrongObjectsMapTable];
    self.nativeAdQueue = [APDNativeAdQueue nativeAdQueueWithSdk:nil settings:[self nativeAdSettings] delegate:self autocache:YES];
    [self.nativeAdQueue loadAd];
}

- (APDNativeAdSettings *)nativeAdSettings {
    APDNativeAdSettings * _instance = [APDNativeAdSettings new];
    _instance.adViewClass = APDNativeView.class;
    _instance.type = APDNativeAdTypeAuto;
    return _instance;
}
- (void)adQueueAdIsAvailable:(APDNativeAdQueue *)adQueue ofCount:(NSUInteger)count {
    [self.tableView reloadData];
}

- (void)adQueue:(APDNativeAdQueue *)adQueue failedWithError:(NSError *)error {
    NSLog(@"ERRRROOOOOR === %@", error.localizedDescription);
}

- (void)presentNativeOnView:(UIView *)view fromIndex:(NSIndexPath *)index {
    self.nativeAd = nil;
    if ([self.nativeAdStack objectForKey:index]) {
        self.nativeAd = [self.nativeAdStack objectForKey:index];
    } else if (self.nativeAdQueue.currentAdCount) {
        self.nativeAd = [[self.nativeAdQueue getNativeAdsOfCount:1] firstObject];
        [self.nativeAdStack setObject:self.nativeAd forKey:index];
    }
    if (self.nativeAd) {
        UIView *nativeView = [self.nativeAd getAdViewForController:self];//Тут крешится
        [view addSubview:nativeView];
        NSArray<NSLayoutConstraint*>* constraints = @[[nativeView.leftAnchor constraintEqualToAnchor:view.leftAnchor],
                                                      [nativeView.rightAnchor constraintEqualToAnchor:view.rightAnchor],
                                                      [nativeView.topAnchor constraintEqualToAnchor:view.topAnchor],
                                                      [nativeView.bottomAnchor constraintEqualToAnchor:view.bottomAnchor]];
        [NSLayoutConstraint activateConstraints:constraints];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nativeCell" forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        [self presentNativeOnView:cell.contentView fromIndex:indexPath];
    }
    return cell;
}
@end
