[4mWGET[24m(1)                                                      GNU Wget                                                     [4mWGET[24m(1)

[1mNAME[0m
       Wget - The non-interactive network downloader.

[1mSYNOPSIS[0m
       wget [[4moption[24m]... [[4mURL[24m]...

[1mDESCRIPTION[0m
       GNU Wget is a free utility for non-interactive download of files from the Web.  It supports HTTP, HTTPS, and FTP
       protocols, as well as retrieval through HTTP proxies.

       Wget is non-interactive, meaning that it can work in the background, while the user is not logged on.  This allows you to
       start a retrieval and disconnect from the system, letting Wget finish the work.  By contrast, most of the Web browsers
       require constant user's presence, which can be a great hindrance when transferring a lot of data.

       Wget can follow links in HTML, XHTML, and CSS pages, to create local versions of remote web sites, fully recreating the
       directory structure of the original site.  This is sometimes referred to as "recursive downloading."  While doing that,
       Wget respects the Robot Exclusion Standard ([4m/robots.txt[24m).  Wget can be instructed to convert the links in downloaded files
       to point at the local files, for offline viewing.

       Wget has been designed for robustness over slow or unstable network connections; if a download fails due to a network
       problem, it will keep retrying until the whole file has been retrieved.  If the server supports regetting, it will
       instruct the server to continue the download from where it left off.

[1mOPTIONS[0m
   [1mOption Syntax[0m
       Since Wget uses GNU getopt to process command-line arguments, every option has a long form along with the short one.  Long
       options are more convenient to remember, but take time to type.  You may freely mix different option styles, or specify
       options after the command-line arguments.  Thus you may write:

               wget -r --tries=10 http://fly.srk.fer.hr/ -o log

       The space between the option accepting an argument and the argument may be omitted.  Instead of [1m-o log [22myou can write
       [1m-olog[22m.

       You may put several options that do not require arguments together, like:

               wget -drc <URL>

       This is completely equivalent to:

               wget -d -r -c <URL>

       Since the options can be specified after the arguments, you may terminate them with [1m--[22m.  So the following will try to
       download URL [1m-x[22m, reporting failure to [4mlog[24m:

               wget -o log -- -x

       The options that accept comma-separated lists all respect the convention that specifying an empty list clears its value.
       This can be useful to clear the [4m.wgetrc[24m settings.  For instance, if your [4m.wgetrc[24m sets "exclude_directories" to [4m/cgi-bin[24m,
       the following example will first reset it, and then set it to exclude [4m/~nobody[24m and [4m/~somebody[24m.  You can also clear the
       lists in [4m.wgetrc[24m.

               wget -X "" -X /~nobody,/~somebody

       Most options that do not accept arguments are [4mboolean[24m options, so named because their state can be captured with a yes-or-
       no ("boolean") variable.  For example, [1m--follow-ftp [22mtells Wget to follow FTP links from HTML files and, on the other hand,
       [1m--no-glob [22mtells it not to perform file globbing on FTP URLs.  A boolean option is either [4maffirmative[24m or [4mnegative[0m
       (beginning with [1m--no[22m).  All such options share several properties.

       Unless stated otherwise, it is assumed that the default behavior is the opposite of what the option accomplishes.  For
       example, the documented existence of [1m--follow-ftp [22massumes that the default is to [4mnot[24m follow FTP links from HTML pages.

       Affirmative options can be negated by prepending the [1m--no- [22mto the option name; negative options can be negated by omitting
       the [1m--no- [22mprefix.  This might seem superfluous---if the default for an affirmative option is to not do something, then why
       provide a way to explicitly turn it off?  But the startup file may in fact change the default.  For instance, using
       "follow_ftp = on" in [4m.wgetrc[24m makes Wget [4mfollow[24m FTP links by default, and using [1m--no-follow-ftp [22mis the only way to restore
       the factory default from the command line.

   [1mBasic Startup Options[0m
       [1m-V[0m
       [1m--version[0m
           Display the version of Wget.

       [1m-h[0m
       [1m--help[0m
           Print a help message describing all of Wget's command-line options.

       [1m-b[0m
       [1m--background[0m
           Go  to background immediately after startup.  If no output file is specified via the [1m-o[22m, output is redirected to [4mwget-[0m
           [4mlog[24m.

       [1m-e [4m[22mcommand[0m
       [1m--execute [4m[22mcommand[0m
           Execute [4mcommand[24m as if it were a part of [4m.wgetrc[24m.  A command thus invoked  will  be  executed  [4mafter[24m  the  commands  in
           [4m.wgetrc[24m,  thus  taking  precedence  over  them.   If  you  need  to specify more than one wgetrc command, use multiple
           instances of [1m-e[22m.

   [1mLogging and Input File Options[0m
       [1m-o [4m[22mlogfile[0m
       [1m--output-file=[4m[22mlogfile[0m
           Log all messages to [4mlogfile[24m.  The messages are normally reported to standard error.

       [1m-a [4m[22mlogfile[0m
       [1m--append-output=[4m[22mlogfile[0m
           Append to [4mlogfile[24m.  This is the same as [1m-o[22m, only it appends to [4mlogfile[24m instead of overwriting the old  log  file.   If
           [4mlogfile[24m does not exist, a new file is created.

       [1m-d[0m
       [1m--debug[0m
           Turn  on  debug  output, meaning various information important to the developers of Wget if it does not work properly.
           Your system administrator may have chosen to compile Wget without debug support, in  which  case  [1m-d  [22mwill  not  work.
           Please note that compiling with debug support is always safe---Wget compiled with the debug support will [4mnot[24m print any
           debug info unless requested with [1m-d[22m.

       [1m-q[0m
       [1m--quiet[0m
           Turn off Wget's output.

       [1m-v[0m
       [1m--verbose[0m
           Turn on verbose output, with all the available data.  The default output is verbose.

       [1m-nv[0m
       [1m--no-verbose[0m
           Turn  off  verbose  without  being  completely  quiet  (use  [1m-q  [22mfor  that), which means that error messages and basic
           information still get printed.

       [1m--report-speed=[4m[22mtype[0m
           Output bandwidth as [4mtype[24m.  The only accepted value is [1mbits[22m.

       [1m-i [4m[22mfile[0m
       [1m--input-file=[4m[22mfile[0m
           Read URLs from a local or external [4mfile[24m.  If [1m- [22mis specified as [4mfile[24m, URLs are read from the standard input.  (Use  [1m./-[0m
           to read from a file literally named [1m-[22m.)

           If this function is used, no URLs need be present on the command line.  If there are URLs both on the command line and
           in  an  input  file,  those  on  the  command  lines  will  be the first ones to be retrieved.  If [1m--force-html [22mis not
           specified, then [4mfile[24m should consist of a series of URLs, one per line.

           However, if you specify [1m--force-html[22m, the document will be regarded as [1mhtml[22m.  In that case you may have problems  with
           relative  links, which you can solve either by adding "<base href="[4murl[24m">" to the documents or by specifying [1m--base=[4m[22murl[0m
           on the command line.

           If the [4mfile[24m is an external one, the document will be  automatically  treated  as  [1mhtml  [22mif  the  Content-Type  matches
           [1mtext/html[22m.  Furthermore, the [4mfile[24m's location will be implicitly used as base href if none was specified.

       [1m--input-metalink=[4m[22mfile[0m
           Downloads files covered in local Metalink [4mfile[24m. Metalink version 3 and 4 are supported.

       [1m--keep-badhash[0m
           Keeps  downloaded  Metalink's  files with a bad hash. It appends .badhash to the name of Metalink's files which have a
           checksum mismatch, except without overwriting existing files.

       [1m--metalink-over-http[0m
           Issues HTTP HEAD request instead of GET and extracts Metalink metadata from response  headers.  Then  it  switches  to
           Metalink download.  If no valid Metalink metadata is found, it falls back to ordinary HTTP download.  Enables [1mContent-[0m
           [1mType: application/metalink4+xml [22mfiles download/processing.

       [1m--metalink-index=[4m[22mnumber[0m
           Set   the   Metalink   [1mapplication/metalink4+xml   [22mmetaurl   ordinal   NUMBER.   From   1   to  the  total  number  of
           "application/metalink4+xml" available.  Specify 0 or [1minf [22mto choose the first good one.  Metaurls, such as those from a
           [1m--metalink-over-http[22m, may have been sorted by priority key's value; keep this in mind to choose the right NUMBER.

       [1m--preferred-location[0m
           Set preferred location for Metalink resources. This has effect if multiple resources with same priority are available.

       [1m--xattr[0m
           Enable use of file system's extended attributes to save the original URL and the Referer HTTP header value if used.

           Be aware that the URL might contain private information like access tokens or credentials.

       [1m-F[0m
       [1m--force-html[0m
           When input is read from a file, force it to be treated as an HTML file.  This enables you to retrieve  relative  links
           from  existing  HTML files on your local disk, by adding "<base href="[4murl[24m">" to HTML, or using the [1m--base [22mcommand-line
           option.

       [1m-B [4m[22mURL[0m
       [1m--base=[4m[22mURL[0m
           Resolves relative links using [4mURL[24m as the point of reference, when reading links from an HTML file  specified  via  the
           [1m-i[22m/[1m--input-file  [22moption  (together  with  [1m--force-html[22m,  or  when  the  input  file was fetched remotely from a server
           describing it as HTML). This is equivalent to the presence of a "BASE" tag in the HTML input file,  with  [4mURL[24m  as  the
           value for the "href" attribute.

           For instance, if you specify [1mhttp://foo/bar/a.html [22mfor [4mURL[24m, and Wget reads [1m../baz/b.html [22mfrom the input file, it would
           be resolved to [1mhttp://foo/baz/b.html[22m.

       [1m--config=[4m[22mFILE[0m
           Specify  the  location  of  a  startup  file you wish to use instead of the default one(s). Use --no-config to disable
           reading of config files.  If both --config and --no-config are given, --no-config is ignored.

       [1m--rejected-log=[4m[22mlogfile[0m
           Logs all URL rejections to [4mlogfile[24m as comma separated values.  The values include the reason of rejection, the URL and
           the parent URL it was found in.

   [1mDownload Options[0m
       [1m--bind-address=[4m[22mADDRESS[0m
           When making client TCP/IP connections, bind to [4mADDRESS[24m on the local machine.  [4mADDRESS[24m may be specified as  a  hostname
           or IP address.  This option can be useful if your machine is bound to multiple IPs.

       [1m--bind-dns-address=[4m[22mADDRESS[0m
           [libcares  only]  This  address  overrides  the  route  for  DNS requests. If you ever need to circumvent the standard
           settings from /etc/resolv.conf, this option together with [1m--dns-servers [22mis your friend.   [4mADDRESS[24m  must  be  specified
           either as IPv4 or IPv6 address.  Wget needs to be built with libcares for this option to be available.

       [1m--dns-servers=[4m[22mADDRESSES[0m
           [libcares   only]  The  given  address(es)  override  the  standard  nameserver  addresses,   e.g.  as  configured  in
           /etc/resolv.conf.  [4mADDRESSES[24m may be specified either as IPv4 or IPv6 addresses, comma-separated.   Wget  needs  to  be
           built with libcares for this option to be available.

       [1m-t [4m[22mnumber[0m
       [1m--tries=[4m[22mnumber[0m
           Set  number  of  tries  to [4mnumber[24m. Specify 0 or [1minf [22mfor infinite retrying.  The default is to retry 20 times, with the
           exception of fatal errors like "connection refused" or "not found" (404), which are not retried.

       [1m-O [4m[22mfile[0m
       [1m--output-document=[4m[22mfile[0m
           The documents will not be written to the appropriate files, but all will be concatenated together and written to [4mfile[24m.
           If [1m- [22mis used as [4mfile[24m, documents will be printed to standard output, disabling link conversion.  (Use [1m./- [22mto print to a
           file literally named [1m-[22m.)

           Use of [1m-O [22mis [4mnot[24m intended to mean simply "use the name [4mfile[24m instead of the one in the URL;" rather, it is analogous to
           shell redirection: [1mwget -O file http://foo [22mis intended to work like  [1mwget  -O  -  http://foo  >  file[22m;  [4mfile[24m  will  be
           truncated immediately, and [4mall[24m downloaded content will be written there.

           For  this  reason,  [1m-N  [22m(for  timestamp-checking)  is not supported in combination with [1m-O[22m: since [4mfile[24m is always newly
           created, it will always have a very new timestamp. A warning will be issued if this combination is used.

           Similarly, using [1m-r [22mor [1m-p [22mwith [1m-O [22mmay not work as you expect: Wget won't just download the first file to [4mfile[24m and then
           download the rest to their normal names: [4mall[24m downloaded content will be placed in [4mfile[24m. This was disabled  in  version
           1.11,  but  has  been  reinstated (with a warning) in 1.11.2, as there are some cases where this behavior can actually
           have some use.

           A combination with [1m-nc [22mis only accepted if the given output file does not exist.

           Note that a combination with [1m-k [22mis only permitted when downloading a single document, as in that  case  it  will  just
           convert all relative URIs to external ones; [1m-k [22mmakes no sense for multiple URIs when they're all being downloaded to a
           single file; [1m-k [22mcan be used only when the output is a regular file.

       [1m-nc[0m
       [1m--no-clobber[0m
           If a file is downloaded more than once in the same directory, Wget's behavior depends on a few options, including [1m-nc[22m.
           In certain cases, the local file will be [4mclobbered[24m, or overwritten, upon repeated download.  In other cases it will be
           preserved.

           When  running  Wget  without  [1m-N[22m,  [1m-nc[22m,  [1m-r[22m, or [1m-p[22m, downloading the same file in the same directory will result in the
           original copy of [4mfile[24m being preserved and the second copy being named [4mfile[24m[1m.1[22m.  If that file is downloaded  yet  again,
           the third copy will be named [4mfile[24m[1m.2[22m, and so on.  (This is also the behavior with [1m-nd[22m, even if [1m-r [22mor [1m-p [22mare in effect.)
           When [1m-nc [22mis specified, this behavior is suppressed, and Wget will refuse to download newer copies of [4mfile[24m.  Therefore,
           ""no-clobber""  is  actually  a  misnomer in this mode---it's not clobbering that's prevented (as the numeric suffixes
           were already preventing clobbering), but rather the multiple version saving that's prevented.

           When running Wget with [1m-r [22mor [1m-p[22m, but without [1m-N[22m, [1m-nd[22m, or [1m-nc[22m, re-downloading a file will result in the new copy simply
           overwriting the old.  Adding [1m-nc [22mwill prevent this behavior, instead causing the original version to be preserved  and
           any newer copies on the server to be ignored.

           When  running  Wget with [1m-N[22m, with or without [1m-r [22mor [1m-p[22m, the decision as to whether or not to download a newer copy of a
           file depends on the local and remote timestamp and size of the file.  [1m-nc [22mmay not be specified at the same time as [1m-N[22m.

           A combination with [1m-O[22m/[1m--output-document [22mis only accepted if the given output file does not exist.

           Note that when [1m-nc [22mis specified, files with the suffixes [1m.html [22mor [1m.htm [22mwill be loaded from the local disk  and  parsed
           as if they had been retrieved from the Web.

       [1m--backups=[4m[22mbackups[0m
           Before (over)writing a file, back up an existing file by adding a [1m.1 [22msuffix ([1m_1 [22mon VMS) to the file name.  Such backup
           files are rotated to [1m.2[22m, [1m.3[22m, and so on, up to [4mbackups[24m (and lost beyond that).

       [1m--no-netrc[0m
           Do  not  try  to  obtain credentials from [4m.netrc[24m file. By default [4m.netrc[24m file is searched for credentials in case none
           have been passed on command line and authentication is required.

       [1m-c[0m
       [1m--continue[0m
           Continue getting a partially-downloaded file.  This is useful when you want to finish  up  a  download  started  by  a
           previous instance of Wget, or by another program.  For instance:

                   wget -c ftp://sunsite.doc.ic.ac.uk/ls-lR.Z

           If there is a file named [4mls-lR.Z[24m in the current directory, Wget will assume that it is the first portion of the remote
           file, and will ask the server to continue the retrieval from an offset equal to the length of the local file.

           Note that you don't need to specify this option if you just want the current invocation of Wget to retry downloading a
           file  should  the  connection  be  lost  midway through.  This is the default behavior.  [1m-c [22monly affects resumption of
           downloads started [4mprior[24m to this invocation of Wget, and whose local files are still sitting around.

           Without [1m-c[22m, the previous example would just download the remote file to [4mls-lR.Z.1[24m, leaving the truncated [4mls-lR.Z[24m  file
           alone.

           If  you  use  [1m-c  [22mon  a  non-empty  file, and the server does not support continued downloading, Wget will restart the
           download from scratch and overwrite the existing file entirely.

           Beginning with Wget 1.7, if you use [1m-c [22mon a file which is of equal size as the one on the server, Wget will refuse  to
           download  the  file  and  print  an explanatory message.  The same happens when the file is smaller on the server than
           locally (presumably because it was changed on the server since your last download attempt)---because  "continuing"  is
           not meaningful, no download occurs.

           On the other side of the coin, while using [1m-c[22m, any file that's bigger on the server than locally will be considered an
           incomplete  download  and  only "(length(remote) - length(local))" bytes will be downloaded and tacked onto the end of
           the local file.  This behavior can be desirable in certain cases---for instance, you can use [1mwget -c [22mto download  just
           the new portion that's been appended to a data collection or log file.

           However,  if the file is bigger on the server because it's been [4mchanged[24m, as opposed to just [4mappended[24m to, you'll end up
           with a garbled file.  Wget has no way of verifying that the local file is really a valid prefix of  the  remote  file.
           You need to be especially careful of this when using [1m-c [22min conjunction with [1m-r[22m, since every file will be considered as
           an "incomplete download" candidate.

           Another  instance where you'll get a garbled file if you try to use [1m-c [22mis if you have a lame HTTP proxy that inserts a
           "transfer interrupted" string into the local file.  In the future a "rollback" option may be added to deal  with  this
           case.

           Note that [1m-c [22monly works with FTP servers and with HTTP servers that support the "Range" header.

       [1m--start-pos=[4m[22mOFFSET[0m
           Start  downloading at zero-based position [4mOFFSET[24m.  Offset may be expressed in bytes, kilobytes with the `k' suffix, or
           megabytes with the `m' suffix, etc.

           [1m--start-pos [22mhas higher precedence over [1m--continue[22m.  When [1m--start-pos [22mand [1m--continue [22mare both specified, wget will emit
           a warning then proceed as if [1m--continue [22mwas absent.

           Server support for continued download is required, otherwise [1m--start-pos [22mcannot help.  See [1m-c [22mfor details.

       [1m--progress=[4m[22mtype[0m
           Select the type of the progress indicator you wish to use.  Legal indicators are "dot" and "bar".

           The "bar" indicator is used by default.  It draws  an  ASCII  progress  bar  graphics  (a.k.a  "thermometer"  display)
           indicating the status of retrieval.  If the output is not a TTY, the "dot" bar will be used by default.

           Use  [1m--progress=dot  [22mto switch to the "dot" display.  It traces the retrieval by printing dots on the screen, each dot
           representing a fixed amount of downloaded data.

           The progress [4mtype[24m can also take one or more parameters.  The parameters vary based on the [4mtype[24m  selected.   Parameters
           to    [4mtype[24m    are    passed   by   appending   them   to   the   type   sperated   by   a   colon   (:)   like   this:
           [1m--progress=[4m[22mtype[24m[1m:[4m[22mparameter1[24m[1m:[4m[22mparameter2[24m.

           When using the dotted retrieval, you may set the [4mstyle[24m by specifying the type as [1mdot:[4m[22mstyle[24m.  Different  styles  assign
           different meaning to one dot.  With the "default" style each dot represents 1K, there are ten dots in a cluster and 50
           dots in a line.  The "binary" style has a more "computer"-like orientation---8K dots, 16-dots clusters and 48 dots per
           line (which makes for 384K lines).  The "mega" style is suitable for downloading large files---each dot represents 64K
           retrieved,  there  are eight dots in a cluster, and 48 dots on each line (so each line contains 3M).  If "mega" is not
           enough then you can use the "giga" style---each dot represents 1M retrieved, there are eight dots in a cluster, and 32
           dots on each line (so each line contains 32M).

           With [1m--progress=bar[22m, there are currently two possible parameters, [4mforce[24m and [4mnoscroll[24m.

           When the output is not a TTY, the progress bar always falls back to "dot", even if [1m--progress=bar [22mwas passed  to  Wget
           during  invocation.  This  behaviour  can  be overridden and the "bar" output forced by using the "force" parameter as
           [1m--progress=bar:force[22m.

           By default, the [1mbar [22mstyle progress bar scroll the name of the file from left to right for the file being downloaded if
           the  filename  exceeds  the  maximum  length  allotted  for  its  display.    In   certain   cases,   such   as   with
           [1m--progress=bar:force[22m,  one  may  not  want  the  scrolling  filename  in  the progress bar.  By passing the "noscroll"
           parameter, Wget can be forced to display as much of the filename as possible without scrolling through it.

           Note that you can set the default style using the "progress" command in [4m.wgetrc[24m.  That setting may be overridden  from
           the command line.  For example, to force the bar output without scrolling, use [1m--progress=bar:force:noscroll[22m.

       [1m--show-progress[0m
           Force wget to display the progress bar in any verbosity.

           By  default,  wget only displays the progress bar in verbose mode.  One may however, want wget to display the progress
           bar on screen in conjunction with any other verbosity modes like [1m--no-verbose [22mor [1m--quiet[22m.  This is often a  desired  a
           property  when invoking wget to download several small/large files.  In such a case, wget could simply be invoked with
           this parameter to get a much cleaner output on the screen.

           This option will also force the progress bar to be printed to [4mstderr[24m when used alongside the [1m--output-file [22moption.

       [1m-N[0m
       [1m--timestamping[0m
           Turn on time-stamping.

       [1m--no-if-modified-since[0m
           Do not send If-Modified-Since header in [1m-N [22mmode. Send preliminary HEAD request instead. This has  only  effect  in  [1m-N[0m
           mode.

       [1m--no-use-server-timestamps[0m
           Don't set the local file's timestamp by the one on the server.

           By default, when a file is downloaded, its timestamps are set to match those from the remote file. This allows the use
           of  [1m--timestamping  [22mon  subsequent  invocations  of  wget.  However,  it  is sometimes useful to base the local file's
           timestamp on when it was actually downloaded;  for  that  purpose,  the  [1m--no-use-server-timestamps  [22moption  has  been
           provided.

       [1m-S[0m
       [1m--server-response[0m
           Print the headers sent by HTTP servers and responses sent by FTP servers.

       [1m--spider[0m
           When invoked with this option, Wget will behave as a Web [4mspider[24m, which means that it will not download the pages, just
           check that they are there.  For example, you can use Wget to check your bookmarks:

                   wget --spider --force-html -i bookmarks.html

           This feature needs much more work for Wget to get close to the functionality of real web spiders.

       [1m-T seconds[0m
       [1m--timeout=[4m[22mseconds[0m
           Set  the  network  timeout to [4mseconds[24m seconds.  This is equivalent to specifying [1m--dns-timeout[22m, [1m--connect-timeout[22m, and
           [1m--read-timeout[22m, all at the same time.

           When interacting with the network, Wget can check for timeout and abort the operation if  it  takes  too  long.   This
           prevents anomalies like hanging reads and infinite connects.  The only timeout enabled by default is a 900-second read
           timeout.  Setting a timeout to 0 disables it altogether.  Unless you know what you are doing, it is best not to change
           the default timeout settings.

           All  timeout-related  options accept decimal values, as well as subsecond values.  For example, [1m0.1 [22mseconds is a legal
           (though unwise) choice of timeout.  Subsecond timeouts are useful for checking server response times  or  for  testing
           network latency.

       [1m--dns-timeout=[4m[22mseconds[0m
           Set  the  DNS lookup timeout to [4mseconds[24m seconds.  DNS lookups that don't complete within the specified time will fail.
           By default, there is no timeout on DNS lookups, other than that implemented by system libraries.

       [1m--connect-timeout=[4m[22mseconds[0m
           Set the connect timeout to [4mseconds[24m seconds.  TCP connections that take  longer  to  establish  will  be  aborted.   By
           default, there is no connect timeout, other than that implemented by system libraries.

       [1m--read-timeout=[4m[22mseconds[0m
           Set the read (and write) timeout to [4mseconds[24m seconds.  The "time" of this timeout refers to [4midle[24m [4mtime[24m: if, at any point
           in  the download, no data is received for more than the specified number of seconds, reading fails and the download is
           restarted.  This option does not directly affect the duration of the entire download.

           Of course, the remote server may choose to terminate the connection sooner than this  option  requires.   The  default
           read timeout is 900 seconds.

       [1m--limit-rate=[4m[22mamount[0m
           Limit  the  download speed to [4mamount[24m bytes per second.  Amount may be expressed in bytes, kilobytes with the [1mk [22msuffix,
           or megabytes with the [1mm [22msuffix.  For example, [1m--limit-rate=20k [22mwill limit the  retrieval  rate  to  20KB/s.   This  is
           useful when, for whatever reason, you don't want Wget to consume the entire available bandwidth.

           This  option  allows  the  use  of  decimal  numbers,  usually  in  conjunction  with  power  suffixes;  for  example,
           [1m--limit-rate=2.5k [22mis a legal value.

           Note that Wget implements the limiting by sleeping the appropriate amount of time after a network read that took  less
           time  than  specified by the rate.  Eventually this strategy causes the TCP transfer to slow down to approximately the
           specified rate.  However, it may take some time for this balance to be achieved, so don't be surprised if limiting the
           rate doesn't work well with very small files.

       [1m-w [4m[22mseconds[0m
       [1m--wait=[4m[22mseconds[0m
           Wait the specified number of seconds between the retrievals.  Use of this option is recommended, as  it  lightens  the
           server  load  by making the requests less frequent.  Instead of in seconds, the time can be specified in minutes using
           the "m" suffix, in hours using "h" suffix, or in days using "d" suffix.

           Specifying a large value for this option is useful if the network or the destination host is down, so  that  Wget  can
           wait  long enough to reasonably expect the network error to be fixed before the retry.  The waiting interval specified
           by this function is influenced by "--random-wait", which see.

       [1m--waitretry=[4m[22mseconds[0m
           If you don't want Wget to wait between [4mevery[24m retrieval, but only between retries of failed downloads, you can use this
           option.  Wget will use [4mlinear[24m [4mbackoff[24m, waiting 1 second after the first failure  on  a  given  file,  then  waiting  2
           seconds after the second failure on that file, up to the maximum number of [4mseconds[24m you specify.

           By default, Wget will assume a value of 10 seconds.

       [1m--random-wait[0m
           Some  web  sites  may  perform  log  analysis to identify retrieval programs such as Wget by looking for statistically
           significant similarities in the time between requests. This option causes the time between requests  to  vary  between
           0.5  and  1.5  * [4mwait[24m seconds, where [4mwait[24m was specified using the [1m--wait [22moption, in order to mask Wget's presence from
           such analysis.

           A 2001 article in a publication devoted to development on a popular consumer platform provided code  to  perform  this
           analysis  on  the  fly.   Its  author  suggested  blocking  at the class C address level to ensure automated retrieval
           programs were blocked despite changing DHCP-supplied addresses.

           The [1m--random-wait [22moption was inspired by this ill-advised recommendation to block many unrelated users from a web site
           due to the actions of one.

       [1m--no-proxy[0m
           Don't use proxies, even if the appropriate *_proxy environment variable is defined.

       [1m-Q [4m[22mquota[0m
       [1m--quota=[4m[22mquota[0m
           Specify download quota for automatic retrievals.  The value can be specified in bytes  (default),  kilobytes  (with  [1mk[0m
           suffix), or megabytes (with [1mm [22msuffix).

           Note   that   quota   will   never   affect   downloading   a   single   file.    So   if   you   specify  [1mwget  -Q10k[0m
           [1mhttps://example.com/ls-lR.gz[22m, all of the [4mls-lR.gz[24m will be downloaded.  The  same  goes  even  when  several  URLs  are
           specified  on the command-line.  The quota is checked only at the end of each downloaded file, so it will never result
           in a partially downloaded file. Thus you may safely type [1mwget -Q2m -i sites[22m---download will be aborted after the  file
           that exhausts the quota is completely downloaded.

           Setting quota to 0 or to [1minf [22munlimits the download quota.

       [1m--no-dns-cache[0m
           Turn  off  caching of DNS lookups.  Normally, Wget remembers the IP addresses it looked up from DNS so it doesn't have
           to repeatedly contact the DNS server for the same (typically small) set of hosts it retrieves from.  This cache exists
           in memory only; a new Wget run will contact DNS again.

           However, it has been reported that in some situations it is not desirable to cache host names, even for  the  duration
           of  a  short-running application like Wget.  With this option Wget issues a new DNS lookup (more precisely, a new call
           to "gethostbyname" or "getaddrinfo") each time it makes a new connection.  Please  note  that  this  option  will  [4mnot[0m
           affect caching that might be performed by the resolving library or by an external caching layer, such as NSCD.

           If you don't understand exactly what this option does, you probably won't need it.

       [1m--restrict-file-names=[4m[22mmodes[0m
           Change  which  characters  found in remote URLs must be escaped during generation of local filenames.  Characters that
           are [4mrestricted[24m by this option are escaped, i.e. replaced with [1m%HH[22m, where [1mHH [22mis the hexadecimal number that corresponds
           to the restricted character. This option may also be used to force all alphabetical  cases  to  be  either  lower-  or
           uppercase.

           By  default, Wget escapes the characters that are not valid or safe as part of file names on your operating system, as
           well as control characters that are typically unprintable.  This option is useful for changing these defaults, perhaps
           because you are downloading to a non-native partition, or  because  you  want  to  disable  escaping  of  the  control
           characters, or you want to further restrict characters to only those in the ASCII range of values.

           The  [4mmodes[24m  are  a  comma-separated  set  of  text  values. The acceptable values are [1munix[22m, [1mwindows[22m, [1mnocontrol[22m, [1mascii[22m,
           [1mlowercase[22m, and [1muppercase[22m. The values [1munix [22mand [1mwindows [22mare mutually exclusive (one will override  the  other),  as  are
           [1mlowercase  [22mand  [1muppercase[22m.  Those  last  are  special cases, as they do not change the set of characters that would be
           escaped, but rather force local file paths to be converted either to lower- or uppercase.

           When "unix" is specified, Wget escapes the character [1m/ [22mand the control characters in the ranges  0--31  and  128--159.
           This is the default on Unix-like operating systems.

           When  "windows"  is  given,  Wget  escapes the characters [1m\[22m, [1m|[22m, [1m/[22m, [1m:[22m, [1m?[22m, [1m"[22m, [1m*[22m, [1m<[22m, [1m>[22m, and the control characters in the
           ranges 0--31 and 128--159.  In addition to this, Wget in Windows mode uses [1m+ [22minstead of [1m: [22mto separate host and port in
           local file names, and uses [1m@ [22minstead of [1m? [22mto separate the query portion of the file name from the rest.  Therefore,  a
           URL   that   would   be   saved   as   [1mwww.xemacs.org:4300/search.pl?input=blah   [22min  Unix  mode  would  be  saved  as
           [1mwww.xemacs.org+4300/search.pl@input=blah [22min Windows mode.  This mode is the default on Windows.

           If you specify [1mnocontrol[22m, then the escaping of the control characters is also switched off. This option may make sense
           when you are downloading URLs whose names contain UTF-8 characters, on a system which can save and  display  filenames
           in  UTF-8  (some  possible  byte values used in UTF-8 byte sequences fall in the range of values designated by Wget as
           "controls").

           The [1mascii [22mmode is used to specify that any bytes whose values are outside the range  of  ASCII  characters  (that  is,
           greater  than  127)  shall  be escaped. This can be useful when saving filenames whose encoding does not match the one
           used locally.

       [1m-4[0m
       [1m--inet4-only[0m
       [1m-6[0m
       [1m--inet6-only[0m
           Force connecting to IPv4 or IPv6 addresses.  With [1m--inet4-only [22mor [1m-4[22m, Wget will only connect to IPv4  hosts,  ignoring
           AAAA  records  in  DNS, and refusing to connect to IPv6 addresses specified in URLs.  Conversely, with [1m--inet6-only [22mor
           [1m-6[22m, Wget will only connect to IPv6 hosts and ignore A records and IPv4 addresses.

           Neither options should be needed normally.  By default, an IPv6-aware Wget will use the address  family  specified  by
           the host's DNS record.  If the DNS responds with both IPv4 and IPv6 addresses, Wget will try them in sequence until it
           finds one it can connect to.  (Also see "--prefer-family" option described below.)

           These  options  can  be  used  to  deliberately force the use of IPv4 or IPv6 address families on dual family systems,
           usually to aid debugging or to deal with broken network configuration.  Only one of [1m--inet6-only [22mand [1m--inet4-only  [22mmay
           be specified at the same time.  Neither option is available in Wget compiled without IPv6 support.

       [1m--prefer-family=none/IPv4/IPv6[0m
           When  given  a choice of several addresses, connect to the addresses with specified address family first.  The address
           order returned by DNS is used without change by default.

           This avoids spurious errors and connect attempts when accessing hosts that resolve to both  IPv6  and  IPv4  addresses
           from  IPv4 networks.  For example, [1mwww.kame.net [22mresolves to [1m2001:200:0:8002:203:47ff:fea5:3085 [22mand to [1m203.178.141.194[22m.
           When the preferred family is "IPv4", the IPv4 address is used first; when the preferred family  is  "IPv6",  the  IPv6
           address is used first; if the specified value is "none", the address order returned by DNS is used without change.

           Unlike  [1m-4  [22mand  [1m-6[22m,  this option doesn't inhibit access to any address family, it only changes the [4morder[24m in which the
           addresses are accessed.  Also note that the reordering performed by this option is [4mstable[24m---it doesn't affect order of
           addresses of the same family.  That is, the relative order of all IPv4 addresses and of  all  IPv6  addresses  remains
           intact in all cases.

       [1m--retry-connrefused[0m
           Consider  "connection  refused" a transient error and try again.  Normally Wget gives up on a URL when it is unable to
           connect to the site because failure to connect is taken as a sign that the server is  not  running  at  all  and  that
           retries  would  not  help.   This  option  is for mirroring unreliable sites whose servers tend to disappear for short
           periods of time.

       [1m--user=[4m[22muser[0m
       [1m--password=[4m[22mpassword[0m
           Specify the username [4muser[24m and password [4mpassword[24m for both FTP  and  HTTP  file  retrieval.   These  parameters  can  be
           overridden using the [1m--ftp-user [22mand [1m--ftp-password [22moptions for FTP connections and the [1m--http-user [22mand [1m--http-password[0m
           options for HTTP connections.

       [1m--ask-password[0m
           Prompt for a password for each connection established. Cannot be specified when [1m--password [22mis being used, because they
           are mutually exclusive.

       [1m--use-askpass=[4m[22mcommand[0m
           Prompt  for  a  user  and  password  using  the specified command.  If no command is specified then the command in the
           environment variable WGET_ASKPASS is used.  If WGET_ASKPASS is not set then the command in  the  environment  variable
           SSH_ASKPASS is used.

           You can set the default command for use-askpass in the [4m.wgetrc[24m.  That setting may be overridden from the command line.

       [1m--no-iri[0m
           Turn off internationalized URI (IRI) support. Use [1m--iri [22mto turn it on. IRI support is activated by default.

           You  can  set the default state of IRI support using the "iri" command in [4m.wgetrc[24m. That setting may be overridden from
           the command line.

       [1m--local-encoding=[4m[22mencoding[0m
           Force Wget to use [4mencoding[24m as the default system encoding. That affects how Wget converts URLs specified as  arguments
           from locale to UTF-8 for IRI support.

           Wget  use the function nl_langinfo() and then the "CHARSET" environment variable to get the locale. If it fails, ASCII
           is used.

           You can set the default local encoding using the "local_encoding" command in [4m.wgetrc[24m. That setting may  be  overridden
           from the command line.

       [1m--remote-encoding=[4m[22mencoding[0m
           Force  Wget to use [4mencoding[24m as the default remote server encoding.  That affects how Wget converts URIs found in files
           from remote encoding to UTF-8 during a recursive fetch.  This  options  is  only  useful  for  IRI  support,  for  the
           interpretation of non-ASCII characters.

           For HTTP, remote encoding can be found in HTTP "Content-Type" header and in HTML "Content-Type http-equiv" meta tag.

           You  can  set  the default encoding using the "remoteencoding" command in [4m.wgetrc[24m. That setting may be overridden from
           the command line.

       [1m--unlink[0m
           Force Wget to unlink file instead of clobbering existing file. This option is useful for downloading to the  directory
           with hardlinks.

   [1mDirectory Options[0m
       [1m-nd[0m
       [1m--no-directories[0m
           Do  not create a hierarchy of directories when retrieving recursively.  With this option turned on, all files will get
           saved to the current directory, without clobbering (if a name  shows  up  more  than  once,  the  filenames  will  get
           extensions [1m.n[22m).

       [1m-x[0m
       [1m--force-directories[0m
           The opposite of [1m-nd[22m---create a hierarchy of directories, even if one would not have been created otherwise.  E.g. [1mwget[0m
           [1m-x http://fly.srk.fer.hr/robots.txt [22mwill save the downloaded file to [4mfly.srk.fer.hr/robots.txt[24m.

       [1m-nH[0m
       [1m--no-host-directories[0m
           Disable generation of host-prefixed directories.  By default, invoking Wget with [1m-r http://fly.srk.fer.hr/ [22mwill create
           a structure of directories beginning with [4mfly.srk.fer.hr/[24m.  This option disables such behavior.

       [1m--protocol-directories[0m
           Use  the  protocol  name  as  a  directory  component  of  local  file  names.  For example, with this option, [1mwget -r[0m
           [1mhttp://[4m[22mhost[24m will save to [1mhttp/[4m[22mhost[24m[1m/... [22mrather than just to [4mhost[24m[1m/...[22m.

       [1m--cut-dirs=[4m[22mnumber[0m
           Ignore [4mnumber[24m directory components.  This is useful for getting  a  fine-grained  control  over  the  directory  where
           recursive retrieval will be saved.

           Take,  for  example,  the directory at [1mftp://ftp.xemacs.org/pub/xemacs/[22m.  If you retrieve it with [1m-r[22m, it will be saved
           locally under [4mftp.xemacs.org/pub/xemacs/[24m.  While the [1m-nH [22moption can remove the [4mftp.xemacs.org/[24m  part,  you  are  still
           stuck  with  [4mpub/xemacs[24m.   This  is  where  [1m--cut-dirs [22mcomes in handy; it makes Wget not "see" [4mnumber[24m remote directory
           components.  Here are several examples of how [1m--cut-dirs [22moption works.

                   No options        -> ftp.xemacs.org/pub/xemacs/
                   -nH               -> pub/xemacs/
                   -nH --cut-dirs=1  -> xemacs/
                   -nH --cut-dirs=2  -> .

                   --cut-dirs=1      -> ftp.xemacs.org/xemacs/
                   ...

           If you just want to get rid of the directory structure, this option is  similar  to  a  combination  of  [1m-nd  [22mand  [1m-P[22m.
           However,  unlike  [1m-nd[22m,  [1m--cut-dirs  [22mdoes  not  lose with subdirectories---for instance, with [1m-nH --cut-dirs=1[22m, a [4mbeta/[0m
           subdirectory will be placed to [4mxemacs/beta[24m, as one would expect.

       [1m-P [4m[22mprefix[0m
       [1m--directory-prefix=[4m[22mprefix[0m
           Set directory prefix to [4mprefix[24m.  The [4mdirectory[24m [4mprefix[24m is the directory where all other files and  subdirectories  will
           be saved to, i.e. the top of the retrieval tree.  The default is [1m. [22m(the current directory).

   [1mHTTP Options[0m
       [1m--default-page=[4m[22mname[0m
           Use [4mname[24m as the default file name when it isn't known (i.e., for URLs that end in a slash), instead of [4mindex.html[24m.

       [1m-E[0m
       [1m--adjust-extension[0m
           If  a  file  of  type  [1mapplication/xhtml+xml  [22mor  [1mtext/html  [22mis  downloaded  and  the URL does not end with the regexp
           [1m\.[Hh][Tt][Mm][Ll]?[22m, this option will cause the suffix [1m.html [22mto be appended to the local filename.   This  is  useful,
           for instance, when you're mirroring a remote site that uses [1m.asp [22mpages, but you want the mirrored pages to be viewable
           on  your  stock  Apache  server.  Another good use for this is when you're downloading CGI-generated materials.  A URL
           like [1mhttp://site.com/article.cgi?25 [22mwill be saved as [4marticle.cgi?25.html[24m.

           Note that filenames changed in this way will be re-downloaded every time you re-mirror a site, because Wget can't tell
           that the local [4mX.html[24m file corresponds to remote URL [4mX[24m (since it doesn't yet know that the URL produces output of type
           [1mtext/html [22mor [1mapplication/xhtml+xml[22m.

           As of version 1.12, Wget will also ensure that any downloaded files of type [1mtext/css [22mend in the suffix [1m.css[22m,  and  the
           option was renamed from [1m--html-extension[22m, to better reflect its new behavior. The old option name is still acceptable,
           but should now be considered deprecated.

           As  of  version  1.19.2,  Wget  will  also ensure that any downloaded files with a "Content-Encoding" of [1mbr[22m, [1mcompress[22m,
           [1mdeflate [22mor [1mgzip [22mend in the suffix [1m.br[22m, [1m.Z[22m, [1m.zlib [22mand [1m.gz [22mrespectively.

           At some point in the future, this option may well be  expanded  to  include  suffixes  for  other  types  of  content,
           including content types that are not parsed by Wget.

       [1m--http-user=[4m[22muser[0m
       [1m--http-password=[4m[22mpassword[0m
           Specify  the username [4muser[24m and password [4mpassword[24m on an HTTP server.  According to the type of the challenge, Wget will
           encode them using either the "basic" (insecure), the "digest", or the Windows "NTLM" authentication scheme.

           Another way to specify username and password is in the URL itself.  Either method reveals your password to anyone  who
           bothers  to  run  "ps".   To  prevent the passwords from being seen, use the [1m--use-askpass [22mor store them in [4m.wgetrc[24m or
           [4m.netrc[24m, and make sure to protect those files from other users with "chmod".  If the passwords are really important, do
           not leave them lying in those files either---edit the files and delete them after Wget has started the download.

       [1m--no-http-keep-alive[0m
           Turn off the "keep-alive" feature for HTTP downloads.  Normally, Wget asks the server to keep the connection  open  so
           that,  when  you  download  more  than  one  document  from  the  same  server, they get transferred over the same TCP
           connection.  This saves time and at the same time reduces the load on the server.

           This option is useful when, for some reason, persistent (keep-alive) connections don't work for you, for  example  due
           to a server bug or due to the inability of server-side scripts to cope with the connections.

       [1m--no-cache[0m
           Disable  server-side cache.  In this case, Wget will send the remote server appropriate directives ([1mCache-Control: no-[0m
           [1mcache [22mand [1mPragma: no-cache[22m) to get the file from the remote service, rather than returning the cached version. This is
           especially useful for retrieving and flushing out-of-date documents on proxy servers.

           Caching is allowed by default.

       [1m--no-cookies[0m
           Disable the use of cookies.  Cookies are a mechanism for maintaining server-side state.  The server sends the client a
           cookie using the "Set-Cookie" header, and the client responds with the  same  cookie  upon  further  requests.   Since
           cookies  allow  the  server owners to keep track of visitors and for sites to exchange this information, some consider
           them a breach of privacy.  The default is to use cookies; however, [4mstoring[24m cookies is not on by default.

       [1m--load-cookies [4m[22mfile[0m
           Load cookies from [4mfile[24m before the first HTTP retrieval.  [4mfile[24m is a textual file  in  the  format  originally  used  by
           Netscape's [4mcookies.txt[24m file.

           You  will  typically  use this option when mirroring sites that require that you be logged in to access some or all of
           their content.  The login process typically works by the  web  server  issuing  an  HTTP  cookie  upon  receiving  and
           verifying  your  credentials.   The  cookie is then resent by the browser when accessing that part of the site, and so
           proves your identity.

           Mirroring such a site requires Wget to send the same cookies your browser sends  when  communicating  with  the  site.
           This  is  achieved by [1m--load-cookies[22m---simply point Wget to the location of the [4mcookies.txt[24m file, and it will send the
           same cookies your browser would send in the same situation.  Different browsers keep textual cookie files in different
           locations:

           "Netscape 4.x."
               The cookies are in [4m~/.netscape/cookies.txt[24m.

           "Mozilla and Netscape 6.x."
               Mozilla's cookie file is also named [4mcookies.txt[24m, located somewhere under [4m~/.mozilla[24m,  in  the  directory  of  your
               profile.  The full path usually ends up looking somewhat like [4m~/.mozilla/default/some-weird-string/cookies.txt[24m.

           "Internet Explorer."
               You  can  produce  a cookie file Wget can use by using the File menu, Import and Export, Export Cookies.  This has
               been tested with Internet Explorer 5; it is not guaranteed to work with earlier versions.

           "Other browsers."
               If you are using a different browser to create your cookies, [1m--load-cookies [22mwill only work if you  can  locate  or
               produce a cookie file in the Netscape format that Wget expects.

           If  you  cannot use [1m--load-cookies[22m, there might still be an alternative.  If your browser supports a "cookie manager",
           you can use it to view the cookies used when accessing the site you're mirroring.  Write down the name  and  value  of
           the cookie, and manually instruct Wget to send those cookies, bypassing the "official" cookie support:

                   wget --no-cookies --header "Cookie: <name>=<value>"

       [1m--save-cookies [4m[22mfile[0m
           Save  cookies  to  [4mfile[24m before exiting.  This will not save cookies that have expired or that have no expiry time (so-
           called "session cookies"), but also see [1m--keep-session-cookies[22m.

       [1m--keep-session-cookies[0m
           When specified, causes [1m--save-cookies [22mto also save session cookies.  Session cookies are normally  not  saved  because
           they  are  meant  to  be  kept in memory and forgotten when you exit the browser.  Saving them is useful on sites that
           require you to log in or to visit the home page before you can access some pages.  With  this  option,  multiple  Wget
           runs are considered a single browser session as far as the site is concerned.

           Since  the  cookie file format does not normally carry session cookies, Wget marks them with an expiry timestamp of 0.
           Wget's [1m--load-cookies [22mrecognizes those as session cookies, but it  might  confuse  other  browsers.   Also  note  that
           cookies  so  loaded  will be treated as other session cookies, which means that if you want [1m--save-cookies [22mto preserve
           them again, you must use [1m--keep-session-cookies [22magain.

       [1m--ignore-length[0m
           Unfortunately, some HTTP servers (CGI programs, to be more precise) send out  bogus  "Content-Length"  headers,  which
           makes  Wget  go  wild,  as  it  thinks not all the document was retrieved.  You can spot this syndrome if Wget retries
           getting the same document again and again, each time claiming that the (otherwise normal) connection has closed on the
           very same byte.

           With this option, Wget will ignore the "Content-Length" header---as if it never existed.

       [1m--header=[4m[22mheader-line[0m
           Send [4mheader-line[24m along with the rest of the headers in each HTTP request.  The supplied header is  sent  as-is,  which
           means it must contain name and value separated by colon, and must not contain newlines.

           You may define more than one additional header by specifying [1m--header [22mmore than once.

                   wget --header='Accept-Charset: iso-8859-2' \
                        --header='Accept-Language: hr'        \
                          http://fly.srk.fer.hr/

           Specification of an empty string as the header value will clear all previous user-defined headers.

           As  of  Wget  1.10,  this  option  can  be  used  to override headers otherwise generated automatically.  This example
           instructs Wget to connect to localhost, but to specify [1mfoo.bar [22min the "Host" header:

                   wget --header="Host: foo.bar" http://localhost/

           In versions of Wget prior to 1.10 such use of [1m--header [22mcaused sending of duplicate headers.

       [1m--compression=[4m[22mtype[0m
           Choose the type of compression to be used.  Legal values are [1mauto[22m, [1mgzip [22mand [1mnone[22m.

           If [1mauto [22mor [1mgzip [22mare specified, Wget asks the server to compress the file using the gzip  compression  format.  If  the
           server  compresses  the file and responds with the "Content-Encoding" header field set appropriately, the file will be
           decompressed automatically.

           If [1mnone [22mis specified, wget will not ask the server to compress the file and will not decompress any server  responses.
           This is the default.

           Compression support is currently experimental. In case it is turned on, please report any bugs to "bug-wget@gnu.org".

       [1m--max-redirect=[4m[22mnumber[0m
           Specifies  the  maximum number of redirections to follow for a resource.  The default is 20, which is usually far more
           than necessary. However, on those occasions where you want to allow more (or fewer), this is the option to use.

       [1m--proxy-user=[4m[22muser[0m
       [1m--proxy-password=[4m[22mpassword[0m
           Specify the username [4muser[24m and password [4mpassword[24m for authentication on a proxy server.  Wget will encode them using the
           "basic" authentication scheme.

           Security considerations similar to those with [1m--http-password [22mpertain here as well.

       [1m--referer=[4m[22murl[0m
           Include `Referer: [4murl[24m' header in HTTP request.  Useful for  retrieving  documents  with  server-side  processing  that
           assume  they  are always being retrieved by interactive web browsers and only come out properly when Referer is set to
           one of the pages that point to them.

       [1m--save-headers[0m
           Save the headers sent by the HTTP server to the file, preceding the  actual  contents,  with  an  empty  line  as  the
           separator.

       [1m-U [4m[22magent-string[0m
       [1m--user-agent=[4m[22magent-string[0m
           Identify as [4magent-string[24m to the HTTP server.

           The  HTTP  protocol  allows  the  clients  to  identify  themselves  using  a "User-Agent" header field.  This enables
           distinguishing the WWW software, usually for statistical  purposes  or  for  tracing  of  protocol  violations.   Wget
           normally identifies as [1mWget/[4m[22mversion[24m, [4mversion[24m being the current version number of Wget.

           However,   some   sites   have   been   known  to  impose  the  policy  of  tailoring  the  output  according  to  the
           "User-Agent"-supplied information.  While this is not such a bad idea in theory, it has been abused by servers denying
           information to clients other than (historically) Netscape or, more  frequently,  Microsoft  Internet  Explorer.   This
           option  allows  you  to  change  the  "User-Agent" line issued by Wget.  Use of this option is discouraged, unless you
           really know what you are doing.

           Specifying empty user agent with [1m--user-agent="" [22minstructs Wget not to send the "User-Agent" header in HTTP requests.

       [1m--post-data=[4m[22mstring[0m
       [1m--post-file=[4m[22mfile[0m
           Use POST as the method for all HTTP requests and send the specified data  in  the  request  body.   [1m--post-data  [22msends
           [4mstring[24m  as  data, whereas [1m--post-file [22msends the contents of [4mfile[24m.  Other than that, they work in exactly the same way.
           In particular, they [4mboth[24m expect content of the  form  "key1=value1&key2=value2",  with  percent-encoding  for  special
           characters;  the only difference is that one expects its content as a command-line parameter and the other accepts its
           content from a file. In particular, [1m--post-file [22mis [4mnot[24m for transmitting files as form attachments: those  must  appear
           as  "key=value"  data  (with  appropriate  percent-coding)  just like everything else. Wget does not currently support
           "multipart/form-data" for transmitting POST data; only "application/x-www-form-urlencoded". Only  one  of  [1m--post-data[0m
           and [1m--post-file [22mshould be specified.

           Please  note  that  wget does not require the content to be of the form "key1=value1&key2=value2", and neither does it
           test for it. Wget will simply transmit whatever data is provided to it. Most servers however expect the POST  data  to
           be in the above format when processing HTML Forms.

           When  sending  a  POST request using the [1m--post-file [22moption, Wget treats the file as a binary file and will send every
           character in the POST request without stripping trailing newline or formfeed characters. Any other control  characters
           in the text will also be sent as-is in the POST request.

           Please be aware that Wget needs to know the size of the POST data in advance.  Therefore the argument to "--post-file"
           must  be  a regular file; specifying a FIFO or something like [4m/dev/stdin[24m won't work.  It's not quite clear how to work
           around this limitation inherent in HTTP/1.0.  Although HTTP/1.1  introduces  [4mchunked[24m  transfer  that  doesn't  require
           knowing  the request length in advance, a client can't use chunked unless it knows it's talking to an HTTP/1.1 server.
           And it can't know that until it receives a response, which in turn requires the request to have been  completed  --  a
           chicken-and-egg problem.

           Note:  As  of version 1.15 if Wget is redirected after the POST request is completed, its behaviour will depend on the
           response code returned by the server.  In case of a 301 Moved Permanently, 302  Moved  Temporarily  or  307  Temporary
           Redirect,  Wget  will, in accordance with RFC2616, continue to send a POST request.  In case a server wants the client
           to change the Request method upon redirection, it should send a 303 See Other response code.

           This example shows how to log in to a server using POST and then proceed to download  the  desired  pages,  presumably
           only accessible to authorized users:

                   # Log in to the server.  This can be done only once.
                   wget --save-cookies cookies.txt \
                        --post-data 'user=foo&password=bar' \
                        http://example.com/auth.php

                   # Now grab the page or pages we care about.
                   wget --load-cookies cookies.txt \
                        -p http://example.com/interesting/article.php

           If  the  server  is using session cookies to track user authentication, the above will not work because [1m--save-cookies[0m
           will not save them (and  neither  will  browsers)  and  the  [4mcookies.txt[24m  file  will  be  empty.   In  that  case  use
           [1m--keep-session-cookies [22malong with [1m--save-cookies [22mto force saving of session cookies.

       [1m--method=[4m[22mHTTP-Method[0m
           For  the  purpose  of  RESTful scripting, Wget allows sending of other HTTP Methods without the need to explicitly set
           them using [1m--header=Header-Line[22m.  Wget will use whatever string is passed to it after [1m--method [22mas the HTTP  Method  to
           the server.

       [1m--body-data=[4m[22mData-String[0m
       [1m--body-file=[4m[22mData-File[0m
           Must  be  set  when  additional  data  needs  to be sent to the server along with the Method specified using [1m--method[22m.
           [1m--body-data [22msends [4mstring[24m as data, whereas [1m--body-file [22msends the contents of [4mfile[24m.   Other  than  that,  they  work  in
           exactly the same way.

           Currently,   [1m--body-file   [22mis   [4mnot[24m   for   transmitting   files   as  a  whole.   Wget  does  not  currently  support
           "multipart/form-data" for transmitting data; only "application/x-www-form-urlencoded". In  the  future,  this  may  be
           changed so that wget sends the [1m--body-file [22mas a complete file instead of sending its contents to the server. Please be
           aware  that Wget needs to know the contents of BODY Data in advance, and hence the argument to [1m--body-file [22mshould be a
           regular file. See [1m--post-file [22mfor a more detailed explanation.  Only one of  [1m--body-data  [22mand  [1m--body-file  [22mshould  be
           specified.

           If Wget is redirected after the request is completed, Wget will suspend the current method and send a GET request till
           the  redirection is completed.  This is true for all redirection response codes except 307 Temporary Redirect which is
           used to explicitly specify that the request method should [4mnot[24m change.  Another exception is when the method is set  to
           "POST", in which case the redirection rules specified under [1m--post-data [22mare followed.

       [1m--content-disposition[0m
           If  this  is set to on, experimental (not fully-functional) support for "Content-Disposition" headers is enabled. This
           can currently result in extra round-trips to the server for a "HEAD" request, and is known to suffer from a few  bugs,
           which is why it is not currently enabled by default.

           This  option  is useful for some file-downloading CGI programs that use "Content-Disposition" headers to describe what
           the name of a downloaded file should be.

           When combined with [1m--metalink-over-http [22mand [1m--trust-server-names[22m, a [1mContent-Type:  application/metalink4+xml  [22mfile  is
           named using the "Content-Disposition" filename field, if available.

       [1m--content-on-error[0m
           If  this  is set to on, wget will not skip the content when the server responds with a http status code that indicates
           error.

       [1m--trust-server-names[0m
           If this is set, on a redirect, the local file name will be based on the redirection URL.  By default  the  local  file
           name  is  based  on  the  original URL.  When doing recursive retrieving this can be helpful because in many web sites
           redirected URLs correspond to an underlying file structure, while link URLs do not.

       [1m--auth-no-challenge[0m
           If this option is given, Wget will send Basic HTTP authentication information (plaintext username  and  password)  for
           all requests, just like Wget 1.10.2 and prior did by default.

           Use of this option is not recommended, and is intended only to support some few obscure servers, which never send HTTP
           authentication challenges, but accept unsolicited auth info, say, in addition to form-based authentication.

       [1m--retry-on-host-error[0m
           Consider host errors, such as "Temporary failure in name resolution", as non-fatal, transient errors.

       [1m--retry-on-http-error=[4m[22mcode[,code,...][0m
           Consider  given  HTTP  response  codes  as non-fatal, transient errors.  Supply a comma-separated list of 3-digit HTTP
           response codes as argument. Useful to work around special circumstances where retries are  required,  but  the  server
           responds  with an error code normally not retried by Wget. Such errors might be 503 (Service Unavailable) and 429 (Too
           Many Requests). Retries enabled by this option are performed subject to  the  normal  retry  timing  and  retry  count
           limitations of Wget.

           Using  this  option  is  intended  to support special use cases only and is generally not recommended, as it can force
           retries even in cases where the server is actually trying to decrease its load. Please use wisely and only if you know
           what you are doing.

   [1mHTTPS (SSL/TLS) Options[0m
       To support encrypted HTTP (HTTPS) downloads, Wget must be compiled with an external SSL library. The  current  default  is
       GnuTLS.   In addition, Wget also supports HSTS (HTTP Strict Transport Security).  If Wget is compiled without SSL support,
       none of these options are available.

       [1m--secure-protocol=[4m[22mprotocol[0m
           Choose the secure protocol to be used.  Legal values are [1mauto[22m, [1mSSLv2[22m, [1mSSLv3[22m, [1mTLSv1[22m, [1mTLSv1_1[22m, [1mTLSv1_2[22m, [1mTLSv1_3 [22mand [1mPFS[22m.
           If [1mauto [22mis used, the SSL library is given the liberty of choosing the appropriate  protocol  automatically,  which  is
           achieved by sending a TLSv1 greeting. This is the default.

           Specifying  [1mSSLv2[22m,  [1mSSLv3[22m,  [1mTLSv1[22m,  [1mTLSv1_1[22m, [1mTLSv1_2 [22mor [1mTLSv1_3 [22mforces the use of the corresponding protocol.  This is
           useful when talking to old and buggy SSL server implementations that make it hard for the underlying  SSL  library  to
           choose the correct protocol version.  Fortunately, such servers are quite rare.

           Specifying  [1mPFS  [22menforces the use of the so-called Perfect Forward Security cipher suites. In short, PFS adds security
           by creating a one-time key for each SSL connection. It has a bit more CPU impact on client and server.  We  use  known
           to  be  secure  ciphers  (e.g.  no  MD4) and the TLS protocol. This mode also explicitly excludes non-PFS key exchange
           methods, such as RSA.

       [1m--https-only[0m
           When in recursive mode, only HTTPS links are followed.

       [1m--ciphers[0m
           Set the cipher list string. Typically this string sets the cipher suites and other SSL/TLS options that the user  wish
           should  be used, in a set order of preference (GnuTLS calls it 'priority string'). This string will be fed verbatim to
           the SSL/TLS engine (OpenSSL or GnuTLS) and hence its format and syntax is dependent on that. Wget will not process  or
           manipulate it in any way. Refer to the OpenSSL or GnuTLS documentation for more information.

       [1m--no-check-certificate[0m
           Don't  check  the  server  certificate against the available certificate authorities.  Also don't require the URL host
           name to match the common name presented by the certificate.

           As of Wget 1.10, the default is to verify the server's certificate against  the  recognized  certificate  authorities,
           breaking  the  SSL  handshake and aborting the download if the verification fails.  Although this provides more secure
           downloads, it does break interoperability with some sites that worked with previous Wget versions, particularly  those
           using  self-signed,  expired,  or  otherwise invalid certificates.  This option forces an "insecure" mode of operation
           that turns the certificate verification errors into warnings and allows you to proceed.

           If you encounter "certificate verification" errors or ones saying that  "common  name  doesn't  match  requested  host
           name",  you can use this option to bypass the verification and proceed with the download.  [4mOnly[24m [4muse[24m [4mthis[24m [4moption[24m [4mif[24m [4myou[0m
           [4mare[24m [4motherwise[24m [4mconvinced[24m [4mof[24m [4mthe[24m [4msite's[24m [4mauthenticity,[24m [4mor[24m [4mif[24m [4myou[24m [4mreally[24m [4mdon't[24m [4mcare[24m [4mabout[24m [4mthe[24m [4mvalidity[24m [4mof[24m [4mits[24m [4mcertificate.[0m
           It is almost always a bad idea not to check the certificates when transmitting confidential or  important  data.   For
           self-signed/internal certificates, you should download the certificate and verify against that instead of forcing this
           insecure   mode.    If   you  are  really  sure  of  not  desiring  any  certificate  verification,  you  can  specify
           --check-certificate=quiet to tell wget to not print any warning about invalid certificates, albeit in most cases  this
           is the wrong thing to do.

       [1m--certificate=[4m[22mfile[0m
           Use  the  client  certificate  stored in [4mfile[24m.  This is needed for servers that are configured to require certificates
           from the clients that connect to them.  Normally a certificate is not required and this switch is optional.

       [1m--certificate-type=[4m[22mtype[0m
           Specify the type of the client certificate.  Legal values are [1mPEM [22m(assumed by default) and [1mDER[22m, also known as [1mASN1[22m.

       [1m--private-key=[4m[22mfile[0m
           Read the private key from [4mfile[24m.  This allows you to provide the private key in a file separate from the certificate.

       [1m--private-key-type=[4m[22mtype[0m
           Specify the type of the private key.  Accepted values are [1mPEM [22m(the default) and [1mDER[22m.

       [1m--ca-certificate=[4m[22mfile[0m
           Use [4mfile[24m as the file with the bundle of certificate authorities ("CA") to verify the peers.  The certificates must  be
           in PEM format.

           Without  this  option Wget looks for CA certificates at the system-specified locations, chosen at OpenSSL installation
           time.

       [1m--ca-directory=[4m[22mdirectory[0m
           Specifies directory containing CA certificates in PEM format.  Each file contains one CA  certificate,  and  the  file
           name  is  based  on a hash value derived from the certificate.  This is achieved by processing a certificate directory
           with the "c_rehash" utility supplied with OpenSSL.  Using [1m--ca-directory [22mis more efficient than [1m--ca-certificate  [22mwhen
           many certificates are installed because it allows Wget to fetch certificates on demand.

           Without  this  option Wget looks for CA certificates at the system-specified locations, chosen at OpenSSL installation
           time.

       [1m--crl-file=[4m[22mfile[0m
           Specifies a CRL file in [4mfile[24m.  This is needed for certificates that have been revocated by the CAs.

       [1m--pinnedpubkey=file/hashes[0m
           Tells wget to use the specified public key file (or hashes) to verify the peer.  This can be a path to  a  file  which
           contains  a  single  public  key  in  PEM  or  DER  format,  or any number of base64 encoded sha256 hashes preceded by
           "sha256//" and separated by ";"

           When negotiating a TLS or SSL connection, the server sends a certificate indicating its  identity.  A  public  key  is
           extracted  from this certificate and if it does not exactly match the public key(s) provided to this option, wget will
           abort the connection before sending or receiving any data.

       [1m--random-file=[4m[22mfile[0m
           [OpenSSL and LibreSSL only] Use [4mfile[24m as the source of random data for seeding the pseudo-random  number  generator  on
           systems without [4m/dev/urandom[24m.

           On  such  systems the SSL library needs an external source of randomness to initialize.  Randomness may be provided by
           EGD (see [1m--egd-file [22mbelow) or read from an external source specified by the user.  If this option  is  not  specified,
           Wget looks for random data in $RANDFILE or, if that is unset, in [4m$HOME/.rnd[24m.

           If  you're getting the "Could not seed OpenSSL PRNG; disabling SSL."  error, you should provide random data using some
           of the methods described above.

       [1m--egd-file=[4m[22mfile[0m
           [OpenSSL only] Use [4mfile[24m as the EGD socket.  EGD stands  for  [4mEntropy[24m  [4mGathering[24m  [4mDaemon[24m,  a  user-space  program  that
           collects  data  from various unpredictable system sources and makes it available to other programs that might need it.
           Encryption software, such as the SSL library, needs sources of non-repeating randomness  to  seed  the  random  number
           generator used to produce cryptographically strong keys.

           OpenSSL  allows  the  user  to  specify his own source of entropy using the "RAND_FILE" environment variable.  If this
           variable is unset, or if the specified file does not produce enough randomness, OpenSSL will read random data from EGD
           socket specified using this option.

           If this option is not specified (and the equivalent startup command is not used), EGD is never contacted.  EGD is  not
           needed on modern Unix systems that support [4m/dev/urandom[24m.

       [1m--no-hsts[0m
           Wget  supports  HSTS  (HTTP Strict Transport Security, RFC 6797) by default.  Use [1m--no-hsts [22mto make Wget act as a non-
           HSTS-compliant UA. As a consequence, Wget would ignore all the  "Strict-Transport-Security"  headers,  and  would  not
           enforce any existing HSTS policy.

       [1m--hsts-file=[4m[22mfile[0m
           By  default,  Wget  stores its HSTS database in [4m~/.wget-hsts[24m.  You can use [1m--hsts-file [22mto override this. Wget will use
           the supplied file as the HSTS database. Such file must conform to the correct HSTS database format used  by  Wget.  If
           Wget cannot parse the provided file, the behaviour is unspecified.

           The  Wget's  HSTS  database  is  a  plain  text  file.  Each line contains an HSTS entry (ie. a site that has issued a
           "Strict-Transport-Security" header and that therefore has specified a concrete  HSTS  policy  to  be  applied).  Lines
           starting  with  a dash ("#") are ignored by Wget. Please note that in spite of this convenient human-readability hand-
           hacking the HSTS database is generally not a good idea.

           An HSTS entry line consists of several fields separated by one or more whitespace:

           "<hostname> SP [<port>] SP <include subdomains> SP <created> SP <max-age>"

           The [4mhostname[24m and [4mport[24m fields indicate the hostname and port to which the given HSTS policy applies. The [4mport[24m field may
           be zero, and it will, in most of the cases. That means that the port number  will  not  be  taken  into  account  when
           deciding  whether  such  HSTS  policy should be applied on a given request (only the hostname will be evaluated). When
           [4mport[24m is different to zero, both the target hostname and the port will be evaluated and the HSTS policy  will  only  be
           applied  if  both  of  them  match.  This  feature  has been included for testing/development purposes only.  The Wget
           testsuite (in [4mtestenv/[24m) creates HSTS databases with explicit  ports  with  the  purpose  of  ensuring  Wget's  correct
           behaviour.  Applying  HSTS  policies  to  ports other than the default ones is discouraged by RFC 6797 (see Appendix B
           "Differences between HSTS Policy and Same-Origin Policy"). Thus, this functionality should not be used  in  production
           environments  and  [4mport[24m  will  typically  be  zero.  The  last  three  fields  do what they are expected to. The field
           [4minclude_subdomains[24m can either be 1 or 0 and it signals whether the subdomains of the target domain should be  part  of
           the given HSTS policy as well. The [4mcreated[24m and [4mmax-age[24m fields hold the timestamp values of when such entry was created
           (first  seen  by  Wget)  and  the  HSTS-defined  value 'max-age', which states how long should that HSTS policy remain
           active, measured in seconds elapsed since the timestamp stored in [4mcreated[24m. Once that time has passed, that HSTS policy
           will no longer be valid and will eventually be removed from the database.

           If you supply your own HSTS database via [1m--hsts-file[22m, be aware that Wget may modify the provided file  if  any  change
           occurs  between  the  HSTS  policies  requested  by  the  remote  servers  and  those in the file. When Wget exits, it
           effectively updates the HSTS database by rewriting the database file with the new entries.

           If the supplied file does not exist, Wget will create one. This file will contain the new HSTS  entries.  If  no  HSTS
           entries  were  generated (no "Strict-Transport-Security" headers were sent by any of the servers) then no file will be
           created, not even an empty one. This behaviour applies to the default database file ([4m~/.wget-hsts[24m) as  well:  it  will
           not be created until some server enforces an HSTS policy.

           Care  is  taken not to override possible changes m