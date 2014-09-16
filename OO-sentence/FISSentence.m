//
//  FISSentence.m
//  
//
//  Created by Zachary Drossman on 9/15/14.
//
//

#import "FISSentence.h"

@implementation FISSentence 

- (NSString *)stringFormat
{
    
    NSMutableString *fullSentence = [[NSMutableString alloc] init];
    
    for (NSInteger i = 0; i < [_words count]; i++)
    {
        
        [fullSentence appendString:_words[i]];
        
        if (i < [_words count] - 1)
        {
            [fullSentence appendString:@" "];
        }

    }
    
    return fullSentence;
}


- (NSNumber *)numOfWords
{

    NSNumber *numberOfWords = @([_words count]);
    return numberOfWords;
}


- (BOOL)containsWord:(NSString *)searchedWord
{
    
    return [_words containsObject:searchedWord];

}

//Alternative to the above using a for in loop
//- (BOOL)containsWord:(NSString *)searchedWord {
//    
//    for (NSString *word in _words) {
//        if ([word isEqualToString:searchedWord]) {
//            return YES;
//        }
//    }
//    
//    return NO;
//    
//}


- (NSMutableArray *)words
{
    
    return _words;
}

- (void)setWords:(NSMutableArray *)words
{

    _words = words;
}

- (BOOL)isProperSentence
{
    
    BOOL isProper = NO;
    
    NSString *firstWord = [_words firstObject];

    if ( [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[firstWord characterAtIndex:0]])
    {

        NSString *lastWord = [_words lastObject];
        
        NSCharacterSet *endOfSentenceCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@".!?"];
        
        if ([endOfSentenceCharacterSet characterIsMember:[lastWord characterAtIndex:lastWord.length - 1]])
        {
            
            isProper = YES;
        }
    }
    
    
    return isProper;
}

- (BOOL)isEqualToSentence:(FISSentence *)otherSentence
{
    BOOL sentenceEquality = NO;
    
    //two nil sentences would technically be 'equal' as well, but we have made a decision to exclude them for the purposes of this lab.
    if ([[otherSentence words] count] == [_words count] && [_words count] > 0)
    {
        
        sentenceEquality = YES;
        
        for (NSInteger i = 0; i < [[otherSentence words] count]; i++)
        {
            
            NSString *originalSentenceWordCaseAndPunctuationInsensitive = [[_words[i] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
            
            NSString *otherSentenceWordCaseAndPunctuationInsensitive = [[[otherSentence words][i] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];

            if (![originalSentenceWordCaseAndPunctuationInsensitive isEqualToString:otherSentenceWordCaseAndPunctuationInsensitive])
            {
                sentenceEquality = NO;
            };
        }

    }
    
    return sentenceEquality;
}


@end
