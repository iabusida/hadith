//
//  HadithContext.m
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import "HadithContext.h"
#import "Book.h"
#import "Chapter.h"
#import "HadithSource.h"
#import "HadithNarration.h"
@implementation HadithContext


-(NSString *)dbPath{
    return[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"hadith.db"];
}

-(NSMutableArray *)GetBooks:(NSString *)sql{

    NSMutableArray *sqliteData = [[NSMutableArray alloc] init];
    sqlite3 *database;
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                Book *newbook = [[Book alloc]init];
                newbook.BookId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                newbook.EnglishTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                newbook.ArabicTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                newbook.BookNumber = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)] integerValue];
                newbook.Hadith_SourceId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)] intValue];
                [sqliteData addObject:newbook];
            }
        }
    }
    sqlite3_close(database);
    return  sqliteData;
}


-(NSMutableArray *)GetChapters:(NSString *)sql{
    
    NSMutableArray *sqliteData = [[NSMutableArray alloc] init];
    sqlite3 *database;
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                Chapter *chapter = [[Chapter alloc]init];
                chapter.ChapterId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                chapter.TitleEnglish = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                chapter.TitleArabic = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                chapter.Number = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)] integerValue];
                chapter.Book_BookId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)] intValue];
                [sqliteData addObject:chapter];
            }
        }
    }
    sqlite3_close(database);
    return  sqliteData;
}


-(NSMutableArray *)GetNarrations:(NSString *)sql{
    
    NSMutableArray *sqliteData = [[NSMutableArray alloc] init];
    sqlite3 *database;
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                HadithNarration *narration = [[HadithNarration alloc]init];
                narration.NarrationId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                
                char *englishNarrator = (char *)sqlite3_column_text(selectStatement, 1);
                
              if(englishNarrator != nil)
                {
                    narration.EnglishNarrator = [NSString stringWithUTF8String:englishNarrator];
                }
                narration.EnglishDetails = [NSString stringWithFormat:@"%@",[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)]];
                narration.ArabicDetails = [NSString stringWithFormat:@"%@",[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 3)]];
                narration.Number = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 4)] integerValue];
                narration.ChapterId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 5)] intValue];
                [sqliteData addObject:narration];
            }
        }
    }
    sqlite3_close(database);
    return  sqliteData;
}


-(NSMutableArray *)GetHadithSources:(NSString *)sql{
    
    NSMutableArray *sqliteData = [[NSMutableArray alloc] init];
    sqlite3 *database;
    if (sqlite3_open([[self dbPath] UTF8String], &database) == SQLITE_OK) {
        sqlite3_stmt *selectStatement;
        if(sqlite3_prepare_v2(database, [sql cStringUsingEncoding:NSASCIIStringEncoding], -1, &selectStatement, NULL) == SQLITE_OK) {
            while(sqlite3_step(selectStatement) == SQLITE_ROW) {
                HadithSource *source = [[HadithSource alloc]init];
                source.SourceId = [[NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 0)]integerValue];
                source.ArabicTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 1)];
                source.EnglishTitle = [NSString stringWithUTF8String:(char *)sqlite3_column_text(selectStatement, 2)];
                [sqliteData addObject:source];
            }
        }
    }
    sqlite3_close(database);
    return  sqliteData;
}

@end
