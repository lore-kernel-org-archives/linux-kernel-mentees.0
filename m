From: skhan@linuxfoundation.org (Shuah Khan)
Date: Fri, 26 Apr 2019 12:17:41 -0600
Subject: [Linux-kernel-mentees] [PATCH v2] staging: rtl8723bs: Fix
 checkpatch.pl warnings
In-Reply-To: <20190426180840.GA5560@bharath12345-Inspiron-5559>
References: <20190426131249.16198-1-bnvandana@gmail.com>
	<20190426174025.19901-1-bnvandana@gmail.com>
	<20190426180840.GA5560@bharath12345-Inspiron-5559>
Message-ID: <2849e876-0e6f-7bad-514b-ec7c8f5637f1@linuxfoundation.org>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190426181741.jbeDq21C7PMQmgE29jAqk5qwDbgAEi9ocQZ8PKQjIoE@z>


On 4/26/19 12:08 PM, Bharath Vedartham wrote:
> On Fri, Apr 26, 2019 at 11:10:25PM +0530, Vandana BN wrote:
>> fixed below warnings,
>> Comparisons should place the constant on the right side of the test
>> braces {} are not necessary for single statement blocks
>>
>> Signed-off-by: Vandana BN <bnvandana at gmail.com>
>>
>> ------
>> v2- Edited commit message and subject
>> ------
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_debug.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
>> index 0de1e12a676e..3fb09ad45a67 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_debug.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
>> @@ -1425,9 +1425,8 @@ int proc_get_btcoex_info(struct seq_file *m, void *v)
>>   	padapter = (struct adapter *)rtw_netdev_priv(dev);
>>   
>>   	pbuf = rtw_zmalloc(bufsize);
>> -	if (NULL == pbuf) {
>> +	if (pbuf == NULL)
>>   		return -ENOMEM;
>> -	}
>>   
>>   	rtw_btcoex_DisplayBtCoexInfo(padapter, pbuf, bufsize);
>>   
>> -- 
>> 2.17.1
>>
> Hey!
> 
> Your patch subject should briefly describe the changes you are making.
> It should not be very generic like "fix checkpatch.pl warnings" or "fix
> sparse warnings".
> 
> A good subject would be:
> "Place constant on the right"
> 
> In your changelog, you can mention the fact that this is a checkpatch.pl
> warning. Something like:
> "This patch fixes the checkpatch.pl warning:
> <Whatever the warning was>
> "
> 
> Read this before submitting your patch:
> https://kernelnewbies.org/PatchPhilosophy
> 
> This is a great place to begin your patches journey!:
> https://kernelnewbies.org/Outreachyfirstpatch

Please don't follow Outreachyfirstpatch instructions - even if
you do, don't send the patch to OutReachy mailing list and this
will be very confusing!!

You should follow the instructions on

https://wiki.linuxfoundation.org/lkmp to send patches.
> 
> And also did you send this to the appropriate mailing lists?

This is fine - the first patch can come just to

linux-kernel-mentees at lists.linuxfoundation.org

> 
> Use ./scripts/get_maintainer.pl to get the maintainer and mailing list
> to send this patch to. You ll be sending your patch to Greg again :p as
> he maintains the staging branch.
> 

Greg is on the cc.

thanks,
-- Shuah
