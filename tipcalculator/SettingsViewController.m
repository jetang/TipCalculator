//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Jeff Tang on 6/12/15.
//  Copyright (c) 2015 Jeff Tang. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
- (IBAction)onTipChange:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self updateTipChoice];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTipChange:(id)sender {
    int tipChoice = self.tipControl.selectedSegmentIndex;
    NSLog(@"%i", tipChoice);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:tipChoice forKey:@"defaultTipPercentageChoice"];
    [defaults synchronize];
}

- (void)updateTipChoice {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipChoice = [defaults integerForKey:@"defaultTipPercentageChoice"];
    
    self.tipControl.selectedSegmentIndex = tipChoice;
}
@end
