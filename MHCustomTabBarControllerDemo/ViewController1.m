//
//  ViewController1.m
//  MHCustomTabBarControllerDemo
//
//  Created by Martin Hartl on 08/05/14.
//  Copyright (c) 2014 Martin Hartl. All rights reserved.
//

#import "ViewController1.h"
#import "ExampleCustomTabBarViewController.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)didTapShowTabBar:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:EXAmpleShowTabBarNotification object:nil];
}

- (IBAction)didTapHideTapBar:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:EXAmpleHideTabBarNotification object:nil];
}


@end
