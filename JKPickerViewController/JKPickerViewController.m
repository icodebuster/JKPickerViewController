//
//  JKPickerViewController.m
//  JKPickerViewControllerExample
//
//  Created by Jobin Kurian on 31/03/14.
//  Copyright (c) 2014 Jobin Kurian. All rights reserved.
//

#import "JKPickerViewController.h"

#define ANIMATION_DURATION 0.3f

@interface JKPickerViewController ()

@end

@implementation JKPickerViewController

#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Setting the user selected data.
    if (_selectedRowData) {
        [_selectedRowData enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSUInteger selectedIndex = [_dataSource[idx] indexOfObject:obj];
            [dataPicker selectRow:selectedIndex inComponent:idx animated:YES];
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - User Defined Methods

// Get the picker view controller.
+ (instancetype)picker
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"JKComponents" bundle:nil];
    JKPickerViewController * pickerVC = [storyboard instantiateViewControllerWithIdentifier:@"JKPickerViewController"];
    return pickerVC;
}

// Showing the pickerview in view.
- (void)showPickerInViewController:(UIViewController *)viewController
             withSelectionHandler:(void (^)(JKPickerViewController *pickerVC, id selectedData))selectionHandler
{
    [viewController.view endEditing:YES];
    _selectionHandler = selectionHandler;
    self.view.frame = viewController.view.bounds;
    
    [viewController addChildViewController:self];
    [viewController.view addSubview:self.view];
    
    overlayView.alpha = 0.0f;
    pickerView.transform = CGAffineTransformMakeTranslation(0, pickerView.bounds.size.height);
    
    [UIView animateWithDuration:ANIMATION_DURATION animations:^{
        overlayView.alpha = 0.4f;
        pickerView.transform = CGAffineTransformIdentity;
    }];
    
    [self didMoveToParentViewController:viewController];
}

// Hide Picker View.
- (void)hidePickerView
{
    [UIView animateWithDuration:ANIMATION_DURATION
                     animations:^{
                         overlayView.alpha = 0.0f;
                         pickerView.transform = CGAffineTransformMakeTranslation(0, pickerView.bounds.size.height);
                     }
                     completion:^(BOOL finished) {
                         [self.view removeFromSuperview];
                         [self removeFromParentViewController];
                     }];
}

// Getting the user selectedData
- (NSArray *)selectedData
{
    NSMutableArray *selectedDataArray = [NSMutableArray array];
    
    [_dataSource enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [selectedDataArray addObject:obj[[dataPicker selectedRowInComponent:idx]]];
    }];
    
    return selectedDataArray;
}


#pragma mark - UI Events

// Cancel Button Pressed.
- (IBAction)cancelButtonPressed:(id)sender
{
    [self hidePickerView];
    _selectionHandler(self, nil);
}

// Done Button Pressed
- (IBAction)doneButtonPressed:(id)sender
{
    [self hidePickerView];
    _selectionHandler(self, [self selectedData]);
}


#pragma mark - UIPickerView Datasource Methods

// Number of Components.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [_dataSource count];
}

// Number of Rows.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [_dataSource[component] count];
}


#pragma mark - UIPickerView Delegate Methods

// Title for Row.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(_titleKeyPath != nil)
        return _dataSource[component][row][_titleKeyPath];
    return _dataSource[component][row];
}

@end
