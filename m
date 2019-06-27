From: skhan at linuxfoundation.org (Shuah Khan)
Date: Thu, 27 Jun 2019 16:11:51 -0600
Subject: [Linux-kernel-mentees] [PATCH] doc: RCU callback locks need
 only _bh, not necessarily _irq
In-Reply-To: <20190627221045.GH26519@linux.ibm.com>
References: <20190627210147.19510-1-c0d1n61at3@gmail.com>
	<bc2ce605-56ab-33aa-c94d-d7774e6ce8cd@linuxfoundation.org>
	<20190627221045.GH26519@linux.ibm.com>
Message-ID: <feb2e1b3-f88e-3022-207f-2862f49a501d@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 6/27/19 4:10 PM, Paul E. McKenney wrote:
> On Thu, Jun 27, 2019 at 04:01:35PM -0600, Shuah Khan wrote:
>> On 6/27/19 3:01 PM, Jiunn Chang wrote:
>>> The UP.rst file calls for locks acquired within RCU callback functions
>>> to use _irq variants (spin_lock_irqsave() or similar), which does work,
>>> but can be overkill.  This commit therefore instead calls for _bh variants
>>> (spin_lock_bh() or similar), while noting that _irq does work.
>>>
>>> Signed-off-by: Paul E. McKenney <paulmck at linux.ibm.com>
>>
>> Should this by Suggested-by?
> 
> I wrote it and Jiunn converted my change to .rst, so I believe that
> this is correct as is.
> 

Great.

thanks,
-- Shuah
