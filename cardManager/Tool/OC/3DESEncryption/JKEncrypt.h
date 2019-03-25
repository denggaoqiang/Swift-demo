//
//  main.m
//  3DES研究
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface JKEncrypt : NSObject

/**字符串加密 */
-(NSString *)do3DESEncryptStr:(NSString *)originalStr;
/**字符串解密 */
-(NSString*)doDecEncryptStr:(NSString *)encryptStr;
/**十六进制解密 */
-(NSString *)doEncryptHex:(NSString *)originalStr;
/**十六进制加密 */
-(NSString*)doDecEncryptHex:(NSString *)encryptStr;

@end
