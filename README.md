# `convert-feed` utility

The utility accepts atom or rss feed, manipulates it some kind and returns the result into stdout in specified format.

Run it:

    bin/convert-feed.rb --out atom source.xml
    bin/convert-feed.rb --out atom https://ru.hexlet.io/lessons.rss

**Options**

Sort feed items

    --sort [DIRECTION] (reverse, date, reverse_date)

Limit items

    --limit [COUNT]
