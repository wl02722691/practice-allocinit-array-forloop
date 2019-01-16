//
//  ViewController.m
//  Object-Oriented Objective-C
//
//  Created by 張書涵 on 2019/1/7.
//  Copyright © 2019 張書涵. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self allocInit];
    [self nsarrayAndNsmutablearray];
    [self forLoop];
    [self nsarraysAndNsmutablearraysInPractice];
}

-(void) allocInit {
    NSDictionary *orderDict = @{
                                @"burgers":@5,
                                @"shakes":@3,
                                @"customers":@4,
                                @"isTakeOut":@true,
                                @"subtotal":@0.0,
                                };
    float burgerPrice = 4;
    float shakePrice = 3;
    float subtotal;
    
    subtotal = (burgerPrice * [[orderDict valueForKey:@"burgers"]intValue]) + (shakePrice * [[orderDict valueForKey:@"shakes"]intValue]);
    
    NSMutableDictionary *outputDict = [NSMutableDictionary dictionaryWithDictionary:orderDict];
    
    [outputDict setValue:@(subtotal) forKey:@"subtotal"];
    
    
    NSArray *a = [NSArray arrayWithObjects:@1, @2, NULL, @3];
    NSLog(@"a:%@", a);
    
    //test1:
    //Create an NSMutableDictionary called 'carDict'. Allocate memory and initialize 'carDict' with the following key/value pairs: "Make":"Honda", "Model":"Accord". Do this all in one line of code.
    //ans1:
    //NSMutableDictionary *carDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Honda", @"Make",@"Accord",@"Model",nil];
    
    //test2:
    //Create an NSString variable called 'myRide' and allocate and init it, but don't give it a value yet.
    //ans2:
    //NSString *myRide = [[NSString alloc]init];
    
    //test3:
    //Set the value of 'myRide' to the value of "Make" contained in 'carDict'.
    //ans3:
    //myRide = [carDict valueForKey:@"Make"];
};

- (void) nsarrayAndNsmutablearray {

    //MSArray
    NSArray *nameArray = @[@"Alice",@"Luke",@"Gary",@"Alice"];
    //elemnt must be object - no primitives(ints, bool, double, etc)
    //可以有兩個Alice，如果只想要整個內容只有一個，可以用NSSet
    //不用alloc init，但你要用可以有下面兩種寫法
    NSArray *nameArray1 = [[NSArray alloc]initWithObjects:@"Alice",@"Luke",@"Gary",@"Alice",nil];
    NSArray *nameArray2 = [NSArray arrayWithObjects:@"Alice",@"Luke",@"Gary",@"Alice",nil];
    
    //NSMutableArray
    //沒有辦法用簡單寫法 NSMutableArray *nameArray = @[@"Alice",@"Luke",@"Gary",@"Alice"];
    NSMutableArray *nameArray3 = [NSMutableArray arrayWithObjects:@"Alice",@"Luke",@"Gary",@"Alice",nil];
    NSMutableArray *nameArray4 = [[NSMutableArray alloc]initWithObjects:@"Alice",@"Luke",@"Gary",@"Alice",nil];
    NSString *name = [nameArray objectAtIndex:2];
    //replace
    [nameArray4 replaceObjectAtIndex:0 withObject:@"Gary"];
    //remove
    [nameArray4 removeObjectAtIndex:1];
    //insertObject
    [nameArray4 insertObject:@"Nia" atIndex:2];
    //add in the end
    [nameArray4 addObject:@"Annie"];
    
};

- (void) forLoop {
    bool ageDiscount;
    bool isMatinee = false;
    bool isEmployee = true;
    
    float regularPrice = 10;
    float ageOrMatinnePrice = 8.5;
    float ageAndMatinnePric = 6.5;
    float emploeeRegPrice = 4.5;
    float employeeMatinnePrice = 0;
    
    int customerAge = 35;
    float customerPrice;
    
    int youthAge = 13;
    int seniorAge = 65;
    
    NSString *empMessage;
    
    float subtotal = 0;
    float taxRate = .05;
    float grandTotal = 0;
    
    NSArray *ageArray = @[@5, @5, @14, @42, @77];
    
    for (NSNumber *age in ageArray) {
        
        customerAge = [age intValue];
    
    if ((customerAge < youthAge) || customerAge>=seniorAge){
        ageDiscount = true;
    } else {
        ageDiscount = false;
    }

    
    if (ageDiscount && isMatinee && !isEmployee) {
        customerPrice = ageAndMatinnePric;
        
    }else if (ageDiscount || (isMatinee && !isEmployee)){
        customerPrice = ageOrMatinnePrice;
        
    }else if (isEmployee && !isMatinee){
        customerPrice = emploeeRegPrice;
        NSString *empMessage = @"Thank for being part of team. Enjoy your movie";
        NSLog(@"%@",empMessage);
        
    }else if (isEmployee && isMatinee){
        customerPrice = employeeMatinnePrice;
        empMessage = @"free movie";
        NSLog(@"%@",empMessage);
        
        
    }else{
        customerPrice = regularPrice;
        
    }
        
        subtotal = subtotal + customerPrice;
        NSLog(@"age :%i customer price %f current subtotal: %f \n", customerAge,customerPrice,subtotal);
    }
    
    grandTotal = subtotal + (subtotal*taxRate);
    
}


- (void) nsarraysAndNsmutablearraysInPractice {
    
    NSArray *quizArray = @[@100,@94,@83,@77,@72];
    
    float scoreTotal = 0;
    
    for (NSNumber *quizScore in quizArray) {
        scoreTotal = scoreTotal + [quizScore intValue];
    }
    
    float averge = scoreTotal / [quizArray count];
    
    NSMutableArray *seatingArray = [NSMutableArray arrayWithObjects:@"Page",@"Chirs",@"Alice",@"Gary",nil];

    [seatingArray removeObjectAtIndex:3];
    
    [seatingArray removeObjectIdenticalTo:@"Alice"];
    
    //test1:
    //Declare an NSArray variable named "drinks" and initialize it with three strings: "juice", "water", and "coffee".
    //ans1:
    NSArray *drinks = @[@"juice",@"water",@"coffee"];
    
    //test2:
    //Create a "for in" loop to iterate over drinks and print out each drink name using NSLog.
    //ans2:
//    for (NSString *drink in drinks) {
//
//        NSLog(@"%@",drink);
//    }

}
@end
