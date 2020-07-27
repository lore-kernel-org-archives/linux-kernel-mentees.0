Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FECC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:30:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE41820729
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 15:30:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMDO/s0V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE41820729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AE2D878B4;
	Mon, 27 Jul 2020 15:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yt4SyNy5IyVM; Mon, 27 Jul 2020 15:30:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CFF3F878B5;
	Mon, 27 Jul 2020 15:30:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4F64C0050;
	Mon, 27 Jul 2020 15:30:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48641C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 374FD860C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-pbi8X-a2FM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:30:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
 [209.85.219.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 890F685FC1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 15:30:36 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id di5so7606102qvb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 08:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=06/0Fc/CzxtKe/AQi80TbkGLzxKNq+FXAhjScQa1P0w=;
 b=DMDO/s0VURJbuRU3EHjXuLMdKHeGJSp2p9miEcOKpygLfWx3etfGBJvyZT6YdaZv+D
 cRoFG+Y+3ZnrS9yjMKJeiB0VelIwPoCw1EqPPnVv2zHz3BT28EHOgaRMlAD8lBHtJSV2
 swA4A9tm6Gr6T7RraR1YT/GNZ2z1TVHDrKojgEASJ9i+C1WXyMQDEZvJIv8tYeF/jp7S
 Tz9tY4hGgzbJZO8677sk2m2r2b3E4NQT2kL4hY1SAiikCv20LlP77egY5OY91ZRUSADj
 BK240vqACl1y5S2tAum2n+iasGs2ljw/dzEQQdijqTFEuVEbFezqKj92L1fG5KWU/Mt+
 X43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=06/0Fc/CzxtKe/AQi80TbkGLzxKNq+FXAhjScQa1P0w=;
 b=Re80tQbnE0KZu4HZBW283Eyy4x4vxRWQNM94qZ1Uyc/SyqNqGezb3HTCIGLPsUX1l6
 yvy+dE9klnoMpLzvzqpN2+4FsyaVVicxh6N36/vKryRxDGhG1Yb3so5tbBRtxwTOj4hz
 WJlljxroTeE6cM1+thnrp8FO70D9O5L/s00EsArTEKq7H5n05dFu1WrEYledmrkCA0BA
 pnk2HyZ6eWvEMvbbiABzLhs02vR1j19yKA+xAaTg5kgi9la8a5UKnXnApDGSYu00pt4/
 xxni4nx3Zh1QAPIARLjW1VBGTGack6PKJQnBJQuRAYl96plXlCz7Kdf6+cvqL4NNN8kC
 vkWQ==
X-Gm-Message-State: AOAM533L6WTSYMO2fCsLPewQMxpszZHfsuCA1LabcaGZGbbuyRHv4TS1
 TTKFlOgngGhbPtWUwWs18g==
X-Google-Smtp-Source: ABdhPJw5MjdGAe9ULHqTPC3/a5mAB9/7H9/flRqXH8RawvWje9UzoAdVymmniLR/3m88yRIKeSCTXQ==
X-Received: by 2002:a05:6214:1143:: with SMTP id
 b3mr21082466qvt.84.1595863835563; 
 Mon, 27 Jul 2020 08:30:35 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id c133sm19928340qkb.111.2020.07.27.08.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 08:30:34 -0700 (PDT)
Date: Mon, 27 Jul 2020 11:30:32 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200727153032.GB315139@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
 <20200727141416.GA306745@PWN> <20200727144609.GG1913@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727144609.GG1913@kadam>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>,
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

On Mon, Jul 27, 2020 at 05:46:09PM +0300, Dan Carpenter wrote:
> On Mon, Jul 27, 2020 at 10:14:16AM -0400, Peilin Ye wrote:
> > Yes, I would like to! I will start from:
> > 
> > 	drivers/firewire/core-cdev.c:463
> 
> My prefered fix for this would be to add a memset at the start of
> fill_bus_reset_event().
> 
> 	memset(event, 0, sizeof(*event));
> 
> 	spin_lock_irq(&card->lock);
> 
> 	event->closure       = client->bus_reset_closure;
> 
> 
> > 	drivers/input/misc/uinput.c:743

I just sent a patch to fix this as you suggested.

> I don't think this is a bug.

I see. I am now fixing:

	block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
