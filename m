Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7B7C43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:26:29 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7055022240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 13:26:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrUc/Nra"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7055022240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E35285821;
	Tue, 15 Sep 2020 13:26:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAWrdDWwyC-h; Tue, 15 Sep 2020 13:26:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A2599856CB;
	Tue, 15 Sep 2020 13:26:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EEB3C0864;
	Tue, 15 Sep 2020 13:26:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94186C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 88BE8204D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RmMpDy9N0SaH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:26:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 21D42204F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 13:26:24 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id o5so4091222qke.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=ECv1tH4dixNsdKxQCqvGJD0xyYRqc/3rORp/BHVcsQ4=;
 b=rrUc/Nra5A278GUSmFmQgG0+9yiyz/Kp+IF8tT6eTd3T2zNG1ooEzO9ZlSCCOlPi9X
 hG+YWCMJqq8/nKJTh+UiUyP6E0SMGLppdAPCAjaCaYUxKK9DFJQnilOVBKn6ywicFDW9
 T/ep8wEpWgIA4CJKCzGviWoNMJFKt7DlgQ9U8gBz4HvwOmAkzWa1iRRXhtlTfNTo8kYK
 0Hh34hrXFgxJGrpV+bUnZYlVeXVlXR61XN5mr9hcMvIBijH7CUpZH5Ym59hVq3kWILQU
 DSxDsdz+dODQ0fV5f6teQgCvV8Lb7WfrlqTz0PghqhgX0cWebwp42woWsJ9gpR9iVoNM
 iUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=ECv1tH4dixNsdKxQCqvGJD0xyYRqc/3rORp/BHVcsQ4=;
 b=EtyZesMhcRJgClNGIc+JaOnXYhiF0Py6xT1R2STek5P76zZj8vs/Gheeq+S6HzKQoI
 AogBlHB7dHLeu7IiE3M38JTSMbZ8XHRoM9UYVnKnfsp2PfEezSnUfqNRjrNPKGOxrW6P
 iN9QerJ/EgTo8b8GCwQi2Yvcy93DOUl4ih/F4BzCZKs+stz7gobd4wXP9TgppJ/k56Xo
 X8KxLL7G5hsDKZmVIxjnb80l/YUqTSqZN5QiRu16Hgf6TzryTU7X5buDRV2KTszFFouu
 f+RIKnPZLDjYIEntMHlgWHLRH9Ce09n+auM/TMsHSUA7QjpspvB/lav2qQ9DuSxpAtH1
 y/pQ==
X-Gm-Message-State: AOAM532Bdum0/OPS31++A3jZMNHxgGsUjLq6KJq2oqCCcFfhOv7O+yJL
 j/RhjSq647RMAi6o1jxchMU=
X-Google-Smtp-Source: ABdhPJzuz0o4wLDw+Cjo2IgGvOxLPSDN8JBtV21hG89SBTjGoXxWC7vpcN1/qhgD+HtvnbTR9wKs5w==
X-Received: by 2002:a05:620a:13e8:: with SMTP id
 h8mr17496044qkl.322.1600176383031; 
 Tue, 15 Sep 2020 06:26:23 -0700 (PDT)
Received: from dwls-dell ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id g45sm17473139qtb.60.2020.09.15.06.26.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 06:26:22 -0700 (PDT)
Date: Tue, 15 Sep 2020 10:26:17 -0300
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <EA89ED5D-E477-4464-B523-D729796CE0D0@getmailspring.com>
In-Reply-To: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
References: <alpine.DEB.2.21.2009151345001.31296@ramsan.of.borg>
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Disposition: inline
Cc: "=?utf-8?Q?mchehab+huawei=40kernel.org?=" <mchehab+huawei@kernel.org>,
 "=?utf-8?Q?r.verdejo=40samsung.com?=" <r.verdejo@samsung.com>,
 "=?utf-8?Q?linux-kernel=40vger.kernel.org?=" <linux-kernel@vger.kernel.org>,
 "=?utf-8?Q?nicolas=40ndufresne.ca?=" <nicolas@ndufresne.ca>,
 "=?utf-8?Q?linux-kernel-mentees=40lists.linuxfoundation.org?="
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 "=?utf-8?Q?linux-media=40vger.kernel.org?=" <linux-media@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [v10 3/4] media: vidtv: add a bridge
	driver
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

Hi Geert,

Thanks for bringing this to my attention.


>> +	u32 nbytes = 0;  /* the number of bytes written by this function */
>> +
>> +	u64 nbytes_expected; /* the number of bytes we should have written */
>> +	u64 nbytes_streamed; /* the number of bytes we actually wrote */
>> +	u32 num_null_pkts; /* number of null packets to bridge the gap */
>> +
>> +	u64 elapsed_time_msecs = jiffies_to_usecs(m->timing.current_jiffies -
>> +						  m->timing.past_jiffies);
>> +
>> +	elapsed_time_msecs = min(elapsed_time_msecs,
>> (u64)VIDTV_MAX_SLEEP_USECS / 1000);
>> +	nbytes_expected = div64_u64(m->mux_rate_kbytes_sec * 1000, MSEC_PER_SEC);
> 
> Seriously?!?
> 
> You multiply by 1000 first, followed by a division by 1000 using an
> expensive 64-by-64 division?

This entire function is broken and needs a do-over :)

> using an expensive 64-by-64 division?

I am new to kernel development. I wasn't even aware that this was
expensive, to be honest.


>> +	if (nbytes_streamed < nbytes_expected) {
>> +		/* can't write half a packet: roundup to a 188 multiple */
>> +		nbytes_expected  = roundup(nbytes_expected - nbytes_streamed, TS_PACKET_LEN);
> 
> drivers/media/test-drivers/vidtv/vidtv_mux.o: In function `vidtv_mux_tick':
> vidtv_mux.c:(.text+0x788): undefined reference to `__udivdi3'
> 
> This is a 64-by-32 division, hence it should use a helper from
> <linux/math64.h>.
> 
> However, I'm wondering if "nbytes_expected - nbytes_streamed" is
> guaranteed to be a "small" number, hence a 32-by-32 division would be
> sufficient?

I think so.

I will send a patch to address the things you pointed out in this email.

-- thanks
-- Daniel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
