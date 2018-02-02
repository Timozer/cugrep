% !TEX TS-program xelatex
% !TEX encoding = UTF-8 Unicode
% -*- coding: UTF-8; -*-
% vim: set fenc=utf-8

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  FileName: cugrep.cls
%%  Author:   Timozer
%%  E-mail:   zhenyuwang94@gmail.com
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1994/06/01]
\ProvidesClass{cugrep}[2018/02/02 v0.5 report class]

% \DeclareOption{options}{code}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

\LoadClass[
    scheme=chinese,
    heading=true,
    nofonts,
    c5size,
    utf8,
    a4paper,
    punct,
    oneside,
    fancyhdr,
    openany,
    amstex]{ctexbook}


%\setlength{param}{len}
%\addtolength{param}{len}
%---------------------- 字号参照 ----------------------
% \small 小五
% \normal 五号
% \large 小四
% \Large 小三
% \LARGE 小二
% \huge  二
% \Huge  一
%------------------------------------------------------

\ctexset{%
    space=auto,
    autoindent=true,
    chapter={%
        afterindent=true,
        pagestyle=plain,
        aftername={\quad},
        %format={\centering\titlefont\heiti\xiaoer[1]}
        %number = \arabic{chapter},
        %numberformat=\it\zihao{0},
        %nameformat=\bf\zihao{2},
        %titleformat=\it\zihao{2},
    },
    section={%
        afterindent=true,
        format={\flushleft\bf\sanhao},
        %name = {\S}
    },
    subsection={%
        afterindent=true,
        %beforeskip={16bp\@plus 1ex \@minus .2ex},
        %afterskip={6bp \@plus .2ex},
    },
    subsubsection={%
        afterindent=true,
    },
    %paragraph/afterindent=true,
    %subparagraph/afterindent=true,
    appendix/numbering = true,
    appendix/name = {附录\ }, % {前, 后}
    appendix/number = {\sf \Alph{chapter}},
}

%\addtolength{\topmargin}{-54pt}
%\setlength{\oddsidemargin}{-0.9cm}  % 3.17cm - 1 inch
%\setlength{\evensidemargin}{\oddsidemargin}
%\setlength{\textwidth}{17.00cm}
%\setlength{\textheight}{24.00cm}    % 24.62

\RequirePackage{xifthen}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\cfoot{\thepage} 
\pagenumbering{arabic}

% ams-tex, 用来排出漂亮的公式
\RequirePackage{amstext, amsmath, amssymb, amsfonts}
\RequirePackage{mathrsfs}
\RequirePackage{bm}
\RequirePackage{mathtools}
%\RequirePackage[defaultsups]{newtxtext}
\RequirePackage{courier}

% 图形支持宏包
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}

%\RequirePackage[options]{package}[date]

% 表格控制
\RequirePackage{longtable, makecell, tabu, booktabs}

\RequirePackage{enumitem}
\setlist{labelindent=\parindent, leftmargin=*}
%------------------ 目录中的超链接(pdf 文档) ----------------------
\RequirePackage[unicode=true, pdfusetitle,
    bookmarks=true, bookmarksnumbered=false,
    bookmarksopen=false, breaklinks=false,
    pdfborder={0 0 1}, hidelinks=true,
    backref=false, colorlinks=false]{hyperref}

%------------------------------------------
\RequirePackage{timozerfont}
\RequirePackage{timozercode}
\RequirePackage{timozertexlogos}
\RequirePackage{timozerbib}

%--------------- Page Layout ---------------
%\RequirePackage[a4paper, top=1.55in, bottom=1.75in, left=1.75in, right=1.75in]{geometry}
%-------------------------封面制作---------------------------
\RequirePackage{array} % 做封面的时候需要用到表格环境
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}
%-------- String Varable Define ------------
\newtoks\classname      % 课程名称
\newtoks\teacher        % 老师名字
\newtoks\sno            % 学号
\newtoks\major          % 专业
\newtoks\college        % 学院
\newtoks\class          % 学生类别: A: 博士, B: 硕士, C: 进修生

%--------------- Title Page ----------------
\renewcommand{\maketitle}{
    \begin{titlepage}
        \thispagestyle{empty}
        \begin{center}\leavevmode
                \vspace*{\baselineskip}
                {\par \Large 中国地质大学（武汉）研究生课程论文 \par}
                \vspace*{2\baselineskip}
                {\par \Huge \@title \par} %
                \vfill
                {\Large
                    \begin{tabular}{clc}
                        %\hbox to 6em {课\hfil 程\hfil 名\hfil 称:} & \hbox to 15em {{}\the\classname \hfil{}} & \\
                        \makebox[5em][s]{课\hfill 程\hfill 名\hfill 称:} & \makebox[8em][s]{\tabincell{l}{\the\classname} \hfill{}} & \\
                        \makebox[5em][s]{教\hfill 师\hfill 姓\hfill 名:} & \makebox[8em][s]{\the\teacher \hfill{}} & \\
                        \makebox[5em][s]{学\hfill 生\hfill 姓\hfill 名:} & \makebox[8em][s]{{\@author}\hfill{}} & \\
                        \makebox[5em][s]{学\hfill 号:} & \makebox[8em][s]{\the\sno \hfill{}} & \\
                        \makebox[5em][s]{所\hfill 在\hfill 院\hfill 系:} & \makebox[8em][s]{\the\college \hfill{}} & \\ 
                        \makebox[5em][s]{专\hfill 业:} & \makebox[8em][s]{\the\major \hfill{}} & \\
                        \makebox[5em][s]{类\hfill 别:} & \makebox[8em][s]{\the\class \hfill{}} & \\
                    \end{tabular}
                }
                \par
                \vfill
                {\@date \par}%
                \vspace*{\baselineskip}
        \end{center}

        \clearpage
        \thispagestyle{empty}
        \begin{center}
            {\LARGE \bf 评\quad 语}
        \end{center}
        \vskip 1.5ex
        % 评语表
        \renewcommand\arraystretch{1.25} % 稍微增大一点表格环境中的行距
        {\Large
            \begin{tabular}{|p{\textwidth}|}
                \hline
                对课程论文的评语: \\
                \tabularnewline[0.65\textheight]
                \hline
            \end{tabular}
            \\
            \begin{tabular}{|p{0.482\textwidth} |p{0.482\textwidth}|}
                \hline
                \makebox[5em][s]{平\hfill 时\hfill 成\hfill 绩:} & \makebox[7em][s]{课\hfill 程\hfill 论\hfill 文\hfill 成\hfill 绩:} \\
                \hline
                \makebox[5em][s]{总\hfill 成\hfill 绩:} & \makebox[7em][s]{评\hfill 阅\hfill 人\hfill 签\hfill 名:} \\
                \hline
            \end{tabular}
        }
        \begin{center}
            {\small 
                \begin{tabular}{ll}
                    \makebox[1em][s]{注:} & 1. 无评阅人签名成绩无效;\\
                    \makebox[1em][s]{} & 2. 必须用钢笔或圆珠笔批阅，用铅笔阅卷无效; \\
                    \makebox[1em][s]{} & 3. 如有平时成绩,必须在上面评分表中标出,并计算入总成绩. \\
                \end{tabular}
            }
        \end{center}
        \renewcommand\arraystretch{1} % 将行距还原

        \clearpage
    \end{titlepage}
}

