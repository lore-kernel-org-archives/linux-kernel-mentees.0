From: sivanich@hpe.com (Dimitri Sivanich)
Date: Tue, 13 Aug 2019 09:50:29 -0500
Subject: [Linux-kernel-mentees] [PATCH v5 1/1] sgi-gru: Remove
 *pte_lookup functions, Convert to get_user_page*()
In-Reply-To: <1565379497-29266-2-git-send-email-linux.bhar@gmail.com>
References: <1565379497-29266-1-git-send-email-linux.bhar@gmail.com>
	<1565379497-29266-2-git-send-email-linux.bhar@gmail.com>
Message-ID: <20190813145029.GA32451@hpe.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190813145029.Q_Vo2DC0oKwoSJiOGJMJ_31IQmfonB_yNEcMzYr4g6o@z>

Bharath,

I do not believe that __get_user_pages_fast will work for the atomic case, as
there is no guarantee that the 'current->mm' will be the correct one for the
process in question, as the process might have moved away from the cpu that is
handling interrupts for it's context.

On Sat, Aug 10, 2019 at 01:08:17AM +0530, Bharath Vedartham wrote:
> For pages that were retained via get_user_pages*(), release those pages
> via the new put_user_page*() routines, instead of via put_page() or
> release_pages().
> 
> This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
> ("mm: introduce put_user_page*(), placeholder versions").
> 
> As part of this conversion, the *pte_lookup functions can be removed and
> be easily replaced with get_user_pages_fast() functions. In the case of
> atomic lookup, __get_user_pages_fast() is used, because it does not fall
> back to the slow path: get_user_pages(). get_user_pages_fast(), on the other
> hand, first calls __get_user_pages_fast(), but then falls back to the
> slow path if __get_user_pages_fast() fails.
> 
> Also: remove unnecessary CONFIG_HUGETLB ifdefs.
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
> This is a fold of the 3 patches in the v2 patch series.
> The review tags were given to the individual patches.
> 
> Changes since v3
> 	- Used gup flags in get_user_pages_fast rather than
> 	boolean flags.
> Changes since v4
> 	- Updated changelog according to John Hubbard.
> ---
>  drivers/misc/sgi-gru/grufault.c | 112 +++++++++-------------------------------
>  1 file changed, 24 insertions(+), 88 deletions(-)
> 
> diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
> index 4b713a8..304e9c5 100644
> --- a/drivers/misc/sgi-gru/grufault.c
> +++ b/drivers/misc/sgi-gru/grufault.c
> @@ -166,96 +166,20 @@ static void get_clear_fault_map(struct gru_state *gru,
>  }
>  
>  /*
> - * Atomic (interrupt context) & non-atomic (user context) functions to
> - * convert a vaddr into a physical address. The size of the page
> - * is returned in pageshift.
> - * 	returns:
> - * 		  0 - successful
> - * 		< 0 - error code
> - * 		  1 - (atomic only) try again in non-atomic context
> - */
> -static int non_atomic_pte_lookup(struct vm_area_struct *vma,
> -				 unsigned long vaddr, int write,
> -				 unsigned long *paddr, int *pageshift)
> -{
> -	struct page *page;
> -
> -#ifdef CONFIG_HUGETLB_PAGE
> -	*pageshift = is_vm_hugetlb_page(vma) ? HPAGE_SHIFT : PAGE_SHIFT;
> -#else
> -	*pageshift = PAGE_SHIFT;
> -#endif
> -	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page, NULL) <= 0)
> -		return -EFAULT;
> -	*paddr = page_to_phys(page);
> -	put_page(page);
> -	return 0;
> -}
> -
> -/*
> - * atomic_pte_lookup
> + * mmap_sem is already helod on entry to this function. This guarantees
> + * existence of the page tables.
>   *
> - * Convert a user virtual address to a physical address
>   * Only supports Intel large pages (2MB only) on x86_64.
> - *	ZZZ - hugepage support is incomplete
> - *
> - * NOTE: mmap_sem is already held on entry to this function. This
> - * guarantees existence of the page tables.
> + *	ZZZ - hugepage support is incomplete.
>   */
> -static int atomic_pte_lookup(struct vm_area_struct *vma, unsigned long vaddr,
> -	int write, unsigned long *paddr, int *pageshift)
> -{
> -	pgd_t *pgdp;
> -	p4d_t *p4dp;
> -	pud_t *pudp;
> -	pmd_t *pmdp;
> -	pte_t pte;
> -
> -	pgdp = pgd_offset(vma->vm_mm, vaddr);
> -	if (unlikely(pgd_none(*pgdp)))
> -		goto err;
> -
> -	p4dp = p4d_offset(pgdp, vaddr);
> -	if (unlikely(p4d_none(*p4dp)))
> -		goto err;
> -
> -	pudp = pud_offset(p4dp, vaddr);
> -	if (unlikely(pud_none(*pudp)))
> -		goto err;
> -
> -	pmdp = pmd_offset(pudp, vaddr);
> -	if (unlikely(pmd_none(*pmdp)))
> -		goto err;
> -#ifdef CONFIG_X86_64
> -	if (unlikely(pmd_large(*pmdp)))
> -		pte = *(pte_t *) pmdp;
> -	else
> -#endif
> -		pte = *pte_offset_kernel(pmdp, vaddr);
> -
> -	if (unlikely(!pte_present(pte) ||
> -		     (write && (!pte_write(pte) || !pte_dirty(pte)))))
> -		return 1;
> -
> -	*paddr = pte_pfn(pte) << PAGE_SHIFT;
> -#ifdef CONFIG_HUGETLB_PAGE
> -	*pageshift = is_vm_hugetlb_page(vma) ? HPAGE_SHIFT : PAGE_SHIFT;
> -#else
> -	*pageshift = PAGE_SHIFT;
> -#endif
> -	return 0;
> -
> -err:
> -	return 1;
> -}
> -
>  static int gru_vtop(struct gru_thread_state *gts, unsigned long vaddr,
>  		    int write, int atomic, unsigned long *gpa, int *pageshift)
>  {
>  	struct mm_struct *mm = gts->ts_mm;
>  	struct vm_area_struct *vma;
>  	unsigned long paddr;
> -	int ret, ps;
> +	int ret;
> +	struct page *page;
>  
>  	vma = find_vma(mm, vaddr);
>  	if (!vma)
> @@ -263,21 +187,33 @@ static int gru_vtop(struct gru_thread_state *gts, unsigned long vaddr,
>  
>  	/*
>  	 * Atomic lookup is faster & usually works even if called in non-atomic
> -	 * context.
> +	 * context. get_user_pages_fast does atomic lookup before falling back to
> +	 * slow gup.
>  	 */
>  	rmb();	/* Must/check ms_range_active before loading PTEs */
> -	ret = atomic_pte_lookup(vma, vaddr, write, &paddr, &ps);
> -	if (ret) {
> -		if (atomic)
> +	if (atomic) {
> +		ret = __get_user_pages_fast(vaddr, 1, write, &page);
> +		if (!ret)
>  			goto upm;
> -		if (non_atomic_pte_lookup(vma, vaddr, write, &paddr, &ps))
> +	} else {
> +		ret = get_user_pages_fast(vaddr, 1, write ? FOLL_WRITE : 0, &page);
> +		if (!ret)
>  			goto inval;
>  	}
> +
> +	paddr = page_to_phys(page);
> +	put_user_page(page);
> +
> +	if (unlikely(is_vm_hugetlb_page(vma)))
> +		*pageshift = HPAGE_SHIFT;
> +	else
> +		*pageshift = PAGE_SHIFT;
> +
>  	if (is_gru_paddr(paddr))
>  		goto inval;
> -	paddr = paddr & ~((1UL << ps) - 1);
> +	paddr = paddr & ~((1UL << *pageshift) - 1);
>  	*gpa = uv_soc_phys_ram_to_gpa(paddr);
> -	*pageshift = ps;
> +
>  	return VTOP_SUCCESS;
>  
>  inval:
> -- 
> 2.7.4
> 
