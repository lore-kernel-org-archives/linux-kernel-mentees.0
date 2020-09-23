Return-Path: <SRS0=Dbq6=DA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A41C4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:29:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBE9523119
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 23 Sep 2020 10:29:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u6yJI32v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBE9523119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9ADBB867CE;
	Wed, 23 Sep 2020 10:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psB1F8KfDppx; Wed, 23 Sep 2020 10:29:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25C4486730;
	Wed, 23 Sep 2020 10:29:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B6F3C0859;
	Wed, 23 Sep 2020 10:29:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C94D3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:29:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B26BA22D10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s9W8k4OKLUa2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:29:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0AA65204E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 10:29:32 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bb1so885965plb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 03:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JI/zqwqxLAG9o9M3uwdlp+Q2ESbf1KLswdxq+phSMss=;
 b=u6yJI32vRYyXSnq/EAHe1ycM5E/UH402GHw9uEHyjFqkwGjw4LxgSg5iLS+DiRQ4+r
 o7Oeyl6s40YgiEk5lLE815dRP47+HbnUA46uteNZkALAUaMU9icgkCx5V4xe0cnUQ99d
 71b4vGj6t937JuPHgrem0dQTIRFdtBXZomoi7lc8431D0L6a2Xeqc82fbvp82Orpl5Yv
 xJIV4wAoYiWMAXCsvj6cDs5aD51aFHi5y24p9NIRSNDyHU6AwnltjuqaIfChy9ZiQVJy
 XtBQWuz11V6nG0xekQREIqGo0xJovNXYI4Yy9cD1YOtH3Im1aHFRg2HZUJVsiXtR8gBT
 EISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JI/zqwqxLAG9o9M3uwdlp+Q2ESbf1KLswdxq+phSMss=;
 b=ESXaVisKHPOCMzgBcAAHdR7kOePmX4owi10Ggc45m09aaQYr0L2PKWwVsRucfke+nh
 y5QZ/V4RaaHuV3T89ErWmKNIrkHDHZgLOrXBj/rAGvfxv3vD7WMy56Ns7T3cTfDzdsTw
 8xMSiiZO1AOjHAuCj+iMP2jz5YATaV199ybLHjB6ofbV6rdtXTDiWB4N3bPn+nWtPXGv
 VD/CNzDw8vwTWML/aRsyo/q8mXkYGuq7n3A0AdSwxdskJK+lizdPZPPaQ/qMUeBjduJf
 otQzIxhUP6abFTZ1OmWmQBSjFoFNl1h4Tqkc6ipSH94LmQto+zhBXuwF9jhJKsekD7H7
 K5mg==
X-Gm-Message-State: AOAM533E5ie5m6jpEdTz77k3SRyKb48CqrHknaANTACaXcRsi6AeCePG
 RYXVhObpLXRHtqWjT9yBQg==
X-Google-Smtp-Source: ABdhPJwkJ17OXMhXTjQk3IyAhB+j/BlL4pmBt9igviElaN0XRW+WDlr9Yxgy9/m+2VJRbrio0D/iMQ==
X-Received: by 2002:a17:90b:46c4:: with SMTP id
 jx4mr2931642pjb.190.1600856971629; 
 Wed, 23 Sep 2020 03:29:31 -0700 (PDT)
Received: from PWN (n11212042027.netvigator.com. [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id x27sm18118583pfp.128.2020.09.23.03.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 03:29:30 -0700 (PDT)
Date: Wed, 23 Sep 2020 06:29:25 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200923102925.GA288879@PWN>
References: <0000000000004c1f4d05afcff2f4@google.com>
 <20200922154531.153922-1-yepeilin.cs@gmail.com>
 <20200923100405.GD6719@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923100405.GD6719@quack2.suse.cz>
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Jan Kara <jack@suse.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] udf: Fix memory leak in
 udf_process_sequence()
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

Hi,

On Wed, Sep 23, 2020 at 12:04:05PM +0200, Jan Kara wrote:
> On Tue 22-09-20 11:45:31, Peilin Ye wrote:
> > udf_process_sequence() is leaking memory. Free `data.part_descs_loc`
> > before returning.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 7b78fd02fb19 ("udf: Fix handling of Partition Descriptors")
> > Reported-and-tested-by: syzbot+128f4dd6e796c98b3760@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=c5ec4e6f5d818f3c4afd4d59342468eec08a38da
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Thanks for the patch but I've just yesterday written exactly the same patch
> and merged it to my tree...

Ah, no worries, happy to see the bug gets fixed!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
