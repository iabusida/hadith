//
//  SourceCell.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SourceCell : UITableViewCell

@property(nonatomic, retain) IBOutlet UILabel *Title;
+ (UITableViewCell *)cellFromNibNamed:(NSString *)nibName ofClass:(Class)cellClass;
@end
