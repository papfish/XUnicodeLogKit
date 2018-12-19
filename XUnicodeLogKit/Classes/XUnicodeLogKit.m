//
//  XUnicodeLogKit.m
//  XUnicodeLogKit
//
//  Created by Leo on 2018/12/18.
//

#import "XUnicodeLogKit.h"

#pragma mark - NSDictionary
@implementation NSDictionary (XUnicodeLogKit)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    NSMutableString *tempString = [NSMutableString string];
    NSMutableString *tabString = [[NSMutableString alloc] initWithString:@"\t"];
    for (NSUInteger i = 0; i < level; i++) {
        [tabString appendString:@"\t"];
    }
    if (level == 0) {
        [tempString appendString:@"\n"];
    }
    [tempString appendString:@"{\r\n"];
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [tempString appendString:tabString];
        if ([obj isKindOfClass:[NSString class]]
            || [obj isKindOfClass:[NSArray class]]
            || [obj isKindOfClass:[NSDictionary class]]
            || [obj isKindOfClass:[NSSet class]]
            || [obj isKindOfClass:[NSData class]]) {
            [tempString appendFormat:@"%@ = %@", key, [obj descriptionWithLocale:locale indent:(level + 1)]];
        } else {
            [tempString appendFormat:@"%@ = %@", key, obj];
        }
        [tempString appendString:@",\r\n"];
    }];
    
    [tempString appendFormat:@"%@}", [tabString substringToIndex:(tabString.length - 1)]];
    return tempString.copy;
}
#endif

@end

#pragma mark - NSArray
@implementation NSArray (XUnicodeLogKit)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    NSMutableString *tempString = [NSMutableString string];
    NSMutableString *tabString = [[NSMutableString alloc] initWithString:@"\t"];
    for (NSUInteger i = 0; i < level; i++) {
        [tabString appendString:@"\t"];
    }
    if (level == 0) {
        [tempString appendString:@"\n"];
    }
    [tempString appendString:@"(\r\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [tempString appendString:tabString];
        if ([obj isKindOfClass:[NSString class]]
            || [obj isKindOfClass:[NSArray class]]
            || [obj isKindOfClass:[NSDictionary class]]
            || [obj isKindOfClass:[NSSet class]]
            || [obj isKindOfClass:[NSData class]]) {
            [tempString appendFormat:@"%@", [obj descriptionWithLocale:locale indent:(level + 1)]];
        } else {
            [tempString appendFormat:@"%@", obj];
        }
        [tempString appendString:@",\r\n"];
    }];
    
    [tempString appendFormat:@"%@)", [tabString substringToIndex:(tabString.length - 1)]];
    return tempString.copy;
}
#endif

@end

#pragma mark - NSSet
@implementation NSSet (XUnicodeLogKit)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    NSMutableString *tempString = [NSMutableString string];
    NSMutableString *tabString = [[NSMutableString alloc] initWithString:@"\t"];
    for (NSUInteger i = 0; i < level; i++) {
        [tabString appendString:@"\t"];
    }
    if (level == 0) {
        [tempString appendString:@"\n"];
    }
    [tempString appendString:@"(\r\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        [tempString appendString:tabString];
        if ([obj isKindOfClass:[NSString class]]
            || [obj isKindOfClass:[NSArray class]]
            || [obj isKindOfClass:[NSDictionary class]]
            || [obj isKindOfClass:[NSSet class]]
            || [obj isKindOfClass:[NSData class]]) {
            [tempString appendFormat:@"%@", [obj descriptionWithLocale:locale indent:(level + 1)]];
        } else {
            [tempString appendFormat:@"%@", obj];
        }
        [tempString appendString:@",\r\n"];
    }];
    
    [tempString appendFormat:@"%@)", [tabString substringToIndex:(tabString.length - 1)]];
    return tempString.copy;
}
#endif

@end

#pragma mark - NSData
@implementation NSData (XUnicodeLogKit)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    NSMutableString *tempString = [NSMutableString string];
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:self options:0 error:&error];
    if (error == nil
        && result != nil
        && ([result isKindOfClass:[NSArray class]]
            || [result isKindOfClass:[NSDictionary class]]
            || [result isKindOfClass:[NSSet class]])) {
            [tempString appendFormat:@"%@", [result descriptionWithLocale:locale indent:level]];
        } else {
            [tempString appendFormat:@"%@", self];
        }
    
    return tempString.copy;
}
#endif

@end

#pragma mark - NSString
@implementation NSString (XUnicodeLogKit)

#ifdef DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [NSString stringWithFormat:@"\"%@\"", self];
}
#endif

@end
