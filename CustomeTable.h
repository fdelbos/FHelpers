//
//  CustomeTable.h
//  FHelpers
//
//  Created by Frederic Delbos on 10/15/12.
//  Copyright (c) 2012 Frederic Delbos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"

@interface CustomeTable : UITableViewController
@property(nonatomic, strong) NSMutableArray *rows;
-(void)addRow:(CustomCell*)row;
@end
