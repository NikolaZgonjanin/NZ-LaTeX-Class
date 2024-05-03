% Class made by Nikola Zgonjanin for Academic and Technical papers
% Contact nzgonjanin@raf.rs
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nzcls}[2024/03/27]
\def\@version{20240327}

% Process class options.
\newif\ifoldmargins\oldmarginsfalse
\newif\ifshowguides\showguidesfalse
\def\@fontsizeopt{11pt} % Default font size.
\DeclareOption{10pt}{\def\@fontsizeopt{10pt}}
\DeclareOption{11pt}{\def\@fontsizeopt{11pt}}
\DeclareOption{12pt}{\def\@fontsizeopt{12pt}}
\DeclareOption{oldmargins}{\oldmarginstrue} % Use old-style margins.
\DeclareOption{showguides}{\showguidestrue} % Show red lines for spacings.
\DeclareOption{twocolumn}{\OptionNotUsed} % don't allow two column style
\DeclareOption*{\PackageWarning{nzcls}{Unknown '\CurrentOption'}}
\ProcessOptions\relax
\LoadClass[onecolumn, \@fontsizeopt, openany]{report}

% Require packages.
\RequirePackage[OT2,T1]{fontenc} % character encoding
\RequirePackage[a4paper]{geometry} % page dimensions and margins
\RequirePackage{setspace} % control the line spacing (e.g. doublespacing)
\RequirePackage{float} % custom floats
\RequirePackage{flafter} % (builtin) floats after their definitions
\RequirePackage{caption} % customize captions without undoing hyperref
\RequirePackage{adjustbox} % rotate boxes
\RequirePackage{amsmath} % better math
\RequirePackage{amsfonts} % better math fonts
\RequirePackage{bm} % bold math (must be after amsmath)
\RequirePackage{listings} % code and algorithms
\RequirePackage{matlab-prettifier} % better MATLAB code formatting
\RequirePackage{upquote} % use upright single quotes in verbatim
\RequirePackage{array} % custom column alignment types
\RequirePackage{enumitem} % custom lists and list spacing
\RequirePackage{etoolbox} % modify existing environments
\RequirePackage{totalcount} % to count figures and tables
\RequirePackage{pgfplots} % plots (includes xcolor, graphicx, tikz)
\RequirePackage{pdfpages} % include whole pdf documents
\RequirePackage{hyperref} % hyperlinks
\RequirePackage{cmsrb} % serbian alphabet
\RequirePackage{etoolbox} % class development toolset
\RequirePackage{parskip} % paragraph spacing
\RequirePackage[serbian]{babel} % serbian language babel
\RequirePackage{soul} % better underlining


% PGF Plot configuration
\pgfplotsset{compat=newest}

% ----------------------
% Added content features
% ----------------------

