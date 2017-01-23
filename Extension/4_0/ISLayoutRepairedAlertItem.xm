#import "ISLayoutRepairedAlertItem.h"

%hook ISLayoutRepairedAlertItem

- (void)configure:(BOOL)configure requirePasscodeForActions:(BOOL)require {
    NSString *title = @"IconSupport Notice";
    NSString *body = @"You have added or removed software that affects your icon layout.\n\nYour layout has been adjusted to prevent errors.";

    UIAlertView *alertView = [self alertSheet];
    [alertView setDelegate:self];
    [alertView setTitle:title];
    [alertView setMessage:body];
    [alertView addButtonWithTitle:@"Dismiss"];
}

%end

//==============================================================================

void initISLayoutRepairedAlertItem() {
    // Register new subclass
    initISAlertItem();
    Class $SuperClass = objc_getClass("ISAlertItem");
    if ($SuperClass != Nil) {
        Class $ISLayoutRepairedAlertItem = objc_allocateClassPair($SuperClass, "ISLayoutRepairedAlertItem", 0);
        if ($ISLayoutRepairedAlertItem != Nil) {
            objc_registerClassPair($ISLayoutRepairedAlertItem);
            %init;
        }
    }
}

/* vim: set ft=logos ff=unix tw=80 sw=4 ts=4 expandtab: */
