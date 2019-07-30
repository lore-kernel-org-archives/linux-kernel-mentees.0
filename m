From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Tue, 30 Jul 2019 14:58:44 +0530
Subject: [Linux-kernel-mentees] [PATCH v4] staging: kpc2000: Convert
 put_page to put_user_page*()
Message-ID: <20190730092843.GA5150@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190730092844.K-G72vopym_dlHd2t0vpAFSRChjHAZe82zZ9-jIQcw0@z>

put_page() to put_user_page*()
Reply-To: 
In-Reply-To: <1564058658-3551-1-git-send-email-linux.bhar at gmail.com>

On Thu, Jul 25, 2019 at 06:14:18PM +0530, Bharath Vedartham wrote:
[Forwarding patch to linux-kernel-mentees mailing list]
> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page().
> 
> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
> 
> Cc: Ira Weiny <ira.weiny at intel.com>
> Cc: John Hubbard <jhubbard at nvidia.com>
> Cc: J?r?me Glisse <jglisse at redhat.com>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Cc: Matt Sickler <Matt.Sickler at daktronics.com>
> Cc: devel at driverdev.osuosl.org
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-mm at kvack.org
> Reviewed-by: John Hubbard <jhubbard at nvidia.com>
> Signed-off-by: Bharath Vedartham <linux.bhar at gmail.com>
> ---
> Changes since v1
>         - Improved changelog by John's suggestion.
>         - Moved logic to dirty pages below sg_dma_unmap
>          and removed PageReserved check.
> Changes since v2
>         - Added back PageResevered check as
>         suggested by John Hubbard.
> Changes since v3
>         - Changed the changelog as suggested by John.
>         - Added John's Reviewed-By tag.
> Changes since v4
>         - Rebased the patch on the staging tree.
>         - Improved commit log by fixing a line wrap.
> ---
>  drivers/staging/kpc2000/kpc_dma/fileops.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/kpc2000/kpc_dma/fileops.c b/drivers/staging/kpc2000/kpc_dma/fileops.c
> index 48ca88b..f15e292 100644
> --- a/drivers/staging/kpc2000/kpc_dma/fileops.c
> +++ b/drivers/staging/kpc2000/kpc_dma/fileops.c
> @@ -190,9 +190,7 @@ static int kpc_dma_transfer(struct dev_private_data *priv,
>  	sg_free_table(&acd->sgt);
>   err_dma_map_sg:
>   err_alloc_sg_table:
> -	for (i = 0 ; i < acd->page_count ; i++) {
> -		put_page(acd->user_pages[i]);
> -	}
> +	put_user_pages(acd->user_pages, acd->page_count);
>   err_get_user_pages:
>  	kfree(acd->user_pages);
>   err_alloc_userpages:
> @@ -211,16 +209,13 @@ void  transfer_complete_cb(struct aio_cb_data *acd, size_t xfr_count, u32 flags)
>  	BUG_ON(acd->ldev == NULL);
>  	BUG_ON(acd->ldev->pldev == NULL);
>  
> -	for (i = 0 ; i < acd->page_count ; i++) {
> -		if (!PageReserved(acd->user_pages[i])) {
> -			set_page_dirty(acd->user_pages[i]);
> -		}
> -	}
> -
>  	dma_unmap_sg(&acd->ldev->pldev->dev, acd->sgt.sgl, acd->sgt.nents, acd->ldev->dir);
>  
> -	for (i = 0 ; i < acd->page_count ; i++) {
> -		put_page(acd->user_pages[i]);
> +	for (i = 0; i < acd->page_count; i++) {
> +		if (!PageReserved(acd->user_pages[i]))
> +			put_user_pages_dirty(&acd->user_pages[i], 1);
> +		else
> +			put_user_page(acd->user_pages[i]);
>  	}
>  
>  	sg_free_table(&acd->sgt);
> -- 
> 2.7.4
> 
