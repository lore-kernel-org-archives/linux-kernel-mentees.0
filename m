Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959E7C07E8A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 18:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDD388217D;
	Wed, 16 Aug 2023 18:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD388217D
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4LQCWKgU
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6Ruae2HNT4r; Wed, 16 Aug 2023 18:38:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6A2B7820A2;
	Wed, 16 Aug 2023 18:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A2B7820A2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CAEFC0071;
	Wed, 16 Aug 2023 18:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E541C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 18:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06455820CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 18:38:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06455820CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTwX-sX4bidH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 18:38:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 25837820A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 18:38:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25837820A2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=Zt0oIUR7CPyOLzen8uwt/eQkJhMyoct9UDoUX3KYy9w=; b=4LQCWKgUm1uweQAPl58aV65Jjg
 IX4nraKfDHtq1oTAbepnVOGSPyAWWfQ4VefJaI0s8DpCrRaWZdlkiTZqSdQ3GMipKyrWbP5Oi03Ok
 QfLIbNaXV5YRFr8YE2RnoICQRW207MvP69Ov6eevZi37iadRfuuKWZz4E327Cvq/AxXkUwYfM57+d
 CJk3yQRJ5kdEMjwkI2AHONGEwArp16+wSefizti8D4HvGQDm0fnq1ajcsV3IivGaxWGWLGPVPTlZn
 TiPIkA/lUpnPTjt7Up6uFImFfdVHuYIYct6pGp5ZsPpw6lBgjzVoQxmhsDXudLHyt2OPGqGJHCDpA
 iWY1hX4g==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qWLPp-004on9-1W; Wed, 16 Aug 2023 18:38:45 +0000
Message-ID: <1595571f-e69a-319e-0f8e-708c222706cb@infradead.org>
Date: Wed, 16 Aug 2023 11:38:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dma: dmatest: Use div64_s64
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, coolrrsh@gmail.com
References: <20230816060400.3325-1-coolrrsh@gmail.com>
 <2023081654-dormitory-vocally-02f7@gregkh>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <2023081654-dormitory-vocally-02f7@gregkh>
Cc: dmaengine@vger.kernel.org, vkoul@kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>



On 8/16/23 08:16, Greg KH wrote:
> On Wed, Aug 16, 2023 at 11:34:00AM +0530, coolrrsh@gmail.com wrote:
>> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
>>
>> In the function do_div, the dividend is evaluated multiple times
>> so it can cause side effects. Therefore replace it with div64_s64.
>>
>> This fixes warning such as:
>> drivers/dma/dmatest.c:496:1-7:
>> WARNING: do_div() does a 64-by-32 division,
>> please consider using div64_s64 instead.
>>
>> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
>> ---
>>  drivers/dma/dmatest.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
>> index ffe621695e47..07042f239db8 100644
>> --- a/drivers/dma/dmatest.c
>> +++ b/drivers/dma/dmatest.c
>> @@ -9,6 +9,7 @@
>>  
>>  #include <linux/err.h>
>>  #include <linux/delay.h>
>> +#include <linux/math64.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/dmaengine.h>
>>  #include <linux/freezer.h>
>> @@ -493,7 +494,7 @@ static unsigned long long dmatest_persec(s64 runtime, unsigned int val)
>>  
>>  	per_sec *= val;
>>  	per_sec = INT_TO_FIXPT(per_sec);
>> -	do_div(per_sec, runtime);
>> +	per_sec=div64_s64(per_sec, runtime);
> 
> Please always run checkpatch.pl on your changes before submitting them
> for others to review.

Also please tell us what tool produced that warning message.
Thanks.

-- 
~Randy
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
