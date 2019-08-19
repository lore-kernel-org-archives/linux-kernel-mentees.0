From: jhubbard at nvidia.com (John Hubbard)
Date: Mon, 19 Aug 2019 12:30:18 -0700
Subject: [Linux-kernel-mentees] [PATCH v6 1/2] sgi-gru: Convert
 put_page() to put_user_page*()
In-Reply-To: <20190819190647.GA6261@bharath12345-Inspiron-5559>
References: <1566157135-9423-1-git-send-email-linux.bhar@gmail.com>
	<1566157135-9423-2-git-send-email-linux.bhar@gmail.com>
	<20190819125611.GA5808@hpe.com>
	<20190819190647.GA6261@bharath12345-Inspiron-5559>
Message-ID: <0c2ad29b-934c-ec30-66c3-b153baf1fba5@nvidia.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 8/19/19 12:06 PM, Bharath Vedartham wrote:
> On Mon, Aug 19, 2019 at 07:56:11AM -0500, Dimitri Sivanich wrote:
>> Reviewed-by: Dimitri Sivanich <sivanich at hpe.com>
> Thanks!
> 
> John, would you like to take this patch into your miscellaneous
> conversions patch set?
> 

(+Andrew and Michal, so they know where all this is going.)

Sure, although that conversion series [1] is on a brief hold, because
there are additional conversions desired, and the API is still under
discussion. Also, reading between the lines of Michal's response [2]
about it, I think people would prefer that the next revision include
the following, for each conversion site:

Conversion of gup/put_page sites:

Before:

	get_user_pages(...);
	...
	for each page:
		put_page();

After:
	
	gup_flags |= FOLL_PIN; (maybe FOLL_LONGTERM in some cases)
	vaddr_pin_user_pages(...gup_flags...)
	...
	vaddr_unpin_user_pages(); /* which invokes put_user_page() */

Fortunately, it's not harmful for the simpler conversion from put_page()
to put_user_page() to happen first, and in fact those have usually led
to simplifications, paving the way to make it easier to call
vaddr_unpin_user_pages(), once it's ready. (And showing exactly what
to convert, too.)

So for now, I'm going to just build on top of Ira's tree, and once the
vaddr*() API settles down, I'll send out an updated series that attempts
to include the reviews and ACKs so far (I'll have to review them, but
make a note that review or ACK was done for part of the conversion),
and adds the additional gup(FOLL_PIN), and uses vaddr*() wrappers instead of
gup/pup.

[1] https://lore.kernel.org/r/20190807013340.9706-1-jhubbard at nvidia.com

[2] https://lore.kernel.org/r/20190809175210.GR18351 at dhcp22.suse.cz


thanks,
-- 
John Hubbard
NVIDIA
