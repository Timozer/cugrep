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
\ProvidesClass{cugrep}[2018/01/21 v0.3 report class]

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

%\ctexset{
    %chapter={
        %format = \raggedright,
        %number = \arabic{chapter},
        %numberformat=\it\zihao{0},
        %nameformat=\bf\zihao{2},
        %aftername={\quad},
        %titleformat=\it\zihao{2},
        %pagestyle = empty,
    %},
    %section={
        %name = {\S}
    %}
%}
\CTEXsetup[format={\Large\flushleft}]{section}
%\renewcommand{\chapter}[1]{
    %\par
    %\LARGE\bf\flushright #1
    %\vspace{0.5cm}
    %\hrule{2pt}
%}
%\CTEXsetup[beforeskip={0pt}, afterskip={1pt}]{section}

%\RequirePackage{xifthen}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\cfoot{\thepage} 
\pagenumbering{arabic}

%\RequirePackage{amstext, amsmath}
%\RequirePackage{booktabs}
%\RequirePackage[options]{package}[date]
%\RequirePackage{graphicx}

%------------------ 目录中的超链接(pdf 文档) ----------------------
\RequirePackage[unicode=true, pdfusetitle,
    bookmarks=true, bookmarksnumbered=false,
    bookmarksopen=false, breaklinks=false,
    pdfborder={0 0 1}, hidelinks=true,
    backref=false, colorlinks=false]{hyperref}

%------------------------------------------
\RequirePackage{timozerfont}
\RequirePackage{timozercode}

%--------------- Page Layout ---------------
%\RequirePackage[a4paper, top=1.55in, bottom=1.75in, left=1.75in, right=1.75in]{geometry}
%\RequirePackage[a4paper]{geometry}
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

\makeatletter 
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
                        \makebox[5em][s]{所\hfill 在\hfill 院\hfill 系:} & \makebox[8em][s]{ {}\the\college \hfill{}} & \\ 
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
            {\LARGE 评语}
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
\makeatother 

%--------------- Section Style -------------
%\renewcommand{\section}{%
%
%}

%\setcounter{secnumdepth}{0}

%--------------- Source Code ---------------
\endinput 
