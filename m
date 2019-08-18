From: linux.bhar at gmail.com (Bharath Vedartham)
Date: Mon, 19 Aug 2019 01:21:15 +0530
Subject: [Linux-kernel-mentees] [PATCH v6 1/2] sgi-gru: Convert
 put_page() to put_user_page*()
In-Reply-To: <1566157135-9423-2-git-send-email-linux.bhar@gmail.com>
References: <1566157135-9423-1-git-send-email-linux.bhar@gmail.com>
	<1566157135-9423-2-git-send-email-linux.bhar@gmail.com>
Message-ID: <20190818195115.GB4487@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

CC'ing lkml.

On Mon, Aug 19, 2019 at 01:08:54AM +0530, Bharath Vedartham wrote:
> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page() or
> release_pages().
> 
> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
> 
> Cc: Ira Weiny <ira.weiny at intel.com>
> Cc: John Hubbard <jhubbard at nvidia.com>
> Cc: J?r?me Glisse <jglisse at redhat.com>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Cc: Dimitri Sivanich <sivanich at sgi.com>
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: William Kucharski <william.kucharski at oracle.com>
> Cc: Christoph Hellwig <hch at lst.de>
> Cc: linux-kernel at vger.kernel.org
> Cc: linux-mm at kvack.org
> Cc: linux-kernel-mentees at lists.linuxfoundation.org
> Reviewed-by: Ira Weiny <ira.weiny at intel.com>
> Reviewed-by: John Hubbard <jhubbard at nvidia.com>
> Reviewed-by: William Kucharski <william.kucharski at oracle.com>
> Signed-off-by: Bharath Vedartham <linux.bhar at gmail.com>
> ---
>  drivers/misc/sgi-gru/grufault.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
> index 4b713a8..61b3447 100644
> --- a/drivers/misc/sgi-gru/grufault.c
> +++ b/drivers/misc/sgi-gru/grufault.c
> @@ -188,7 +188,7 @@ static int non_atomic_pte_lookup(struct vm_area_struct *vma,
>  	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page, NULL) <= 0)
>  		return -EFAULT;
>  	*paddr = page_to_phys(page);
> -	put_page(page);
> +	put_user_page(page);
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 
