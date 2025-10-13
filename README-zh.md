# 模板

中山大学各类文档模板．

## 使用

将仓库克隆到[本地文件夹](https://github.com/typst/packages?tab=readme-ov-file#local-packages)．以 Linux 为例：

```sh
target="${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local"
mkdir -p "$target" && git clone "https://github.com/yuanlx27/sysu-templates" "$target/sysu-templates"
```

之后便可以在代码中调用此包．以实验报告为例：

```typ
#import "@local/sysu-templates:0.1.0": report

#show: report.with(
  title: "标题",
  subtitle: "副标题",
  student: (name: "姓名", id: "学号"),
  institude: "学院",
  major: "专业",
  class: "班级",
)

// 正文
```
