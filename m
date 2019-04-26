From: bnvandana at gmail.com (bnva)
Date: Fri, 26 Apr 2019 23:16:00 +0530
Subject: [Linux-kernel-mentees] [PATCH] Fix checkpatch.pl warnings
In-Reply-To: <d5ca742f-5ca8-7a26-487f-8fd0c9fc2ff1@linuxfoundation.org>
References: <20190426131249.16198-1-bnvandana@gmail.com>
	<d5ca742f-5ca8-7a26-487f-8fd0c9fc2ff1@linuxfoundation.org>
Message-ID: <59655e31-045d-658a-8bcb-500bcaf8e0c3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>


On 26/04/19 7:19 PM, Shuah Khan wrote:
> On 4/26/19 7:12 AM, Vandana BN wrote:
>> Signed-off-by: Vandana BN <bnvandana at gmail.com>
>> ---
>> ? drivers/staging/rtl8723bs/core/rtw_debug.c | 3 +--
>> ? 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
>> index 0de1e12a676e..3fb09ad45a67 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_debug.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
>> @@ -1425,9 +1425,8 @@ int proc_get_btcoex_info(struct seq_file *m, void *v)
>> ????? padapter = (struct adapter *)rtw_netdev_priv(dev);
>> ? ????? pbuf = rtw_zmalloc(bufsize);
>> -??? if (NULL == pbuf) {
>> +??? if (pbuf == NULL)
>> ????????? return -ENOMEM;
>> -??? }
>> ? ????? rtw_btcoex_DisplayBtCoexInfo(padapter, pbuf, bufsize);
>> ?
>
>
> Hi Vandana,
>
> Thanks for the patch. A few things to note:
>
> The commit summary line should include the area and driver.
>
> Instead of "Fix checkpatch.pl warnings", it should say:
>
> "staging: rtl8723bs: Fix checkpatch.pl warnings"
>
> Please include the checkpatch warning in the commit message to tell
> us more about the reason for this fix.
>
> Please look at a few patches that get posted to Linux kernel
> mailing lists - you can find them on https://lkml.org/lkml/last100/
> for what kind if details should be included in the commit log.
>
> thanks,
> -- Shuah

Thank you.

I have sent another patch adding commit message and changing the subject.

regards,

Vandana.
