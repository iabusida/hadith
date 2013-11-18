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

        NSLog(@"Text: %@", lblTitle.text);
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    hadithContext = [[HadithContext alloc] init];

    NSMutableArray *narrations = [hadithContext GetNarrations:@"select * from Narrations where Chapter_ChapterId in (1,2,3,4,5)"];
    HadithNarration *narration = [narrations objectAtIndex:0];
    NSLog(@"Narrator %@", narration.EnglishNarrator);
    lblTitle.text =narration.EnglishDetails;
  //  Title.text =
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
