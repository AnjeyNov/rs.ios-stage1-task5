#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";
NSString *KeyCountryNumber = @"countryNumber";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    if(string.length == 0) {
    return @{KeyPhoneNumber: @"+",
             KeyCountry: @""};
    }
            
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"+"];
    NSString *countryCode;
    
    if(string.length > 11) {
        if([string containsString:@"+"]) {
            return @{ KeyPhoneNumber: [string substringWithRange:NSMakeRange(0, 13)],
                      KeyCountry: @""};
        }
        [result appendString: [string substringWithRange:NSMakeRange(0, 12)]];
        return @{KeyPhoneNumber: result,
                 KeyCountry: @""};
    }
    
    NSDictionary *country = [PNConverter countryFromNumber:string];
    [result appendString:country[KeyCountryNumber]];
    countryCode = country[KeyCountry];
    if([countryCode isEqualToString:@""]) {
        return @{KeyPhoneNumber: result,
                 KeyCountry: @""};
    }
    
    if([countryCode isEqualToString:@"RU"] || [countryCode isEqualToString:@"KZ"]) {
        if(string.length <= 4) {
        return @{KeyPhoneNumber: result,
                 KeyCountry: countryCode};
        }
    }
    
    if(string.length == 3) {
        return @{KeyPhoneNumber: result,
        KeyCountry: countryCode};
    }
    
//    
//    if([countryCode isEqualToString:@"RU"] || [countryCode isEqualToString:@"KZ"]) {
//        
//    }
//    if([countryCode isEqualToString:@"MD"] ||[countryCode isEqualToString:@"AM"]) {
//        
//    }
//    
//    
    
    return @{KeyPhoneNumber: result,
    KeyCountry: @""};
}
//
//+ (NSString*)separation:(NSString*)string inLen:(int)len {
//    NSMutableString* result = [NSMutableString new];
//    [result appendString:@" ("];
//    if(len==10) {
//        [result appendString:[string substringWithRange:NSMakeRange(1, 3)]];
//        [result appendString:@")"];
//        if(string.length>4){
//            if(string.length>7){
//                [result appendString:[string substringWithRange:NSMakeRange(4, 3)]];
//                if(string.length>)
//            }
//            [result appendString:[string substringWithRange:NSMakeRange(4, string.length-4)]];
//            return result;
//        }
//    }
//}

+ (NSDictionary*) countryFromNumber:(NSString*)string {
    if(string.length < 3) {
        NSMutableString *country = [[NSMutableString alloc] initWithString: [string substringWithRange:NSMakeRange(0, 1)]];
        
        if(![country isEqualToString:@"7"]) {
            return @{ KeyCountryNumber: string,
                      KeyCountry: @""};
        }
        if(string.length == 1) {
            return @{ KeyCountryNumber: string,
            KeyCountry: @"RU"};
        }
        if([[string substringWithRange:NSMakeRange(1, 1)] isEqualToString: @"7"]) {
            [country appendString:@" ("];
            [country appendString:[string substringWithRange:NSMakeRange(1, string.length-1)]];
            return @{ KeyCountryNumber: country,
            KeyCountry: @"KZ"};
        } else {
        [country appendString:@" ("];
            [country appendString:[string substringWithRange:NSMakeRange(1, string.length-1)]];
            return @{ KeyCountryNumber: country,
            KeyCountry: @"RU"};
        }
    }
    
    NSMutableString *country = [[NSMutableString alloc] initWithString: [string substringWithRange:NSMakeRange(0, 3)]];
    if([country isEqualToString:@"373"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"MD"};
    }
    if([country isEqualToString:@"374"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"AM"};
    }
    if([country isEqualToString:@"375"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"BY"};
    }
    if([country isEqualToString:@"380"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"UA"};
    }
    if([country isEqualToString:@"992"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"TJ"};
    }
    if([country isEqualToString:@"993"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"TM"};
    }
    if([country isEqualToString:@"994"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"AZ"};
    }
    if([country isEqualToString:@"996"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"KG"};
    }
    if([country isEqualToString:@"998"]) {
        return @{ KeyCountryNumber: country,
        KeyCountry: @"UZ"};
    }
    
    return @{ KeyCountryNumber: @"",
                   KeyCountry: @""};
}
@end
