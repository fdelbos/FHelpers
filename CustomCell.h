//
//  CustomCell.h
//  FHelpers
//
//  Created by Frederic Delbos on 10/15/12.
//  Copyright (c) 2012 Frederic Delbos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"
#import "FHelpers.h"

@interface CustomCell : UITableViewCell
@property (nonatomic, strong) onFinish block;
+(id)makeCell;
@end
