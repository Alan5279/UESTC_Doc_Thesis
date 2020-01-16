%
%  Copyright 2018 Zhiyuan Ma <yuliar3514@gmail.com>
% 
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
% 
%  This work has the LPPL maintenance status `maintained'.
% 
%  The Current Maintainer of this work is Zhiyuan Ma <yuliar3514@gmail.com>.
% 
%  This work consists of the files thesis-uestc.cls, thesis-uestc.bst.
% 


\ProvidesClass{thesis-uestc}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage{mathspec}
\RequirePackage{fontspec}
\RequirePackage{bm}
\RequirePackage{epstopdf}
\RequirePackage{bbm} %mathbb{1}
\RequirePackage{longtable}
%\RequirePackage{pifont}
%\RequirePackage{txfonts}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}
\RequirePackage{ragged2e}

%%%%%%%%%%% CJK下设置中文字体 %%%%%%%%%%%%%
\newcommand{\song}{\CJKfamily{song}} % 宋体   (Windows自带simsun.ttf)
\newcommand{\fs}{\CJKfamily{fs}}   % 仿宋体 (Windows自带simfs.ttf)
\newcommand{\kai}{\CJKfamily{kai}} % 楷体   (Windows自带simkai.ttf)
\newcommand{\hei}{\CJKfamily{hei}} % 黑体   (Windows自带simhei.ttf)
\newcommand{\li}{\CJKfamily{li}}   % 隶书   (Windows自带simli.ttf)
\newcommand{\xbsong}{\CJKfamily{xbs}}	%方正小标宋简体


%字体设置
\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{28pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{21pt}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{15.75pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.875pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.25pt}{\baselineskip}\selectfont}

\ifwindows
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}	%\heiti
\else
\ifmacosx
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{STHeiti}
\else
  \setCJKmainfont[AutoFakeBold=true]{simsun.ttc}
  \newCJKfontfamily{\heiti}{simhei.ttf}
  \setallmainfonts[
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf}
\fi
\fi

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{url}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}

\makeatletter % undo the wrong changes made by mathspec
\let\RequirePackage\original@RequirePackage
\let\usepackage\RequirePackage
\makeatother
\RequirePackage[nopostdot]{glossaries}
\renewcommand*{\glossarypreamble}{\vspace{-9pt}}

\newacronymstyle{acronym-uestc}{
  \ifglshaslong{\glslabel}{\glsgenacfmt}{\glsgenentryfmt}
}{
  \renewcommand*{\GenericAcronymFields}{
    first={\the\glslongtok\space\protect\paren{\the\glsshorttok}},
    description={\the\glslongtok}}
  \renewcommand*{\genacrfullformat}[2]{%
    \glsentrydesc{##1}~(\glsentrylong{##1},\space%
    \glsentryshort{##1})%
  }
  \renewcommand*{\acronymentry}[1]{%
    \acronymfont{\glsentryshort{##1}}%
  }
}
\setacronymstyle{acronym-uestc}

\newglossarystyle{long-uestc}{
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{.7\textwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{
  \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 缩略词表}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \setlength\glsdescwidth{.7\textwidth}
  \pdfbookmark{缩略词表}{glossary}
  \printglossary[style=long-uestc, title={\protect\centering 缩略词表}, nonumberlist, nogroupskip]
}
\makeglossaries

\RequirePackage{standalone}
\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{titletoc}	%调整目录格式
\RequirePackage{setspace}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
%\RequirePackage[linesnumbered,boxed]{algorithm2e}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
%\RequirePackage{algpseudocode}
\RequirePackage{booktabs}
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}


%\let\algorithm\relax
%\let\endalgorithm\relax
%\expandafter\let\csname algorithm*\endcsname\relax
%\expandafter\let\csname endalgorithm*\endcsname\relax
%\let\listofalgorithms\relax

% Define the new algorithm environment
%\DeclareFloatingEnvironment{algorithm}
%
%\makeatletter
%% Definition for the style ruled
%% First add the rules enclosing the caption
%\DeclareCaptionFormat{algrule}{%
%  {\@hangfrom{#1#2}%
%     \doublespacing
%     \small
%     \advance\caption@parindent
%     \advance\caption@hangindent\hangindent
%     \caption@@par#3\par
%     }% 
%}
%
%% Apply the new format to the algorithm environment
%%\captionsetup[algorithm]{format=algrule,name={算法}}
%%%-----修改algorithm显示--------
%%下面这两条是使用algorithm2e这个包的时候才用
%%\renewcommand{\listalgorithmcfname}{List of Algorithms}	%调整列表显示的
%%\renewcommand{\algorithmcfname}{算法}	%algorithm2e用这个
%
%%下面这一条是使用algorithm和algorithmic包的时候用
\floatname{algorithm}{算法}	%algorithm和algorithmic包的用这个
%%%----------------------------------
%
%\makeatletter
%
%\renewcommand{\algorithmname}{算法}
\renewcommand{\thealgorithm}{\arabic{chapter}-\arabic{algorithm}}
\captionsetup[algorithm]{aboveskip=6 pt}
\AtBeginEnvironment{algorithm}{\vspace{6pt} \setlength{\baselineskip}{20pt}}
%\AtBeginEnvironment{algorithmic}{\hline}
%\AtEndEnvironment{algorithm}{\hline}
\renewcommand{\algorithmicrequire}{ \textbf{输入:}} 
\renewcommand{\algorithmicensure}{ \textbf{输出:}}

\makeatletter
\renewcommand*\env@matrix[1][\arraystretch]{%
  \edef\arraystretch{#1}%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{*\c@MaxMatrixCols c}}
\makeatother

\newenvironment{lcase}
    {\left \lbrace \begin{aligned}}
    {\end{aligned}\right.}

\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}


\urlstyle{rm}
\raggedbottom

\renewcommand{\contentsname}{目\hspace{6pt}录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
\renewcommand{\listfigurename}{图形目录}
\renewcommand{\listtablename}{表格目录}


% \newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
% \addtocontents{lof}{\protect\noaddvspace}
% \addtocontents{lot}{\protect\noaddvspace}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}  %表格内容换行用

\pretocmd{\listoffigures}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 图形目录}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \renewcommand{\cftfigpresnum}{图}
  %下面这段消除图表目录章与章之间的空行
  \makeatletter
  \def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \if@mainmatter
                           \refstepcounter{chapter}%
                           \typeout{\@chapapp\space\thechapter.}%
                           \addcontentsline{toc}{chapter}%
                                     {\protect\numberline{\thechapter}#1}%
                         \else
                           \addcontentsline{toc}{chapter}{#1}%
                         \fi
                      \else
                        \addcontentsline{toc}{chapter}{#1}%
                      \fi
                      \chaptermark{#1}%
                      \if@twocolumn
                        \@topnewpage[\@makechapterhead{#2}]%
                      \else
                        \@makechapterhead{#2}%
                        \@afterheading
                      \fi}
  \makeatother
  %设置长度
  \addtolength{\cftfignumwidth}{16pt}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}} 
}{}{}

\newcommand{\thesisfigurelist}{
  \listoffigures
}

\pretocmd{\listoftables}{
    \newpage
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 表格目录}
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \renewcommand{\cfttabpresnum}{表}
  \addtolength{\cfttabnumwidth}{12pt}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-1}}
}{}{}

\newcommand{\thesistablelist}{
  \listoftables
}

\RequirePackage[a4paper, %margin=1 in,
right=3 cm, left=3 cm, %调整左右页边距
%  inner=3 cm, outer=3 cm, 
  top=3.1 cm, bottom=3.1 cm, %调整上下页边距
  ]{geometry}

%\RequirePackage[a4paper,
%  right=3 cm, left=3 cm, %调整左右页边距
%%  inner=3 cm, outer=3 cm, 
%  top=3.0 cm, bottom=3 cm, %调整上下页边距
%  bindingoffset=0cm]{geometry}	%A4（210×297）
  
%  \setlength{\textwidth}{15 cm plus 10 pt}	%左右是3cm，所以宽是210-30*2=150
%  \setlength{\textheight}{23.7 cm}	%上下是3cm，所以高是297-30*2=237
%  \setlength{\footskip}{1.0 cm}	%页脚是2cm，所以footskip是3.0-2.0=1.0cm
%  \setlength{\headsep}{0.2 cm}	%页眉是2.0 cm，所以headsep是3.0-2.0=1.0 cm
%  \setlength{\topskip}{0pt}
%  \setlength{\topmargin}{3.0cm}
%  \setlength{\headheight}{20pt}
%  \setlength{\oddsidemargin}{3.0cm}
%  \setlength{\evensidemargin}{\oddsidemargin}
  \setlength{\topskip}{0.55 cm}	%调整页眉到正文距离，试出来的
 \setlength{\footskip}{0.9 cm}	%调整页码到正文的距离，试出来的
  

\setlength{\headheight}{15pt}

\pagestyle{fancy}
%\linespread{1.391}
\linespread{1.251}
%\renewcommand{\baselinestretch}{1}
%段首缩进2字符
\setlength{\parindent}{2em}
\titlespacing{\chapter}{0pt}{0pt}{18pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\setlength{\baselineskip}{20pt}	%设置行间距为20磅

\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\text{\arabic{chapter}.\arabic{section}}}
\renewcommand{\thesubsection}{\text{\arabic{chapter}.\arabic{section}.\arabic{subsection}}}
\renewcommand{\thesubsubsection}{\text{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}}

%\AtBeginEnvironment{equation}{
%\setlength\abovedisplayskip{0pt}
%\setlength\belowdisplayskip{3pt}
%}

%\newenvironment{myequation}{
%{\setlength\abovedisplayskip{0pt}
%\setlength\belowdisplayskip{0pt}
%\begin{equation}
%}{
%\end{equation}
%}
%}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

\DeclareCaptionFont{FigCap}{\fontsize{10.5 pt pt}{20 pt}}	%表格和图的字体大小和行距

\captionsetup{format=hang}
\captionsetup{width=\textwidth - 42 pt}
\captionsetup[figure]{aboveskip=6 pt,belowskip=-8 pt,font=FigCap}
\captionsetup[table]{aboveskip=6 pt,belowskip=12 pt,font=FigCap}
\setlength{\extrarowheight}{5pt}
\setlength{\subfigcapskip}{0pt}
\setlength{\intextsep}{9pt}

\captionsetup[subfigure]
  {labelformat=simple, listofformat=subsimple, farskip = 0pt}

\makeatletter
\AtBeginEnvironment{figure}{
  \def\@floatboxreset{\centering}
}
\makeatother

\makeatletter
\AtBeginEnvironment{table}{
  \def\@floatboxreset{\centering}
}
\makeatother
\AtBeginEnvironment{tabular}{\small}

\makeatletter
\renewcommand{\p@subfigure}{\arabic{chapter}-\arabic{figure}}
\makeatother

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{4}
\setcounter{tocdepth}{4}

%在这里设置正文中的章节格式
\titleformat{\chapter}[block]
  {\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{7.5pt}{}

%正文中的编号样式需要加粗体，同时又要保证目录中不是粗体，所以这里这么设置。
\titleformat{\section}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\textbf{\arabic{chapter}.\arabic{section}}}{7pt}{}
  
\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\textbf{\arabic{chapter}.\arabic{section}.\arabic{subsection}}}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\heiti}
  {\textbf{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}}{6pt}{}

\RequirePackage[hang]{footmisc}
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\makeatletter
\def\@makefntext #1{
  \ifFN@hangfoot 
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@ 
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else 
              \hbox { \normalfont \@thefnmark} 
      \fi 
    }
        \leftmargin \wd \@tempboxa 
        \rightmargin \z@ \linewidth \columnwidth 
          \advance \linewidth -\leftmargin\parshape \@ne 
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip 
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax 
        \else 
          \parindent 1em \noindent 
            \ifdim 
                \footnotemargin >\z@ \hb@xt@ 
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@ 
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi 
            \fi
    \fi 
        \footnotelayout #1\ifFN@hangfoot \par \egroup 
  \fi
}
\makeatother

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

%这样设置的话，中英文摘要的编号才没错。
\newcommand\blankpage{%
%  \newpage
%  \null
%  \thispagestyle{empty}%
  \addtocounter{pseudopage}{0}%显示有问题的时候需要调整下这一项
  \newpage
}

\setcounter{pseudopage}{-1}
\newenvironment{chineseabstract}{
  \fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pagenumbering{Roman}
    \pdfbookmark{中文摘要}{chineseabstract}
    \chapter*{摘\chinesespace 要}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 摘要}
}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
    \fi
}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
    \begin{minipage}[t]{48pt}
      \noindent\textbf{关键词\chinesecolon}
    \end{minipage}
    \begin{minipage}[t]{\linewidth - 48pt}
      #1
    \end{minipage}
}
  
\newenvironment{englishabstract}{
  \pdfbookmark{英文摘要}{englishabstract}
  \chapter*{\bfseries ABSTRACT}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont ABSTRACT}
}{
%  \checkoddpage
%  \ifoddpage
%      \blankpage
%    \else
%      \newpage
%    \fi
%英文摘要这里不需要了。
}
  
\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent\begin{minipage}[t]{2.1cm}
      \noindent\textbf{Keywords: }
    \end{minipage}
    \begin{minipage}[t]{
      \linewidth - 2.1cm}
        #1
    \end{minipage}
}

%主要符号表的PDF书签插入
\newenvironment{thesissymbols}{
\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pagenumbering{Roman}
  \pdfbookmark{主要符号表}{thesissymbols}
  \chapter*{主要符号表}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 主要符号表}
}{
%  \checkoddpage
%  \ifoddpage
%      \blankpage
%    \else
%      \newpage
%    \fi
%英文摘要这里不需要了。
}

%缩略词表的PDF书签插入
\newenvironment{thesisabbr}{
\fancyfoot[CE,CO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{pseudopage}}
  \pagenumbering{Roman}
  \pdfbookmark{缩略词表}{thesisabbr}
  \chapter*{缩略词表}
    \thispagestyle{fancy}
    \fancyhead[C]{\fontsize{10.5pt}{12.6pt}\selectfont 缩略词表}
}{
%  \checkoddpage
%  \ifoddpage
%      \blankpage
%    \else
%      \newpage
%    \fi
%英文摘要这里不需要了。
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{0pt}
\setlength{\cftbeforechapskip}{0pt}

\addtolength{\cftchapnumwidth}{25pt}

\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

\renewcommand{\cfttoctitlefont}{\fontsize{15pt}{15pt}\selectfont\heiti}
\renewcommand\cftchapfont{\heiti}

\newcommand{\chinesedegreename}{硕士}
\newcommand{\chinesebooktitle}{硕士学位论文}
\newcommand{\englishbooktitle}{Master Thesis}
\newcommand{\thetitle}{}
\newcommand{\theenglishtitle}{}
\newcommand{\theauthor}{}
\newcommand{\theenglishauthor}{}
\newcommand{\thedate}{}
\newcommand{\theschool}{}
\newcommand{\theenglishschool}{}
\newcommand{\themajor}{}
\newcommand{\theenglishmajor}{}
\newcommand{\theadvisor}{}
\newcommand{\theenglishadvisor}{}
\newcommand{\thestudentid}{}

\renewcommand{\title}[1]{
  \renewcommand{\thetitle}{#1}
}

\newcommand{\englishtitle}[1]{
	\renewcommand{\theenglishtitle}{#1}
}

\renewcommand{\author}[1]{
  \renewcommand{\theauthor}{#1}
}

\newcommand{\englishauthor}[1]{
  \renewcommand{\theenglishauthor}{#1}
}

\renewcommand{\date}[1]{
  \renewcommand{\thedate}{#1}
}

\newcommand{\major}[1]{
  \renewcommand{\themajor}{#1}
}

\newcommand{\englishmajor}[1]{
	\renewcommand{\theenglishmajor}{#1}
}

\newcommand{\school}[1]{
  \renewcommand{\theschool}{#1}
}

\newcommand{\englishschool}[1]{
	\renewcommand{\theenglishschool}{#1}
}

\newcommand{\advisor}[1]{
  \renewcommand{\theadvisor}{#1}
}

\newcommand{\englishadvisor}[1]{
	\renewcommand{\theenglishadvisor}{#1}
}

\newcommand{\studentid}[1]{
  \renewcommand{\thestudentid}{#1}
}




\DeclareOption{bachelor}{
  \renewcommand{\chinesedegreename}{本科}
  \renewcommand{\chinesebooktitle}{本科学位论文}
  \renewcommand{\englishbooktitle}{Bachelor Thesis}
}

\DeclareOption{master}{
  \renewcommand{\chinesedegreename}{硕士}
  \renewcommand{\chinesebooktitle}{硕士学位论文}
  \renewcommand{\englishbooktitle}{Master Thesis}
}

\DeclareOption{promaster}{
  \renewcommand{\chinesedegreename}{硕士}
  \renewcommand{\chinesebooktitle}{专业学位硕士学位论文}
  \renewcommand{\englishbooktitle}{Master Thesis for Professional Degree}
}

\DeclareOption{doctor}{
  \renewcommand{\chinesedegreename}{博士}
  \renewcommand{\chinesebooktitle}{博士学位论文}
  \renewcommand{\englishbooktitle}{Doctoral Dissertation}
}


\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{9 pt}
\begin{center}
  \fontsize{22 pt}{22 pt}\selectfont 电子科技大学 \\[7bp]
  \fontsize{12 pt}{12 pt}\selectfont UNIVERSITY OF ELECTRONIC SCIENCE
    AND TECHNOLOGY OF CHINA \\[36bp]
  \fontsize{42 pt}{42 pt}\selectfont\chinesebooktitle \\[24bp]
  \fontsize{16 pt}{16 pt}\selectfont
    \textbf{\MakeUppercase{\englishbooktitle}} \\[48bp]
  \includegraphics[width=221bp]{logo.eps} \\[48bp]
  \begin{tabular}{lp{4.6in}}
%    \fontsize{16 pt}{16 pt}\selectfont
\xiaoerhao \xbsong 论文题目 & \multirow{2}{4.6in}[-5 pt] %Use the negative value to lower the text
    {
        \centering
          \fontsize{16 pt}{19 pt}\selectfont
		\textbf{\thetitle}
    } \\
    \cline{2-2}
            & \\
    \cline{2-2}
  \end{tabular} \\[\baselineskip]
  \begin{tabular}{>{\fontsize{16 pt}{16 pt}\selectfont \xbsong}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{3.77in}}
    学科专业 & \textbf{\themajor} \\
    \cline{2-2}
    学\chinesespace\chinesespace 号 & \textbf{\thestudentid} \\
    \cline{2-2}
    作者姓名 & \textbf{\theauthor} \\
    \cline{2-2}
    指导老师 & \textbf{\theadvisor} \\
    \cline{2-2}
  \end{tabular}
\end{center}

\newpage
\thispagestyle{empty}
\noindent
%\begin{tabular}{lp{2.5in}lp{2.5in}}
%  分类号 & & 密级 &  \\
%  \cline{2-2}
%  \cline{4-4}
%  UDC\textsuperscript{ 注1} & & & \\
%  \cline{2-2}
%\end{tabular} \\[48bp]

\noindent
分类号 \uline{\hspace{2.5in}} 密级 \uline{\hspace{2.5in}} \\[12bp]
UDC\textsuperscript{ 注1} \uline{\hspace{2.5in}} \\[12bp]

\vspace{-24 pt}
\begin{center}
  \fontsize{36pt}{36 pt}\selectfont{\heiti
    学\chinesespace 位\chinesespace 论\chinesespace 文
  } \\[16bp]
    
    \renewcommand\arraystretch{1.2}
    \begin{tabular}{lp{5.5in}}
    \renewcommand\arraystretch{2}
    %    \fontsize{16 pt}{16 pt}\selectfont
    & \multirow{2}{5.5in}[-5 pt] %Use the negative value to lower the text
        {
            \centering
              \fontsize{22 pt}{22 pt}\selectfont
    		\textbf{\thetitle}
        } \\
        \cline{2-2}
                & \\
        \cline{2-2}
      \end{tabular} \\[\baselineskip]
%    \fontsize{22pt}{22pt}\selectfont	%题目用二号字体
%    \noindent
%    \thetitle \\
    \vspace{-62pt} \\
%    \rule{5.9in}{.4 pt} \\
	\noindent
    \fontsize{12pt}{12 pt}\selectfont（题名和副题名） \\[16bp]
   
    \fontsize{16pt}{16 pt}\selectfont
    \textbf{\theauthor} \\
    \vspace{-36pt} \\
    \rule{1.63in}{.4 pt} \\
    \fontsize{12pt}{12 pt}\selectfont（作者姓名） \\[16bp]
    
  \begin{tabular}{>{\fontsize{12 pt}{12 pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{4.45in}}
      指导老师 & \textbf{\theadvisor} \\
    \cline{2-2}
    &  \textbf{电子科技大学} \chinesespace \textbf{成都} \\
    \cline{2-2}
    & \\
    \cline{2-2}
    & \\
    \cline{2-2}
    & \fontsize{12 pt}{12 pt}\selectfont（姓名、职称、单位名称）
  \end{tabular}  \\[16bp]
\end{center}
  
  \noindent
  \begin{tabular}{>{\fontsize{12 pt}{12 pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{0.96in}
      >{\fontsize{12 pt}{12 pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16pt}{16 pt}\selectfont}
      p{2.48in}}
      申请学位级别 & \textbf{\chinesedegreename{}} &
      学科专业 & \textbf{\themajor} \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12 pt}{12 pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{1.0in}
      >{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{2.0in}}
      提交论文日期 &  &
      论文答辩日期 & \\
    \cline{2-2}
    \cline{4-4}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{3.97in}}
      学位授予单位和日期 & \textbf{电子科技大学 \chinesespace \chinesespace \chinesespace 年 \chinesespace 月 \chinesespace 日} \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12 pt}{12 pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{2.26in}}
      答辩委员会主席 & \\
    \cline{2-2}
  \end{tabular} \\
  \begin{tabular}{>{\fontsize{12pt}{12pt}\selectfont}l
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{4.89in}}
      评阅人 & \\
    \cline{2-2}
  \end{tabular}
  
\vspace{0.54in}
\noindent
注1：注明《国际十进分类法UDC》的类号。


\newpage
\setcounter{page}{0}
\setcounter{pseudopage}{0}
%The third cover: english title and name
\thispagestyle{empty}
\setlength{\extrarowheight}{9 pt}
\begin{center}
  \fontsize{21 pt}{21 pt} \selectfont
  \textbf{\\ \theenglishtitle} \\[286bp]
  %\fontsize{16 pt}{16 pt}\selectfont
  %  \textbf{\MakeUppercase{\englishbooktitle}} \\[48bp]
%  \includegraphics[width=221bp]{logo.pdf} 
%  \\[48bp]
  \fontsize{15 pt}{22.5 pt} \selectfont \textbf{A Doctoral Dissertation Submitted to \\
  University of Electronic Science and Technology of China}
   \\[36 bp]
   \hspace{-10 pt}
  \begin{tabular}{>{\fontsize{16 pt}{16 pt}\selectfont}r
      >{\centering\arraybackslash\fontsize{16 pt}{16 pt}\selectfont}
      p{4.3 in}}	%3.77
    \textbf{Discipline:} & \textbf{\theenglishmajor} \\
    \cline{2-2}
    \textbf{Author:} & \textbf{\theenglishauthor} \\
    \cline{2-2}
    \textbf{Supervisor:} & \textbf{\theenglishadvisor} \\
    \cline{2-2}
    \textbf{School:} & \textbf{\theenglishschool} \\
    \cline{2-2}
  \end{tabular}
\end{center}

\newpage
\noindent
\setcounter{page}{0}
\setcounter{pseudopage}{0}
%独创性声明和论文使用授权
\thispagestyle{empty}
\begin{center}
 \fontsize{18 pt}{18 pt}\selectfont{ \heiti%\songti
    独创性声明
  } \\[\baselineskip]
 \end{center}
 
 	
 
  \fontsize{14.05 pt}{20 pt}\selectfont{
%  \renewcommand{\CJKglue}{\hskip 1pt }
  \setlength{\parindent}{2 em}	%加了这个才能保证缩进正确
    本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。 
  }\\ %[\baselineskip]
  
  \fontsize{14.05 pt}{20 pt}\selectfont{
  \setlength{\parindent}{2 em}	%加了这个才能保证缩进正确
  作者签名： \uline{\hspace{1.5 in}} \hspace{3 em}
  日期： \hspace{2 em}年\hspace{1.5 em}月\hspace{1.5 em}日
  }\\[\baselineskip]
  
    \begin{center}
    \fontsize{18 pt}{18 pt}\selectfont{\heiti 论文使用授权}\\[\baselineskip]
    \end{center}
    
    %用一个空行或者\par 命令可以开始新的段落，同时会有默认的首行缩进。用\\ 或者\newline 可以强制换行在下一行继续，且在下一行不会有缩进。
  \fontsize{14.05 pt}{20 pt}\selectfont{
%  \renewcommand{\CJKglue}{\hskip 1pt }
  \setlength{\parindent}{2em}	%加了这个才能保证缩进正确。
  本学位论文作者完全了解电子科技大学有关保留、使用学位论文的规定，有权保留并向国家有关部门或机构送交论文的复印件和磁盘，允许论文被查阅和借阅。本人授权电子科技大学可以将学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存、汇编学位论文。  
  
  （保密的学位论文在解密后应遵守此规定）
  }\\ %[\baselineskip]
  \begin{flushright}
  \fontsize{14 pt}{20 pt}\selectfont{
      作者签名： \uline{\hspace{1.5 in}} \chinesespace
      导师签字： \uline{\hspace{1.5 in}} \\
      日期： \hspace{2 em}年\hspace{1.5 em}月\hspace{1.5 em}日
      }\\[\baselineskip]
  \end{flushright}
  \fontsize{12 pt}{16 pt}\selectfont	%还原正文找字体设置
  \setlength{\parindent}{2em}	%还原首行缩进
  
  %加入下面的行，保证摘要页码从I开始
  \setcounter{page}{-1}
  \setcounter{pseudopage}{-1}
}


\ProcessOptions\relax

\newcommand{\standardhead}{
  \fancyhf{}
  \fancyhead[CO]{\fontsize{10.5 pt}{12.6 pt}\selectfont\leftmark}
  \fancyhead[CE]{\fontsize{10.5 pt}{12.6 pt}\selectfont 电子科技大学\chinesedegreename{}学位论文}
  \fancyfoot[CE,CO]{\fontsize{9 pt}{10.8 pt}\selectfont\thepage}
}

\pretocmd{\tableofcontents}{
  \fancyhf{}
  \fancyhead[C]{\fontsize{10.5 pt}{12.6 pt}\selectfont 目录}
  \fancyfoot[CE,CO]{\fontsize{9 pt}{10.8 pt}\selectfont\Roman{pseudopage}}
  \pdfbookmark{目录}{toc}
}{}{}

%调整目录数字标签为非粗体

\newcommand{\thesistableofcontents}{
  \tableofcontents
}

\renewcommand{\chaptermark}[1]{\markboth{第\zhnumber{\arabic{chapter}}章 \hspace{5.25 pt}#1}{}}

\setlength{\cftbeforesecskip}{-1 pt}	%调整目录间距用

\newcommand{\thesisacknowledgement}{
  \renewcommand\thesection{\arabic{section}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}} 
  \setcounter{section}{0}
  \chapter*{致\hspace{12pt}谢}
  \addcontentsline{toc}{chapter}{致\hspace{12pt}谢}
  \markboth{致谢}{致谢}
  \thispagestyle{fancy}
}

\newcommand{\thesischapterexordium}{
  \checkoddpage
  \ifoddpage
      \blankpage
    \else
      \newpage
  \fi
    \newpage
  \addtocontents{toc}{\protect\setcounter{tocdepth}{4}} 
  \standardhead
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \chapter{绪\hspace{6pt}论}
    \chaptermark{绪论}
}

\newcommand{\thesisappendix}{
  \chapter*{附\chinesespace 录}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{a-\arabic{equation}}
    \renewcommand{\thetable}{a-\arabic{table}}
    \renewcommand{\thefigure}{a-\arabic{figure}}
}

\newcommand{\thesistranslationoriginal}{
  \chapter*{外文资料原文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料原文}
    \markboth{外文资料原文}{外文资料原文}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{Figure}
    \renewcommand{\tablename}{Table}
}

\newcommand{\thesistranslationchinese}{
  \chapter*{外文资料译文}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{外文资料译文}
    \markboth{外文资料译文}{外文资料译文}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\figurename}{图}
    \renewcommand{\tablename}{表}
}

%这句用来设置参考文献的标号是靠左还是靠右。%\hfill放在前面表示自动填充前面的空间，即右对齐；
%如果放在[#1]后面就是自动填充后面的空间，即左对齐
\makeatletter
\renewcommand{\@biblabel}[1]{\hfill[#1]}
\makeatother

\patchcmd\thebibliography
    {\labelsep}
    {\labelsep\itemsep=0pt\parsep=0pt\relax}
    {}
    {\typeout{Couldn't patch the command}}

\newenvironment{thesisbibliography}{
  \begin{thebibliography}{123}
    \interlinepenalty=10000
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
  \end{thebibliography}
}

\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000	%设置10000这种较大的值可以防止在参考文献中间分页
  \begin{spacing}{1.667}
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}

\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
      \equal{#1}{nocite}
    }{
%      \nocite{*}	%没有引用的参考文献会出现在最后。
	\renewcommand*{\makelabel}[1]{\hss##1}
    }{}
  \bibliographystyle{thesis-uestc}
  \bibliography{#2}
}

%\AtBeginBibliography{\renewcommand*{\makelabel}[1]{\hss#1}}

\newcites{achievement}{攻读\chinesedegreename{}学位期间取得的成果}

\newenvironment{thesisachievement}{
  \renewcommand{\bibname}{攻读\chinesedegreename{}学位期间取得的成果}
  \begin{thebibliography}{123}
  \interlinepenalty=10000
  \begin{spacing}{1.667}
  \thispagestyle{fancy}
  \small
}{
  \end{spacing}\end{thebibliography}
  \renewcommand{\bibname}{参考文献}
}

\newcommand{\thesisloadachievement}[1]{
  \nociteachievement{*}
  \renewcommand{\bibname}{攻读\chinesedegreename{}学位期间取得的成果}
  \thispagestyle{fancy}
  \begin{spacing}{1.667}
%  \bibliographystyleachievement{thesis-uestc}
%  \bibliographyachievement{#1}
	\bibliography{#1}
  \end{spacing}
  \renewcommand{\bibname}{参考文献}
}



\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\heiti}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例子}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
        \heiti
    #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}
\makeatother

\renewcommand{\citedash}{-} 	%重载多文献引用时的破折号样式，原来的是双线--
\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}	%新设定指令，参考文献引用变成上标
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{6 pt}
  \setlength{\belowdisplayskip}{6 pt}
  \setlength{\belowdisplayshortskip}{6 pt}
  \setlength{\abovedisplayshortskip}{6 pt}
}


\endinput