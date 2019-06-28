From: skhan at linuxfoundation.org (Shuah Khan)
Date: Fri, 28 Jun 2019 09:04:16 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] nl80211: Fix undefined
 behavior in bit shift
In-Reply-To: <8b8c44c3ecb8626d9bb5a8f786b1d2b7488df86b.camel@sipsolutions.net>
References: <20190627010137.5612-4-c0d1n61at3@gmail.com>
	<20190627032532.18374-4-c0d1n61at3@gmail.com>
	<c20a0a94-ab50-bb85-7c78-e02a465c5a40@linuxfoundation.org>
	<8b8c44c3ecb8626d9bb5a8f786b1d2b7488df86b.camel@sipsolutions.net>
Message-ID: <9e17c585-bd42-8c65-a37a-add6aa4d5ca4@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/28/19 7:57 AM, Johannes Berg wrote:
> On Wed, 2019-06-26 at 21:34 -0600, Shuah Khan wrote:
>> On 6/26/19 9:25 PM, Jiunn Chang wrote:
>>> Shifting signed 32-bit value by 31 bits is undefined.  Changing most
>>> significant bit to unsigned.
>>>
>>> Changes included in v2:
>>>     - use subsystem specific subject lines
>>>     - CC required mailing lists
>>>
>>> Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
>>> ---
>>
>> Move version change lines here. They don't belong in the commit log.
> 
> FWIW, in many cases people (maintainers) now *do* want them in the
> commit log. Here, they're just editorial, so agree, but if real
> technical changes were made due to reviews, they can indeed be useful.
> 
> johannes
> 

I went looking in the git log. Looks like there are several commits with
"Changes since" included in the commit log. It still appears to be
maintainer preference. Probably from networking and networking related
areas - wireless being one of them. This trend is recent it appears in
any case.

There is a value to seeing changes as the work evolves. However, there
is the concern that how log should it be.

This example commit has history from RFC stage and no doubt very useful
since this is a new driver.

8ef988b914bd449458eb2174febb67b0f137b33c

If we make this more of a norm, we do want to make sure, we evolve
from informal nature of these "Changes since", to "Commit log" text.

thanks,
-- Shuah
