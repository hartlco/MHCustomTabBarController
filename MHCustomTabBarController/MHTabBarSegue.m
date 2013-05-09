//
//  MHTabBarSegue.m
//  MHTabBarSegue
//
//  Created by Martin Hartl on 09.05.13.
//  Copyright (c) 2013 Martin Hartl. All rights reserved.
//

#import "MHTabBarSegue.h"
#import "MHCustomTabBarController.h"

@implementation MHTabBarSegue
- (void) perform {
    MHCustomTabBarController *tabBarViewController = (MHCustomTabBarController *)self.sourceViewController;
    UIViewController *destinationViewController = (UIViewController *) self.destinationViewController;

    
    destinationViewController.view.frame = tabBarViewController.container.bounds;
    [tabBarViewController addChildViewController:destinationViewController];
    [tabBarViewController.container addSubview:destinationViewController.view];
    [destinationViewController didMoveToParentViewController:tabBarViewController];
    
    tabBarViewController.currentViewController = destinationViewController;
}

@end
