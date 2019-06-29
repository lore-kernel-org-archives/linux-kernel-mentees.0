From: willy@infradead.org (Matthew Wilcox)
Date: Fri, 28 Jun 2019 18:41:36 -0700
Subject: [Linux-kernel-mentees] [PATCH v1] Doc : fs : convert xfs.txt to
	ReST
In-Reply-To: <20190629010733.GA31770@localhost>
References: <20190628214302.GA12096@localhost>
	<20190629010733.GA31770@localhost>
Message-ID: <20190629014136.GF4286@bombadil.infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190629014136.MAWzgOYoabXHIQClb12UYKjPISKb9DbhxoV0fFgmQ1M@z>

On Sat, Jun 29, 2019 at 02:25:08AM +0100, Sheriff Esseson wrote:
> On Fri, Jun 28, 2019 at 10:43:24PM +0100, Sheriff Esseson wrote:
> > 	Convert xfs.txt to ReST, markup and rename accordingly. Update
> > 	Documentation/index.rst.

Don't quote the entire previous patch when submitting a new one.

> Rid Documentation/filesystems/index.rst of ".rst" in toc-tree references.
> 
> CC xfs-list.
> 
> Correct email indentation.

This text should be below the --- line, and it should be marked as "v2:"

And you didn't update the MAINTAINERS file.

> +For boolean mount options, the names with the "(*)" prefix is the
> +default behaviour. For example, take an behaviour enabled by default to be a one (1) or,

This line is too long.  Doesn't checkpatch.pl complain?

> +   rtdev=<device>
> +        An XFS filesystem has up to three parts: a data section, a log
> +	section, and a real-time section.  The real-time section is optional.
> +        If enabled, ``rtdev`` sets ``device`` to be used as an
> +        external real-time section, similar to ``logdev`` above.

Darrick mentioned the indentation was weird here, and you haven't fixed that.

> +   sunit=<value>
> +	Used to specify the stripe unit for a RAID device
> +	or (in conjunction with ``swidth`` below) a stripe volume.  ``value`` must be specified in 512-byte
> +	block units. This option is only relevant to filesystems

line length