% 页眉与页脚定义
% \LaTeX{}已经预定义了几种页面风格, e.g. empty, plain, headings, myheadings
% 在这里可以使用宏包 fancyhdr 来修改这些页面风格

% 首页页眉与页脚定义, 因为首页一般采用 plain 风格, 所以可以直接修改 plain 风格
\fancypagestyle{plain}{%
    \fancyhf{} % 清除所有页眉页脚
    \renewcommand{\headrulewidth}{0pt}
    \cfoot{\thepage}
}

%\newcommand\frontmatter{%
    %\cleardoublepage
    %\@mainmatterfalse
    %\pagenumbering{roman}}
%\newcommand\mainmatter{%
    %\cleardoublepage
    %\@mainmattertrue
    %\pagenumbering{arabic}}
%\newcommand\backmatter{%
    %\if@openright
      %\cleardoublepage
    %\else
      %\clearpage
    %\fi
    %\@mainmatterfalse}
%------ 重新定义 frontmatter, mainmatter, backmatter
\renewcommand{\frontmatter}{%
    \clearpage
    \pagestyle{plain}
    %\setcounter{page}{1} % 这条命令没有必要, 因为pagenumbering命令会自动将页码重新设置为1
    \pagenumbering{roman}
    %\setcounter{chapter}
    }
\renewcommand{\mainmatter}{%
    \clearpage
    \setcounter{chapter}{0}
    \pagenumbering{arabic}
    \pagestyle{fancy}
    \fancyhf{}
    \rhead{\small \rightmark}
    \lhead{\small 中国地质大学(武汉)研究生课程论文}
    \cfoot{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}
    }
\let\cugappendix = \appendix
\renewcommand{\appendix}{
    \setcounter{chapter}{0}
    \cugappendix 
    \@mainmattertrue
}
%\renewcommand{\appendix}{%
    %\clearpage
    %\setcounter{chapter}{0}
    %\renewcommand\thechapter{\Alph{chapter}}
    %%arabic 阿拉伯数字
    %%roman 小写的罗马数字
    %%Roman 大写的罗马数字
    %%alph 小写字母
    %%Alph 大写字母
    %}
%\renewcommand{\backmatter}{%
    %}

\newtoks\cugabstract
\newtoks\cugkeywords 
\newcommand{\AppChapter}[2]{%
    \phantomsection
    \addcontentsline{toc}{chapter}{\bf #1}
    %\addcontentsline{toe}{chapter}{\bf #2}
    \chapter*{#1}
    }

\newcommand{\tbib}[1]{%
    \bibliography{#1}
    \addcontentsline{toc}{chapter}{\bf 参考文献}
    }
\newcommand{\makeabstract}{%
    \clearpage 
    \AppChapter{摘\quad 要}{Abstract (in Chinese)}
    \setcounter{page}{1}
    {\normalsize
    \the\cugabstract 
    }
    \vspace{1ex}
    
    \noindent
    {\small {\bf 关键词:}\hskip0.5em \the\cugkeywords}
}
%--------------- Section Style -------------
%\renewcommand{\section}{%
%
%}

%\setcounter{secnumdepth}{0}

\RequirePackage{xparse}

% \RequirePackage{cleveref}
% \cref{label, label, ...}
% \crefrange{}{}
% \cpageref{label, label, ...}
% \cpagerefrange{label}{label}
% maybe i can use cleveref package to solve the problem
\AtBeginDocument{%
\let\oldref\ref%
\renewcommand{\ref}[1]{\hskip0.25em\oldref{#1}\hskip0.25em}
%\RenewDocumentCommand \ref { m }{\hskip0.25em\oldref{#1}\hskip0.25em}
}
\NewDocumentEnvironment{tfig}{m m}{%
    \begin{figure}[htbp]
        \centering 
    }{%
        \caption{#1}
        \label{#2}
    \end{figure}
}

% tex 中定义命令的语句 \def, \gdef, \edef, \xdef, \gdef -> \global\def
% \def<命令模板>{定义}
% \def\Emph#1{\bf{#1}}
%--------------- Source Code ---------------
\endinput 
