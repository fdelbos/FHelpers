//
//  CustomCell.m
//  FHelpers
//
//  Created by Frederic Delbos on 10/15/12.
//  Copyright (c) 2012 Frederic Delbos. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

+(id)makeCell
{
    UITableViewCell *cell;
    NSString *name = NSStringFromClass([self class]);
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:name owner:nil options:nil];
    
    for(id currentObject in topLevelObjects)
        if([currentObject isKindOfClass:[self class]])
        {
            cell = (UITableViewCell*)currentObject;
            break;
        }
    [cell setSelectionStyle:UITableViewCellSelectionStyleBlue];
    return cell;
}

@end

