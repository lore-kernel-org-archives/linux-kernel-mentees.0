Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97135C433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:56:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5253F20738
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MG5CBLty"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5253F20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2BFA1203D2;
	Mon, 27 Jul 2020 07:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbSntcp48mWP; Mon, 27 Jul 2020 07:56:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A5FCB2002B;
	Mon, 27 Jul 2020 07:56:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 911C6C004F;
	Mon, 27 Jul 2020 07:56:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDD99C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 97C40203D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:56:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxhBa9dkDDHA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:56:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 2744F2002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:56:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id b79so14432931qkg.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=N6upqxCfyW0GVZHe453idrIKQhFzkY5bo/oAq5M3uGE=;
 b=MG5CBLtyWpDp74hy9XAMKqGEpWa8mR8mZm6FLz3EmFUhHuNS6Cc+ucxF/8J3Kwilww
 ctoLd7ZrsXx6WGMNMV4rJbnd27tJ1/e4rtMyJBuCTqpVNAAoNo99DbKA44lj0OjjfjF3
 SNqKyxqlob+pKDiCPnI21KXkXmZNE53JjrZ3oENbp1qhQTFUoABDRLmgacaHzT4HdKI4
 tBXnGOlWKicNc5GHjatI5XupCQPIIbGS5yKAF0NRmIBtDgzck+d0RDxmQyQh1BrnGohf
 L7vVZJdawFwAO9/0fnkuLd6z7+8TZ0QuPIM0GgkOvt+scBTGTnMDfHPP4eA37TtOMW0V
 Z1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=N6upqxCfyW0GVZHe453idrIKQhFzkY5bo/oAq5M3uGE=;
 b=jzRNkptYaY2YNNQSoPVuHRx3fG8tzmKLeDDmC00giMovaeaRRLLPFMDt+KO8tdxylG
 K8MZYn0UuXZcDh/9nxw04sMPM19W3c5nrnWA+5dCgGB9Q1i/jK7ST7TkVARMS7XQkJ9D
 Wc/eAY8k37Cp6RUN8CgXPyWSK1FDBdikZHxGEzf6dHUgy1ZKs6UwZH8yCXr5eZsutLVh
 mKvYgNV+XDHN2Bs+msb0ebfB6fG0EHpGYlhRVqSfHYj0dxfyAch/NBFARTTlm037IjvQ
 qoyees/aeM6WCky6fo1+eP7y5lIaQAEcTJTkqgAfP+jN7imhOQK8b00wfuBTpRAyjUeO
 ZlLA==
X-Gm-Message-State: AOAM533PvhABkzeVtbiuiPWcut/k4nAQy0/jIZRp457sHlMKgu/ryg+Q
 U6/c9R68/L1tQb9SxbVaHg==
X-Google-Smtp-Source: ABdhPJxAQQcavuqSCw162hVKCvTa60uFZJYYJ8f5F0oIw3F8nSrx6KfVDkWkp/ov+7P3mP9y4r3j/A==
X-Received: by 2002:a37:61ce:: with SMTP id v197mr2776425qkb.44.1595836600043; 
 Mon, 27 Jul 2020 00:56:40 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id p4sm17340859qkj.135.2020.07.27.00.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 00:56:39 -0700 (PDT)
Date: Mon, 27 Jul 2020 03:56:37 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200727075637.GA205716@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > video_put_user() is copying uninitialized stack memory to userspace due
> > to the compiler not initializing holes in the structures declared on the
> > stack. Fix it by initializing `ev32` and `vb32` using memset().
> >
> > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> 
> Thanks a lot for addressing this! I now see that I actually created a similar
> bugfix for it back in January, but for some reason that got stuck in my
> backlog and I never wrote a proper description for it or sent it out to the
> list, sorry about that. I would hope we could find a way to have either
> the compiler or sparse warn if we copy uninitialized data to user space,
> but we now don't even check for that within the kernel any more.

I am glad to be of help!

> I would suggest adding these tags to the patch, to ensure it gets backported
> to stable kernels as needed:
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
> Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for
> time64 ABI")
> 
> In addition to
> 
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Sure, I will send a v4 soon. Thank you for reviewing the patch.

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
