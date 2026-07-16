# Deep Generative Model Notes

这份仓库记录深度生成模型（Deep Generative Models）的学习笔记，使用 LaTeX 排版，主要由 XeLaTeX 编译生成。

## 章节内容

| 文件 | 主题 | 说明 |
|------|------|------|
| `chap1_intro.tex` | 深度生成模型简介 | 基础概念、生成建模框架与背景知识 |
| `chap2_vae.tex` | 变分自编码器（VAE） | 变分推断、ELBO、重参数化技巧等 |
| `chap3_ddpm.tex` | 去噪扩散概率模型（DDPM） | 前向/反向扩散、训练与采样 |
| `chap5_diffusion_model.tex` | 扩散模型与 Score-SDE 框架 | Score Matching、SDE/ODE 采样视角 |

> 注：章节编号跟随原课程/教材顺序，当前跳过 Chapter 4。

## 目录结构

```
.
├── chap1_intro.tex              # 第一章 LaTeX 源文件
├── chap2_vae.tex                # 第二章 LaTeX 源文件
├── chap3_ddpm.tex               # 第三章 LaTeX 源文件
├── chap5_diffusion_model.tex    # 第五章 LaTeX 源文件
├── chap*_build/                 # 各章节编译输出目录（含 PDF）
├── graph/                       # 插图资源
├── template/                    # 模板与样式文件
└── README.md                    # 本文件
```

## 编译方式

各章节为独立的 LaTeX 文档，推荐使用 XeLaTeX 编译：

```bash
xelatex chap2_vae.tex
```

部分章节依赖 `ctex`、`geometry`、`microtype` 等宏包，请确保本地 TeX 发行版已安装。

## 构建产物

- 已生成的 PDF 位于各 `chap*_build/` 目录下，可直接下载阅读。
- 中间文件（`.aux`、`.log`、`.out` 等）已在 `.gitignore` 中排除。

## 协议

笔记内容仅供学习交流使用。
