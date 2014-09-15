//
//  FISSentence.h
//  
//
//  Created by Zachary Drossman on 9/15/14.
//
//

#import <Foundation/Foundation.h>

@interface FISSentence : NSObject {
    NSMutableArray *_words;
}


- (NSMutableArray *)words;
- (void)setWords:(NSMutableArray *)words;

- (NSNumber *)numOfWords;
- (BOOL)containsWord:(NSString *)searchedWord;
- (NSString *)stringFormat;

- (BOOL)isProperSentence;
- (BOOL)isEqualToSentence:(NSArray *)otherSentence;

@end
