// EBU6230 Typst 讲义模板（独立文件，复制后改名即可使用）
// 用法：复制本文件 → 重命名为 notes_xxx.typ → 搜索「TODO」修改讲次信息 → 填写正文
// 说明见 TEMPLATE_USAGE.md

// ── 全局设置 ────────────────────────────────────────────
#let zh-font = (
  "Source Han Serif CN",
  "Source Han Serif SC",
  "Noto Serif CJK SC",
  "STSong",
  "SimSun",
)
#let zh = text.with(font: zh-font, lang: "zh")

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.8cm, right: 2.8cm),
  header: [
    #set text(size: 9pt, fill: rgb("#0056b3"))
    #grid(
      columns: (1fr, 1fr),
      align(left)[*EBU6230* 图像与视频处理],
      align(right)[Lecture N：中文标题],  // TODO: 页眉讲次，与封面一致
    )
    #line(length: 100%, stroke: 0.5pt + rgb("#0056b3"))
  ],
  footer: context [
    #set text(size: 9pt)
    #align(center)[#counter(page).display("1")]
  ],
)

#set text(font: zh-font, size: 11pt, lang: "zh")
#set par(justify: true, leading: 0.85em)
#set heading(numbering: "1.1")
#set math.text(font: zh-font, lang: "zh")

#show heading: it => {
  set text(font: zh-font, weight: "bold", fill: rgb("#0056b3"))
  it
}

// ── 颜色 ────────────────────────────────────────────────
#let c-primary = rgb("#0056b3")
#let c-accent  = rgb("#dc322f")
#let c-defbg   = rgb("#ebf4ff")
#let c-thmbg   = rgb("#fff5e6")
#let c-exbg    = rgb("#f0fff0")
#let c-notebg  = rgb("#fffaf0")
#let c-quizbg  = rgb("#faebff")
#let c-derivbg = rgb("#f5f0ff")

// ── 彩色块组件 ──────────────────────────────────────────
#let cbox(title: none, bg: c-defbg, border: c-primary, body) = {
  block(
    width: 100%,
    fill: bg,
    stroke: (left: 3pt + border, rest: 0.5pt + border),
    radius: (right: 4pt),
    inset: (left: 12pt, right: 10pt, top: 8pt, bottom: 8pt),
  )[
    #if title != none [
      #text(font: zh-font, weight: "bold", fill: border, lang: "zh")[#title] \
      #v(4pt)
    ]
    #body
  ]
}

#let defbox(title: "定义", body)   = cbox(title: title, bg: c-defbg,  border: c-primary,       body)
#let thmbox(title: none,   body)   = cbox(title: title, bg: c-thmbg,  border: rgb("#b35a00"),   body)
#let exbox(title: "示例",  body)   = cbox(title: title, bg: c-exbg,   border: rgb("#2e7d32"),   body)
#let notebox(title: "注意", body)  = cbox(title: title, bg: c-notebg, border: c-accent,         body)
#let derivbox(title: "推导", body) = cbox(title: title, bg: c-derivbg,border: rgb("#6a0dad"),   body)
#let quizbox(body)                  = cbox(title: "考点速记", bg: c-quizbg, border: rgb("#7b00cc"), body)

// 分段定义：中文显式走正文字体，避免与行内公式混排时字体错乱
#let cases-def(lhs, ..rows) = {
  let cells = ( [$#lhs =$], [], )
  for row in rows.pos() {
    let (val, desc) = row
    cells += (
      val,
      box(width: 100%, inset: 0pt)[
        #set text(font: zh-font, lang: "zh")
        #desc
      ],
    )
  }
  align(center)[
    #grid(
      columns: (auto, 1fr),
      column-gutter: 10pt,
      row-gutter: 6pt,
      align: (center, left),
      ..cells,
    )
  ]
}

// ── 标题页 ──────────────────────────────────────────────
#align(center)[
  #v(2cm)
  #text(size: 28pt, weight: "bold", fill: c-primary)[EBU6230\ 图像与视频处理]
  #v(1em)
  #line(length: 80%, stroke: 2pt + c-primary)
  #v(0.6em)
  #text(size: 20pt, weight: "bold")[Lecture N：中文标题]  // TODO: 封面讲次与中文标题
  #v(0.3em)
  #text(size: 14pt, fill: gray)[English Title]            // TODO: 英文副标题
  #v(0.6em)
  #line(length: 80%, stroke: 2pt + c-primary)
  #v(2fr)
  #table(
    columns: (auto, auto),
    stroke: none,
    inset: 6pt,
    align: (right, left),
    [*作者*], [fanzuituanhuo],                            // TODO: 作者
    [*课程*], [EBU6230],
    [*笔记整理*], [#datetime.today().display("[year] 年 [month] 月 [day] 日")],
  )
  #v(2cm)
]

#pagebreak()

// ── 目录 ────────────────────────────────────────────────
#outline(title: "目录", indent: 1.5em)

#pagebreak()

// ════════════════════════════════════════════════════════
= 本讲核心目标
// ════════════════════════════════════════════════════════

本讲围绕*主题（English Name）*展开，重点内容为：

+ 目标一；
+ 目标二；
+ 目标三。

// ════════════════════════════════════════════════════════
= 正文章节一
// ════════════════════════════════════════════════════════

== 小节

#defbox(title: "定义：概念名（English Term）")[
  首次出现写中英文对照。
]

#notebox(title: "注意")[
  易错点或补充说明。
]

#thmbox(title: "定理 / 流程 / 速查")[
  #table(
    columns: (auto, 1fr),
    stroke: 0.5pt,
    inset: 8pt,
    align: left,
    table.header([*列 1*], [*列 2*]),
    [条目], [说明],
  )
]

#derivbox(title: "推导：公式名称")[
  $ f(x) = ... $
]

#exbox(title: "示例")[
  数值或图示示例。
]

// ════════════════════════════════════════════════════════
= 速查表
// ════════════════════════════════════════════════════════

#thmbox(title: "核心对比")[
  #table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.5pt,
    inset: 8pt,
    align: left,
    table.header([*特性*], [*方案 A*], [*方案 B*]),
    [条目], [说明 A], [说明 B],
  )
]

// ════════════════════════════════════════════════════════
= 考点速记
// ════════════════════════════════════════════════════════

#quizbox[
  + *考点一？* \
    答案要点。

  + *考点二？* \
    答案要点。
]

// ════════════════════════════════════════════════════════
= 一页总结
// ════════════════════════════════════════════════════════

#cbox(title: "本讲核心结论", bg: c-defbg, border: c-primary)[
  *1. 要点一*\
  简要说明。

  #v(4pt)
  *2. 要点二*\
  简要说明。
]
