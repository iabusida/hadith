//
//  HadithViewController.m
//  hadith
//
//  Created by Islam Abusida on 11/17/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import "HadithViewController.h"

@interface HadithViewController ()

@end

@implementation HadithViewController

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
    self = [super initWithNibName:@"HadithViewController" bundle:nil];
    if (self) {
//        self.bookId = bookId;
//        self.sourceId = sourceId;
        lblTitle.text = @"Hello World";
        NSLog(@"Text: %@", lblTitle.text);
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    lblTitle.text = @"Hello World";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
