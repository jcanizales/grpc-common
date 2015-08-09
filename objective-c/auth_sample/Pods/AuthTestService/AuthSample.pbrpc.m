#import "AuthSample.pbrpc.h"

#import <ProtoRPC/ProtoRPC.h>
#import <RxLibrary/GRXWriter+Immediate.h>

static NSString *const kPackageName = @"grpc.testing";
static NSString *const kServiceName = @"TestService";

@implementation AUTHTestService

// Designated initializer
- (instancetype)initWithHost:(NSString *)host {
  return (self = [super initWithHost:host packageName:kPackageName serviceName:kServiceName]);
}

// Override superclass initializer to disallow different package and service names.
- (instancetype)initWithHost:(NSString *)host
                 packageName:(NSString *)packageName
                 serviceName:(NSString *)serviceName {
  return [self initWithHost:host];
}


#pragma mark UnaryCall(Request) returns (Response)

- (void)unaryCallWithRequest:(AUTHRequest *)request handler:(void(^)(AUTHResponse *response, NSError *error))handler{
  [[self RPCToUnaryCallWithRequest:request handler:handler] start];
}
// Returns a not-yet-started RPC object.
- (ProtoRPC *)RPCToUnaryCallWithRequest:(AUTHRequest *)request handler:(void(^)(AUTHResponse *response, NSError *error))handler{
  return [self RPCToMethod:@"UnaryCall"
            requestsWriter:[GRXWriter writerWithValue:request]
             responseClass:[AUTHResponse class]
        responsesWriteable:[GRXWriteable writeableWithSingleValueHandler:handler]];
}
@end
