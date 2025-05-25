#!/bin/env Rscript --vanilla

#-------------------------------------------------------------------------------
# This script is a wrapper for converting a file in Pandoc markdown to github
# markdown. It's mostly useful for converting equation formats.
#-------------------------------------------------------------------------------

args <- commandArgs(trailingOnly=TRUE)

pandoc_args <- c(
    "--from=markdown+rebase_relative_paths",
    "--to=gfm",
    "-o",
    args[2],
    args[1]
)

ret <- pandoc::pandoc_run(pandoc_args)
cat(ret)