% Standard math macros
\newcommand{\ulv}[1] % vectors
    {{}\mkern1mu\underline{\mkern-1mu#1\mkern-1mu}\mkern1mu}
\DeclareSymbolFont{euler}{U}{eur}{m}{n} % symbol font
\DeclareMathSymbol{\PI}{\mathord}{euler}{25} % up pi

% Convenience macros
\DeclareMathOperator{\sgn}{sgn}             % sign function
\DeclareMathOperator{\tr}{tr}               % trace of a matrix
\DeclareMathOperator{\adj}{adj}             % adjugate of a matrix
\DeclareMathOperator*{\argmax}{arg\,max}    % argmax operator
\DeclareMathOperator*{\argmin}{arg\,min}    % argmin operator
\newcommand{\abs}[1]{\left\lvert#1\right\rvert} % absolute value
\newcommand{\norm}[1]{\left\lVert#1\right\rVert} % vector or matrix norm
\newcommand{\ssm}[1]{[#1]_{\rule{0pt}{1.38ex}\times}} % skew symmetric matrix
\newcommand{\diff}[2]{\frac{\mathrm{d}{#1}}{\mathrm{d}{#2}}} % derivative
\newcommand{\piff}[2]{\frac{\partial{#1}}{\partial{#2}}} % partial derivative
\newcommand{\EE}[2]{\ensuremath{{{#1}\!\times\!10^{#2}}}} % scientific notation
\newcommand{\rom}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

% Upright math letters
\newcommand{\upc}[1][]{\mathrm{c}_{#1}}     % abbreviated cosine
\newcommand{\ups}[1][]{\mathrm{s}_{#1}}     % abbreviated sine
\newcommand{\upt}[1][]{\mathrm{t}_{#1}}     % abbreviated tangent
\newcommand{\upd}{\mathrm{d}}               % differential operator
\newcommand{\upe}{\mathrm{e}}               % Euler's number
\newcommand{\upi}{\mathrm{i}}               % imaginary number
\newcommand{\upj}{\mathrm{j}}               % imaginary number
\newcommand{\upk}{\mathrm{k}}               % quaternion number

% Increase maximum number of matrix columns.
\setcounter{MaxMatrixCols}{20}

% Define custom table column types (array package) and spacings.
\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\arraybackslash}p{#1}}
\setlength{\tabcolsep}{1ex} % spacing between columns of a table

% Custom colors (xcolor package)
\definecolor{blue}{RGB}{0,0,255}        % 0000ff
\definecolor{azure}{RGB}{0,128,255}     % 0080ff
\definecolor{cyan}{RGB}{0,209,209}      % 00d1d1
\definecolor{green}{RGB}{15,180,0}      % 0fb400
\definecolor{lime}{RGB}{169,203,0}      % a9cb00
\definecolor{yellow}{RGB}{255,191,0}    % ffbf00
\definecolor{orange}{RGB}{255,128,0}    % ff8000
\definecolor{red}{RGB}{255,0,0}         % ff0000
\definecolor{magenta}{RGB}{255,0,255}   % ff00ff
\definecolor{purple}{RGB}{128,0,255}    % 8000ff

% Clickable mailto email addresses
\newcommand{\mailto}[1]{\href{mailto:#1}{\nolinkurl{#1}}}

% ----------------------
% Miscellaneous Settings
% ----------------------

% Define default document sizing.
\newlength{\sideMargins}
\ifoldmargins
    \setlength{\sideMargins}{1.25in}
\else
    \setlength{\sideMargins}{1in}
\fi
\geometry{
    top=1in,
    bottom=\sideMargins,
    left=\sideMargins,
    right=\sideMargins,
    headsep={0.5\sideMargins - 0.05in},
    footskip={0.5\sideMargins + 0.05in}}

% Define paragraph indent size.
\newlength{\@fixedParIndent}
\setlength{\@fixedParIndent}{0pt}
\setlength\parindent{\@fixedParIndent}

% Define rubber space between first item and preceding paragraph.
\setlength{\topsep}{0pt}

% Avoid overfull lines.
\setlength{\emergencystretch}{\hsize}

% Make a black band to show overfull lines.
\overfullrule=1mm

% Allow the bottom of the page to have white space.
\raggedbottom

% Reduce chances of widows and orphans.
\widowpenalty10000
\clubpenalty10000

% Use French spacing.
\frenchspacing

% Reduce list spacing (enumitem package).
\setlist{
    topsep=0pt,
    parsep=0.5\parskip,
    itemsep=0.5\parskip,
    leftmargin=2\parindent,
    labelwidth=0pt,
    labelsep=0.5em,
    itemindent=1cm}
\setlist[description]{
    itemindent={0.5em-\parindent}}

% Remove extra spacing around equations (etoolbox package).
\newcommand{\customdisplayskips}{%
    \setlength{\abovedisplayskip}{0.5em}%
    \setlength{\belowdisplayskip}{0.5em}%
    \setlength{\abovedisplayshortskip}{0pt}%
    \setlength{\belowdisplayshortskip}{0pt}%
    \setlength{\jot}{0pt}} % interline spacing (amsmath package)
\appto{\tiny}{\customdisplayskips}
\appto{\scriptsize}{\customdisplayskips}
\appto{\footnotesize}{\customdisplayskips}
\appto{\small}{\customdisplayskips}
\appto{\normalsize}{\customdisplayskips}
\appto{\large}{\customdisplayskips}
\appto{\Large}{\customdisplayskips}
\appto{\LARGE}{\customdisplayskips}
\appto{\huge}{\customdisplayskips}
\appto{\Huge}{\customdisplayskips}

% Change tabular row spacing.
\AtBeginEnvironment{tabular}{\renewcommand{\arraystretch}{1.0}}

% Remove indents from multiline equations.
\setlength\multlinegap{0pt}

% Reduce spacing within arrays (e.g., matrices).
\renewcommand{\arraystretch}{0.62}

% Redefine the quote environment
\renewenvironment{quote}
    {\list{}{\setlength\rightmargin{2\@fixedParIndent}%
        \setlength\leftmargin{2\@fixedParIndent}%
        \rightmargin\leftmargin}%
    \setstretch{1}%
    \setlength{\parskip}{0pt}%
    \setlength{\parindent}{\@fixedParIndent}%
    \item\relax}
    {\endlist\vspace{-0.8em}}

% Create total counters (totalcount package).
\DeclareTotalCounter{figure}
\DeclareTotalCounter{table}

% Remove spacing before and after floats.
\setlength{\floatsep}{1.667\baselineskip}
\setlength{\textfloatsep}{1.667\baselineskip}
\setlength{\intextsep}{1.667\baselineskip}

% Customize captions. The caption package is used instead of manually redefining
% the "@caption" macro because of complications with the hyperref package.
\captionsetup{labelsep=period, %margin={1\parindent,1\parindent},
    skip=1ex, font={stretch=1.0, bf}}

% Define full-page, rotated floats.
\newenvironment{rotfigure}[1][]%
    {\begin{figure}[#1]
        \centering
        \begin{adjustbox}{angle=90}
            \begin{minipage}{\textheight}%
    }{%
            \end{minipage}
        \end{adjustbox}
    \end{figure}}
\newenvironment{rottable}[1][]%
    {\begin{table}[#1]
        \centering
        \begin{adjustbox}{angle=90}
            \begin{minipage}{\textheight}%
    }{%
            \end{minipage}
        \end{adjustbox}
    \end{table}}

% Hyperlink styling (hyperref package)
\hypersetup{
    hypertexnames=true,
    colorlinks=true,
    allcolors=black}

% Remove pdf image warnings.
\pdfsuppresswarningpagegroup=1

% Edit chapter header
\makeatletter
\def\@makechapterhead#1{%
  \vspace*{30}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \Large \bfseries #1\par\nobreak
    \vskip 20\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{30}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Large \bfseries  #1\par\nobreak
    \vskip 20\p@
  }}
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\makeatother

% -------------------------------------
% Custom code styles (listings package)
% -------------------------------------

% General listings style
\lstdefinestyle{codeonwhite}{
    xleftmargin=40pt, xrightmargin=0pt,
    frame=leftline, framesep=9pt, framerule=2pt, rulecolor=\color{gray!20},
    numbers=left, numberstyle=\scriptsize\ttfamily\color{gray},
    numbersep=\@fixedParIndent,
    upquote=true, showstringspaces=false, tabsize=4,
    breaklines=true, breakindent=\@fixedParIndent, breakatwhitespace=true,
    breakautoindent=true,
    aboveskip=0pt, belowskip=0pt}

% Pseudocode listings language
\lstdefinelanguage{pseudocode}{
    style=codeonwhite,
    basicstyle=\linespread{1.2}\rmfamily\small,
    commentstyle=\color{gray}\itshape,
    stringstyle=\color{orange}\ttfamily,
    keywords={function, for, while, do, break, continue, if, then, else, end,
        in, to, until, return},
    keywordstyle=\color{black}\bfseries,
    morecomment=[l]{\%\ },
    morestring=[b]",
    morestring=[b]',
    columns=flexible,
    prebreak={ \dots},
    mathescape=true}
\lstnewenvironment{pseudocode}[1][1]{%
    \lstset{language=pseudocode, firstnumber=#1}}{}

% Python code
\lstdefinelanguage{python}{
    style=codeonwhite,
    basicstyle=\linespread{1.2}\ttfamily\small,
    commentstyle=\color{gray},
    stringstyle=\color{orange},
    keywordstyle=[1]\color{azure},   % keywords
    keywordstyle=[2]\color{azure},   % builtin functions
    keywordstyle=[3]\color{purple},  % NumPy
    keywordstyle=[4]\color{magenta}, % MatplotLib
    keywords={and, as, assert, break, class, continue, def, del, elif, else,
        except, False, finally, for, from, global, if, import, in, is, lambda,
        None, nonlocal, not, or, pass, raise, return, True, try, while, with,
        yield},
    morekeywords=[2]{abs, aiter, all, any, anext, ascii, bin, bool, breakpoint,
        bytearray, bytes, callable, chr, classmethod, compile, complex, delattr,
        dict, dir, divmod, enumerate, eval, exec, exit, filter, float, format,
        frozenset, getattr, globals, hasattr, hash, help, hex, id, input, int,
        isinstance, issubclass, iter, len, list, locals, map, max, memoryview,
        min, next, object, oct, open, ord, quit, pow, print, property, range,
        repr, reversed, round, set, setattr, slice, sorted, staticmethod, str,
        sum, super, tuple, type, vars, zip},
    morekeywords=[3]{DataSource, LinAlgError, MachAr, NDArrayOperatorsMixin,
        NumpyVersion, T, abs, absolute, add, all, allclose, amax, amin, angle,
        any, append, apply_along_axis, apply_over_axis, arange, arccos, arccosh,
        arcsin, arcsinh, arctan, arctan2, arctanh, argmax, argmin, argpartition,
        argsort, argwhere, around, array, array2string, array_equal,
        array_equiv, array_repr, array_split, array_str, arraysetops,
        asanyarray, asarray, asarray_chkfinite, ascontiguousarray, asfarray,
        asfortranarray, asmatrix, asscalar, atleast_1d, atleast_2d, atleast_3d,
        average, bartlett, base_repr, binary_repr, bincount, bitwise_and,
        bitwise_or, bitwise_xor, blackman, block, bmat, broadcast,
        broadcast_arrays, broadcast_shapes, broadcast_to, busday_count,
        busday_offset, busdaycalendar, byte_bounds, c_, can_cast, capitalize,
        cbrt, ceil, center, chararray, chebyshev, cholesky, choose, cla, clip,
        column_stack, common_type, compare_chararrays, compress, concatenate,
        cond, conj, conjugate, convolve, copy, copysign, copyto, corrcoef,
        correlate, cos, cosh, count, count_nonzero, cov, cross, cumprod, cumsum,
        datetime_as_string, datetime_data, decode, deg2rad, degrees, delete,
        deprecate, deprecate_with_doc, det, diag, diag_indices,
        diag_indices_from, diagflat, diagonal, diff, digitize, disp, divide,
        divmod, dot, dsplit, dstack, dtype, ediff1d, eig, eigh, eigs, eigvals,
        eigvalsh, einsum, einsum_path, empty, empty_like, encode, endswith,
        equal, errstate, exp, exp2, expand_dims, expandtabs, expm1, extract,
        eye, fabs, fft, fft2, fftfreq, fftn, fftshift, hfft, ifft, ifft2, ifftn,
        ifftshift, ihfft, irfft, irfft2, irfftn, rfft, rfft2, rfftfreq, rfftn,
        fill_diagonal, find, find_common_type, finfo, fix, flat, flatiter,
        flatnonzero, flatten, flip, fliplr, flipud, float_power, floor,
        floor_divide, fmax, fmin, fmod, format_float_positional,
        format_float_scientific, format_parser, frexp, frombuffer, fromfile,
        fromfunction, fromiter, frompyfunc, fromregex, fromstring, fsolve, full,
        full_like, gcd, genfromtxt, geomspace, get_include, get_printoptions,
        getbufsize, geterr, geterrcall, geterrobj, gradient, greater,
        greater_equal, hamming, hanning, heaviside, hermite, hermite_e,
        histogram, histogram2d, histogram_bin_edges, histogramdd, hsplit,
        hstack, hypot, i0, identity, identiy, iinfo, imag, in1d, index, indices,
        inner, insert, interp, intersect1d, inv, invert, is_busday, isalnum,
        isalpha, isclose, iscomplex, iscomplexobj, isdecimal, isdigit, isfinite,
        isfortran, isin, isinf, islower, isnan, isnat, isneginf, isnumeric,
        isposinf, isreal, isrealobj, isscalar, issctype, isspace, issubclass_,
        issubdtype, issubsctype, istitle, isupper, ix_, join, kaiser, kron,
        laguerre, lcm, ldexp, left_shift, legendre, less, less_equal, lexsort,
        linspace, ljust, load, loadtxt, log, log10, log1p, log2, logaddexp,
        logaddexp2, logical_and, logical_not, logical_or, logical_xor, logspace,
        lower, lstrip, lstsq, mask_indices, mat, matmul, matrix_power,
        matrix_rank, max, maximum, maximum_sctype, may_share_memory, mean,
        median, memmap, meshgrid, mgrid, min, min_scalar_type, minimum,
        mintypecode, mod, modf, moveaxis, msort, multi_dot, multiply,
        nan_to_num, nanargmax, nanargmin, nancumprod, nancumsum, nanmax,
        nanmean, nanmedian, nanmin, nanpercentile, nanprod, nanquantile, nanstd,
        nansum, nanvar, ndenumerate, ndindex, nditer, negative, nested_iters,
        nextafter, nonzero, norm, not_equal, obj2sctype, ode, ogrid, ones,
        ones_like, outer, packbits, pad, partition, pcolor, percentile, pi,
        piecewise, pinv, place, polyfit, polynomial, polyval, positive, power,
        printoptions, prod, promote_types, ptp, put, put_along_axis, putmask,
        qr, quad, quantile, r_, rad2deg, radians, rand, randn, ravel,
        ravel_multi_index, real, real_if_close, reciprocal, remainder, repeat,
        replace, repmat, require, reshape, resize, result_type, rfind,
        right_shift, rindex, rint, rjust, roll, rollaxis, rot90, round_, round,
        row_stack, rpartition, rsplit, rstrip, s_, save, savetxt, savez,
        savez_compressed, sctype2char, searchsorted, select, set_printoptions,
        set_string_function, setbufsize, setdiff1d, seterr, seterrcall,
        seterrobj, setxor1d, shape, shares_memory, show_config, sign, signbit,
        sin, sinc, sinh, slogdet, solve, sort, sort_complex, spacing, split,
        splitlines, sqrt, square, squeeze squeeze, stack, startswith, std,
        str_len, strip, subtract, sum, svd, swapaxes, swapcase, take,
        take_along_axis, tan, tanh, tensordot, tensorinv, tensorsolve, tile,
        title, tofile, tolist, trace, translate, transpose, trapz, tri, tril,
        tril_indices, tril_indices_from, trim_zeros, triu, triu_indices,
        triu_indices_from, true_divide, trunc, typename, union1d, unique,
        unpackbits, unravel_index, unwrap, upper, vander, var, vdot, vectorize,
        vsplit, vstack, where, who, xlabel, ylabel, zeros, zeros_like, zfill},
    morekeywords=[4]{acorr, angle_spectrum, annotate, arrow, autoscale, autumn,
        axes, axhline, axhspan, axis, axline, axvline, axvspan, bar, bar_label,
        barbs, barh, bone, box, boxplot, broken_barh, cla, clabel, clf, clim,
        close, cohere, colorbar, connect, contour, contourf, cool, copper, csd,
        delaxes, disconnect, draw, draw_if_interactive, errorbar, eventplot,
        figimage, figlegend, fignum_exists, figtext, figure, fill, fill_between,
        fill_betweenx, findobj, flag, gca, gcf, gci, get,
        get_current_fig_manager, get_figlabels, get_fignums, get_plot_commands,
        getp, ginput, gray, grid, hexbin, hist, hist2d, hlines, hot, hsv,
        imread, imsave, imshow, inferno, install_repl_displayhook, ioff, ion,
        isinteractive, get, legend, locator_params, loglog, magma,
        magnitude_spectrum, margins, matshow, minorticks_off, minorticks_on,
        new_figure_manager, nipy_spectral, pause, pcolor, pcolormesh,
        phase_spectrum, pie, pink, plasma, plot, plot_date, polar, prism, psd,
        quiver, quiverkey, rc, rc_context, rcdefaults, rgrids, savefig, sca,
        scatter, sci, semilogx, semilogy, set_cmap, setp, show, specgram,
        spring, spy, stackplot, stairs, stem, step, streamplot, subplot,
        subplot2grid, subplot_mosaic, subplot_tool, subplots, subplots_adjust,
        summer, suptitle, switch_backend, table, text, thetagrids, tick_params,
        ticklabel_format, tight_layout, title, tricontour, trcontourf,
        tripcolor, triplot, twinx, twiny, uninstall_repl_displayhook,
        violinplot, viridis, vlines, waitforbuttonpress, winter, xcorr, xkcd,
        xlabel, xlim, xscale, xticks, ylabel, ylim, yscale, yticks},
    morecomment=[l]{\#\ },
    morecomment=[s]{"""}{"""},
    morestring=[b]",
    morestring=[b]',
    prebreak={ \char92},
    rulecolor=\color{azure!20}}
\lstnewenvironment{python}[1][1]{\lstset{language=python, firstnumber=#1}}{}
\newcommand*{\inputpython}[3]{\lstinputlisting[linerange={{#2}-{#3}},
    firstnumber=#2, language=python]{#1}}
\newcommand*{\py}{\lstinline[language=python, basicstyle=\ttfamily]}

% MATLAB code
\lstdefinestyle{styleMatlab}{
    style=Matlab-editor,
    basicstyle=\linespread{1.2}\ttfamily\small,
    xleftmargin=40pt, xrightmargin=0pt,
    frame=leftline, framesep=9pt, framerule=2pt, rulecolor=\color{green!20},
    numbers=left, numberstyle=\scriptsize\ttfamily\color{gray},
    numbersep=\@fixedParIndent,
    upquote=true, showstringspaces=false, tabsize=4,
    breaklines=true, breakindent=\@fixedParIndent, breakatwhitespace=true,
    breakautoindent=true,
    aboveskip=0pt, belowskip=0pt,
    prebreak={ ...}}
\lstnewenvironment{matlab}[1][1]{\lstset{style=styleMatlab, firstnumber=#1}}{}
\newcommand*{\inputmatlab}[3]{\lstinputlisting[
    style=styleMatlab, linerange={{#2}-{#3}}, firstnumber=#2]{#1}}
\newcommand*{\mat}{\lstinline[style=Matlab-editor, basicstyle=\ttfamily]}

% R code
\lstdefinelanguage{rlang}{
    style=codeonwhite,
    language=R,
    basicstyle=\linespread{1.2}\ttfamily\small,
    commentstyle=\color{green},
    stringstyle=\color{red},
    keywordstyle=\color{azure},
    morekeywords={TRUE, FALSE},
    deletekeywords={data, frame, length, as, character, gamma, beta},
    prebreak={},
    rulecolor=\color{purple!20}}
\lstnewenvironment{rlang}[1][1]{\lstset{language=rlang, firstnumber=#1}}{}
\newcommand*{\inputrlang}[3]{\lstinputlisting[linerange={{#2}-{#3}},
    firstnumber=#2, language=rlang]{#1}}
\newcommand*{\rlng}{\lstinline[language=rlang, basicstyle=\ttfamily]}