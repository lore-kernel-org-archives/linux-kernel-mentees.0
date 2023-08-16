Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9A3C001E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 15:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A83C24054C;
	Wed, 16 Aug 2023 15:16:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A83C24054C
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=EzPojsfh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKL3zyUfHOUa; Wed, 16 Aug 2023 15:16:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 71313403C8;
	Wed, 16 Aug 2023 15:16:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71313403C8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49D4DC0072;
	Wed, 16 Aug 2023 15:16:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44825C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:16:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF46404EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:16:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FF46404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I54EvXro3kB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:16:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B2C3403C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 15:16:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B2C3403C8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AD0664511;
 Wed, 16 Aug 2023 15:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4148CC433C7;
 Wed, 16 Aug 2023 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1692199006;
 bh=RiV/mx1g8NJ0W8pjhCev/3TqAoyjGUb/fK24JyWQPos=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EzPojsfhCVGG/gnE90Br9t3myMafCDPAPrFtXkOLf75DZ0h41Hq9C+Sb4OVhS3ed7
 kNxptuMTLF4vw5ip+5ijKl+NIYEWLPUch1bpYeFiHYp/DNt8alM7rSksXLzAZM0EH3
 POzoHvgwGxV+Xwjex2TzX1+36rOKdrEAWK1fS40A=
Date: Wed, 16 Aug 2023 17:16:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: coolrrsh@gmail.com
Subject: Re: [PATCH] dma: dmatest: Use div64_s64
Message-ID: <2023081654-dormitory-vocally-02f7@gregkh>
References: <20230816060400.3325-1-coolrrsh@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230816060400.3325-1-coolrrsh@gmail.com>
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

On Wed, Aug 16, 2023 at 11:34:00AM +0530, coolrrsh@gmail.com wrote:
> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> In the function do_div, the dividend is evaluated multiple times
> so it can cause side effects. Therefore replace it with div64_s64.
> 
> This fixes warning such as:
> drivers/dma/dmatest.c:496:1-7:
> WARNING: do_div() does a 64-by-32 division,
> please consider using div64_s64 instead.
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

Please always run checkpatch.pl on your changes before submitting them
for others to review.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
