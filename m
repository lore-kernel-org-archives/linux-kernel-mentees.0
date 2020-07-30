Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC7CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 08:07:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6003820809
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 08:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="pE6CSjWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6003820809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 382EB20767;
	Thu, 30 Jul 2020 08:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4gJ216XdlAw; Thu, 30 Jul 2020 08:07:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7D611203D7;
	Thu, 30 Jul 2020 08:07:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59D86C004F;
	Thu, 30 Jul 2020 08:07:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88B15C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7C74D87D0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:07:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MV9a9Z+LoBHn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:07:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 72D4782333
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:07:25 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w12so13722912iom.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 01:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xk9Rc7RW0dpZR2H7aQdCd9x/8Qyf+LufFcyvFMA4TRc=;
 b=pE6CSjWSaGf1LyVds1/RMgYF8RUGn5TZJHXjYS/z/3WaD/zI5X1T9UbxdlEfExt4ww
 fiqw/WQL2m4SbqfCbmmkBHeRQhdJSW9DpRLqk8AR9klNEzDn7/B/DxPU58pcTa/roMhX
 q+NiInRLqX2FCBQqSqR6dwQePoBJg1KF++pHOAaL1fbTI2Pt7YBGj0qEbkSBbQ+gLBVT
 f1wmkKBYvpRYP+sJwr0AaAzhTNcWtqdtQ00XyCegbxhSgtCxlXIZ5LsbRBM4B2/sMoNW
 AIdPy1KUeQ6cltA6WKnQG6UCU/dajwelb3Ze02nd0x9mlUt6DJJGOH8d6VqI6qpXvQHi
 9byg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xk9Rc7RW0dpZR2H7aQdCd9x/8Qyf+LufFcyvFMA4TRc=;
 b=F1//NQtZpWA7z11N/pMVFMWco8V3Zry3ke4cWfGGdTp2IlcKlJQDEztqp+EnHMUgou
 Q9WRX+YrBaZf5AnNm0h1PUgWWgOVT5OHQzTzdx7DMIgpaBT/oFw0s886j0Jn8qpEfYRq
 0b4xvKd/pv68Ogc9gjLCMAtRIzntIFxdqjiH72PBdddHPXQqEeTBhvVaask+XPbebfO2
 9A6QYMuAHABApd4tfcAgiRKPSwE2ui2ZAxhIjJ241sATDNdV0H2yeA4/CYnkPXlw7bKu
 Fl/g5q1PhTwHXEDR+k1xywZ3oD3j7L+pmYZ1yPsfRyVBAuiQUyx9n7d4UN9StzE7Jd5T
 W5bQ==
X-Gm-Message-State: AOAM53303w3tNU8r+Wm/Ic8MRSbG86tU3VO3RHOz0rkg5vdkZ41yncw5
 uNKts8rIjsbUSi7X33fYES+86C6ZVc4ewNs+9mOr/Q==
X-Google-Smtp-Source: ABdhPJxfkHJ3U7r6qBlC/pLcD5o2kytIEOIjvVwTzQ/51wksja7qhQ1JZwpuFNgqoFoF8gdCdxryLyzWjzfDs75oQlc=
X-Received: by 2002:a02:854a:: with SMTP id g68mr2156366jai.24.1596096444677; 
 Thu, 30 Jul 2020 01:07:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam>
 <CACRpkda7k4L+nqAYE6z2FVZF-WT2Pm3CHH_=fW24xz_u+QCMRQ@mail.gmail.com>
 <20200728130632.GI1913@kadam>
 <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3MEUYH3qG-+dxgH1Omx2gtcqSRXzKLLaAw21Xho6HAeQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Jul 2020 10:07:13 +0200
Message-ID: <CAMRc=MciXb152=CHAi1kfpwFuELLN55-BfNOo8hBg8Tzp4wMnQ@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
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

On Tue, Jul 28, 2020 at 3:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 28, 2020 at 3:06 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Tue, Jul 28, 2020 at 02:22:29PM +0200, Linus Walleij wrote:
> > > On Mon, Jul 27, 2020 at 3:17 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > >
> > > > Here are my latest warnings on linux-next from Friday.
> > >
> > > Thanks for sharing this Dan, very interesting findings.
> > >
> > > > drivers/gpio/gpiolib-cdev.c:473 lineevent_read() warn: check that 'ge' doesn't leak information (struct has a hole after 'id')
> > >
> > > We are revamping the ABI for 64bit compatibility so we are now running
> > > pahole on our stuff. I suppose we need to think about mending this old ABI
> > > as well.
> >
> > Yeah...  But this one is a false positive.  It's not super hard for me
> > to silence it actually.  I'll take care of it.  It could be a while
> > before I push this to the public repository though...
>
> The lineevent_read() function still needs to be fixed to support
> 32-bit compat mode on x86, which is independent of the warning.
>
> Something like
>
> static int lineevent_put_data(void __user *uptr, struct gpioevent_data *ge)
> {
> #ifdef __x86_64__
>         /* i386 has no padding after 'id' */
>         if (in_ia32_syscall()) {
>                 struct {
>                         compat_u64      timestamp __packed;
>                         u32             id;
>                 } compat_ge = { ge->timestamp, ge->id };
>
>                 if (copy_to_user(uptr, &compat_ge, sizeof(compat_ge)))
>                         return -EFAULT;
>
>                 return sizeof(compat_ge);
>         }
> #endif
>
>         if (copy_to_user(uptr, ge, sizeof(*ge))
>                 return -EFAULT;
>
>         return sizeof(*ge);
> }
>
>        Arnd

Hi Arnd,

Andy actually had a patch for that but since this isn't a regression
(it never worked), we decided to leave it as it is and get it right in
v2 API.

Bartosz
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
