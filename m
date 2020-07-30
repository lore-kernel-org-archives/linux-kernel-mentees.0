Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9066C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 08:15:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAC22074B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 08:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFAC22074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6C3D523109;
	Thu, 30 Jul 2020 08:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0A59NmwTg4F; Thu, 30 Jul 2020 08:15:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 828D620416;
	Thu, 30 Jul 2020 08:15:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68BEEC0050;
	Thu, 30 Jul 2020 08:15:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AFC9C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 535A387D92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfzC6DwzCUbC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:15:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C22A87D65
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:15:45 +0000 (UTC)
Received: from mail-qt1-f178.google.com ([209.85.160.178]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M7bND-1k93wZ0pkj-007zRM for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Jul 2020 10:15:42
 +0200
Received: by mail-qt1-f178.google.com with SMTP id v22so13802593qtq.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 01:15:42 -0700 (PDT)
X-Gm-Message-State: AOAM530rjqElWkClm0+YayMMX7MkYFb7Ojp3NDT7A2GqgAMxht4QI7T+
 j7m3IWQVPxR4BZSDQYRKCVLZqjZNkHSY0+NFY+I=
X-Google-Smtp-Source: ABdhPJy9qE8d6D2vfgEVw6kVbtwQLGW5Rqh6b1z9O7UyiXPqU5prrGsm5t9N2iViOWRfC5+t73qPilDnnD91WD12O3g=
X-Received: by 2002:ac8:5195:: with SMTP id c21mr1813995qtn.304.1596096941108; 
 Thu, 30 Jul 2020 01:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
 <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
In-Reply-To: <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jul 2020 10:15:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
Message-ID: <CAK8P3a1m7C0rGGEHvndhxun2TyFh-cweNnPHp-rDtu7Z=YyUKw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-Provags-ID: V03:K1:RnDqqp2+PgC+fX5ZG0CHuQhdu8DjS68FWEwdOuvZI4jH6G3BGjo
 Fy4AqeSs1MUs8+wuiUk9KiqBIWnyRNIzWK/WWRvdehuaYYdTz9lnPksUAsyThSkiHNyUt33
 gK5NNY03xeg2QsbhKn28X4Wfn2Hh17p4ZXyg7diROBHFuImXD1DqRlMHGe1Nn/X704MFnnB
 07g1oE9Fpds3gy+bDaRKw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+i19WcfOYSI=:2decvDUGA3lFyTtlvj0KNf
 gsdxrsmCHg80hkv73uHCbs/GZ6JKYwrigyrwIzNRs/mEeJVZES2rM8LpK0XYIzmDOz3b+Pwe3
 3YvDchSz9WGyiZzWiovmYVZUhYGToUwXDEIHMgrWCxfe1+xhBKbPKHWRhxV+HxUOhLNff43qn
 v4i188rHKhhwrjgScljN9ynrlTkWa0oYJFjwcUJ99YqALcAUddbrDgJIKBwox7rf7GTDbzysL
 pheRiwD2eIEu/XWZ/50nXd1Hi7fbqjOwW5lZWkwWpneOF8pT/hKrFd/rO8A2SSpcUn0jm35yx
 TIFpLw+SdmCbc8Y9qZe/Pix0/2DzSBrlPwdIaKCvuP8MuCJQTI5N6g6WI3Fd7ZyeTUxFkyf3S
 +pIaasamwmSPc5xSYlv20O8z8qOJHgFjtUngpnwDrHc7ZLv4OGFRaoNHW6hIDlkGLXx/lyRbE
 dsmsguYvrl2CiQGwZStiuBMfQTsd/zPgggvTxmYlS13X3c9f9CTF4aPc6E/j6EzmvSpQyG1n1
 Dkh3c6lTCZH8o+Br/F0er1Ypst7RSjnsQDieRgYf2eQ6fdoQhuh90+2b1E5FbL7yftTKwTWvk
 h86NnTYZoLcAlTqQih6FS6H7nSnQ9Q/dEZE7WFzk25iLD2hGADM7cAuBmGP61yJFLvqWKONad
 vG0w2h9zfUzdqB7WOC1C8nOAY2zBHUdWZHckYI1zEgvLRBa//OkVix0F5cgYzGChOiI91NX1G
 yEFjXiOqw71KrOXUY592yJdLOU6HUqFM7fndZeNdYbyomVcFine3hUUGBpbEN2WWmubR7gvWR
 +gOuIY+cIMubWXE4dA39ecJ3ZWTcMVG9qN6ltguk+0OSJpM6Ga9xS5Qq6z6H2iZqSUPjub9P3
 8vQnSA37qddGYfWKJlKE3TcCqEwjdu/y4tW4ZA6BMMN0OfGRDgQ9ueMFIS9pqj/kWYcS1hDoG
 5rrqGOxf4RP0/knwae/bldzYU/+opJqO59eisODfTbB9jtjlFOkRc
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vandana BN <bnvandana@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>, Peilin Ye <yepeilin.cs@gmail.com>,
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

On Thu, Jul 30, 2020 at 10:07 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jul 28, 2020 at 3:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > Something like
> >
> > static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
> > {
> > #ifdef __x86_64__
> >         /* i386 has no padding after 'id' */
> >         if (in_ia32_syscall()) {
> >                 struct {
> >                         compat_u64      timestamp __packed;
> >                         u32             id;
> >                 } compat_ge = { ge->timestamp, ge->id };
> >
> >                 if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
> >                         return -EFAULT;
> >
> >                 return sizeof(compat_ge);
> >         }
> > #endif
> >
> >         if (copy_to_user(uptr, ge, sizeof(*ge))
> >                 return -EFAULT;
> >
> >         return sizeof(*ge);
> > }
> >
> >        Arnd
>
> Hi Arnd,
>
> Andy actually had a patch for that but since this isn't a regression
> (it never worked), we decided to leave it as it is and get it right in
> v2 API.

I would argue that it needs to be fixed anyway, unless you also want
to remove the v1 interface for native mode. If this works on 32-bit
kernels, on 64-bit kernels with 64-bit user space and on compat
32-bit user space on 64-bit non-x86 architectures, I see no reason
to leave it broken specifically on x86 compat user space. There are
still reasons to use 32-bit x86 user space for low-memory machines
even though native i386 kernels are getting increasingly silly.

     Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
