//
//  HomViewController.m
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    data = [[HadithContext alloc]init];

    sources = [data GetHadithSources:@"select * from hadithsources"];
    [sourceTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == sourceTable){
        return [sources count];
    }
    else if(tableView == booksTable)
    {
       return [books count];
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellID = @"SourceCell";
    SourceCell *cell =[tableView dequeueReusableCellWithIdentifier:cellID];

    if(tableView == sourceTable)
    {
        HadithSource  *hadithSource = [sources objectAtIndex:indexPath.row];
        
        if (cell == nil)
            cell = (SourceCell*)[SourceCell cellFromNibNamed:cellID ofClass:[SourceCell class]];
        
        cell.Title.text = hadithSource.ArabicTitle;
        //    cell.type.text = [fav.listingType intValue] == 0 ? @"Dispensary" : @"Doctor";
        //    cell.phone_number.text = fav.phoneNumber;
    return cell;
    }
    else if(tableView == booksTable){
        
        Book  *chapter = [books objectAtIndex:indexPath.row];
       
        if (cell == nil)
            cell = (SourceCell*)[SourceCell cellFromNibNamed:cellID ofClass:[SourceCell class]];
        
        cell.Title.text = chapter.EnglishTitle;
        return cell;
        
    }
    return nil;

}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == sourceTable)
    {
        HadithSource *source = [sources objectAtIndex:indexPath.row];
        
        books = [data GetBooks:[NSString stringWithFormat:@"select * from books where HadithSource_SourceId = %d", source.SourceId]];
        [booksTable reloadData];
        booksTable.hidden = NO;
        sourceTable.hidden = YES;
    }
    else if(tableView == booksTable){
        Book *book = [books objectAtIndex:indexPath.row];
        DetailViewController *nviewController = [[DetailViewController alloc]initWithHadithBook:book.Hadith_SourceId :book.BookId];
        [self presentViewController:nviewController animated:YES completion:nil];
//        HadithViewController *hadithController = [[HadithViewController alloc] init];
//        [self presentViewController:hadithController animated:YES completion:nil];
        
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
