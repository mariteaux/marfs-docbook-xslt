# marf's DocBook XSLT
These are the XSLT stylesheets and build script I use to generate the versions of my stories on each of my three sites, [nofi.mari.somnol](http://nofi.mariteaux.somnolescent.net/writing/stories/), [lofi.mari.somnol](http://lofi.mariteaux.somnolescent.net/writing/stories/), and [hifi mari.somnol](http://mariteaux.somnolescent.net/writing/stories/). Each of these sites house the same content, just aimed at three different eras of browsers, and thus require some special tricks to synchronize what's on each across all three. Otherwise, I'd be managing three different HTML pages per site.

My stories provided a unique challenge, because I wanted to have them available to read all on one page or in chunks (chapters, etc) on individual pages. I was potentially looking, to fix just a single typo, having to fix it in six different places, let alone greater changes to structuring/markup or proper rewrites. That was not tenable.

As such, I set up a build system where the stories would be in kept in [DocBook](https://docbook.org) format, which is an XML-based language aimed at structuring books, technical documentation, and papers, and then converted to HTML through XSLT. These result in input pages for an [AutoSite](http://autosite.somnolescent.net/) project, in my case, the three projects for all three of my sites. (AutoSite is a templating engine that itself cuts down on the amount of work I need to maintain three different websites.)

This is all automated through a shell script that makes the output directories, runs the commands, and cleans the resulting files of XML namespace stuffs and doctypes (because the former isn't needed in HTML and the latter is handled in the AutoSite templates, not the input pages). Because xsltproc runs on any XML files it finds in the directory the script is pointed at, you can chunk the stories into separate files for each chapter and then use xinclude in a master DocBook document. xsltproc will run on each chapter individually and then on the master file, resulting in navigatable individual HTML pages and then an all-on-one-page version for people who prefer that.

## Usage
I don't expect anyone to use these but me. This is set up for my sites, my build process (using xsltproc on Cygwin), and is as messy as it comes, very much on purpose.

That said, the script is run like such:

```
sh buildall.sh [directory to story]
```

## So why is it a GitHub repo then?
Because it feels so right. Also, if anyone wants an example of how something like this could be put together for their own masochistic desires, I'm happy to provide.