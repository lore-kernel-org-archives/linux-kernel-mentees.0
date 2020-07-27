Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318CBC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:20:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036E12070A
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 14:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036E12070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9B5488192;
	Mon, 27 Jul 2020 14:20:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DWPb21ZB5mJu; Mon, 27 Jul 2020 14:20:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 43B8F88191;
	Mon, 27 Jul 2020 14:20:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 262DAC004F;
	Mon, 27 Jul 2020 14:20:52 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED622C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E292D88192
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wZy5w8fuFnuR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:20:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A82FA88191
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 14:20:49 +0000 (UTC)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M42X0-1k03zj0SVE-0004xR for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Jul 2020 16:20:47
 +0200
Received: by mail-qk1-f169.google.com with SMTP id h7so15329676qkk.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:20:46 -0700 (PDT)
X-Gm-Message-State: AOAM531aX/Aw16tDUk766FOtl8Eilou5t03mJMfzp1AyiHWNscXsUkYc
 qHaNSEIDXkqRCDklr2ZI8XfPqhNdHUsGhkGg9jU=
X-Google-Smtp-Source: ABdhPJw7HU4DkkeUrMcak+NpsOXmslOO3+jYmC/8AEojsfZg/P4wKNKY0WLTL5LRBq4hmj1FpqBJPo8pIawzXbM9u3M=
X-Received: by 2002:a37:b484:: with SMTP id
 d126mr23013501qkf.394.1595859645873; 
 Mon, 27 Jul 2020 07:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CAK8P3a3+9Gr6G6KDWu=iW3316O9cPH+XupBBajJaxrq20xQcyQ@mail.gmail.com>
 <20200727141416.GA306745@PWN>
In-Reply-To: <20200727141416.GA306745@PWN>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 16:20:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3qBs8CsAeTqk7aKgdxsfR677sSwaEHR9+V1vn_4RKRbw@mail.gmail.com>
Message-ID: <CAK8P3a3qBs8CsAeTqk7aKgdxsfR677sSwaEHR9+V1vn_4RKRbw@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:MXtL2FieZwoZ71XOirTQEMTFITzyR7u0OCAvXG9DoGSqpftjggX
 h6YFdpyik2m1AUOnogOfufX/y/70mJJ1SBluLeoDXzYlIpI5a71nDa3292e/WRhEQp7wVGo
 ykITexiXX7dI41moaOcUu5XcZNyqLaajIVNXJhK6enxIDbOAxKekzTyhh1Qnoo5OE4ad7Jl
 peHpi6vMwlAjz6YNhlTYQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:45lT7e45CxM=:9HTtS3kWdsnyYai4uPmN/o
 G7vW8YzBSRo3p3+KtLFq+eOtcbvoZWr8ktJZUYxrY49mvDcZMapwlFCW9qkxr+RNvvH212ycj
 9FJ8tF5BHosNuUGFcUN9P3AM+zokh8psoGdNdkDyWmDWWymdrXYCCMPkvynoN2Z0TFonmxlEw
 mXAxl0HgMWOCfV+m5HQBvyfNatcydmvLyEw7mtJ0kRzinunp+SQRGAYzWUw/8HDanAFW8kjqa
 Vnt6DM7PG58tsu/ilN1WXfFTNWgmPZMUkAQByBcAdsB0/qdz/1W7TnvnP0yIPq7gxIP6u30fB
 FwEttmBCXpqzncU/er6Ews/2WQpzlXuOVtgOAYfhs7prXhXEFdvojw6FDyDlfNvNmAw8+wfq7
 bW8KQAmPs5vltmBNxaIibrY6d7mc1TCn7lDEO+jZcPYjbsjdLN6XgPFEj2IC9WoUOWxm2aLYB
 Qm2SBntpkyYfTFtm8vODnfhVjBs+9kiB2yAlhnlFDxgGRqKIy4Ilvdk/rqt39Sop5C2j/eN/y
 MXbFVF6O7LeRytoR7opHeL4YbCI89Q8pCZ7QPt++n6zcT9IpiKDiV9mAfhPswg/1iCtSKERH7
 07lpv/dxWST7Yo7i+0fVO8PbZxWhDVfBkvuZIMjRqyyCalpSaJSrjpSByJD9brje0T2/9F08T
 6KAcMajjBHgFbqCKTaIPL+0J9ot/LgS9XFWikemPpn3q+omU7JZYZKWSZO0aUrg2diLdhN7il
 zRqv5Z/fRdeRvNrdVpRh2GewG1vZWZcG9iwfvAvo+R/LmHcAw/csXgoQqLYMzvTgbv2bkr+22
 x+prodOkmobjWMUvTTwMPl3emCL7bUhkJ6vtYz6YNuBo8hR9N1dJMYZOdrKO2GPoIYFtURaXW
 nrLul3SVcfCCKvq25wwyLVByc1rGhYzCozA3Nk4jvZE1YVYDW3oNsx/IwPAYkP7r7bwLphMry
 rIcxwjwBztnvxmnFrG+rAW248QaEFTxoIX6OmU54yl8UlI7e19UmW
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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

On Mon, Jul 27, 2020 at 4:14 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> On Mon, Jul 27, 2020 at 04:05:38PM +0200, Arnd Bergmann wrote:
> > Peilin Ye, is this something you are interested in fixing for the other drivers
> > as well? I'd be happy to help review any further patches if you Cc me.
>
> Yes, I would like to! I will start from:
>
>         drivers/firewire/core-cdev.c:463
>         drivers/input/misc/uinput.c:743
>
> ...as you mentioned above.

Sounds good, thanks!

     Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
