# rpn_ruby

A gem developed as part of a toy project to play with different ways of packaging and deploying applications

This repo is a submodule of the toy project ```rpn_sample_ruby```.

```rpn_ruby``` is a module containing the implementation of the RPN calculator logic; organized as a gem but not built and uploaded to rubygems.org.

## Local testing

To get started:

```shell
bundle install
```

To run the microtests:

```shell
rake
```

## Related projects

```rpn_service``` is a RESTful service that wraps module ```rpn_ruby```.

```rpn_ui``` is a Sinatra-based webapp that calls service ```rpn_service```.


