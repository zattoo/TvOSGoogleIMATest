# ZattooFoundation
[![Build Status](https://travis-ci.com/zattoo/ZattooFoundation.svg?token=vnHStUUmbTiwCpUDgqdj&branch=master)](https://travis-ci.com/zattoo/ZattooFoundation)

ZattooFoundation is a Swift framework created with the purpose of making easier the creation of iOS and tvOS Applications for Zattoo, providing a high level abstraction layer for any specific detail regarding API communication or data persistency.

Even though the framework was built using pure Swift, the public layer is fully compatible with Obj-C code.

The interface provided by ZattooFoundation consists in a list of grouped Use Cases. An updated version of this list of use cases can be found [here](https://github.com/zattoo/ZattooFoundation/tree/master/ZattooFoundation/Source/Public/UseCases)

All the use cases work on the same way. They must be called using an instance of the specific group, as result of which 2 different callbacks could be received. There 2 different callbacks, success and failure.

Objects returned by ZattooFoundation are simple and immutable DTOs. An updated version of this list of DTOs can be found [here](https://github.com/zattoo/ZattooFoundation/tree/master/ZattooFoundation/Source/Public/DTOs)

All the operations are thread safe and are processed in an asyncronous way.

### Architecture

![ZattooFoundation](docs/Architecture.png)

### Cocoapods

ZattooFoundation can be easily integrated in your iOS or tvOS project using Cocoapods just adding this line to your Podfile:

```
pod 'ZattooFoundation',  :git => 'https://github.com/zattoo/ZattooFoundation.git'
```

### Requirements
* iOS 10.3, tvOS 11.0 or macOS 10.12
* Xcode 10.3
