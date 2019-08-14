From: linux.bhar at gmail.com (Bharath Vedartham)
Date: Wed, 14 Aug 2019 23:30:31 +0530
Subject: [Linux-kernel-mentees] [PATCH v5 1/1] sgi-gru: Remove
 *pte_lookup functions, Convert to get_user_page*()
In-Reply-To: <20190814173830.GC13770@ziepe.ca>
References: <1565379497-29266-1-git-send-email-linux.bhar@gmail.com>
	<1565379497-29266-2-git-send-email-linux.bhar@gmail.com>
	<20190813145029.GA32451@hpe.com>
	<20190813172301.GA10228@bharath12345-Inspiron-5559>
	<20190813181938.GA4196@hpe.com>
	<20190814173034.GA5121@bharath12345-Inspiron-5559>
	<20190814173830.GC13770@ziepe.ca>
Message-ID: <20190814180031.GB5121@bharath12345-Inspiron-5559>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On Wed, Aug 14, 2019 at 02:38:30PM -0300, Jason Gunthorpe wrote:
> On Wed, Aug 14, 2019 at 11:00:34PM +0530, Bharath Vedartham wrote:
> > On Tue, Aug 13, 2019 at 01:19:38PM -0500, Dimitri Sivanich wrote:
> > > On Tue, Aug 13, 2019 at 10:53:01PM +0530, Bharath Vedartham wrote:
> > > > On Tue, Aug 13, 2019 at 09:50:29AM -0500, Dimitri Sivanich wrote:
> > > > > Bharath,
> > > > > 
> > > > > I do not believe that __get_user_pages_fast will work for the atomic case, as
> > > > > there is no guarantee that the 'current->mm' will be the correct one for the
> > > > > process in question, as the process might have moved away from the cpu that is
> > > > > handling interrupts for it's context.
> > > > So what your saying is, there may be cases where current->mm != gts->ts_mm
> > > > right? __get_user_pages_fast and get_user_pages do assume current->mm.
> > > 
> > > Correct, in the case of atomic context.
> > > 
> > > > 
> > > > These changes were inspired a bit from kvm. In kvm/kvm_main.c,
> > > > hva_to_pfn_fast uses __get_user_pages_fast. THe comment above the
> > > > function states it runs in atomic context.
> > > > 
> > > > Just curious, get_user_pages also uses current->mm. Do you think that is
> > > > also an issue? 
> > > 
> > > Not in non-atomic context.  Notice that it is currently done that way.
> > > 
> > > > 
> > > > Do you feel using get_user_pages_remote would be a better idea? We can
> > > > specify the mm_struct in get_user_pages_remote?
> > > 
> > > From that standpoint maybe, but is it safe in interrupt context?
> > Hmm.. The gup maintainers seemed fine with the code..
> > 
> > Now this is only an issue if gru_vtop can be executed in an interrupt
> > context. 
> > 
> > get_user_pages_remote is not valid in an interrupt context(if CONFIG_MMU
> > is set). If we follow the function, in __get_user_pages, cond_resched()
> > is called which definitly confirms that we can't run this function in an
> > interrupt context. 
> > 
> > I think we might need some advice from the gup maintainers here.
> > Note that the comment on the function __get_user_pages_fast states that
> > __get_user_pages_fast is IRQ-safe.
> 
> vhost is doing some approach where they switch current to the target
> then call __get_user_pages_fast in an IRQ context, that might be a
> reasonable pattern
> 
> If this is a regular occurance we should probably add a
> get_atomic_user_pages_remote() to make the pattern clear.
> 
> Jason

That makes sense. get_atomic_user_pages_remote() should not be hard to
write. AFAIKS __get_user_pages_fast is special_cased for current, we
could probably just add a new parameter of the mm_struct to the page
table walking code in gup.c

But till then I think we can approach this by the way vhost approaches
this problem by switching current to the target. 

Thank you
Bharath
