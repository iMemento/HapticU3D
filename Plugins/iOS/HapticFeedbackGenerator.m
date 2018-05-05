//
//  HapticFeedbackGenerator.m
//  Unity-iPhone
//
//  Created by 王小兵 on 2018/5/5.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    Selection = 0,
    ImpactLight,
    ImpactMedium,
    ImpactHeavy,
    Success,
    Warning,
    Error
} FeedbackType;

@interface HapticFeedbackGenerator : NSObject

+ (void)generate:(FeedbackType)type;

@end


void GenerateFeedback(int type)
{
    [HapticFeedbackGenerator generate:(FeedbackType)type];
}


@implementation HapticFeedbackGenerator

+(void)generate:(FeedbackType)type{
    
    if ([[UIDevice currentDevice] systemVersion].floatValue < 10.0){
        return;
    }
    
    switch (type) {
        case Selection:
            [self generateSelectionFeedback];
            break;
        case ImpactLight:
            [self generateImpactFeedback:UIImpactFeedbackStyleLight];
            break;
        case ImpactMedium:
            [self generateImpactFeedback:UIImpactFeedbackStyleMedium];
            break;
        case ImpactHeavy:
            [self generateImpactFeedback:UIImpactFeedbackStyleHeavy];
            break;
        case Success:
            [self generateNotificationFeedback:UINotificationFeedbackTypeSuccess];
            break;
        case Warning:
            [self generateNotificationFeedback:UINotificationFeedbackTypeWarning];
            break;
        case Error:
            [self generateNotificationFeedback:UINotificationFeedbackTypeError];
            break;
        default:
            break;
    }
}

+(void)generateSelectionFeedback{
    UISelectionFeedbackGenerator *generator = [[UISelectionFeedbackGenerator alloc] init];
    [generator prepare];
    [generator selectionChanged];
    generator = nil;
}

+(void)generateImpactFeedback:(UIImpactFeedbackStyle)style{
    UIImpactFeedbackGenerator *generator = [[UIImpactFeedbackGenerator alloc] initWithStyle:style];
    [generator prepare];
    [generator impactOccurred];
    generator = nil;
}

+(void)generateNotificationFeedback:(UINotificationFeedbackType)notificationType{
    UINotificationFeedbackGenerator *generator = [[UINotificationFeedbackGenerator alloc] init];
    [generator prepare];
    [generator notificationOccurred:notificationType];
    generator = nil;
}

@end
