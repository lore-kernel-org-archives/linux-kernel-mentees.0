Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80743C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:14:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3832173E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:14:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuZF0Mj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3832173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EFE5D204CB;
	Mon, 27 Jul 2020 14:14:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XMDpW-Z1eiw; Mon, 27 Jul 2020 14:14:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DC5E2042E;
	Mon, 27 Jul 2020 14:14:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44C6AC004F;
	Mon, 27 Jul 2020 14:14:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59DC9C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 42FE285EC0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nu_lJ7k7WG9r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:14:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 869F885D7D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:14:20 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id b25so12271015qto.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=y9lbwhpNkXDEPrCqs4m21x/DyaLmLEGxvTObYoYswfg=;
 b=nuZF0Mj0owgt6tEsiTXfnJ2eI2ujMyxvOF5pbIRSQUbOvAb/wtVocAFwgKr/er65gC
 C+d5tZT5DB2J9mjk94BGMWgb/W/f0Vh23B440hN+Aq88n/FP8GewmdyNeyXWAY21tTmJ
 t7bpomd1mNoPFxL9K6XpFtfMGuNmL1KfpMUHbjJnOUwLskuli1JzIReFdu0ImyICn0Pc
 bHqtCJKDiGzoWZQxs7GdkkLzBpuZN00UJrdoU41KBPiXmuQleavSAW/ACB/IMRJoGSNs
 v70CMNmIuhXeq/Q/fMM7fndWFHAhGhxWyS0imUpzLXQpQyOWhMwb6GXeQ/hKgLZ0w5gb
 t6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=y9lbwhpNkXDEPrCqs4m21x/DyaLmLEGxvTObYoYswfg=;
 b=HYZmNaRP3f8WvjQENTZCh5Ux1lsWfLhf+ImzKLdDGdja86JeLME+EqpXq+3qK/Huhf
 fJLcs4v7I7hX7elOlZasgSOwd4dPJS64QG4nmlhsDH+evdxLVefZboURPv9FPQUNv7PG
 ICdU2UBtXO6R5ihX3Tbqhu7kJrrX/xiSiJBUiU17NaWedrGm77wT0c8jDg7B7E0mmRzj
 L4Oia7w8kxPYsnq/Q3ho/24swl1BtFp0D1RtY2JNx6Yarnbxo3rXtDS/E6Aozpi1ZJIx
 oOiTBu2hHB1fdoxhroMt8tlbVUYf5cq2fCzlbb34y4C9zF3v967nfT6AeS3kOKjOjyeC
 F8TA==
X-Gm-Message-State: AOAM533LX/hU1AWNwV3OAUMlCgJSeE4nWzNOgSZ1FwZ+vJ6dzzrL92kO
 Bu8K1O+BRo6i2ImU9RidRQ==
X-Google-Smtp-Source: ABdhPJy1E319z1D33SixUBWRgVTxX65uy8ONSuGjV3Q4iaZunOwRcDqmSGKsYBSkw3Ql8PSuJxAW0g==
X-Received: by 2002:ac8:5207:: with SMTP id r7mr22026332qtn.191.1595859259370; 
 Mon, 27 Jul 2020 07:14:19 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id y24sm2422196qtv.71.2020.07.27.07.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 07:14:18 -0700 (PDT)
Date: Mon, 27 Jul 2020 10:14:16 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200727141416.GA306745@PWN>
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Linus Walleij <linus.walleij@linaro.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
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

On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > >
> > > > video_put_user() is copying uninitialized stack memory to userspace due
> > > > to the compiler not initializing holes in the structures declared on the
> > > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > > >
> > > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > >
> > > Thanks a lot for addressing this! I now see that I actually created a similar
> > > bugfix for it back in January, but for some reason that got stuck in my
> > > backlog and I never wrote a proper description for it or sent it out to the
> > > list, sorry about that. I would hope we could find a way to have either
> > > the compiler or sparse warn if we copy uninitialized data to user space,
> > > but we now don't even check for that within the kernel any more.
> >
> > Here are my latest warnings on linux-next from Friday.
> 
> Ah, I forgot you had that kind of list already, thanks for checking!
> 
> > block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')
> 
> I see no padding in this one, should be fine AFAICT. Any idea why you
> get a warning
> for this instance?
> 
> > drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')
> 
> This one hs padding in it and looks broken.
> 
> > drivers/input/misc/uinput.c:958 uinput_ioctl_handler() warn: check that 'ff_up' doesn't leak information (struct has a hole after 'replay')
> 
> hard to tell.
> 
> > drivers/firewire/core-cdev.c:463 ioctl_get_info() warn: check that 'bus_reset' doesn't leak information (struct has a hole after 'generation')
> 
> broken, trivial to fix
> 
> > drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information
> 
> Seems fine due to __packed annotation.
> 
> > drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
> 
> The driver seems to initialize the elements correctly before putting
> them into the kfifo, so there is no infoleak. However the structure layout
> of "struct gpioevent_data" is incompatible between x86-32 and x86-64
> calling conventions, so this is likely broken in x86 compat mode,
> unless user space can explicitly deal with the difference.
> 
> > drivers/gpu/drm/i915/i915_query.c:136 query_engine_info() warn: check that 'query.num_engines' doesn't leak information
> 
> I don't think this leaks any state, as it just copies data to user space that
> it copied from there originally.
> 
> Stopping here for now.
> 
> Peilin Ye, is this something you are interested in fixing for the other drivers
> as well? I'd be happy to help review any further patches if you Cc me.

Yes, I would like to! I will start from:

	drivers/firewire/core-cdev.c:463
	drivers/input/misc/uinput.c:743

...as you mentioned above.

Thank you!
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
