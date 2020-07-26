Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62404C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 18:12:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE9520714
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 18:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVyeUEfb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE9520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C18DB204DA;
	Sun, 26 Jul 2020 18:12:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rYWC46XusA9X; Sun, 26 Jul 2020 18:12:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 296A2204B2;
	Sun, 26 Jul 2020 18:12:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 111C5C0050;
	Sun, 26 Jul 2020 18:12:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE75AC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AF26C204B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:12:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPFLXMaVwaID
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:12:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by silver.osuosl.org (Postfix) with ESMTPS id A346B204CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 18:12:25 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id c12so1600262qtn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 11:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=sWvoytYgdWuVZpnsHNqepIQUSxkaD87xtrtLEKkqxWY=;
 b=MVyeUEfbyS3VZjAkUDRUL1xOAzcfaQcd8KU7aoJ4z62BDQBGfr8iG0+ajJoqOZqJIK
 YQRZOu53+llVUz4LPxfdqQUWLZ4umPzuU+Djvnfx4znXYIT5DI2j1IKfxzS/3z8AcSMV
 g/kTOEIb7fqZm0t6iOpgttv1EM7rot3vi9eH2Y+dZcLgljzLwP++VjViuQ5QslcR0EnW
 sdKyWU9FBJW8VyZZPjrOnb1cjzh6zu6GCN6fhCaFCxpVFK/x3DXLYTGGdQLcb3d7/kGA
 B5EUJmrLgMbxDNeJJ1J5FqDy/nchpFM56Z7LLHFhRmJQuS7oBhaOW83FWcB4PvteEm5/
 fdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sWvoytYgdWuVZpnsHNqepIQUSxkaD87xtrtLEKkqxWY=;
 b=FYfYxAv7qTuJ+s/zchFgRNIX/oVaUqoec7vYPvPo55nj15MVdcI6cNYrHdkXbTVzpv
 DDB4gMRYWMdy+YZv4Tlmo5CqfVPkCglNZQjQCeBxKeK6jh03czvdUytpoUV2VzWFQv8K
 THTe6CmojopDmUIQ8gUUcgKVcAXvQx6k2uPVXPftpKVB2sPAiG6W6HXDuL2i+aXy4Lex
 dJPLrZaE1x7KXygihZHoTXgBgUesLX2ahcGdElybRwdmFD035EYnUh4u1MI3Nd3VE454
 nLXkJsRyK7uo9eL59UHx6BemNo7OU0duPB/edfStO0m1P0Csjpy1USHjPrAPwXCdCjgX
 Ys6Q==
X-Gm-Message-State: AOAM533sn2Vweli6s3ssc4fCK2/ikkHWr1voFB95p65sxncK8JdcuuEG
 qy14gznIaHH6yt2iivk03g==
X-Google-Smtp-Source: ABdhPJxKGSTuzHcLZGMGS82EEnlAeefUmZtiIGxBpjEXSvwnMIf7j9zEmOsoxXFdzO5wAarhaL0o7g==
X-Received: by 2002:ac8:6793:: with SMTP id b19mr9261706qtp.333.1595787144680; 
 Sun, 26 Jul 2020 11:12:24 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
 by smtp.gmail.com with ESMTPSA id j15sm1885535qkl.63.2020.07.26.11.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 11:12:24 -0700 (PDT)
Date: Sun, 26 Jul 2020 14:12:22 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <20200726181222.GB49356@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726173044.GA14755@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726173044.GA14755@pendragon.ideasonboard.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs@googlegroups.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vandana BN <bnvandana@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] media/v4l2-core: Fix
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

Sorry, by this code example:

        char *p = (char *)&vb32;
        int i;

        for (i = 0; i < sizeof(struct vb32); i++, p++)
                printk("*(p + i): %d", *(p + i));

actually I meant:

        char *p = (char *)&vb32;
        int i;

        for (i = 0; i < sizeof(struct vb32); i++)
                printk("*(p + i): %d", *(p + i));

But the idea is the same.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
