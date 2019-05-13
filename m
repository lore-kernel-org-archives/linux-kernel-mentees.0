From: dan.carpenter at oracle.com (Dan Carpenter)
Date: Mon, 13 May 2019 13:49:20 +0300
Subject: [Linux-kernel-mentees] [PATCH v3 1/8] Staging: kpc2000:
 kpc_dma: Resolve trailing whitespace error reported by checkpatch
In-Reply-To: <20190513102622.22398-1-bnvandana@gmail.com>
References: <20190510193833.1051-1-bnvandana@gmail.com>
	<20190513102622.22398-1-bnvandana@gmail.com>
Message-ID: <20190513104920.GI18105@kadam>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Mon, May 13, 2019 at 03:56:15PM +0530, Vandana BN wrote:
> Resolve trailing whitespace error from checkpatch.pl
> ERROR: trailing whitespace
> ---
> v2-split changes to multiple patches
> v3 - edit commit message
> ---
> 
> Signed-off-by: Vandana BN <bnvandana at gmail.com>
> ---

The Signed off by has to be before the first --- cut off line.
Everything after the cut off is removed from the commit message.

>  drivers/staging/kpc2000/kpc_dma/dma.c         |  86 ++++++-------
>  drivers/staging/kpc2000/kpc_dma/fileops.c     | 114 +++++++++---------
>  .../staging/kpc2000/kpc_dma/kpc_dma_driver.c  |  46 +++----
>  .../staging/kpc2000/kpc_dma/kpc_dma_driver.h  |  16 +--
>  4 files changed, 131 insertions(+), 131 deletions(-)
> 


regards,
dan carpenter
