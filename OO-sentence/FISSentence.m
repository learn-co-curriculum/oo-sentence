//
//  FISSentence.m
//  
//
//  Created by Zachary Drossman on 9/15/14.
//
//

#import "FISSentence.h"

@implementation FISSentence 

- (NSString *)stringFormat {
    
    NSMutableString *fullSentence;
    
    for (NSString *word in _words) {
        
        [fullSentence appendString:word];
    }
    
    return fullSentence;
}


- (NSNumber *)numOfWords {

    return @([_words count]);
}


- (BOOL)containsWord:(NSString *)searchedWord {
    
    if ([_words containsObject:searchedWord]) {
        return YES;
    }
    
    return NO;
}


- (NSMutableArray *)words {
    
    if (!_words) {
        _words = [[NSMutableArray alloc] init];
    }
    
    return _words;
}

- (void)setWords:(NSMutableArray *)words {

    _words = words;
}

- (BOOL)isProperSentence {
    
    BOOL _isProperSentence = NO;
    
    NSString *firstWord = [_words firstObject];

    if ( [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[firstWord characterAtIndex:0]]) {

        NSString *lastWord = [_words lastObject];
        
        NSCharacterSet *endOfSentenceCharacterSet = [NSCharacterSet characterSetWithCharactersInString:@".!?"];
        
        if ([endOfSentenceCharacterSet characterIsMember:[lastWord characterAtIndex:lastWord.length - 1]]) {
            
            _isProperSentence = YES;
        }
    }
    
    
    return _isProperSentence;
}

- (BOOL)isEqualToSentence:(NSArray *)otherSentence {
    
    BOOL _isEqualToSentence = NO;
    
    if ([otherSentence count] == [_words count] && [_words count] > 0)
    {
        
        _isEqualToSentence = YES;
        
        for (NSInteger i = 0; i < [otherSentence count]; i++) {
            
            NSString *originalSentenceWordCaseAndPunctuationInsensitive = [[_words[i] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
            
            NSString *otherSentenceWordCaseAndPunctuationInsensitive = [[otherSentence[i] lowercaseString] stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
            
            if (![originalSentenceWordCaseAndPunctuationInsensitive isEqualToString:otherSentenceWordCaseAndPunctuationInsensitive])
            {
                _isEqualToSentence = NO;
            }
        }
        
    }
    
    return _isEqualToSentence;
}


@end
