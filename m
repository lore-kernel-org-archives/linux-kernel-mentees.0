From: linux.bhar@gmail.com (Bharath Vedartham)
Date: Tue, 20 Aug 2019 00:37:15 +0530
Subject: [Linux-kernel-mentees] [PATCH 2/2] sgi-gru: Remove uneccessary
 ifdef for CONFIG_HUGETLB_PAGE
In-Reply-To: <20190819130057.GC5808@hpe.com>
References: <1566157135-9423-1-git-send-email-linux.bhar@gmail.com>
	<1566157135-9423-3-git-send-email-linux.bhar@gmail.com>
	<20190819130057.GC5808@hpe.com>
Message-ID: <20190819190714.GB6261@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190819190715.F4yCTlPM5zQIWvH-7Njg84oDpt6AE9ambSuUXiZOzGk@z>

On Mon, Aug 19, 2019 at 08:00:57AM -0500, Dimitri Sivanich wrote:
> Reviewed-by: Dimitri Sivanich <sivanich at hpe.com>
Thanks! 
> On Mon, Aug 19, 2019 at 01:08:55AM +0530, Bharath Vedartham wrote:
> > is_vm_hugetlb_page will always return false if CONFIG_HUGETLB_PAGE is
> > not set.
> > 
> > Cc: Ira Weiny <ira.weiny at intel.com>
> > Cc: John Hubbard <jhubbard at nvidia.com>
> > Cc: J?r?me Glisse <jglisse at redhat.com>
> > Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> > Cc: Dimitri Sivanich <sivanich at sgi.com>
> > Cc: Arnd Bergmann <arnd at arndb.de>
> > Cc: William Kucharski <william.kucharski at oracle.com>
> > Cc: Christoph Hellwig <hch at lst.de>
> > Cc: linux-kernel at vger.kernel.org
> > Cc: linux-mm at kvack.org
> > Cc: linux-kernel-mentees at lists.linuxfoundation.org
> > Reviewed-by: Ira Weiny <ira.weiny at intel.com>
> > Reviewed-by: John Hubbard <jhubbard at nvidia.com>
> > Reviewed-by: William Kucharski <william.kucharski at oracle.com>
> > Signed-off-by: Bharath Vedartham <linux.bhar at gmail.com>
> > ---
> >  drivers/misc/sgi-gru/grufault.c | 21 +++++++++++----------
> >  1 file changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/misc/sgi-gru/grufault.c b/drivers/misc/sgi-gru/grufault.c
> > index 61b3447..bce47af 100644
> > --- a/drivers/misc/sgi-gru/grufault.c
> > +++ b/drivers/misc/sgi-gru/grufault.c
> > @@ -180,11 +180,11 @@ static int non_atomic_pte_lookup(struct vm_area_struct *vma,
> >  {
> >  	struct page *page;
> >  
> > -#ifdef CONFIG_HUGETLB_PAGE
> > -	*pageshift = is_vm_hugetlb_page(vma) ? HPAGE_SHIFT : PAGE_SHIFT;
> > -#else
> > -	*pageshift = PAGE_SHIFT;
> > -#endif
> > +	if (unlikely(is_vm_hugetlb_page(vma)))
> > +		*pageshift = HPAGE_SHIFT;
> > +	else
> > +		*pageshift = PAGE_SHIFT;
> > +
> >  	if (get_user_pages(vaddr, 1, write ? FOLL_WRITE : 0, &page, NULL) <= 0)
> >  		return -EFAULT;
> >  	*paddr = page_to_phys(page);
> > @@ -238,11 +238,12 @@ static int atomic_pte_lookup(struct vm_area_struct *vma, unsigned long vaddr,
> >  		return 1;
> >  
> >  	*paddr = pte_pfn(pte) << PAGE_SHIFT;
> > -#ifdef CONFIG_HUGETLB_PAGE
> > -	*pageshift = is_vm_hugetlb_page(vma) ? HPAGE_SHIFT : PAGE_SHIFT;
> > -#else
> > -	*pageshift = PAGE_SHIFT;
> > -#endif
> > +
> > +	if (unlikely(is_vm_hugetlb_page(vma)))
> > +		*pageshift = HPAGE_SHIFT;
> > +	else
> > +		*pageshift = PAGE_SHIFT;
> > +
> >  	return 0;
> >  
> >  err:
> > -- 
> > 2.7.4
> > 
