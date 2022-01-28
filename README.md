# pom-proto
Protobuf and utility package for smartmesh blockchain transaction and gRPC API

- `\src` includes protobuf definition for all core data objects and gRPC API used by smartmesh blockchain

- `\golang` includes the generated protobuf files for go language

# Getting Started
## Installing
### Install protoc
Install the Google protocol buffers compiler `protoc` v3.12.0 or above from https://github.com/protocolbuffers/protobuf/releases

Install protoc-gen-go at version v1.4.2

Enable go mod. Install grpc-gateway https://github.com/grpc-ecosystem/grpc-gateway. Basically this is what you need:

```
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
```

### Install mockgen
Install golang mock generator `mockgen` v1.4.4 or above to generate mock files.

```
go get -u github.com/golang/mock/mockgen
```

## Compiling
```
make gen
```
This generates the protobuf files and put into \golang directory

