#let report(
  title: "标题",
  subtitle: "副标题",
  student: (name: "姓名", id: "学号"),
  institude: "学院",
  major: "专业",
  class: "班级",
  body,
) = {
  set document(
    author: student.name,
    title: title,
  )

  set heading(numbering: (..nums) => {
    let nums = nums.pos()

    if nums.len() == 1 {
      numbering("一", ..nums)
    } else if nums.len() == 2 {
      numbering("1.1", ..nums)
    }
  })

  set par(justify: true)

  set text(
    font: (
      (name: "Libertinus Serif", covers: "latin-in-cjk"),
      (name: "Noto Serif CJK SC"),
    ),
    lang: "zh",
    size: 12pt,
  )

  show raw: set text(font: "Maple Mono NFMono")
  show raw.where(block: true): it => block(fill: luma(90%), inset: 1em, radius: 0.2em, width: 100%, it)
  show raw.where(block: false): it => box(fill: luma(90%), inset: (x: 0.2em), outset: (y: 0.2em), radius: 0.2em, it)

  page({
    set align(center)

    set text(1.2em)

    image("assets/images/sysu.png")

    text(size: 2em, weight: "bold", title)

    v(1em)

    text(size: 1.5em, weight: "medium", subtitle)

    v(5em)

    grid(
      columns: (12em, 16em),
      row-gutter: 2em,
      rect(stroke: none, h(2fr) + "姓" + h(1fr) + "名" + h(2fr)),
      rect(width: 100%, stroke: (bottom: black), student.name),
      rect(stroke: none, h(2fr) + "学" + h(1fr) + "号" + h(2fr)),
      rect(width: 100%, stroke: (bottom: black), student.id),
      rect(stroke: none, h(2fr) + "学" + h(1fr) + "院" + h(2fr)),
      rect(width: 100%, stroke: (bottom: black), institude),
      rect(stroke: none, h(2fr) + "专" + h(1fr) + "业" + h(2fr)),
      rect(width: 100%, stroke: (bottom: black), major),
      rect(stroke: none, h(2fr) + "班" + h(1fr) + "级" + h(2fr)),
      rect(width: 100%, stroke: (bottom: black), class),
    )
  })

  body
}
