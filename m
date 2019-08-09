From: linux.bhar at gmail.com (Bharath Vedartham)
Date: Fri, 9 Aug 2019 15:22:36 +0530
Subject: [Linux-kernel-mentees] [PATCH v4 1/1] sgi-gru: Remove
 *pte_lookup functions
In-Reply-To: <b659042a-f2c3-df3c-4182-bb7dd5156bc1@nvidia.com>
References: <1565290555-14126-1-git-send-email-linux.bhar@gmail.com>
	<1565290555-14126-2-git-send-email-linux.bhar@gmail.com>
	<b659042a-f2c3-df3c-4182-bb7dd5156bc1@nvidia.com>
Message-ID: <20190809095236.GC22457@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Thu, Aug 08, 2019 at 04:21:44PM -0700, John Hubbard wrote:
> On 8/8/19 11:55 AM, Bharath Vedartham wrote:
> ...
> >  static int gru_vtop(struct gru_thread_state *gts, unsigned long vaddr,
> >  		    int write, int atomic, unsigned long *gpa, int *pageshift)
> >  {
> >  	struct mm_struct *mm = gts->ts_mm;
> >  	struct vm_area_struct *vma;
> >  	unsigned long paddr;
> > -	int ret, ps;
> > +	int ret;
> > +	struct page *page;
> >  
> >  	vma = find_vma(mm, vaddr);
> >  	if (!vma)
> > @@ -263,21 +187,33 @@ static int gru_vtop(struct gru_thread_state *gts, unsigned long vaddr,
> >  
> >  	/*
> >  	 * Atomic lookup is faster & usually works even if called in non-atomic
> > -	 * context.
> > +	 * context. get_user_pages_fast does atomic lookup before falling back to
> > +	 * slow gup.
> >  	 */
> >  	rmb();	/* Must/check ms_range_active before loading PTEs */
> > -	ret = atomic_pte_lookup(vma, vaddr, write, &paddr, &ps);
> > -	if (ret) {
> > -		if (atomic)
> > +	if (atomic) {
> > +		ret = __get_user_pages_fast(vaddr, 1, write, &page);
> > +		if (!ret)
> >  			goto upm;
> > -		if (non_atomic_pte_lookup(vma, vaddr, write, &paddr, &ps))
> > +	} else {
> > +		ret = get_user_pages_fast(vaddr, 1, write ? FOLL_WRITE : 0, &page);
> > +		if (!ret)
> >  			goto inval;
> >  	}
> > +
> > +	paddr = page_to_phys(page);
> > +	put_user_page(page);
> > +
> > +	if (unlikely(is_vm_hugetlb_page(vma)))
> > +		*pageshift = HPAGE_SHIFT;
> > +	else
> > +		*pageshift = PAGE_SHIFT;
> > +
> >  	if (is_gru_paddr(paddr))
> >  		goto inval;
> > -	paddr = paddr & ~((1UL << ps) - 1);
> > +	paddr = paddr & ~((1UL << *pageshift) - 1);
> >  	*gpa = uv_soc_phys_ram_to_gpa(paddr);
> > -	*pageshift = ps;
> 
> Why are you no longer setting *pageshift? There are a couple of callers
> that both use this variable.
I ll send v5 once your convinced by my argument that ps is not necessary
to set *pageshift and that *pageshift is being set.

Thank you
Bharath
> 
> thanks,
> -- 
> John Hubbard
> NVIDIA
