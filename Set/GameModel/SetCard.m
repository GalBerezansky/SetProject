//
//  SetCard.m
//  SetProject 12/08/2020
//
//  Created by Gal Berezansky on 11/08/2020.
//  Copyright © 2020 Gal Bereznaksy. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard


/*-------------------Helper methods--------------------*/
+(BOOL) allSpecificFeaturesMatch : (NSArray *) featuresArray{
    id feature1 = [featuresArray objectAtIndex:0];
    id feature2 = [featuresArray objectAtIndex:1];
    id feature3 = [featuresArray objectAtIndex:2];
    return ([feature1 isEqual:feature2] && [feature2 isEqual: feature3]);
}

+(BOOL) allSpecificFeaturesDontMatch : (NSArray *) featuresArray{
    id feature1 = [featuresArray objectAtIndex:0];
    id feature2 = [featuresArray objectAtIndex:1];
    id feature3 = [featuresArray objectAtIndex:2];
    return (![feature1 isEqual:feature2] && ![feature2 isEqual:feature3] && ![feature1 isEqual: feature3]) ;
}

+(BOOL)isFeatureValid: (NSArray *) featuresArray{
    return [SetCard allSpecificFeaturesMatch:featuresArray] ||
           [SetCard allSpecificFeaturesDontMatch:featuresArray];
}

/*-------------------------------------------------------*/
-(int) match:(NSArray *) otherCards{
    int score = 0;
    SetCard * otherCard1 = [otherCards objectAtIndex:0];
    SetCard * otherCard2 = [otherCards objectAtIndex:1];
    NSArray * shapeArray = @[self.shape , otherCard1.shape , otherCard2.shape];
    NSArray * numberOfShapesArray = @[@(self.numberOfShapes) , @(otherCard1.numberOfShapes) ,                                    @(otherCard2.numberOfShapes)];
    NSArray * shadingArray = @[self.shading , otherCard1.shading , otherCard2.shading];
    NSArray * colorArray = @[self.color , otherCard1.color , otherCard2.color];
    
    if([SetCard isFeatureValid:shapeArray] && [SetCard isFeatureValid:numberOfShapesArray]&& [SetCard isFeatureValid:shadingArray] && [SetCard isFeatureValid:colorArray]){
        score = 8;
    }
        
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
    return @[@"▲" , @"●" , @"■"];
}

+(NSUInteger) maxAmountOfShapes{
    return 3;
}

+(NSArray *) validShadings{
    return @[@"hollow" , @"shaded" , @"filled"];
}

+(NSArray *) validColors{
    return @[@"red" , @"green" , @"purple"];
}

/*Instance methods*/

/**
 returns string representation of the card (withoud other properties)
 */

-(NSString *) description{
    NSString * description = @"";
    for(int i = 0 ; i <= self.numberOfShapes ; i++){
        description = [description stringByAppendingString:self.shape];
    }
    return description;
}

@end
