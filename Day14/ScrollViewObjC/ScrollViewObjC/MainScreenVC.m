//
//  MainScreenVC.m
//  ScrollViewObjC
//
//  Created by techmaster on 8/21/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "MainScreenVC.h"
#define TITLE @"title"
#define CLASS @"class"
@interface MainScreenVC ()
{
    NSArray* _menuData;
}
@end

@implementation MainScreenVC

- (void) initData {
    _menuData = @[
                  @{TITLE: @"Simple Zoom", CLASS: @"SimpleZoom"},
                  @{TITLE: @"Tap to Zoom", CLASS: @"TapToZoom"},
                  @{TITLE: @"Lens Zoom", CLASS: @"LensZoom"},
                  @{TITLE: @"Simple Scroll", CLASS: @"SimpleScroll"},
                  @{TITLE: @"Nested Scroll", CLASS: @"NestedScroll"},
                  @{TITLE: @"Inifinite Scroll", CLASS: @"InfiniteScroll"}
                  ];
                    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Scroll View Demo";
    [self initData];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_menuData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellID = @"CellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary* menu = _menuData[indexPath.row];
    cell.textLabel.text = menu[TITLE];
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSDictionary* menu = _menuData[indexPath.row];
    
    UIViewController* viewController = [(UIViewController*)[NSClassFromString(menu[CLASS]) alloc] initWithNibName:menu[CLASS] bundle:nil];
    viewController.title = menu[TITLE];
    [self.navigationController pushViewController:viewController
                                         animated:YES];
}


@end
