//
//  JKPickerViewController.h
//  JKPickerViewControllerExample
//
//  Created by Jobin Kurian on 31/03/14.
//  Copyright (c) 2014 Jobin Kurian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKPickerViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UIView *overlayView;
    IBOutlet UIView *pickerView;
    IBOutlet UIPickerView *dataPicker;
    
    IBOutlet UIToolbar *toolBar;
    IBOutlet UIBarButtonItem *cancelButton;
    IBOutlet UIBarButtonItem *doneButton;
    
    void(^_selectionHandler)(JKPickerViewController *pickerVC, id selectedData);
}

@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) NSArray *selectedRowData;
@property (nonatomic, strong) NSString *titleKeyPath;


#pragma mark - User Defined Methods

+ (instancetype)picker;
- (void)showPickerInViewController:(UIViewController *)viewController
             withSelectionHandler:(void (^)(JKPickerViewController *pickerVC, id selectedData))selectionHandler;


#pragma mark - UI Events

// Cancel Button Pressed.
- (IBAction)cancelButtonPressed:(UIBarButtonItem *)sender;

// Done Button Pressed.
- (IBAction)doneButtonPressed:(UIBarButtonItem *)sender;

@end
