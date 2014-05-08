//
//  ExampleCustomTabBarViewController.m
//  MHCustomTabBarControllerDemo
//
//  Created by Martin Hartl on 08/05/14.
//  Copyright (c) 2014 Martin Hartl. All rights reserved.
//

#import "ExampleCustomTabBarViewController.h"

NSString * const EXAmpleShowTabBarNotification = @"EXAmpleShowTabBarNotification";
NSString * const EXAmpleHideTabBarNotification = @"EXAmpleHideTabBarNotification";

@interface ExampleCustomTabBarViewController ()

@property (weak, nonatomic) IBOutlet UIView *tabBar;

@end

@implementation ExampleCustomTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabBar) name:EXAmpleHideTabBarNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabBar) name:EXAmpleShowTabBarNotification object:nil];
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)hideTabBar {
    self.tabBar.hidden = YES;
}

- (void)showTabBar {
    self.tabBar.hidden = NO;
}



@end
