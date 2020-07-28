Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2265EC433EA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:00:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F236220775
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 09:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F236220775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B1E9A2284F;
	Tue, 28 Jul 2020 09:00:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhoufjYmwNVy; Tue, 28 Jul 2020 09:00:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C9A1622849;
	Tue, 28 Jul 2020 09:00:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B166EC0050;
	Tue, 28 Jul 2020 09:00:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34B69C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0625A87E68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B8Tb+WU6tboZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DDBBA87E62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 09:00:36 +0000 (UTC)
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mmhs6-1kgWm740Ry-00jnNn for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Jul 2020 11:00:34
 +0200
Received: by mail-qv1-f50.google.com with SMTP id r19so292040qvw.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 02:00:33 -0700 (PDT)
X-Gm-Message-State: AOAM530dFWL7VNBmWrOGfQz5zNZV+XHxl95J4qOol4jGXmHIGK8dS5h9
 Dm+RNbFcSXlVLiebLqaQsYjX4m7/IywTpYjOooI=
X-Google-Smtp-Source: ABdhPJyHJknGj8GUNL8xLpz4Ao+RH8HsvsNIXL/Mx8WnbEJnfPHwMfS9/LuIY4gTuNauTXnxx9R4Pbevp0lgD1BJOnI=
X-Received: by 2002:a0c:a992:: with SMTP id a18mr25130279qvb.211.1595926832698; 
 Tue, 28 Jul 2020 02:00:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
 <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
 <20200727131608.GD1913@kadam> <20200727220456.GA328887@PWN>
In-Reply-To: <20200727220456.GA328887@PWN>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2020 11:00:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0CcmchionPJQr_4Gdevo8r8ixed7WHSu8MyYvffagqdg@mail.gmail.com>
Message-ID: <CAK8P3a0CcmchionPJQr_4Gdevo8r8ixed7WHSu8MyYvffagqdg@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:Q4+hFudRPv1bDsjjYhPT8FjlZWEEDb8uqfuUZ2/HFwZdZGm5wAh
 Wx7IUYAEtzHwQGjLT8KjOy6aOd9phQR2iauY5EBjLShiO1WupRXNOgIyFpIjs1YEYFl3G5z
 2pt4JR8aqRLn1710QLPXtqE1bHWh9jeBBzGJ9s+Yy5bfe1UEpA4InXcWlNtcDtjRHWxa8qI
 VveK7lkbvp8KeQYLaTEDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZJTogZmsEmc=:rJrLD7B7KMdHPRuhhtaHL/
 Ojfau54F2kO6wZdcMQVpH8Zot2kpRPHzKXvRZoieW9x6iEUqwDNoaen+VE5fcRFDnQPcfech/
 PNWRGVNN0TkOIj1cKrgiUDWPy++gSypZFQsFkx5ThTjj17h6LCNlWtp466SLMvJNG4UoulJmx
 yepK95Nh7KHXVrv4YFhkl25qWrZFU2f4ZHB7EZvi+LSjSFCEQH4Fqx8E3YhCYWMP4Lpt2samf
 uUwF8GjqwL/WqXeG6ZKlXzTykB77G/SNXpuAjAXOWInY7Z5qcqz2ylRrDqxsBGcLf4GIHUOi7
 Y8+qc1WBXzzprX7P8j2ScjAX1uIbeKN1sFsEy8uxLXhO025TlqymZDO0OE64g0tiHbPgeapOS
 Li4yi6YRTN8PAg1aObczNoDO2fjmFlgh7/vJXZ6qodjiPjaRiKGq/HrzMYJbJ6rYRyPRLmN3V
 zp9O3LArJSKpj5gtk+Ii2ThEInBpKDBatbgPCSE5vl1h6ST2ooVFuLA37GBY/RXjsReUWs9QT
 410yA99hOchVeCG3utoKciE40BqD1uRJ+Aw2yfalRbbv2HjLzIEHmK7hHODU8dCwY+jJBM+Pj
 pY+2RhJOnQKo5ZGrALrDcEJVgiYLAI7v1UsUHE+gAwSXqRpPs72UMQYFXpsIN7hfMWW+Vw2d/
 7UAktjvHYYouXn0rPDnK9SlZsIzMWi4FFrl0Ky/ZBXYeoY3bN1gPxDw9PVidZs5ObOlgaPQfH
 TH5wOFruJpmIH2rEyN/0383LGyzjIDfC20az5wcR6K3LFr1bG6tqKq4mut0ZNuc84kK3HylsI
 Y+NQlaSvE9ZRpnSHjRnqVYOg+UAZfpVp/T1+ifPZS6ddIZxJ4V8UJco+qY89PQ0ZBKBD5Nc
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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

On Tue, Jul 28, 2020 at 12:05 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Mon, Jul 27, 2020 at 04:16:08PM +0300, Dan Carpenter wrote:
> > drivers/char/hpet.c:675 hpet_ioctl() warn: check that 'info' doesn't leak information (struct has a hole after 'hi_timer')
>
> This one seems like a false positive.
>
> drivers/char/hpet.c:670:
>
>         mutex_lock(&hpet_mutex);
>         err = hpet_ioctl_common(file->private_data, cmd, arg, &info);
>         mutex_unlock(&hpet_mutex);
>
>         if ((cmd == HPET_INFO) && !err &&
>             (copy_to_user((void __user *)arg, &info, sizeof(info))))
>                 err = -EFAULT;
>
> `info` is only being copied to userspace when `cmd` is `HPET_INFO`.
> However, hpet_ioctl_common() is already doing memset() on `info` in
> `case HPET_INFO`:
>
> drivers/char/hpet.c:612:
>
>         case HPET_INFO:
>                 {
>                         memset(info, 0, sizeof(*info));
>                         ^^^^^^

Yes, makes sense.

      Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
