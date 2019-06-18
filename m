From: gregkh at linuxfoundation.org (Greg KH)
Date: Tue, 18 Jun 2019 18:08:47 +0200
Subject: [Linux-kernel-mentees] [PATCH v2] fs: cramfs_fs.h: Fix shifting
 signed 32-bit value by 31 bits problem
In-Reply-To: <20190618114947.10563-1-puranjay12@gmail.com>
References: <20190618114947.10563-1-puranjay12@gmail.com>
Message-ID: <20190618160847.GC27611@kroah.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Tue, Jun 18, 2019 at 05:19:47PM +0530, Puranjay Mohan wrote:
> Fix CRAMFS_BLK_FLAG_UNCOMPRESSED to use "U" cast to avoid shifting signed
> 32-bit value by 31 bits problem. This isn't a problem for kernel builds
> with gcc.
> 
> This could be problem since this header is part of public API which
> could be included for builds using compilers that don't handle this
> condition safely resulting in undefined behavior.
> 
> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>

Reviewed-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

You should resend this and cc: Nicolas Pitre <nico at fluxnic.net> as he is
the cramfs maintainer.

thanks,

greg k-h
