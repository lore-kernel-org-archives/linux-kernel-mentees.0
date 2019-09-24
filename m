From: willy@infradead.org (Matthew Wilcox)
Date: Tue, 24 Sep 2019 05:23:10 -0700
Subject: [Linux-kernel-mentees] [PATCH] fs: direct-io: Fixed a
	Documentation build warn
In-Reply-To: <20190924121920.GA4593@madhuparna-HP-Notebook>
References: <20190924121920.GA4593@madhuparna-HP-Notebook>
Message-ID: <20190924122310.GF1855@bombadil.infradead.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190924122310.yLNE6swbjGySOoaQZSFKSx3cGD9xdNf9lEU7f7AWi8g@z>

On Tue, Sep 24, 2019 at 05:49:25PM +0530, Madhuparna Bhowmik wrote:
> Adds the description about
> offset within the code.

Why?

> @@ -255,6 +254,7 @@ void dio_warn_stale_pagecache(struct file *filp)
>   */
>  static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int flags)
>  {
> +	/* offset: the byte offset in the file of the completed operation */
>  	loff_t offset = dio->iocb->ki_pos;
>  	ssize_t transferred = 0;
>  	int err;

This is not normal practice within the Linux kernel.  I suggest reading
section 8 of Documentation/process/coding-style.rst 
