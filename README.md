JKPickerViewController
======================

Ready to use PickerViewController

#### Loading data from a array.

    NSArray *simpleDataArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May"];
    
    JKPickerViewController *pickerVC = [JKPickerViewController picker];
    [pickerVC setDataSource:@[simpleDataArray]];
    [pickerVC showPickerInViewController:self
                   withCompletionHandler:^(JKPickerViewController *pickerVC, id selectedData) {
                       if (selectedData) {
                           NSLog(@"Selected Data = %@", selectedData);
                       }
                   }];


#### Loading data from array of dictionary.

    NSArray *arrayOfDic = @[@{@"id": @"1", @"month": @"Jan"},
                            @{@"id": @"2", @"month": @"Feb"},
                            @{@"id": @"3", @"month": @"Mar"},
                            @{@"id": @"4", @"month": @"Apr"},
                            @{@"id": @"5", @"month": @"May"}];
    
    JKPickerViewController *pickerVC = [JKPickerViewController picker];
    [pickerVC setDataSource:@[arrayOfDic]];
    [pickerVC setTitleKeyPath:@"month"];
    [pickerVC showPickerInViewController:self
                   withCompletionHandler:^(JKPickerViewController *pickerVC, id selectedData) {
                       if (selectedData) {
                           NSLog(@"Selected Data = %@", selectedData);
                       }
                   }];
