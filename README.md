# Dockerized Thrift 0.5

This is a docker image for Thrift 0.5 (which is 6+ years old).

Use this for generation of code in Twitter's repositories if you have issues with newer versions of Thrift.

## Example

```
docker run -v $PWD:/src:rw thrift -v -o /src --gen java /src/tracing.thrift
```
