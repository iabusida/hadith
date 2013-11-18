//
//  HadithContext.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface HadithContext : NSObject


-(NSMutableArray *)GetBooks:(NSString *)sql;
-(NSMutableArray *)GetChapters:(NSString *)sql;
-(NSMutableArray *)GetHadithSources:(NSString *)sql;
-(NSMutableArray *)GetNarrations:(NSString *)sql;
@end
