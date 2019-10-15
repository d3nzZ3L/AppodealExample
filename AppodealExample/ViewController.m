//
//  ViewController.m
//  AppodealExample
//
//  Created by Denis Borodavchenko on 14/10/2019.
//  Copyright © 2019 Denis Borodavchenko. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)showNativeAdVC:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"nativeVC"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
