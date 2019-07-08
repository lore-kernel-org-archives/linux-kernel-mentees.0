From: corbet@lwn.net (Jonathan Corbet)
Date: Mon, 8 Jul 2019 13:47:56 -0600
Subject: [Linux-kernel-mentees] [PATCH] Documentation: filesystems:
 Convert jfs.txt to reStructedText format.
In-Reply-To: <20190706232236.GA24717@t-1000>
References: <20190706232236.GA24717@t-1000>
Message-ID: <20190708134756.1025c940@lwn.net>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190708194756.bigI8EJIYNtfSI_E9k-PWgzP9XnW0jvl8vNtBSn9gk8@z>

On Sat, 6 Jul 2019 16:22:39 -0700
Shobhit Kukreti <shobhitkukreti at gmail.com> wrote:

> This converts the plain text documentation of jfs.txt to reStructuredText format.
> Added to documentation build process and verified with make htmldocs
> 
> Signed-off-by: Shobhit Kukreti <shobhitkukreti at gmail.com>

Thanks for working to make the kernel documentation better.  That said, I
do have a request...


> ---
>  Documentation/filesystems/index.rst |  1 +
>  Documentation/filesystems/jfs.rst   | 74 +++++++++++++++++++++++++++++++++++++
>  Documentation/filesystems/jfs.txt   | 52 --------------------------
>  3 files changed, 75 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/filesystems/jfs.rst
>  delete mode 100644 Documentation/filesystems/jfs.txt
> 
> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
> index 1131c34..d700330 100644
> --- a/Documentation/filesystems/index.rst
> +++ b/Documentation/filesystems/index.rst
> @@ -41,3 +41,4 @@ Documentation for individual filesystem types can be found here.
>     :maxdepth: 2
>  
>     binderfs.rst
> +   jfs
> diff --git a/Documentation/filesystems/jfs.rst b/Documentation/filesystems/jfs.rst
> new file mode 100644
> index 0000000..bfb6110
> --- /dev/null
> +++ b/Documentation/filesystems/jfs.rst
> @@ -0,0 +1,74 @@
> +===========================================
> +IBM's Journaled File System (JFS) for Linux
> +===========================================
> +
> +JFS Homepage:  http://jfs.sourceforge.net/
> +
> +Following Mount Options are Supported
> +
> +(*) == default
> + .. tabularcolumns:: |p{1.3cm}|p{1.3cm}|p{8.0cm}|
> +
> +.. cssclass:: longtable
> +
> +.. flat-table::   
> +  :header-rows:  0
> +  :stub-columns: 0

Please don't use flat-table unless you really need to.  It makes the
documents harder to read in plain-text form, which is something we want to
avoid whenever possible.  A simple definition list seems more appropriate
for this information.

(I should really update the documentation to discourage use of flat-table).

Note that the merge window is open, so expect me to be even slower than
usual to respond to things for the next couple of weeks.

Thanks,

jon
