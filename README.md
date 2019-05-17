# Introduction

This boilerplate is targeted towards large, serious projects and assumes you are somewhat familiar with Webpack and `weex-loader`. 

## Quickstart

To use this template, scaffold a project with [weexpack v1.1.1+](https://github.com/weexteam/weex-pack).

``` bash
$ npm install -g weex-toolkit
$ weex create my-project # default will create the webpack template
$ cd my-project && npm start
```

## How to start Weex Project

	cd WeexDemo 
	npm start
	
you can see the website open in your browser. that is the js file URL

## How to run iOS

请进入WeexDemo-iOS项目，打开workspace 文件，然后点击运行即可。

 首先会尝试请求 http://localhost:8081/dist/index.js 地址下面的js文件，如果启动了weex的server，能够请求到文件，则会加载对应本地src目录下面编译出来的对应文件。
 
 如果没有启动本地服务器，则会加载内置在本地目录里面的index.js 文件，这个是编译后存在本地的js文件。
 
 如果要更改实际加载的文件地址，则可以修改AppDelegate.m文件中的写死的url地址即可。