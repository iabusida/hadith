//
//  NarrationViewController.h
//  hadith
//
//  Created by Islam Abusida on 11/17/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HadithContext.h"
@interface DetailViewController : UIViewController
{
    HadithContext *hadithContext;
    IBOutlet UILabel *lblTitle;
    int narrationIndex;
    IBOutlet UITextView *EnglishText;
    NSMutableArray *chapterIds;
    IBOutlet UIButton *NextButton;
    NSMutableArray *narrations;
}

- (id)initWithHadithBook:(int)sourceId :(int)bookId;
@property(nonatomic, assign) int sourceId;
@property(nonatomic, assign) int bookId;
@end
