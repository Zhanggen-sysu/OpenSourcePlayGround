//
//  Macros.h
//  OpenSourcePlayGround
//
//  Created by GenZhang on 2022/12/15.
//

#ifndef Macros_h
#define Macros_h

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000 // 当前Xcode支持iOS8及以上
// Screen Size
#define SCREEN_WIDTH ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.width)
#define SCREENH_HEIGHT ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale:[UIScreen mainScreen].bounds.size.height)
#define SCREEN_SIZE ([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)]?CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale):[UIScreen mainScreen].bounds.size)
#else
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#endif

// Color
#define kMainColor [UIColor colorWithRed:0 green:122/255.0 blue:255/255.0 alpha:1]
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

// Image
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]

// Cycle Retain
#define WeakSelf(type)  __weak typeof(type) weak##type = type;
#define StrongSelfReturnNil(type)  __strong typeof(type) type = weak##type;\
                                    if (!type)return;

// view corner and border
#define ViewBorderRadius(View, Radius, Width, Color)\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// font
#define kFont(size) [UIFont systemFontOfSize:size]
#define kBoldFont(size) [UIFont boldSystemFontOfSize:size]

#define API_KEY @"748c16b2d0a067ab5e9055e41fc2754b"
#define API_IMG_BASEURL @"https://image.tmdb.org/t/p"

#endif /* Macros_h */
