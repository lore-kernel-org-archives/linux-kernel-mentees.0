Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB5DEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 11:32:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CFF423E4;
	Thu, 17 Aug 2023 11:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01CFF423E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsGaoS-hTZ4D; Thu, 17 Aug 2023 11:32:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5FBCF423F8;
	Thu, 17 Aug 2023 11:32:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FBCF423F8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30A5EC0071;
	Thu, 17 Aug 2023 11:32:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 621D5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E2714241C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2714241C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dsSvwUgiIXqu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:32:12 +0000 (UTC)
X-Greylist: delayed 393 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 17 Aug 2023 11:32:11 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77614423FD
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 77614423FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 11:32:11 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-71-dOULvA-BN-q2BWVbdPtlQg-1; Thu, 17 Aug 2023 12:25:35 +0100
X-MC-Unique: dOULvA-BN-q2BWVbdPtlQg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 17 Aug
 2023 12:25:32 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 17 Aug 2023 12:25:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'coolrrsh@gmail.com'" <coolrrsh@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dma: dmatest: Use div64_s64
Thread-Topic: [PATCH] dma: dmatest: Use div64_s64
Thread-Index: AQHZ0AeULU9mW46wa0OxWq5lt3Wbdq/uV53w
Date: Thu, 17 Aug 2023 11:25:32 +0000
Message-ID: <ab54155f8ed241eabe006700eb4b4511@AcuMS.aculab.com>
References: <20230816060400.3325-1-coolrrsh@gmail.com>
In-Reply-To: <20230816060400.3325-1-coolrrsh@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

From: coolrrsh@gmail.com
> Sent: Wednesday, August 16, 2023 7:04 AM
> 
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> In the function do_div, the dividend is evaluated multiple times
> so it can cause side effects. Therefore replace it with div64_s64.

Nope, and even if it did it wouldn't matter here.

> This fixes warning such as:
> drivers/dma/dmatest.c:496:1-7:
> WARNING: do_div() does a 64-by-32 division,
> please consider using div64_s64 instead.

What you should really do is look carefully at the domain
of the input values to see if the division can actually
overflow.

That message is basically incorrect.

The full 64x64 divide is horribly slow on all 32bit archs.
It is even about twice as slow as the 64x32 divide on Intel
x86 cpu in 64bit mode (regardless of the values).

	David

> 
> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> ---
>  drivers/dma/dmatest.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
> index ffe621695e47..07042f239db8 100644
> --- a/drivers/dma/dmatest.c
> +++ b/drivers/dma/dmatest.c
> @@ -9,6 +9,7 @@
> 
>  #include <linux/err.h>
>  #include <linux/delay.h>
> +#include <linux/math64.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
>  #include <linux/freezer.h>
> @@ -493,7 +494,7 @@ static unsigned long long dmatest_persec(s64 runtime, unsigned int val)
> 
>  	per_sec *= val;
>  	per_sec = INT_TO_FIXPT(per_sec);
> -	do_div(per_sec, runtime);
> +	per_sec=div64_s64(per_sec, runtime);
> 
>  	return per_sec;
>  }
> --
> 2.25.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
