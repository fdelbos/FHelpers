//
//  CustomeTable.m
//  FHelpers
//
//  Created by Frederic Delbos on 10/15/12.
//  Copyright (c) 2012 Frederic Delbos. All rights reserved.
//

#import "CustomeTable.h"

@interface CustomeTable ()

@end

@implementation CustomeTable

@synthesize rows;

-(id)init
{
    if(self = [super init])
        self.rows = [[NSMutableArray alloc] init];
    return self;
}

-(void)addRow:(CustomCell*)row
{
    if (row.block != nil)
        [row setSelectionStyle:UITableViewCellSelectionStyleGray];
    else
        [row setSelectionStyle:UITableViewCellEditingStyleNone];
    [rows addObject:row];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return rows.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ((CustomCell*)[rows objectAtIndex:indexPath.row]).frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [rows objectAtIndex:indexPath.row];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *c = rows[indexPath.row];
    if (c.block)
        c.block();
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
