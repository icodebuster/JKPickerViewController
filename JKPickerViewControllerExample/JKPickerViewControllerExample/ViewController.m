//
//  ViewController.m
//  JKPickerViewControllerExample
//
//  Created by Jobin Kurian on 31/03/14.
//  Copyright (c) 2014 Jobin Kurian. All rights reserved.
//

#import "ViewController.h"
#import "JKPickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)arrayPickerPressed:(id)sender
{
    NSArray *simpleDataArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May"];
    
    JKPickerViewController *pickerVC = [JKPickerViewController picker];
    [pickerVC setDataSource:@[simpleDataArray]];
    [pickerVC setSelectedRowData:@[@"Apr"]];
    [pickerVC showPickerInViewController:self
                   withSelectionHandler:^(JKPickerViewController *pickerVC, id selectedData) {
                       if (selectedData) {
                           NSLog(@"Selected Data = %@", selectedData);
                       }
                   }];
}

- (IBAction)arrayDicPickerPressed:(id)sender
{
    NSArray *arrayOfDic = @[@{@"id": @"1", @"month": @"Jan"},
                            @{@"id": @"2", @"month": @"Feb"},
                            @{@"id": @"3", @"month": @"Mar"},
                            @{@"id": @"4", @"month": @"Apr"},
                            @{@"id": @"5", @"month": @"May"}];
    
    JKPickerViewController *pickerVC = [JKPickerViewController picker];
    [pickerVC setDataSource:@[arrayOfDic]];
    [pickerVC setTitleKeyPath:@"month"];
    [pickerVC setSelectedRowData:@[@{@"id": @"4", @"month": @"Apr"}]];
    [pickerVC showPickerInViewController:self
                   withSelectionHandler:^(JKPickerViewController *pickerVC, id selectedData) {
                       if (selectedData) {
                           NSLog(@"Selected Data = %@", selectedData);
                       }
                   }];
    
}



@end
