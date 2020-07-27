Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1BEDC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:06:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C59D32073E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C59D32073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 915B187A85;
	Mon, 27 Jul 2020 14:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZViyvOsuAaM; Mon, 27 Jul 2020 14:06:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D3D3A878C0;
	Mon, 27 Jul 2020 14:06:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFDD7C0050;
	Mon, 27 Jul 2020 14:06:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0527C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CDAC485F89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NO7kuG3dMeVl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:05:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5D65685F84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:05:58 +0000 (UTC)
Received: from mail-qt1-f170.google.com ([209.85.160.170]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MMnnm-1kGU9Q04HM-00IoMG for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Jul 2020 16:05:56
 +0200
Received: by mail-qt1-f170.google.com with SMTP id b25so12246216qto.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:05:55 -0700 (PDT)
X-Gm-Message-State: AOAM531U4S17PYxynM7LQPiworIY1Yehk6JfNgis+LUhWnB+BBBXW2G8
 mp+OVak0kC+xtGyIGpybWdBJMKds/n3s5qnXJeE=
X-Google-Smtp-Source: ABdhPJyLw0yS/axt0gy7Q4r8Mv5c5syAQIHggRwgMclz+d8wr5c6LKZiPDs5uhjwt61MDn3Dh4YP6VF9XZYYgL6b5rw=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr19493367qtd.18.1595858754708; 
 Mon, 27 Jul 2020 07:05:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
In-Reply-To: <20200727131608.GD1913@kadam>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 16:05:38 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
Message-ID: <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Provags-ID: V03:K1:QQ0VDXoH8oWcItNoQC82bZ35lhi8TmRa/w3ghOvdMVVv/HdcVpy
 l29sRA39xSau2ByYxZwPmjl/otU4T9Y4e4ZyRxViQqfxJ2na1Zp1KvtpoATb947S89n6y4w
 Kq19WkX4fWV7r7nOJubtee9cCAhkQY6PlgEOb372FI5ab0FFAW1FFAdh/1ciJCc0Ix4VrD/
 bmXH/0f7ey4ocIWtn7jWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ydkMA2EBmVk=:i6zWkTs5i/HEHvrzl1hX+J
 b7aIy1bCHv7fZ6tZ+J+6D0kIZOZPWY8FJJ9/vADdB9rzK4S1HjusNuPPXjNduV8Di/xy6M6HU
 P6fDVKZntbUJEksshwk9xBucG0F4zfBQ57Ulrn8a7VN5MjOTZDk/W9gGcdPvpEPrERsQc3SpC
 r8rgcHfSrJt2N4NTEpPz17xBoJ8uASMSiuPqsCufbiTjVJetUXGuaiJZDNDB9sHtxgiwo/UlM
 /32WAzQVMSdAg9LSNyNgoYiNoFmTn1MxyoQz3br342YuwgSONZPhAaOALmfgjCzMlJV8qq5JI
 Dral7OcpjpfxHSSdh72G61f1z37MxA9TAi65vgKbzTt+Atx21FG/GHtVpdzgpy2/Fxcx5MweD
 r/i+9r8DlaDhPQPh8yxf77dDVTOp2rUbfHSmNLS35jYorZPrOFgZjJcKI73kaToNvzfCkcy5V
 79aS+0z2r2bH4G7Ntf4f/wzU33bWQ3vmrWVKPrqhC1GxdM3Es0m9hiTSdqZkMOx4/hn5h71eR
 6R3Q/48ivoTH+ZRqtWvy5/rlztNHXDTZcSW9XrGo1/fKfaYPkviyIElMBozxxs7KVdoIIikmg
 kwx0PLAJjdAoHJ5bdkUJTJn3Q41Rrl2rCxLUYzdhwrA073TJtSVZtNOrimN94omoPK5Tj2YXs
 KGZ86lfXBBBu/2Lt6TV/6rjxaBMzTfzQHwGU4vn/bv6ymp3kdOPcwZ8YbsQbkiSDn8IWuSWCg
 hQUUKYOf+3Zhd5VwzDCYPvfrj0OszJJI2GNfczefp/bJZ0TFDP/S0vPUmMGhwQDs5BK+zE3l9
 65LsYECj+xUpx0LLbKtgKud4K+FwG+pRSkF+icJBmbM1vwzQDkTz5SCY7+0IdFO2MVsRTsxKM
 cvekeNPxRPZNnkoKtxgVUNsls9xGMYbI/JrvUAqWIA79Lxt0Sg+cMp0ssOHaZCbFQqgNxjygd
 BQVdicznAvZcJx4PHnVSJdC6huAC6cdHzyVRQK6JlM25BppWGXUf4
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Linus Walleij <linus.walleij@linaro.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
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

On Mon, Jul 27, 2020 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Mon, Jul 27, 2020 at 09:25:16AM +0200, Arnd Bergmann wrote:
> > On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > >
> > > video_put_user() is copying uninitialized stack memory to userspace due
> > > to the compiler not initializing holes in the structures declared on the
> > > stack. Fix it by initializing `ev32` and `vb32` using memset().
> > >
> > > Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> >
> > Thanks a lot for addressing this! I now see that I actually created a similar
> > bugfix for it back in January, but for some reason that got stuck in my
> > backlog and I never wrote a proper description for it or sent it out to the
> > list, sorry about that. I would hope we could find a way to have either
> > the compiler or sparse warn if we copy uninitialized data to user space,
> > but we now don't even check for that within the kernel any more.
>
> Here are my latest warnings on linux-next from Friday.

Ah, I forgot you had that kind of list already, thanks for checking!

> block/scsi_ioctl.c:707 scsi_put_cdrom_generic_arg() warn: check that 'cgc32' doesn't leak information (struct has a hole after 'data_direction')

I see no padding in this one, should be fine AFAICT. Any idea why you
get a warning
for this instance?

> drivers/input/misc/uinput.c:743 uinput_ff_upload_to_user() warn: check that 'ff_up_compat' doesn't leak information (struct has a hole after 'replay')

This one hs padding in it and looks broken.

> drivers/input/misc/uinput.c:958 uinput_ioctl_handler() warn: check that 'ff_up' doesn't leak information (struct has a hole after 'replay')

hard to tell.

> drivers/firewire/core-cdev.c:463 ioctl_get_info() warn: check that 'bus_reset' doesn't leak information (struct has a hole after 'generation')

broken, trivial to fix

> drivers/scsi/megaraid/megaraid_mm.c:824 kioc_to_mimd() warn: check that 'cinfo.base' doesn't leak information

Seems fine due to __packed annotation.

> drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')

The driver seems to initialize the elements correctly before putting
them into the kfifo, so there is no infoleak. However the structure layout
of "struct gpioevent_data" is incompatible between x86-32 and x86-64
calling conventions, so this is likely broken in x86 compat mode,
unless user space can explicitly deal with the difference.

> drivers/gpu/drm/i915/i915_query.c:136 query_engine_info() warn: check that 'query.num_engines' doesn't leak information

I don't think this leaks any state, as it just copies data to user space that
it copied from there originally.

Stopping here for now.

Peilin Ye, is this something you are interested in fixing for the other drivers
as well? I'd be happy to help review any further patches if you Cc me.

     Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
