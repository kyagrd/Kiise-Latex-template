\ProvidesClass{jok}[2010/12/01 v1 thesis class for SNU CSE]

\newif\if@preprint

% load default class and set default paper size and font size
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{preprint}{\@preprinttrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt,a4paper,twocolumn]{article}
\setlength{\columnsep}{15mm}

% set default parpar margin
\usepackage[top=30mm, left=12.5mm, right=12.5mm, bottom=20mm]{geometry}


% set default font and hangul packages
\usepackage{times}
\usepackage{dhucs-cmap}
\usepackage[hangul,nonfrench,finemath]{kotex}
% \SetHangulFonts{utgr}{utgt}{uttz}

% packages for spacing
\usepackage[hangul]{dhucs-setspace}

% set line spacing
\SetHangulspace{1.3}{1.1}


\usepackage{indentfirst}
\setlength{\parindent}{1em}
\setlength{\parskip}{0pt}


% package for footnotes
\usepackage[parenthesis,hang]{dhucsfn}

% caption style
\usepackage[nooneline,normal]{caption}
\setlength{\captionmargin}{15pt}

\captionsetup[figure]{labelsep=space}
\captionsetup[table]{labelsep=space}
\captionsetup[algorithm]{labelsep=space}



% set section presentation
% 1, 1.1, 1.1.1, 1.1.1.1 형식으로 연결되도록 함.
\usepackage[ensec]{dhucs-sectsty}
\sectionfont{\fontsize{12}{12}\bfseries\selectfont}
\subsectionfont{\fontsize{10}{10}\bfseries\selectfont}
\subsubsectionfont{\fontsize{10}{10}\bfseries\selectfont}


% do not generate page number
\pagestyle{empty}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variable settings 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\engtitle#1{\gdef\@engtitle{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\engabstract#1{\gdef\@engabstract{#1}}
\def\keyword#1{\gdef\@keyword{#1}}
\def\engkeyword#1{\gdef\@engkeyword{#1}}

\newcommand\auth[2]{\parbox{4cm}{\centering #1\\({\normalsize #2})}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 제목
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
	\twocolumn[
	\begin{center}
		{\fontsize{22}{22}\selectfont {\bfseries {\@title}} \par}
 		\vspace{1mm}
		{\fontsize{16}{16}\selectfont {({\@engtitle}}) \par}
  		\vspace{8mm}
 		\if@preprint
	 		\vspace{26pt}
% 			\vphantom{\fontsize{10}{10}\selectfont {\centering {\@author}}}
		\else
			{\fontsize{12}{12}\selectfont {\centering {\@author}}}
		\fi
		\par
 		\vspace{8mm}
 		\hspace{14mm}
		\parbox{14cm}{~~{\bfseries 요~~약}
                                \fontsize{9}{9}\selectfont {\@abstract} \par}
 		\hspace{14mm}
		\par
 		\vspace{2mm}
 		\hspace{14mm}
		\parbox{14cm}{~~{\bfseries 키워드:}
                                \fontsize{9}{9}\selectfont {\@keyword} \par}
 		\hspace{14mm}
		\par
 		\vspace{8mm}
 		\hspace{14mm}
		\parbox{14cm}{~~{\bfseries Abstract}
                                \fontsize{9}{9}\selectfont {\@engabstract} \par}
 		\hspace{14mm}
		\par
 		\vspace{2mm}
 		\hspace{14mm}
		\parbox{14cm}{~~{\bfseries Keywords:}
                                \fontsize{9}{9}\selectfont {\@engkeyword} \par}
 		\hspace{8mm}
	\end{center}
	\vspace{25mm}
	]
}

\renewcommand{\refname}{\vspace*{5mm}\centering\textsf{References}}
\makeatletter
\newcommand\bibsection{%
   \cnetering \section*{{\sfseries{\refname}}}%
}%
\makeatother

% format with dot '.' after the section number and before the section title
\makeatletter
\def\@seccntformat#1{
	\@ifundefined{#1@cntformat}%
	{\csname the#1\endcsname\quad}% default
	{\csname #1@cntformat\endcsname}% individual control
}
\def\section@cntformat{\thesection.\quad}
% \def\subsection@cntformat{\thesubsection.\quad}
\makeatother

