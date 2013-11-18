//
//  HomViewController.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HadithContext.h"
#import "Book.h"
#import "HadithSource.h"
#import "Chapter.h"
#import "SourceCell.h"
@interface HomeViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *sourceTable;
    IBOutlet UITableView *booksTable;
    NSMutableArray *sources;
    HadithContext *data;
    NSMutableArray *books;
}


@end
