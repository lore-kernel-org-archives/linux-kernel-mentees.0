Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74421C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 13:49:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471AA208A9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 13:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471AA208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EA0786D5B;
	Thu, 30 Jul 2020 13:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cCgYJwoheFCN; Thu, 30 Jul 2020 13:49:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7F97286D52;
	Thu, 30 Jul 2020 13:49:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA69C004F;
	Thu, 30 Jul 2020 13:49:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5341C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 13:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B116D86D5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 13:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cSdyWEQGYGbi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 13:49:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D4EB86490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 13:49:29 +0000 (UTC)
Received: from mail-qt1-f172.google.com ([209.85.160.172]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M7aqD-1k97Yh1Kqz-0081EV for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Jul 2020 15:49:26
 +0200
Received: by mail-qt1-f172.google.com with SMTP id h21so13947719qtp.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 06:49:25 -0700 (PDT)
X-Gm-Message-State: AOAM530EZQ+w1EtL+tH5/rq8oNe+KNWowu6D4TFg9l3biOQdssUQO9L7
 xr/8xJP6oPabL9eNyxLnxFObDBSticHgUkg0c8w=
X-Google-Smtp-Source: ABdhPJxYt4H9vHzfASu+mtn83yjSQoOpA3J4Tjf50fTb26SWJsSPR5JCjW96j8TGyMZE7WFUEvwkFXswX6oFLGrVaRE=
X-Received: by 2002:aed:2946:: with SMTP id s64mr3072428qtd.204.1596116965004; 
 Thu, 30 Jul 2020 06:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
 <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
 <20200730083833.GD3703480@smile.fi.intel.com>
 <CAK8P3a2i2mnRPZ-f9UNxPNJcjyjdTOA7-fgcMqavsV8Ab17RkQ@mail.gmail.com>
 <20200730114842.GH3703480@smile.fi.intel.com>
In-Reply-To: <20200730114842.GH3703480@smile.fi.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jul 2020 15:49:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2L1yK=XuS5vGj-einsNKU99ZdX53Ao5TUfc7_WU-LOYA@mail.gmail.com>
Message-ID: <CAK8P3a2L1yK=XuS5vGj-einsNKU99ZdX53Ao5TUfc7_WU-LOYA@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:AV1f4aqAuWJl2DAF3Zomb0JjmcPnEe0XE8DHCEoBIjTQYmW2xH/
 gBUbJG05Nr/NB9qPLHwFydO+/VaLBEzFZEUn49dD8iuiW/AHcCKGxt05iPGis96gXrRz7mx
 pCmwrWqRMnSioOOYnS2SHB94iwBhjmZS3jhw4LuDmNJXRAzZpZ2Th2Z8oKHvgolnqEHUBGy
 Bg+ayXfPs10rMLX9S664w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cjPOfQy/Ygc=:L9wA6TK0SlSRe9p6vaBJBs
 vEaVR2UDZXAEray01AsMGNmMfd1h/1wU2prjvVYN/MPhKLz1/nWHnNX0g7PuDw0KPlereW6mj
 dBdiFAL38ew4ZmItyOKYtZVqQEWikF7jZx7dGamjTgccaPKlHNFGYnWhfG2fetoN6PnMfvL4u
 2HK8QKz2ORt3sM5PSmAQKAR4UxFwo73xUchE1PSH1QG5rMU1ta7TzWFfPkesLQPECDnL7EI3k
 sNiiR8a3tNvtQPkwsZP1iSWpez/oA7FICYLGbqXP4/fC0wWqd2DifhQxixFb2NxsphV0Um/pg
 IyN8f5pfcS0Uu6SrFH6Zvui5uSzhUcs5XvVUO63JEiv0OtKQzPztQL7TvZUQR99I/3SFV6gQr
 hipUo2L0XWaD57fAw9Mix0aU1eaVVLwRDu/gIastqs0TeOadS841ob7hMs+Rv9NP2bBKLRKgt
 fngOWWh0iiPxFZ6Z61GTnAFdQh3O/u6VEEOQzhju9uvskINuHehSgrCwytChvfSSqWyW4wEu7
 QXmLu7G3/vO2dUUstWY2BZ5XAS1d1glTddJ+lb4j/rV/nVtTnsN4zF/jzn/k01yugxKlwG/7v
 a9zZLQHnIc+qRiExUll05kI1u384FrrbeZnMWpArkgrog3rIz5aQxLzAw5212bxe6zitHWY5h
 hR/GTx2mS4DiTqF7GuJpfE4VFiYDYYd/O3WOuqKwwWsW1EkPEW+oTWN02n+hBEjXFSXaL6ONA
 GptcLeDzJy6rfeYjxHrcq4mJa9lpOxVpIlN5VJGvoA7yyse98roL9Ul3L5Oks6aPFzeovg/BH
 eCkfgtew6E5p4ckHnZVcxRMVa9PEo7pAwFEy8jIn6r09aD76n38Ley9aAH2SLK+R8b5Qct/
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>,
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

On Thu, Jul 30, 2020 at 1:48 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Jul 30, 2020 at 11:18:04AM +0200, Arnd Bergmann wrote:
> > The in_ia32_syscall() check should be completely reliable in telling whether
> > we are called from read() by an ia32 task or not, and we use the same
> > logic for input_event, which has a similar problem (on all compat architectures,
> > not just x86).
>
> By the way any reason why we have to have in_ia32_syscall() instead of
> in_compat_syscall()?

x86 is the only architecture that has different struct alignment between 32-bit
and 64-bit processes, so others don't have this particular problem. On top of
that, x86 also has two different 32-bit ABIs and only one of them needs the
workaround, while the other (x32) uses the same struct layout as x86-64 and
must use the normal code path.

       Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
