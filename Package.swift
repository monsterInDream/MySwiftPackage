// swift-tools-version: 6.0
//上面这句是必须的，否则会报错
import PackageDescription

let package = Package(
    //1.包的名称
    name: "MySwiftPackage",
    //2.适用的平台和最低版本
    platforms: [
        .iOS(.v15),
    ],
    //3.该包提供的产品（library / executable）
    //必须在这里写入该library由哪些targets提供，才能提供给其他项目下载使用package
    products: [
        .library(
            name: "MySwiftPackage",
            targets: ["MySwiftPackage"]),
    ],
    //4.依赖的外部Swift Package
    //这里写入需要导入的其他第三方：
    dependencies: [
        //4.1.远程依赖（Alamofire）
        //.package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.9.0"),
        //4.2.本地依赖
        //.package(path: "../LocalPackage") // 本地依赖
        //4.3.测试：
        .package(url: "https://github.com/Alamofire/Alamofire.git", exact: "5.10.2")
    ],
    //5.定义源码目标
    targets: [
        //5.0.目标为Package本身
        .target(
            //5.1.目标名称
            name: "MySwiftPackage",
            //5.2.依赖的外部库
            //dependencies: ["Alamofire", "SwiftyJSON"],
            dependencies: ["Alamofire"],
            //5.3.源代码的相对路径,相当于cocopods中的source_files
            //SPM 默认会在 Sources/TargetName/ 下寻找代码
            path: "Sources/MySwiftPackage",
            //5.4.资源文件相对路径（图片、JSON、Bundle）
            resources: [
                //(1).这里的 "Assets" 相对路径是基于path 目录，// 现在 SPM 会在 `Sources/MySwiftPackage/Assets` 找到资源
                //(2).在Sources目录下创建目录Assets，将所有资源文件(静态资源文件)放到新建的目录Assets下
                //(3).默认方式：.process("Assets")，SMP处理并优化资源（适用于JSON，图片等）。
                //.copy("Assets")，原封不动拷贝到Bundle资源里面
                .process("Assets")//资源文件自动处理
            ]
        ),
        
    ]
)
