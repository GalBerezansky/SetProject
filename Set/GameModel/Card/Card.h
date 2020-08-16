//
//  Card.h
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 05/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//Abstract class that represents a generic card.
@interface Card : NSObject

///Returns the string representation of a card.
@property(strong , nonatomic) NSString *defention;

///Determines if the card is choosen by the user or not.
@property(nonatomic , getter = isChosen) BOOL chosen;

///Determines if the card was already matched with other cards.
@property(nonatomic , getter = isMatched) BOOL matched;

///Returns the amount of points given from a match between this card and the \c otherCards.
-(int) match: (NSArray *) otherCards; //Abstract method.

@end

NS_ASSUME_NONNULL_END
