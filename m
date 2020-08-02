Return-Path: <SRS0=RDF/=BM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2445C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 16:55:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E16B2075B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 16:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uc3Vw0xb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E16B2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5CD3F87D89;
	Sun,  2 Aug 2020 16:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GIfV1jNnR9TV; Sun,  2 Aug 2020 16:55:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 238F387BA6;
	Sun,  2 Aug 2020 16:55:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0948AC0051;
	Sun,  2 Aug 2020 16:55:41 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ED57C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 16:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 41FCB857D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 16:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzvMxbiH1CWW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 16:55:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A48BE8574A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 16:55:39 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id j187so33224715qke.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 02 Aug 2020 09:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BINorMwcmmozTJcln0MY/a1goJtl5nuGFZ+Nkbr2f30=;
 b=uc3Vw0xb0konWtvxSYuBa3RKAeGOwYP+qEpMumHLXgBBqNwKGhUGcWG7uDxoMh45ZL
 1xErxsxzr06rsn5IUrENPlraLUXoBa76pkMUCQsMi7Lwzv1EB3itGyqJA6HaHqwnO1CI
 FjGJcaS0q0oW0//LNoAkZHqs1tymQ7RJjzoZBmj5UXkpwwtKgI1FFp4E+FM1r1EZNKQn
 HfihTKtxxcTF5+drYqGWRtLPqemk+VFBAwOAIwG10EsJ1QfmDtpEvp86xN0QNFyKQr2f
 U34YNzRSM7g7/tyElMX5vVcrE9yljIRvyu6xRy7IJ711leLQ4HvJeZyXYv2YNSO//lTn
 nNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BINorMwcmmozTJcln0MY/a1goJtl5nuGFZ+Nkbr2f30=;
 b=jK9z60CYLmDG6WzIQve5q3we8u97D+sxDGn0X1hAo6Cfx3a3lc2S3jw14C7LCvRlG0
 0nd2HHxopkFpB+RBlhEtzTDsq72Opfo5/nMjo0MddbgvbYnA9gydnW2NVKhZ0fxcltT6
 q7Oa+jWJbVZfzX5sBXekYUFzgs2ieUhteMRHSdmgqW1n6WScXMB85YDYDwoaGMbLBwny
 yl7eqixlWr7MkyJb38xDQl6Icr10oQXppzvxMQnd/nOMAe2UPTS+7q7+S8YEaJ76Ir5a
 pNQah3wBRp5BaQO1YkAFmPQxgC119sdnTDgLHySlf1l9a/ZSbm7apmbx1Ai/Bbe9vvd+
 4KiQ==
X-Gm-Message-State: AOAM5327xYxwBWmPhDztnUNFaTmc4zujQvd/ee9cktCz6xjJF1IAkyoa
 i9nEp6HwyDjFnjzra3nWww==
X-Google-Smtp-Source: ABdhPJymQtwYnrk15jVl8++2D8fEG4xzmBUHJ/Uqnxy77RstBFGjbX7MLuzmJspbY8K11tAGoU9acQ==
X-Received: by 2002:ae9:ef43:: with SMTP id d64mr13560246qkg.326.1596387338519; 
 Sun, 02 Aug 2020 09:55:38 -0700 (PDT)
Received: from PWN
 (146-115-88-66.s3894.c3-0.sbo-ubr1.sbo.ma.cable.rcncustomer.com.
 [146.115.88.66])
 by smtp.gmail.com with ESMTPSA id l189sm17094407qke.67.2020.08.02.09.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Aug 2020 09:55:38 -0700 (PDT)
Date: Sun, 2 Aug 2020 12:55:35 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200802165535.GA270694@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727131608.GD1913@kadam>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Linux-kernel-mentees] [PATCH v3] media/v4l2-core: Fix
 kernel-infoleak in video_put_user()
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

On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> kernel/signal.c:3524 __do_sys_rt_sigtimedwait() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
> kernel/signal.c:3524 __do_sys_rt_sigtimedwait() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
> kernel/signal.c:3556 __do_sys_rt_sigtimedwait_time32() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')
> kernel/signal.c:3556 __do_sys_rt_sigtimedwait_time32() warn: check that 'info' doesn't leak information (struct has a hole after 'si_code')

I think these are safe. Before getting to copy_siginfo_to_user(), all
`info` run through:

	do_sigtimedwait()
		V
	dequeue_signal()
		V
       __dequeue_signal()
		V
	collect_signal()

Where it either gets memcpy()'d by copy_siginfo(), or memset()'d by
clear_siginfo().

The only exception is when next_signal() fails in __dequeue_signal(),
but that will cause do_sigtimedwait() to return an error, and we never
reach copy_siginfo_to_user() in such a case.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
