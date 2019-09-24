From: skhan at linuxfoundation.org (Shuah Khan)
Date: Tue, 24 Sep 2019 07:16:23 -0600
Subject: [Linux-kernel-mentees] [PATCH] fs: direct-io: Fixed a
 Documentation build warn
In-Reply-To: <20190924122310.GF1855@bombadil.infradead.org>
References: <20190924121920.GA4593@madhuparna-HP-Notebook>
	<20190924122310.GF1855@bombadil.infradead.org>
Message-ID: <684ef896-5062-0997-99fe-8395e9f05d9b@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 9/24/19 6:23 AM, Matthew Wilcox wrote:
> On Tue, Sep 24, 2019 at 05:49:25PM +0530, Madhuparna Bhowmik wrote:
>> Adds the description about
>> offset within the code.
> 
> Why?
> 
>> @@ -255,6 +254,7 @@ void dio_warn_stale_pagecache(struct file *filp)
>>    */
>>   static ssize_t dio_complete(struct dio *dio, ssize_t ret, unsigned int flags)
>>   {
>> +	/* offset: the byte offset in the file of the completed operation */
>>   	loff_t offset = dio->iocb->ki_pos;
>>   	ssize_t transferred = 0;
>>   	int err;
> 
> This is not normal practice within the Linux kernel.  I suggest reading
> section 8 of Documentation/process/coding-style.rst
> 

You don't combine documentation and code patches. I don't think you need
to add this comment in here.

thanks,
-- Shuah
