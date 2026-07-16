# Deep Generative Model Notes

这份仓库记录深度生成模型（Deep Generative Models）的学习笔记，使用 LaTeX 排版，主要由 XeLaTeX 编译生成。

## 章节内容

| 文件 | 主题 | 说明 |
|------|------|------|
| `tex/chap1_intro.tex` / `tex/chapter1_en.tex` | 深度生成模型简介 | 基础概念、生成建模框架与背景知识 |
| `tex/chap2_vae.tex` / `tex/chapter2_vae_en.tex` | 变分自编码器（VAE） | 变分推断、ELBO、重参数化技巧等 |
| `tex/chap3_ddpm.tex` / `tex/chapter3_ddpm_en.tex` | 去噪扩散概率模型（DDPM） | 前向/反向扩散、训练与采样 |
| `tex/chapter4_score_based_en.tex` | 基于 Score 的生成模型 | Score Matching、Langevin Dynamics、NCSN 等 |
| `tex/chap5_diffusion_model.tex` | 扩散模型与 Score-SDE 框架 | Score Matching、SDE/ODE 采样视角 |

> 注：`chapter*_en.tex` 为对应章节的英文版本；章节 4 的 Score-Based 视角是第 5 章 Score-SDE 框架的前置内容。

## 目录结构

```
.
├── tex/          # LaTeX 源文件
├── pdf/          # 编译生成的 PDF（可直接阅读）
├── graph/        # 插图资源
├── template/     # 模板与样式文件
├── build.sh      # 一键编译脚本
└── README.md
```

## 编译方式

推荐用根目录下的脚本编译：

```bash
./build.sh                         # 编译全部章节
./build.sh chap5_diffusion_model   # 只编译某一章
```

也可以手动编译：

```bash
cd tex
xelatex chap5_diffusion_model.tex
xelatex chap5_diffusion_model.tex   # 解析交叉引用
mv chap5_diffusion_model.pdf ../pdf/
rm -f chap5_diffusion_model.{aux,log,out}
```

部分章节依赖 `ctex`、`geometry`、`microtype` 等宏包，请确保本地 TeX 发行版已安装。

## 构建产物

- 已生成的 PDF 位于 `pdf/`，可直接打开阅读。
- 中间文件（`.aux`、`.log`、`.out` 等）已在 `.gitignore` 中排除，请勿提交到仓库。

## 协议

笔记内容仅供学习交流使用。
