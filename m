Return-Path: <SRS0=tUVd=BG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4862AC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:25:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A3202070B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 27 Jul 2020 07:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A3202070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 81329203D2;
	Mon, 27 Jul 2020 07:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UnisFyjZnfx1; Mon, 27 Jul 2020 07:25:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DA0820385;
	Mon, 27 Jul 2020 07:25:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BC82C004F;
	Mon, 27 Jul 2020 07:25:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC57DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D9A9888055
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g+us5sdlqC1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:25:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 806E48804A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 07:25:35 +0000 (UTC)
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MTRIi-1kNAmn1UnU-00TnJJ for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Jul 2020 09:25:33
 +0200
Received: by mail-qt1-f169.google.com with SMTP id b25so11505776qto.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jul 2020 00:25:33 -0700 (PDT)
X-Gm-Message-State: AOAM532x4JsbJspaxTl5FQMPkiVHTRkxq9PZ+PL4fgQkV+CqtyXdBgH4
 M67kq4Nkhl+gQT3+iUs/gLlkHgJAAAYgym2aP24=
X-Google-Smtp-Source: ABdhPJwWLr1eTQmOXplkFU6XSrVj3kjpURsSxQSIWVgU+rgY8vc+FCSJgM46ph7HyxcrmOsXIwIa1wuoiXAbMCg8mWw=
X-Received: by 2002:aed:33e7:: with SMTP id v94mr18147736qtd.18.1595834732135; 
 Mon, 27 Jul 2020 00:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726222703.102701-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200726222703.102701-1-yepeilin.cs@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 09:25:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
Message-ID: <CAK8P3a3NB2BVo9fH-Wcinrhhs-QJ=9dK59Ds83TvgLmEkRy3qA@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
X-Provags-ID: V03:K1:0s5eHMXq04fMocP++umqyUbRy7dJr/2DC7t69jEqOsbNHjHr2gF
 bTbZHLM/AFxyixSy6f6Tuz1XYY1S3ptwgLj8LM3RIclwAJ21ZBmUECdVnVM5ibEfTvW9Up4
 ZrLBR5Y66DRQfTmv8OTmiZWRe6bbrUsblR2Kz+Xc3zqanrn+6BUFj+J2g7qZYAAfWgiUfXt
 FZWhzoUgpjQ69hJ/lrPxA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:shXpg5QNoM4=:9Epr4jNMCWSha/Jb2OyOg8
 00KYNyQfOqvppiWef54x44GwnKaoYomSxB/bS17QddSV9d7XGuEG+jFiAN3fKVHKnjJ7/KolV
 r/kscezCf+jlVX7nvzJM/+50Uu8kPLqjz/zI2GkctrVEKA8nV+MNtnv5szTmYAPQKK7vwqMG5
 mVxoH9DU8Bnkprexvmp2xEfbGZtKFGS18IxfWqE94A5WJLOk6bHGNcdJUhkK9sWa2loQETLk5
 71s1o7iMB64Iun1y78Tx7bjAzvNi/rMVBTT0nbldcIAz0ZcIlodVjOame87vqGEsYCuD5Xk1o
 EM/egvDGPGN1V3//Mv+NJ5C9l/MgpZXWYiDOrNboF/vXynRHj7kA615Wm7QnuUmX9g6EqFGQQ
 g94K13U2SXHqWuhFrlk8VKtxMdmdIMSpR5tOrdUbEjr6N1SguZm+W4BUEXtvz0maQRoFjr6+r
 JnXCeMoB0Bom23dsT6l6R0T61SVchM9yu48zOkvjaJ8Icf88sjkIewLQm2L3wtVjLeXPEirOw
 2S4CA+J0FPFirNx+uXVs96UwgZpMeO6PLt2ozfnjOLszsl2Z9GYmZRYOhgfGnCD78QPLiQptq
 DRfo1a1ooZY7hAoCofq7jHgbBUYzxWivTe4LX6HcoGc4iKS6A0qAbgpGY1oc+n+F+ZAzRyh0f
 MlbUZ1QISlFuWF6TwL9Fe4GI7AB5lj7WmebABoDkZqs2trXq/uef7HOdQLduxhKWtEi38mdns
 wUnIZgBkhGq5biWrMGtQIL+SHI6x/xQjmahSRW0FNESPVkYQ1X9te44GL6NU5YTCtdhZFopiS
 8aF1Dw4v7Ow1D8h0PhXVAv1w60tszC1HmhNoJUc27zgYQWwLOrwEgNwVh08D1A9QjsQKx2r9O
 ZvUzNXE6LDcw5BrJKSCyJLG4R7ADHFUDv42KNvo9dzM5Srsh7PucOVoZ8dFj9ctuKF1q8MSUo
 eWhRTJiXq7WhehSGyAllYGTDJYUFhmoqHeBd58xgdtHQI7r2C8qES
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
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

On Mon, Jul 27, 2020 at 12:28 AM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> video_put_user() is copying uninitialized stack memory to userspace due
> to the compiler not initializing holes in the structures declared on the
> stack. Fix it by initializing `ev32` and `vb32` using memset().
>
> Reported-and-tested-by: syzbot+79d751604cb6f29fbf59@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=79d751604cb6f29fbf59
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>

Thanks a lot for addressing this! I now see that I actually created a similar
bugfix for it back in January, but for some reason that got stuck in my
backlog and I never wrote a proper description for it or sent it out to the
list, sorry about that. I would hope we could find a way to have either
the compiler or sparse warn if we copy uninitialized data to user space,
but we now don't even check for that within the kernel any more.

I would suggest adding these tags to the patch, to ensure it gets backported
to stable kernels as needed:

Cc: stable@vger.kernel.org
Fixes: 1a6c0b36dd19 ("media: v4l2-core: fix VIDIOC_DQEVENT for time64 ABI")
Fixes: 577c89b0ce72 ("media: v4l2-core: fix v4l2_buffer handling for
time64 ABI")

In addition to

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
