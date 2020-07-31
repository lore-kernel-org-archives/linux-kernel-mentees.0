Return-Path: <SRS0=tCTQ=BK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7D7C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 10:02:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F8932074B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 31 Jul 2020 10:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzhGLmt9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F8932074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ECBBE20529;
	Fri, 31 Jul 2020 10:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xIMGvCBrwtsj; Fri, 31 Jul 2020 10:02:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 212F620504;
	Fri, 31 Jul 2020 10:02:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A624C0050;
	Fri, 31 Jul 2020 10:02:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B082C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 10:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4C7422050B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 10:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t81ZjhNWSbTJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 10:02:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 4617420504
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 10:02:47 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id a9so6924292pjd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 31 Jul 2020 03:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YU2YU11NcpqAnb5BnC0Bw1oS+Y3NACnLXP9l9d7nU8o=;
 b=GzhGLmt9WCFC+8A67PIckUK/e+i3LY4XZqkhzFjXVGTEo2vHV87lte/KN81O63v/dc
 NsnUHhYx4eC041lzXmkd1Ok9Wo3iMdVDEAcG8l/qzRLHwuBASmpBkF4b7S4RdeAs2Lk4
 Ztlg7Ns8qaX1mXakicU0V5QUjrYtsxGevZNSPRi+nj6zgT1Ln4XtgEOLmeOwpQ7qWC4V
 IogmK6oqwsTZfwtiXFgoOK7TPLNy+ZlzU/ZzLGktlAgJF7TjBENklHq1F1P+NgLqqqLK
 onOjsCsGbosS1eh1tuvZ+MPRBHFzq1WgfHF88Vs80eG4zcyHXMo7UUzUj6LV3kWf0Xpc
 rLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YU2YU11NcpqAnb5BnC0Bw1oS+Y3NACnLXP9l9d7nU8o=;
 b=MpoKYCNK5xwW2bt1tsbcbqgwIFBjkrQxnUY5qVPjSU1gs1u+ptkQIRvxM7f48zGR4P
 c51X4YmNWF2PaQUZcjPMXbvdrJvgFx2Qw+UQKFkZgsqzdnxi0WUOrRro4xOQrggMO+ZM
 uVhuXSYRzBYt0oL2Bl1nZ4xVuh8uHya5IEA9KV0s+EmNLDhS3WW5iXWH68Bnc951kfNB
 BD3KsudnaGVCt9ACTVRbGCQO1y+/6AcHZ79OkTAGugId0Dk9kB1ci5aKSbqtTyAJ/0NW
 O/B+0zr205tdrvqa7gFcX828O3nR631J9keKr3r1VN6+tur18FG9ZEX18M2BdcSh3pg+
 IiOw==
X-Gm-Message-State: AOAM532PjlmzNNmsLjBjYcOQDNDxHOf7GPJUN1gbVLlTuZV1SAithk3n
 ikXiGdSpH3G5HoNRauM4AGsHX1Ylvsh9TA==
X-Google-Smtp-Source: ABdhPJwLQyaxvLsQABdV5E9Y7urq4jyaMU3+KOb6FiTJ4OR/0Daa00b9QChobxuBLLHVvnqs+Tvssg==
X-Received: by 2002:a63:fc52:: with SMTP id r18mr3090503pgk.334.1596189766470; 
 Fri, 31 Jul 2020 03:02:46 -0700 (PDT)
Received: from [192.168.86.81] ([49.206.12.123])
 by smtp.gmail.com with ESMTPSA id u14sm9247222pgf.51.2020.07.31.03.02.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 03:02:45 -0700 (PDT)
To: Brendan Higgins <brendanhiggins@google.com>
References: <20200730121656.45302-1-98.arpi@gmail.com>
 <CAFd5g46wpYxF1=bs3LvXeVg6mPHrT6Ggp=QxScaf87O=yqcpBA@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <3aae0ade-1a61-5d28-94ee-6b0eee7c7be6@gmail.com>
Date: Fri, 31 Jul 2020 15:32:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46wpYxF1=bs3LvXeVg6mPHrT6Ggp=QxScaf87O=yqcpBA@mail.gmail.com>
Content-Language: en-US
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_uuid.c to KUnit
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

On 31/07/20 11:20 am, Brendan Higgins wrote:
> On Thu, Jul 30, 2020 at 5:18 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>
>> Converts test lib/test_uuid.c to KUnit
> 
> Can you add some more detail to the commit message? Maybe link to
> KUnit and say something about why this change is beneficial.
> 
Sure, I will make this change.
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> 
> Change mostly looks good to me.
> Thank you for the review.

On failure, the original test calls another function which prints a detailed error. I removed it when converting to KUnit. Is this required?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
