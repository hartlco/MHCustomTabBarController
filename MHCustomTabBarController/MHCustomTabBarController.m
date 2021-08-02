/*
 * Copyright (c) 2015 Martin Hartl
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "MHCustomTabBarController.h"

#import "MHTabBarSegue.h"

NSString *const MHCustomTabBarControllerViewControllerChangedNotification = @"MHCustomTabBarControllerViewControllerChangedNotification";
NSString *const MHCustomTabBarControllerViewControllerAlreadyVisibleNotification = @"MHCustomTabBarControllerViewControllerAlreadyVisibleNotification";

@interface MHCustomTabBarController ()

@property (nonatomic, strong) NSMutableDictionary *viewControllersByIdentifier;
@property (strong, nonatomic) NSString *destinationIdentifier;

@end

@implementation MHCustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewControllersByIdentifier = [NSMutableDictionary dictionary];
    self.replacesOldViewController = YES;
    self.usesTabs = YES;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (!self.usesTabs) {
        return;
    }
    
    assert(self.buttons || self.segmentedControl);
    
    id sender = (self.buttons) ? self.buttons[0] : self.segmentedControl;
    
    if (self.childViewControllers.count < 1) {
        [self performSegueWithIdentifier:@"viewController1" sender:sender];
    }
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    self.destinationViewController.view.frame = self.container.bounds;
}

#pragma mark - Segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if (!self.usesTabs || ![segue isKindOfClass:[MHTabBarSegue class]]) {
        [super prepareForSegue:segue sender:sender];
        return;
    }

    ((MHTabBarSegue *)segue).replacesOldViewController = self.replacesOldViewController;
    
    self.oldViewController = self.destinationViewController;
    
    //if view controller isn't already contained in the viewControllers-Dictionary
    if (!self.viewControllersByIdentifier[segue.identifier]) {
        self.viewControllersByIdentifier[segue.identifier] = segue.destinationViewController;
    }
    
    assert(self.buttons || self.segmentedControl);
    
    if (self.buttons) {
        for (UIButton *btn in self.buttons) {
            if (self.keepsSelection) {
                continue;
            }

            btn.selected = NO;
        }

        [sender setSelected:YES];
        self.selectedIndex = [self.buttons indexOfObject:sender];
    } else {
        [sender setSelected:YES];
        self.selectedIndex = self.segmentedControl.selectedSegmentIndex;
    }

    self.destinationIdentifier = segue.identifier;
    self.destinationViewController = self.viewControllersByIdentifier[self.destinationIdentifier];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:MHCustomTabBarControllerViewControllerChangedNotification object:nil]; 
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {

    if (!self.usesTabs) {
        return [super shouldPerformSegueWithIdentifier:identifier sender:sender];
    }

    if ([self.destinationIdentifier isEqual:identifier]) {
        //Dont perform segue, if visible ViewController is already the destination ViewController
        [[NSNotificationCenter defaultCenter] postNotificationName:MHCustomTabBarControllerViewControllerAlreadyVisibleNotification object:nil];
        return NO;
    }
    
    return YES;
}

#pragma mark - Memory Warning
- (void)didReceiveMemoryWarning {

    if (!self.usesTabs) {
        [super didReceiveMemoryWarning];
        return;
    }

    [[self.viewControllersByIdentifier allKeys] enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        if (![self.destinationIdentifier isEqualToString:key]) {
            [self.viewControllersByIdentifier removeObjectForKey:key];
        }
    }];
    
    [super didReceiveMemoryWarning];
}

@end
