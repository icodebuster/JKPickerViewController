JKPickerViewController
======================

Ready to use PickerViewController

#### Loading data from a array

    NSArray *simpleDataArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May"];
    
    JKPickerViewController *pickerVC = [JKPickerViewController picker];
    [pickerVC setDataSource:@[simpleDataArray]];
    [pickerVC setSelectedRowData:@[@"Apr"]];
    [pickerVC showPickerInViewController:self
                   withCompletionHandler:^(JKPickerViewController *pickerVC, id selectedData) {
                       if (selectedData) {
                           NSLog(@"Selected Data = %@", selectedData);
                       }
                   }];
