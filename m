Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C554C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 10:31:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FCBD206ED
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 10:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="M/JE0jWW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FCBD206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B510D8568D;
	Fri,  6 Nov 2020 10:31:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NF-avH-DOo9; Fri,  6 Nov 2020 10:31:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A8C41853C5;
	Fri,  6 Nov 2020 10:31:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85450C0893;
	Fri,  6 Nov 2020 10:31:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 021B1C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:31:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC0C386479
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2q8yWlonViYj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:31:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5B1E86463
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 10:31:47 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id k18so834288wmj.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 02:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M1+FhL1Hdj59VRzZdZhioMqeWvhNPbEdiUD7VULxQQU=;
 b=M/JE0jWWrCdwzcZCXwIZD3eRRKTYy/8g8OKV0ZKDif3qphFlkO2H5JyC59iyuMtxNE
 Nu/yOa22/Toc1SAzQWEzm3poObF9hJw+XoFLePpHjoYvGPXXFpqYtwwf18kuAxDWyZzI
 3KPHLXLwiikOSMubcfovBClQGtt9xnFGPPeyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M1+FhL1Hdj59VRzZdZhioMqeWvhNPbEdiUD7VULxQQU=;
 b=n4axk//SbWhDFNDAeTVsW91T5qa0ov3sv11qiOAw1OIuIoN083bE8vz+X4OqznFUKf
 /15Xw4C020HilQ/LXzZjcxQWU5xISvitzc2SPteF8ikG6l0v9ELRa+GcO//HW7/maP5f
 a2Sqpu4U413j/hx5xzzAEiayJrQxFcyEDzoXkf6i+FhBnRxF/z4kutwSgdItKGDxUL2w
 f1ZVaVaAF+SzozNxUI3T9JY4g7s98XlYrs1cG2bHYlTwniwVfgk3DdPOG2D/GHfAEZvw
 TDx8FXZWJ0Z1HPeCGjnsTb8XESFBdT5B366ygGK/hbFpAW7og+tg9veD61bWPt3JDjU0
 BXQg==
X-Gm-Message-State: AOAM532O9QySVH5sSqzGwI7OD3UkAOjbrkJeBxzU/IdOn05Sevardz1B
 EZEH9r705PK4c/TDFlGIUCnz1Q==
X-Google-Smtp-Source: ABdhPJzurZkBLjeRcDX+srfxJ/ab/V528S8yjKu3GWSmBaPWEbZPW7e13Q8ol2knWYcGMw1McbppEg==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr1631220wma.126.1604658705755; 
 Fri, 06 Nov 2020 02:31:45 -0800 (PST)
Received: from [172.16.11.132] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id t74sm1652566wmt.8.2020.11.06.02.31.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:31:44 -0800 (PST)
To: Arpitha Raghunandan <98.arpi@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20201103111049.51916-1-98.arpi@gmail.com>
 <20201103113353.GC4077@smile.fi.intel.com>
 <20201103115223.GA268796@kroah.com> <20201103160728.GQ20201@alley>
 <57976ff4-7845-d721-ced1-1fe439000a9b@rasmusvillemoes.dk>
 <b24a8200-b456-ecab-cc60-6f4ff10baa5d@gmail.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <1b452380-53a5-f396-bf2f-97736db28afb@rasmusvillemoes.dk>
Date: Fri, 6 Nov 2020 11:31:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b24a8200-b456-ecab-cc60-6f4ff10baa5d@gmail.com>
Content-Language: en-US
Cc: alexandre.belloni@bootlin.com, Kees Cook <keescook@chromium.org>,
 rdunlap@infradead.org, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
 linux-kselftest@vger.kernel.org, idryomov@gmail.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH v3] lib: Convert test_printf.c to
	KUnit
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

On 06/11/2020 05.04, Arpitha Raghunandan wrote:
> 
> The total number of "atoms" can be printed by maintaining a static variable
> total_count that can be incremented as is in the original test_printf test.
> But, the reporting of the random seed currently is done in kselftest and so
> will not show up with KUnit. I am not really sure which is better in this case.

So my real questions are: Why do we have both kselftest and kunit?
What's the difference? Are there any plans to merge the two frameworks?
What's the point of converting from one to the other if not? And if one
is to take a currently stand-alone ad hoc test module and place it under
one of those umbrellas, which one should one choose?

I don't really care if the "deterministic random testing" prep work goes
with kstm or kunit; whichever framework could provide that boilerplate
is the framework I'd make sure to use for subsequent work on various tests.

The reporting of the number of "atoms" in the printf test suite is
something I'd miss if not preserved, but if there's sufficient good
rationale for doing the conversion to Kunit I could live with that. But
if kunit then can't provide a per-test-module rnd_state and handle its
seeding (and reporting of what seed was used), I won't ack the conversion.

Rasmus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
