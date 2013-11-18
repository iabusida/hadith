//
//  Narration.h
//  hadith
//
//  Created by Islam Abusida on 11/10/13.
//  Copyright (c) 2013 Islam Abusida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HadithNarration : NSObject
//
@property(nonatomic, assign) int NarrationId;
@property(nonatomic, retain) NSString *EnglishNarrator;
@property(nonatomic, retain) NSString *EnglishDetails;
@property(nonatomic, retain) NSString *arabicDetails;
@property(nonatomic, assign) int Number;
@property(nonatomic, assign) int ChapterId;
//
@end
