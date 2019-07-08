From: willy@infradead.org (Matthew Wilcox)
Date: Mon, 8 Jul 2019 12:57:17 -0700
Subject: [Linux-kernel-mentees] [PATCH] Documentation: filesystems:
 Convert jfs.txt to reStructedText format.
In-Reply-To: <20190706232236.GA24717@t-1000>
References: <20190706232236.GA24717@t-1000>
Message-ID: <20190708195717.GG32320@bombadil.infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190708195717.rNE4Z8HotWH1M_bSrW62rcfwJGVptmvttTMHENgj-Ps@z>

On Sat, Jul 06, 2019 at 04:22:39PM -0700, Shobhit Kukreti wrote:
> +++ b/Documentation/filesystems/index.rst
> @@ -41,3 +41,4 @@ Documentation for individual filesystem types can be found here.
>     :maxdepth: 2
>  
>     binderfs.rst
> +   jfs

This is the wrong place for this file.  See earlier conversation with
Sheriff Esseson, and the patch from me to move binderfs.

> diff --git a/Documentation/filesystems/jfs.rst b/Documentation/filesystems/jfs.rst
> new file mode 100644
> index 0000000..bfb6110
> --- /dev/null
> +++ b/Documentation/filesystems/jfs.rst

Why is git not detecting this as (mostly) a rename?
