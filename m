From: skhan@linuxfoundation.org (Shuah Khan)
Date: Mon, 29 Apr 2019 09:34:41 -0600
Subject: [Linux-kernel-mentees] [PATCH] staging: media: bcm2048: Fixed
 style error ERROR: Macros with complex values should be enclosed in
 parentheses found using scripts/checkpatch.pl
In-Reply-To: <20190429151719.GA1362@arch>
References: <20190429145002.GA12732@arch> <20190429145635.GA7601@kroah.com>
	<20190429151719.GA1362@arch>
Message-ID: <93269609-66ae-871b-8001-9bb9d4b0b1ed@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190429153441.F-3dapjB-jf-xxvVJGKU4wBpYwxOM8xJ8guzhMWT-tk@z>

On 4/29/19 9:17 AM, Puranjay Mohan wrote:
> On Mon, Apr 29, 2019 at 04:56:35PM +0200, Greg KH wrote:
>> On Mon, Apr 29, 2019 at 08:20:02PM +0530, Puranjay Mohan wrote:
>>> Signed-off-by: Puranjay Mohan <puranjay12 at gmail.com>
>>> ---
>>
>> I think your subject line needs a bit of work :)
>>
>> Also, I can't take patches without any changelog text.
>>
>>>   drivers/staging/media/bcm2048/radio-bcm2048.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/bcm2048/radio-bcm2048.c b/drivers/staging/media/bcm2048/radio-bcm2048.c
>>> index d9b02ff66259..599da6c977ed 100644
>>> --- a/drivers/staging/media/bcm2048/radio-bcm2048.c
>>> +++ b/drivers/staging/media/bcm2048/radio-bcm2048.c
>>> @@ -2000,7 +2000,7 @@ static ssize_t bcm2048_##prop##_read(struct device *dev,		\
>>>   	return sprintf(buf, mask "\n", value);				\
>>>   }
>>>   
>>> -#define DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check)		\
>>> +#define (DEFINE_SYSFS_PROPERTY(prop, prop_type, mask, check))		\
>>>   property_write(prop, prop_type, mask, check)				\
>>>   property_read(prop, mask)						\
>>
>> Wait, did you build this patch?  Are you sure it is doing what you think
>> it is doing?
>>
>> thanks,
>>
>> greg k-h
> 
> It is my first patch ever, can you guide me on how to resend the patch
> with the corrections.
> After adding the parentheses around the Macro, the Error was not showing
> up with the checkpatch.pl so I thought it corrected it.
>
Did you build and run tests to make sure you change works?

Please go through the following to understand all about sending your 
first patch.

https://wiki.linuxfoundation.org/lkmp/lkmp_getting_started

This should tell you the steps to follow before sending the patch.

thanks,
-- Shuah
