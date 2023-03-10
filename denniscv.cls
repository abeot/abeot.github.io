\ProvidesClass{denniscv}[2021/08/10 Dennis Chen's multi-page CV class]
\LoadClass{article}

\RequirePackage[letterpaper,top=1.5cm,bottom=1.5cm,left=2cm,right=2cm]{geometry} % adjust marhins
\RequirePackage{nopageno} % no page counter
\RequirePackage{changepage} % adjust margins

% colors

\RequirePackage{xcolor}

\definecolor{topcolor}{RGB}{3,54,255} % top level color, used for name and cat
\definecolor{wildcolor}{RGB}{90,15,10} % wildcard color for quotes and anything else that comes up
\definecolor{bodycolor}{RGB}{0,0,0} % body color. used for act and desc
\definecolor{refcolor}{RGB}{50, 50, 50} % color used for references.

\RequirePackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=topcolor
}

% fonts
\RequirePackage{graphicx} % for the next thing
\newsavebox\CBox % lighter bold
\def\lightBold#1{\sbox\CBox{#1}\resizebox{\wd\CBox}{\ht\CBox}{\textbf{#1}}}

% titling commands

\newcommand{\name}[1]{
\begin{center}
{\color{topcolor}\huge\bfseries\sffamily #1}
\end{center}
} % name of person

% packages for socials icons

\RequirePackage{marvosym}
\RequirePackage{fontawesome}

\newcommand{\sociallist}[1]{
\begin{center}
{\hypersetup{
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=refcolor
}\color{refcolor}\sffamily#1}
\end{center}
} % linkedin and whatnot

\newcommand{\social}[2]{#1\hspace{3pt}#2}
\newcommand{\sep}{\hspace{5pt}$\circ$\hspace{5pt}}

\newcommand{\cvQuote}[2]{
    \begin{adjustwidth}{6cm}{6cm}
        {\fontfamily{Alegreya-LF}\selectfont\color{wildcolor}#1
            \begin{flushright}
            \textsl{#2}
            \end{flushright}
        }
    \end{adjustwidth}
} % quote for CV

%body commands

\newcommand{\cat}[1]{
\vspace{6pt}
\noindent{\color{topcolor}\bfseries\Large\sffamily#1
\vspace{3pt}
\hrule}
} %category

\newcommand{\act}[3]{
\vspace{6pt}
	\noindent{{\fontsize{11}{13.2}\fontfamily{Alegreya-LF}\selectfont\color{bodycolor}\lightBold{{\sffamily#1}}\hfill#2 \if\relax\detokenize{#3}\relax\else\hspace{0mm}-- #3\fi}}
\vspace{2pt}
} %each thing i did. \act{thing}{start date}{end date}

\newcommand{\desc}[1]{
\noindent{\normalsize\sffamily\color{bodycolor}#1}
} %description

\newcommand{\refer}[1]{
\vspace{1pt}
\noindent\color{refcolor}\small#1
}

