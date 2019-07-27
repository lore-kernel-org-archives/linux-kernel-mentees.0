From: tranmanphong at gmail.com (Phong Tran)
Date: Sat, 27 Jul 2019 08:56:02 +0700
Subject: [Linux-kernel-mentees] [PATCH] isdn/gigaset: check endpoint
	null in gigaset_probe
In-Reply-To: <1876196a0e7fc665f0f50d5e9c0e2641f713e089.camel@tiscali.nl>
References: <20190726133528.11063-1-tranmanphong@gmail.com>
	<1876196a0e7fc665f0f50d5e9c0e2641f713e089.camel@tiscali.nl>
Message-ID: <24cd0b70-45e6-ea98-fc8f-b25fbf6e817f@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

On 7/26/19 9:22 PM, Paul Bolle wrote:
> Phong Tran schreef op vr 26-07-2019 om 20:35 [+0700]:
>> This fixed the potential reference NULL pointer while using variable
>> endpoint.
>>
>> Reported-by: syzbot+35b1c403a14f5c89eba7 at syzkaller.appspotmail.com
>> Tested by syzbot:
>> https://groups.google.com/d/msg/syzkaller-bugs/wnHG8eRNWEA/Qn2HhjNdBgAJ
>>
>> Signed-off-by: Phong Tran <tranmanphong at gmail.com>
>> ---
>>   drivers/isdn/gigaset/usb-gigaset.c | 9 +++++++++
> 
> This is now drivers/staging/isdn/gigaset/usb-gigaset.c.

this patch was created base on branch 
kasan/usb-fuzzer-usb-testing-2019.07.11 [1]
I did not notice about the driver was moved to staging.

> 
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/isdn/gigaset/usb-gigaset.c b/drivers/isdn/gigaset/usb-gigaset.c
>> index 1b9b43659bdf..2e011f3db59e 100644
>> --- a/drivers/isdn/gigaset/usb-gigaset.c
>> +++ b/drivers/isdn/gigaset/usb-gigaset.c
>> @@ -703,6 +703,10 @@ static int gigaset_probe(struct usb_interface *interface,
>>   	usb_set_intfdata(interface, cs);
>>   
>>   	endpoint = &hostif->endpoint[0].desc;
>> +        if (!endpoint) {
>> +		dev_err(cs->dev, "Couldn't get control endpoint\n");
>> +		return -ENODEV;
>> +	}
> 
> When can this happen? Is this one of those bugs that one can only trigger with
> a specially crafted (evil) usb device?
> 

Yes, in my understanding, this only happens with random test of syzbot.

>>   	buffer_size = le16_to_cpu(endpoint->wMaxPacketSize);
>>   	ucs->bulk_out_size = buffer_size;
>> @@ -722,6 +726,11 @@ static int gigaset_probe(struct usb_interface *interface,
>>   	}
>>   
>>   	endpoint = &hostif->endpoint[1].desc;
>> +        if (!endpoint) {
>> +		dev_err(cs->dev, "Endpoint not available\n");
>> +		retval = -ENODEV;
>> +		goto error;
>> +	}
>>   
>>   	ucs->busy = 0;
>>   
> 
> Please note that I'm very close to getting cut off from the ISDN network, so
> the chances of being able to testi this on a live system are getting small.
> 

This bug can be invalid now. Do you agree?
There is an instruction to report invalid bug to syzbot [2].

> Thanks,
> 
> 
> Paul Bolle
> 


[1] 
https://github.com/google/kasan/commits/usb-fuzzer-usb-testing-2019.07.11
[2] 
https://github.com/google/syzkaller/blob/master/docs/syzbot.md#communication-with-syzbot

Thanks,
Phong
