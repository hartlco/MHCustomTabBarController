//
//  MHCustomTabBarController.h
//  MHCustomTabBarController
//
//  Created by Martin Hartl on 09.05.13.
//  Copyright (c) 2013 Martin Hartl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MHCustomTabBarController : UIViewController

@property(weak,nonatomic)UIViewController *currentViewController;
@property (strong, nonatomic) NSString *currentIdentifier;
@property (weak, nonatomic) IBOutlet UIView *container;
@property (weak, nonatomic) IBOutlet UIView *buttonView;

@end
