# How to Document

<!-- toc -->

## How to write Markdown

Refer to these documents on how to write markdown if you are using:
- [VSCode](https://code.visualstudio.com/docs/languages/markdown)
- [Replit](https://docs.replit.com/tutorials/replit/markdown)

Check out the [CommonMark quick reference](https://commonmark.org/help/) first. Much of this document is borrowed from the rustdoc book[^rust].

Here are some features you must use in our internal wiki:

1. Adding References. See [above](how.md#how-to-add-inline-citations)

2. Adding Tables. To make cooler tables, check out the [GitHub Tables extension](https://github.github.com/gfm/#tables-extension-).

| Header1 | Header2 |
| ------- | ------- |
| abc     | def     |

```
| Header1 | Header2 |
|---------|---------|
| abc     | def     |

```

3. Adding task lists.

```
- [x] Complete task
- [ ] Incomplete task
```

4. Warning blocks

<div class="warning">A big warning!</div>

```
<div class="warning">A big warning!</div>
```

5. Latex, via [MathJax](https://www.mathjax.org/)

```
\\[ \mu = \frac{1}{N} \sum_{i=0} x_i \\]
```

\\[ \mu = \frac{1}{N} \sum_{i=0} x_i \\]

6. Graphs via the [DOT Language](https://graphviz.gitlab.io/doc/info/lang.html)

```dot process
digraph {
    "processed" -> "graph"
}
```

7. [Including Files](https://rust-lang.github.io/mdBook/format/mdbook.html#including-files)

Note you can write HTML in Markdown as well! But please refrain from doing so unless necessary.

If you want to see all the Markdown features available to you, here is the [spec](https://spec.commonmark.org/0.30/).


## How to add inline citations
1. edit [src/bibliography.bib](https://github.com/UBC-iGEM/internal-wiki-2023-24/blob/main/src/bibliography.bib), check [here](https://bibtex.eu/types/) for the fields to fill out. For example, 
```
@article{ref_name,
    url = {http://www.jstor.org/stable/3263863},
    author = {D. J. A. Clines},
    journal = {Journal of Biblical Literature},
    number = {1},
    pages = {22--40},
    publisher = {Society of Biblical Literature},
    title = {{The Evidence for an Autumnal New Year in Pre-Exilic Israel Reconsidered}},
    volume = {93},
    year = {1974}
}
```
2. Then call your reference in any mdbook file like this: [@ref_name]
