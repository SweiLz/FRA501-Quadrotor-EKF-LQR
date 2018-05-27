%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: Wuttipat Chokananatasab [Liews]
%% Date:   April 23, 2018
%% Email:  sweilz.w@gmail.com, wuttipat.sero@mail.kmutt.ac.th
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Identification %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/fiboReport}[23/04/2018 A latex thai class file by Liews Wuttipat]
\typeout{https://github.com/sweilz/}

\LoadClass[12pt,a4paper,oneside]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% THAI Font %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{fontspec}
\XeTeXlinebreaklocale "th_TH"
\XeTeXlinebreakskip = 0pt plus 1pt
\defaultfontfeatures{Scale=1.23,Mapping=tex-text}
\setmainfont[Mapping=tex-text]{TH Sarabun New}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifthen} %% สำหรับใช้ if-else
\usepackage{verbatim} %% สำหรับใส่ Code programming
\usepackage{graphicx} %% สำหรับใส่ รูปภาพ
\usepackage[hidelinks]{hyperref} %% สำหรับใส่ URL

\usepackage{setspace} %% จัดการช่องว่าง
\usepackage{geometry} %% สำหรับจัดขอบหน้ากระดาษ
\usepackage{fancyhdr} %% สำหรับจัดการ Page layout
\usepackage{titlesec} %% สำหรับจัดการ Page title
\usepackage{titletoc} %% สำหรับจัดหน้าสารบัญ

