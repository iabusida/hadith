//
//  HadithViewController.h
//  hadith
//
//  Created by Islam Abusida on 11/17/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HadithNarration.h"
#import "HadithContext.h"
@interface HadithViewController : UIViewController
{
    IBOutlet UILabel *lblTitle;
}
- (id)initWithHadithBook:(int)sourceId :(int)bookId;
@end


//
//
//#import <UIKit/UIKit.h>
//#import "HadithNarration.h"
//#import "HadithContext.h"
//@interface HadithViewController : UIViewController
//{
//    HadithContext *hadithContext;
//    IBOutlet UILabel *lblTitle;
//}
//
//- (id)initWithHadithBook:(int)sourceId :(int)bookId;
//@property(nonatomic, assign) int sourceId;
//@property(nonatomic, assign) int bookId;
//@end
