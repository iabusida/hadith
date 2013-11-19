//
//  NarrationViewController.m
//  hadith
//
//  Created by Islam Abusida on 11/17/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import "DetailViewController.h"
#import "HadithNarration.h"
#import "HadithContext.h"
#import "Chapter.h"
@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (id)initWithHadithBook:(int)sourceId :(int)bookId
{
    self = [super initWithNibName:@"DetailViewController" bundle:nil];
    if (self) {
        self.bookId = bookId;
        self.sourceId = sourceId;
        chapterIds = [[NSMutableArray alloc] init];
        hadithContext = [[HadithContext alloc] init];
        EnglishText.showsVerticalScrollIndicator = YES;
        NSMutableArray *chapters = [hadithContext GetChapters:[NSString stringWithFormat:@"select * from chapters where book_bookid = %d", bookId]];
        
        for(Chapter *chapter in chapters)
        {
            [chapterIds addObject:[NSString stringWithFormat:@"%d", chapter.ChapterId]];
        }
        NSLog(@"Text: %@", lblTitle.text);
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    hadithContext = [[HadithContext alloc] init];
    NSString *mergeIdString = [chapterIds componentsJoinedByString:@","];
    
    narrations = [hadithContext GetNarrations:[NSString stringWithFormat:@"select * from Narrations where Chapter_ChapterId in (%@)", mergeIdString]];
    if([narrations count] > 0)
    {
        narrationIndex = 0;
        lblTitle.text = [NSString stringWithFormat:@"%d out of %d narrations", narrationIndex + 1, [narrations count]];
        HadithNarration *narration = [narrations objectAtIndex:narrationIndex];
       [EnglishText setText:narration.EnglishDetails];
    }

}
-(IBAction)Next:(id)sender{
    narrationIndex += 1;
    lblTitle.text = [NSString stringWithFormat:@"%d out of %d narrations", narrationIndex + 1, [narrations count]];
    HadithNarration *narration = [narrations objectAtIndex:narrationIndex];
    [EnglishText setText:narration.EnglishDetails];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
