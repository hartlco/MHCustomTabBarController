//
//  MHCustomTabBarController.m
//  MHCustomTabBarController
//
//  Created by Martin Hartl on 09.05.13.
//  Copyright (c) 2013 Martin Hartl. All rights reserved.
//

#import "MHCustomTabBarController.h"

@implementation MHCustomTabBarController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.presentingViewController beginAppearanceTransition: YES animated: animated];
}

-(void) viewDidAppear:(BOOL)animated
{
    [self.presentingViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.presentingViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.presentingViewController endAppearanceTransition];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.childViewControllers.count < 1) {
        [self performSegueWithIdentifier:@"viewController1" sender:[_buttonView.subviews objectAtIndex:0]];
    }
}


#pragma mark - Forwarding

- (BOOL)shouldAutomaticallyForwardRotationMethods {
    return YES;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods {
    return YES;
}

#pragma mark - Rotation

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    for (UIViewController *vc  in self.childViewControllers) {
        [vc.view setFrame:self.container.bounds];
    }
    
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    for (UIButton *button in _buttonView.subviews) {
        [button setSelected:NO];
    }
        
    UIButton *button = (UIButton *)sender;
    [button setSelected:YES];
    self.currentIdentifier = segue.identifier;
    self.currentViewController = segue.destinationViewController;

    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if ([self.currentIdentifier isEqual:identifier]) {
        //Dont perform segue, if visible ViewController is already the destination ViewController
        return NO;
    }
    
    return YES;
}

#pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    for (UIViewController *vc in self.childViewControllers) {
        if (![vc isEqual:self.currentViewController]) {
            [vc willMoveToParentViewController:nil];
            [vc removeFromParentViewController];
        }
    }
    NSLog(@"amount of children: %d", [self.childViewControllers count]);
}

@end
