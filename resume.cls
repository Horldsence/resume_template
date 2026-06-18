% ============================================================
%  resume.cls — 双栏简历文档类（请勿修改）
%  编译: XeLaTeX
% ============================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2025/01/01 Two-Column Chinese Resume]

% ---------- 基类 ----------
\LoadClass[11pt,a4paper]{article}

% ---------- 中文 ----------
\RequirePackage[UTF8,heading]{ctex}
\xeCJKsetup{AutoFakeBold}

% ---------- 页面 ----------
\RequirePackage[top=1.2cm, bottom=1.0cm, left=1.2cm, right=1.2cm]{geometry}

% ---------- 颜色 ----------
\RequirePackage[svgnames]{xcolor}
\definecolor{accent}{HTML}{2C3E50}
\definecolor{lightaccent}{HTML}{607D8B}
\definecolor{rulecolor}{HTML}{B0BEC5}

% ---------- 字体 ----------
\setCJKmainfont{FZXiaoBiaoSong-B05S}
\setmainfont{JetBrainsMono Nerd Font}[Ligatures=TeX]

% ---------- 图标 ----------

% ---------- 表格 ----------
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{multicol}

% ---------- 图形 ----------
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{microtype}

% ---------- 其他 ----------
\RequirePackage{hyperref}
\hypersetup{colorlinks=true, urlcolor=black, linkcolor=black}
\urlstyle{same}
\pagestyle{empty}

% ============================================================
%  用户命令
% ============================================================

% --- 照片：\photo{宽}{高} 或 \photo{宽}{高}[文件名] ---
\NewDocumentCommand{\photo}{m m o}{%
  {\centering
  \IfNoValueTF{#3}{%
    \begin{tikzpicture}[baseline={([yshift=-0.85em]current bounding box.north)}]
      \draw[rulecolor, line width=0.8pt] (0,0) rectangle (#1,#2);
      \node at (0.5*#1,0.5*#2) {\footnotesize\color{lightaccent}一寸照};
    \end{tikzpicture}%
  }{%
    \raisebox{-\height}{\includegraphics[width=#1,height=#2,keepaspectratio]{#3}}%
  }\par}%
}

% --- 姓名 ---
\newcommand{\name}[1]{%
  \begin{center}{\LARGE\bfseries\color{accent}#1}\end{center}\vspace{0.02em}%
}

% --- 意向岗位 ---
\newcommand{\position}[1]{%
  \begin{center}{\normalsize\color{lightaccent}#1}\end{center}\vspace{0.1em}%
}

% --- 分割线 ---
\newcommand{\sepline}{%
  \noindent{\color{rulecolor}\rule{\linewidth}{0.5pt}}%
}

% --- 联系方式（内部用 \infoitem 对齐标签与文字）---
\newcommand{\infoitem}[2]{%
  \begin{tabular}{@{}m{3.6em}@{\hspace{0.6em}}m{\dimexpr\linewidth-4.2em\relax}@{}}
    \raggedright\small\color{accent}#1 & \small #2 \\[0.08em]
  \end{tabular}%
}
\newcommand{\phone}[1]{\infoitem{电话}{#1}}
\newcommand{\email}[1]{\infoitem{邮箱}{#1}}
\newcommand{\birth}[1]{\infoitem{出生年月}{#1}}
\newcommand{\cet}[1]{\infoitem{英语}{#1}}
\newcommand{\github}[1]{\infoitem{GitHub}{\url{#1}}}
\newcommand{\blog}[1]{\infoitem{博客}{\url{#1}}}

% --- 左栏章节标题 ---
\newcommand{\leftsection}[1]{%
  \vspace{0.55em}%
  \noindent{\bfseries\color{accent}#1}
  \vspace{0.04em}\par%
  \noindent{\color{rulecolor}\rule{\linewidth}{0.5pt}}%
  \vspace{0.1em}\par%
}

% --- 右栏章节标题 ---
\newcommand{\rightsection}[1]{%
  \vspace{0.65em}%
  \noindent{\bfseries\large\color{accent}#1}
  \vspace{-0.12em}\par%
  \noindent{\color{rulecolor}\rule{\linewidth}{0.5pt}}%
  \vspace{0.1em}\par%
}

% --- 获奖：\award{名称}{级别}{年份} ---
\newcommand{\award}[3]{%
  {\small\bfseries #1\par}%
  {\small\color{lightaccent}#2\hfill\small #3\par}%
  \vspace{0.18em}%
}

% --- 教育：\school{学校}{时间} / \courses{课程} ---
\newcommand{\school}[2]{%
  \noindent\begin{tabularx}{\linewidth}{@{}X@{}r@{}}
    {\bfseries #1} & \small\color{lightaccent} #2
  \end{tabularx}\par%
}
\newcommand{\courses}[1]{{\small #1\par}\vspace{0.08em}}

% --- 项目：\project{名称}{时间} / \detail{描述} ---
\newcommand{\project}[2]{%
  \vspace{0.1em}%
  \noindent\begin{tabularx}{\linewidth}{@{}X@{}r@{}}
    {\bfseries #1} & \small\color{lightaccent} #2
  \end{tabularx}\par%
  \vspace{0.02em}%
}
\newcommand{\detail}[1]{{\small #1\par}\vspace{0.08em}}

% --- 开源项目：\osproject{名称}{数据}{简介} ---
\newcommand{\osproject}[3]{%
  \vspace{0.06em}%
  \noindent\begin{tabularx}{\linewidth}{@{}X@{}r@{}}
    {\small\bfseries #1} & \small\color{lightaccent} #2
  \end{tabularx}\par%
  {\small #3\par}\vspace{0.06em}%
}

% --- 技能：\skill{类别}{内容}（需放在 tabularx 内）---
\newcommand{\skill}[2]{%
  \small\bfseries #1 & \small #2 \\%
}

% --- 证书：\cert{名称} ---
\newcommand{\cert}[1]{\small #1}
