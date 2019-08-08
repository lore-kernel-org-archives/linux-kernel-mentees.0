From: jhubbard at nvidia.com (John Hubbard)
Date: Thu, 8 Aug 2019 16:30:48 -0700
Subject: [Linux-kernel-mentees] [PATCH v4 1/1] sgi-gru: Remove
 *pte_lookup functions
In-Reply-To: <b659042a-f2c3-df3c-4182-bb7dd5156bc1@nvidia.com>
References: <1565290555-14126-1-git-send-email-linux.bhar@gmail.com>
	<1565290555-14126-2-git-send-email-linux.bhar@gmail.com>
	<b659042a-f2c3-df3c-4182-bb7dd5156bc1@nvidia.com>
Message-ID: <97a93739-783a-cf26-8384-a87c7d8bf75e@nvidia.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 8/8/19 4:21 PM, John Hubbard wrote:
> On 8/8/19 11:55 AM, Bharath Vedartham wrote:
> ...
>>  	if (is_gru_paddr(paddr))
>>  		goto inval;
>> -	paddr = paddr & ~((1UL << ps) - 1);
>> +	paddr = paddr & ~((1UL << *pageshift) - 1);
>>  	*gpa = uv_soc_phys_ram_to_gpa(paddr);
>> -	*pageshift = ps;
> 
> Why are you no longer setting *pageshift? There are a couple of callers
> that both use this variable.
> 
> 

...and once that's figured out, I can fix it up here and send it up with 
the next misc callsites series. I'm also inclined to make the commit
log read more like this:

sgi-gru: Remove *pte_lookup functions, convert to put_user_page*()

For pages that were retained via get_user_pages*(), release those pages
via the new put_user_page*() routines, instead of via put_page() or
release_pages().

This is part a tree-wide conversion, as described in commit fc1d8e7cca2d
("mm: introduce put_user_page*(), placeholder versions").

As part of this conversion, the *pte_lookup functions can be removed and
be easily replaced with get_user_pages_fast() functions. In the case of
atomic lookup, __get_user_pages_fast() is used, because it does not fall
back to the slow path: get_user_pages(). get_user_pages_fast(), on the other
hand, first calls __get_user_pages_fast(), but then falls back to the
slow path if __get_user_pages_fast() fails.

Also: remove unnecessary CONFIG_HUGETLB ifdefs.


thanks,
-- 
John Hubbard
NVIDIA
