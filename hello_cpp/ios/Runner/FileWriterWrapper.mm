//
//  FileWriterWrapper.mm
//  Runner

#import "FileWriterWrapper.h"
#import "FileWriter.h"

NSString* WriteHelloWrapper(int count) {
    std::string result = writeHelloWorldCpp(count);
    return [NSString stringWithUTF8String:result.c_str()];
}

