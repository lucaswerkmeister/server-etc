# `/etc`

This is the git repository for the `/etc` directory of my personal server.
It does not hold the entire contents of the `/etc` directory,
just some parts that I want to have under version control.
The main reason for making it public is that I think
some of the configuration files here might be useful to others as well
(I used to put those on [GitHub Gist][gist]
before publishing this repository).

## Highlights

The configuration files in `systemd/system/` override or amend several services
in order to sandbox them better.
For instance, Debian’s default `opendkim.service` configuration
starts OpenDKIM as root with no sandbox at all
(though the daemon later changes user to `opendkim`);
with my `local.conf` drop-in,
the daemon starts as its dedicated user right off the bat,
can never gain privileges again (e. g. setuid binaries lose their effect),
and sees a read-only file system except for a select handful of directories.

Some services also have accompanying `tmpfiles.d` and/or `sysusers.d` snippets,
to create necessary files, directories, or system users.

## License

**TL;DR:** Just use it. Attribution is nice. Contact me if necessary.

It’s complicated.
Some of the files here are just unmodified distribution defaults,
where I don’t know the license and am too lazy to find out.
Others are modified distribution defaults,
with my own changes.
Some are copied, again with modifications,
from [this Ars Technica series on running your own email server][taking-email-back].
The rest are mostly or entirely my own.

I’m not even sure if most of these files are copyrightable –
they might not reach the threshold of originality,
in which case, if I understand correctly,
you don’t need any license to just take them and use them as you see fit.
Of course, it’s still a good idea to record where you got them from
(e. g. via a comment), not just for attribution
but also so yo can refer back to the source for questions or future updates.

If you want to use anything in this repository
and your situation requires some license,
feel free to contact me, and I’m sure we can work something out.

[gist]: https://gist.github.com/
[taking-email-back]: https://arstechnica.com/information-technology/2014/02/how-to-run-your-own-e-mail-server-with-your-own-domain-part-1/
