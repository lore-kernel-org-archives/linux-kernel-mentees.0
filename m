From: mhocko@kernel.org (Michal Hocko)
Date: Tue, 20 Aug 2019 10:18:20 +0200
Subject: [Linux-kernel-mentees] [PATCH v6 1/2] sgi-gru: Convert
 put_page() to put_user_page*()
In-Reply-To: <0c2ad29b-934c-ec30-66c3-b153baf1fba5@nvidia.com>
References: <1566157135-9423-1-git-send-email-linux.bhar@gmail.com>
	<1566157135-9423-2-git-send-email-linux.bhar@gmail.com>
	<20190819125611.GA5808@hpe.com>
	<20190819190647.GA6261@bharath12345-Inspiron-5559>
	<0c2ad29b-934c-ec30-66c3-b153baf1fba5@nvidia.com>
Message-ID: <20190820081820.GI3111@dhcp22.suse.cz>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190820081820.nFFHXMM59gPvTzUU4S_-bnvkrmGku0mNAJfMkUg8gr0@z>

On Mon 19-08-19 12:30:18, John Hubbard wrote:
> On 8/19/19 12:06 PM, Bharath Vedartham wrote:
> > On Mon, Aug 19, 2019 at 07:56:11AM -0500, Dimitri Sivanich wrote:
> > > Reviewed-by: Dimitri Sivanich <sivanich at hpe.com>
> > Thanks!
> > 
> > John, would you like to take this patch into your miscellaneous
> > conversions patch set?
> > 
> 
> (+Andrew and Michal, so they know where all this is going.)
> 
> Sure, although that conversion series [1] is on a brief hold, because
> there are additional conversions desired, and the API is still under
> discussion. Also, reading between the lines of Michal's response [2]
> about it, I think people would prefer that the next revision include
> the following, for each conversion site:
> 
> Conversion of gup/put_page sites:
> 
> Before:
> 
> 	get_user_pages(...);
> 	...
> 	for each page:
> 		put_page();
> 
> After:
> 	
> 	gup_flags |= FOLL_PIN; (maybe FOLL_LONGTERM in some cases)
> 	vaddr_pin_user_pages(...gup_flags...)

I was hoping that FOLL_PIN would be handled by vaddr_pin_user_pages.

> 	...
> 	vaddr_unpin_user_pages(); /* which invokes put_user_page() */
> 
> Fortunately, it's not harmful for the simpler conversion from put_page()
> to put_user_page() to happen first, and in fact those have usually led
> to simplifications, paving the way to make it easier to call
> vaddr_unpin_user_pages(), once it's ready. (And showing exactly what
> to convert, too.)

If that makes the later conversion easier then no real objections from
me. Assuming that the current put_user_page conversions are correct of
course (I have the mlock one and potentials that falls into the same
category in mind).
-- 
Michal Hocko
SUSE Labs
