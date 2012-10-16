FHelpers
========

Simple IOS helper functions

##FHelpers.h
- typedef for simple block CallBacks
- Macro `DEFINE_SHARED_INSTANCE_USING_BLOCK` to make a shared instance, see [this gist](https://gist.github.com/1057420)
- asdasda
- Macros `RGB(r, g, b)` and `RGBA(r, g, b, a)` as `UIColor colorWithRed` shorcuts.
- `+(BOOL)setEncryptedProperty:(NSString*)propertyName value:(NSString)value;` and `+(NSString*)getEncryptedProperty:(NSString*)propertyName;`  to encrypte some data and store it in the system (for passwords).
- `+(void)setProperty:(NSString*)propertyName value:(NSString*)value;` and `+(NSString*)getProperty:(NSString*)propertyName;` to store a value in the system.
- `+(void)alertMsg:(NSString*)msg title:(NSString*)title;` Display and `UIAlert` to the user.