\usepackage{tikz} %% สำหรับวาดแผนภาพต่างๆ
\usepackage{atbegshi} %% สำหรับทำสารบัญให้มี (ต่อ)
\usepackage{fancyvrb} %% สำหรับสร้างกล่อง Code
\fvset{frame=single,framesep=1mm,framerule=0.5mm}
\usepackage{amsmath} %% สำหรับเขียนสมการ
% \usepackage{lipsum}
% \usepackage{makeidx}
\newcommand{\quotes}[1]{``#1''} %% สร้างกล่องคำพูด
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Page layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{3} %% ความลึกของ section
\setcounter{tocdepth}{3} %% ความลึกของสารบัญ
% \geometry{left=40mm,top=30mm,bottom=20mm,right=20mm} %% Thesis Geometry
\geometry{left=25mm,top=30mm,bottom=20mm,right=25mm} %% Report Geometry

\titleformat{\chapter}[display]{\bfseries\Large}
{\filcenter\chaptertitlename~\thechapter}
{-0.7ex}{\vspace{1ex}\centering}[\vspace{1em}]
\titleformat{\section}[block]{\large\bfseries}{\thesection}{1ex}{}
\titleformat{\subsection}[block]{\normalfont\bfseries}{\thesubsection}{1ex}{}
\titleformat{\subsubsection}[block]{\normalfont\bfseries}{\thesubsubsection}{1ex}{}

\titlespacing{\chapter}{0pt}{-20pt}{0pt}
\titlespacing{\section}{0pt}{0pt}{0pt}
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\titlespacing{\subsubsection}{5mm}{0pt}{0pt}
\titlespacing{\paragraph}{10mm}{0pt}{10pt}
\titlespacing{\subparagraph}{15mm}{0pt}{10pt}

%% ตั้งค่าให้เป็นภาษาไทยบอกหน้า
\def\thaialph#1{\expandafter\thalph\csname c@#1\endcsname}
\def\thalph#1{%
    \ifcase#1\or ก\or ข\or ค\or ง\or จ\or ฉ\or ช\or ซ\or
    ฌ\or ญ\or ฎ\or ฏ\or ฐ\or ฑ\or ฒ\or ณ\or ด\or ต\or ถ\or ท\or ธ\or น\or
    บ\or ป\or ผ\or ฝ\or พ\or ฟ\or ภ\or ม\or ย\or ร\or ฤ\or ล\or ฦ\or ว\or
    ศ\or ษ\or ส\or ห\or ฬ\or อ\else ฮ\else\xpg@ill@value{#1}{thalph}\fi}
\newcommand\mainmatter{\cleardoublepage\pagenumbering{arabic}}
\newcommand\frontmatter{\cleardoublepage\pagenumbering{arabic}
\renewcommand{\thepage}{\thaialph{page}}}

%% ตั้งค่าให้หน้าไปแสดงที่ขอบขวาบน
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\fancypagestyle{plain}{
	\fancyhead{}
	\fancyhf{}
	\fancyhead[R]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}
%%%%%%%%%%%%%%%%%%%%%%%%% Table of Contents layout %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\chaptername}{บทที่}
\renewcommand{\figurename}{รูปที่}

\renewcommand{\contentsname}{สารบัญ}
\renewcommand{\listtablename}{รายการตาราง}
\renewcommand{\listfigurename}{รายการรูปภาพ}
\renewcommand{\appendixname}{ภาคผนวก}

\newcommand{\contenttopchapter}{เรื่อง}
\newcommand{\contenttoppage}{หน้า}
\newcommand{\contenttopfigure}{รูป}
\newcommand{\contenttoptable}{ตาราง}
\newcommand{\contenttopcontinued}{~(ต่อ)}
\renewcommand\bibname{เอกสารอ้างอิง}

\titlecontents{chapter}[0pt]{}{\bfseries\chaptername~\thecontentslabel~~}
	{\bfseries\thecontentslabel}{\bfseries\titlerule*[.25pc]{.}\contentspage}

\titlecontents{section}[25pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}
    
\titlecontents{subsection}[50pt]{}{\thecontentslabel~~}
	{\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{subsubsection}[65pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{paragraph}[80pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{subparagraph}[90pt]{}{\thecontentslabel~~}
    {\thecontentslabel}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{figure}[0pt]{}{\figurename~\thecontentslabel~~}
	{\figurename}{\titlerule*[.25pc]{.}\contentspage}

\titlecontents{table}[0pt]{}{\tablename~\thecontentslabel~~}
    {\tablename}{\titlerule*[.25pc]{.}\contentspage}

\newcommand{\ContentsHeader}[4]{
	\chapter*{#1#2} \noindent #3 \hfill #4\par\kern.5\baselineskip
}
\newcommand{\ContentsHeaderContinued}{\ContentsHeader{\contentsname}{\contenttopcontinued}{\contenttopchapter}{\contenttoppage}}
\newcommand{\LofHeaderContinued}{\ContentsHeader{\listfigurename}{\contenttopcontinued}{\contenttopfigure}{\contenttoppage}}
\newcommand{\LotHeaderContinued}{\ContentsHeader{\listtablename}{\contenttopcontinued}{\contenttoptable}{\contenttoppage}}

\renewcommand{\tableofcontents}{
    \AtBeginShipout{\ContentsHeaderContinued}
    \cleardoublepage
    \begingroup
    \ContentsHeader{\contentsname}{}{\contenttopchapter}{\contenttoppage}
    \addcontentsline{toc}{chapter}{\contentsname}
    \@starttoc{toc}
    \endgroup
    \renewcommand{\ContentsHeaderContinued}{}
}

\renewcommand{\listoffigures}{
    \AtBeginShipout{\LofHeaderContinued}
	\cleardoublepage
	\begingroup
	\ContentsHeader{\listfigurename}{}{\contenttopfigure}{\contenttoppage}
	\addcontentsline{toc}{chapter}{\listfigurename}
	\@starttoc{lof}
    \endgroup
    \renewcommand{\LofHeaderContinued}{}
}
\renewcommand{\listoftables}{
    \AtBeginShipout{\LotHeaderContinued}
	\cleardoublepage
	\begingroup
	\ContentsHeader{\listtablename}{}{\contenttoptable}{\contenttoppage}
	\addcontentsline{toc}{chapter}{\listtablename}
	\@starttoc{lot}
    \endgroup
    \renewcommand{\LotHeaderContinued}{}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Environment %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macro Definitions %%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}

\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

\newcommand{\@coverimage}{}
\newcommand{\coverimage}[1]{\renewcommand{\@coverimage}{#1}}

\newcommand{\@covertext}{}
\newcommand{\covertext}[1]{\renewcommand{\@covertext}{#1}}

\newcommand{\@academicyear}{2560}
\newcommand{\academicyear}[1]{\renewcommand{\@academicyear}{#1}}

\newcommand{\@Modifydate}{}
\newcommand{\Modifydate}[1]{\renewcommand{\@Modifydate}{#1}}
%% ชื่อที่ปรึกษา
\newcommand{\@advisor}{}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title Page %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{tudelft-cyan}{cmyk}{1,0,0,0}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{tudelft-green}{cmyk}{1,0.15,0.4,0}
\definecolor{tudelft-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{tudelft-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{tudelft-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{tudelft-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{tudelft-lavender}{cmyk}{0.45,0.2,0,0.07}
\definecolor{tudelft-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{tudelft-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{tudelft-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{tudelft-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{tudelft-yellow}{cmyk}{0.02,0,0.54,0}
\definecolor{tudelft-blue}{cmyk}{1,0.40,0,0}
\newlength\@cover@margin
\setlength\@cover@margin{12pt}
\newlength\@cover@splitboxwidth
\setlength\@cover@splitboxwidth{6.375in}
\newlength\@cover@splitboxheight
\setlength\@cover@splitboxheight{0.5\paperheight}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\renewcommand{\maketitle}{
    \newgeometry{margin=0pt}
	\thispagestyle{empty}
	\begin{tikzpicture}[remember picture,overlay]
		\node at (current page.west)[anchor=north west,inner sep=0pt] {
			\includegraphics[width=\paperwidth]{\@coverimage}};
		\node at (current page.south west)[anchor=south west,inner sep=20pt]{
			\includegraphics{classes/fibo_logo.jpeg}};
		\setlength\@cover@fronttextwidth{\@cover@splitboxwidth}
        \addtolength\@cover@fronttextwidth{+10\@cover@margin}
		\setlength\@cover@fronttextheight{\@cover@splitboxheight}
		\addtolength\@cover@fronttextheight{-4\@cover@margin}
		
        \node at (current page.north west)[anchor=north west,inner sep=3\@cover@margin]{
			\begin{minipage}[t][\@cover@fronttextheight]{\@cover@fronttextwidth}
				{\color{tudelft-white}\fontsize{32}{35}\selectfont\textbf{REPORT}
				\fontsize{16}{16}\selectfont\textbf\@Modifydate}
				% {\color{tudelft-white}\fontsize{23}{23}\selectfont\textbf\@subject}
				\vspace{5pt} \\
				{\color{tudelft-white}\fontsize{23}{23}\selectfont\textbf\@subject}\\
				{\color{tudelft-white}\fontsize{16}{16}\selectfont\textbf\@advisor}
				\vfill
				\vfill
				{\color{tudelft-black}\fontsize{40}{40}\selectfont\textbf\@title}
				\\
				\vspace{5pt}
				{\color{tudelft-black}\fontsize{30}{30}\selectfont\textbf\@subtitle}
				\vfill
				\vfill
				{\color{tudelft-white}\fontsize{22}{22}\selectfont\textbf{Member}}
				\vspace{5pt} \\
				{\color{tudelft-white}\fontsize{18}{18}\selectfont\@covertext}
				\vfill
				{\color{tudelft-white}\fontsize{22}{22}\selectfont\textbf{Insitude of Field Robotics, KMUTT}}
			\end{minipage}
		};
	\end{tikzpicture}
	\restoregeometry
	\pagecolor{white}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Thesis Abstract %%%%%%%%%%%%%%%%%%%%%%%%%%
\renewenvironment{abstract}{
\cleardoublepage
\setcounter{page}{1}
\begin{onehalfspacing}
\begin{flushleft}
    \begin{tabular*}{\textwidth}{@{}p{.17\textwidth}p{.70\textwidth}@{}}
		\textbf{ชื่อหัวข้อ}& {\@title} \\
		{} & {\@subtitle}\\
        \textbf{รายวิชา} & {\@subject}\\
		\textbf{สาขาวิชา}& {วิศวกรรมหุ่นยนต์และระบบอัตโนมัติ} \\
		\textbf{คณะ}& {สถาบันวิทยาการหุ่นยนต์ภาคนาม} \\
		\textbf{สถาบัน}& {มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี} \\
		\textbf{ปีการศึกษา}& \@academicyear \\
    \end{tabular*}
\end{flushleft}
\end{onehalfspacing}
\hrule height .7pt
\vspace{2em}
\begingroup
	\let\clearpage\relax
	\chapter*{บทคัดย่อ}
	\addcontentsline{toc}{chapter}{บทคัดย่อ}
\endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Abbreviations and Symbols  %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{abbreviations}
{
    \cleardoublepage
    \onecolumn
    \chapter*{\centering ประมวลศัพท์และตัวย่อ}
    \addcontentsline{toc}{chapter}{ประมวลศัพท์และตัวย่อ}
    \begingroup
    }{
    \vfill
	\endgroup
}

\newenvironment{symbols}
{
    \cleardoublepage
    \onecolumn
    \chapter*{\centering รายการสัญลักษณ์}
    \addcontentsline{toc}{chapter}{รายการสัญลักษณ์}
    \begingroup
    }{
    \vfill
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Appendices  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{lipsum}
\newenvironment{appendices}
{
    \cleardoublepage
    \clearpage\thispagestyle{empty}\addtocounter{page}{-1}
    \vspace*{\fill}
    \begin{center}
        {\bfseries\Huge\appendixname}
    \end{center}
    \vspace*{\fill}
	\appendix
	\renewcommand{\thechapter}{\thaialph{chapter}}
	
	\titlecontents{chapter}% <section-type>
  		[0pt]% <left>
  		{}% <above-code>
  		{\bfseries\appendixname\ \thecontentslabel\quad}% <numbered-entry-format>
  		{\bfseries\thecontentslabel}% <numberless-entry-format>
  		{\bfseries\titlerule*[.25pc]{.}\contentspage}% <filler-page-format>
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
