//
//  SetCard.m
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 11/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


/*Helper methods*/
+(BOOL) allSpecificFeaturesMatch : (NSArray *) featuresArray{
    if([featuresArray count] != 3){
        NSLog(@"no way jose");
        return NO;
    }
    id feature1 = [featuresArray objectAtIndex:0];
    id feature2 = [featuresArray objectAtIndex:1];
    id feature3 = [featuresArray objectAtIndex:2];
    return ([feature1 isEqual:feature2] && [feature2 isEqual: feature3]);
}

+(BOOL) allSpecificFeaturesDontMatch : (NSArray *) featuresArray{
    if([featuresArray count] != 3){
        NSLog(@"no way jose");
        return NO;
    }
    id feature1 = [featuresArray objectAtIndex:0];
    id feature2 = [featuresArray objectAtIndex:1];
    id feature3 = [featuresArray objectAtIndex:2];
    return (![feature1 isEqual:feature2] && ![feature2 isEqual:feature3] && ![feature1 isEqual: feature3]) ;
}

/**/
-(int) match:(NSArray *) otherCards{
    int score = 0;
    if([otherCards count] != 2){
        NSLog(@"no way jose");
        return NO;
    }
    SetCard * otherCard1 = [otherCards objectAtIndex:0];
    SetCard * otherCard2 = [otherCards objectAtIndex:1];
    BOOL isShapeValid = [SetCard allSpecificFeaturesMatch:@[self.shape , otherCard1.shape , otherCard2.shape]] ||
                        [SetCard allSpecificFeaturesDontMatch:@[self.shape , otherCard1.shape , otherCard2.shape]];
    
    BOOL isNumberValid = [SetCard allSpecificFeaturesMatch:@[@(self.numberOfShapes) , @(otherCard1.numberOfShapes) ,                                    @(otherCard2.numberOfShapes)]] ||[SetCard allSpecificFeaturesDontMatch:@[@(self.numberOfShapes) ,                           @(otherCard1.numberOfShapes) , @(otherCard2.numberOfShapes)]];
    
    BOOL isShadeValid = [SetCard allSpecificFeaturesMatch:@[self.shading , otherCard1.shading , otherCard2.shading]] ||
                        [SetCard allSpecificFeaturesDontMatch:@[self.shading , otherCard1.shading , otherCard2.shading]];
    
    BOOL isColorValid = [SetCard allSpecificFeaturesMatch:@[self.color , otherCard1.color , otherCard2.color]] ||
                        [SetCard allSpecificFeaturesDontMatch:@[self.color , otherCard1.color , otherCard2.color]];
    
    if(isShapeValid && isNumberValid && isShadeValid && isColorValid)
        score = 6;
    return score;
}

/**Setters*/

@synthesize shape = _shape;
-(void) setShape:(NSString *)shape{
    if([[SetCard validShapes] containsObject:shape]){
        _shape = shape;
    }
}

@synthesize numberOfShapes = _numberOfShapes;
-(void) setNumberOfShapes:(NSUInteger)numberOfShapes{
    if(numberOfShapes > 0 && numberOfShapes < [SetCard maxAmountOfShapes]){
        _numberOfShapes = numberOfShapes;
    }
}

@synthesize shading = _shading;
-(void) setShading:(NSString *)shading{
    if([[SetCard validShadings] containsObject:shading]){
        _shading = shading;
    }
}

@synthesize color = _color;
-(void) setColor:(NSString *)color{
    if([[SetCard validColors] containsObject:color]){
        _color = color;
    }
}

/*Getters*/

-(NSString *) shape{
    return _shape ? _shape : @"?";
}

-(NSString *) shading{
    return  _shading ? _shading : @"?";
}

-(NSString *) color{
    return _color ? _color : @"?";
}


/**Class methods*/

+(NSArray *) validShapes{
    return @[@"oval" , @"diamond" , @"squiggle"];
}

+(NSUInteger) maxAmountOfShapes{
    return 3;
}

+(NSArray *) validShadings{
    return @[@"hollw" , @"shaded" , @"filled"];
}

+(NSArray *) validColors{
    return @[@"red" , @"green" , @"purple"];
}

/*Instance methods*/
-(NSString *) description{
    return [NSString stringWithFormat: @"%lu %@ %@ %@" ,self.numberOfShapes , self.shape , self.shading , self.color];
}

@end
