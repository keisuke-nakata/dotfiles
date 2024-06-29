#!/usr/bin/env perl

# https://qiita.com/rainbartown/items/d7718f12d71e688f3573#latexmkrc-%E3%81%AE%E7%B7%A8%E9%9B%86

# LaTeX
$latex = '/Library/TeX/texbin/platex -synctex=1 -halt-on-error -file-line-error %O %S';
$max_repeat = 5;

# BibTeX
$bibtex = '/Library/TeX/texbin/pbibtex %O %S';
$biber = '/Library/TeX/texbin/biber --bblencoding=utf8 -u -U --output_safechars %O %S';

# index
$makeindex = '/Library/TeX/texbin/mendex %O -o %D %S';

# DVI / PDF
$dvipdf = '/Library/TeX/texbin/dvipdfmx %O -o %D %S';
$pdf_mode = 3;

# preview
$pvc_view_file_via_temporary = 0;
if ($^O eq 'linux') {
    $dvi_previewer = "xdg-open %S";
    $pdf_previewer = "xdg-open %S";
} elsif ($^O eq 'darwin') {
    $dvi_previewer = "open %S";
    $pdf_previewer = "open %S";
} else {
    $dvi_previewer = "start %S";
    $pdf_previewer = "start %S";
}

# clean up
$clean_full_ext = "%R.synctex.gz"
