//
//  CardMatchingGame.h
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 06/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

//NS_ASSUME_NONNULL_BEGIN what is it?

@interface CardMatchingGame : NSObject


- (instancetype) initWithCardCount: (NSUInteger)count
                         usingDeck: (Deck *)deck ;//NS_DESIGNATED_INITIALIZER

- (void)chooseCardAtIndex:(NSUInteger)index;

-(NSString *) description;

-(Card *) cardAtIndex:(NSUInteger)index;

@property (nonatomic , readonly) NSInteger score;

@property (nonatomic) NSInteger matchMode;

@end

//NS_ASSUME_NONNULL_END
