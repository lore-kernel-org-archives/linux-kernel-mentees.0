Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD668C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jul 2022 03:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA9D424BC;
	Thu, 14 Jul 2022 03:55:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EA9D424BC
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iBIU8/Hi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPSTWEL9kxrS; Thu, 14 Jul 2022 03:55:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A3C8A4248B;
	Thu, 14 Jul 2022 03:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C8A4248B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76416C0033;
	Thu, 14 Jul 2022 03:55:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 945ACC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B1140123
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:55:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51B1140123
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iBIU8/Hi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0rrBz6djU4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:55:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED441400CE
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED441400CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jul 2022 03:55:30 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id u13so335271iln.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jul 2022 20:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNyP+5NLoIYdbnOPNtBQI41XzXYGbPB6hlgDygq+CQo=;
 b=iBIU8/Hi3FVeFXM4r+X+Iiek+ikFrHQ3n1wyem5Te+kit8fC1JlOldH0IflUOxt2H1
 AVqU/ZWslS5EyQNy1d6bM2H0+lYCvNr6W8y440Z5tNkyOGlpa7KL0PxargtwnS40smar
 EYHPmWw1N0PX0BI6LvHWfXhmIkPlPWI3wyP3FJfY6irBaq8oGUCjetoOJt6U5GGOMhjL
 QJ8odfQlCGx4INsW1GYDap+xQ5S3247BFNJZRoEzOIr2IJ6Rfgdpb5RmhxbALx2Tqt4y
 7DAFwWDvVJ3GjYLgFNoI6Pfm8y7lt4F8Gds32jdgKfRJUTZUmJVrNaSj80FfjHwMRinK
 OdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNyP+5NLoIYdbnOPNtBQI41XzXYGbPB6hlgDygq+CQo=;
 b=h92TtT5ywS45X/v6fiSPjv9I/LW043MVZuWvDDmr0SqMDS1f3mCJiWdJ2HritO1reF
 MokASwNZYVdLZ4ha5aNGSycxd4uHm8KNffOW755a+OmmgBz8znRzxLXF06o1L+BC5IlN
 DT8R4N9dgOR5EYLH6UJG0wwY0BrR5GeGBgbKsoewexwbvPe5GHtQAN+cOjsh5wt92/VK
 6IY+trZiW607JXhdHjlWCSlcAOG6XyvCpseoQt2yNjFQI2GW5YazBbkxNYdTI+fsBkmR
 EK85zyEyU6Mu0yzPgcIGjYu2oiKmtSeJVwXwAd/OUOMvEeeB8Mq2X9gKqFXwHYgXA2YX
 XT2g==
X-Gm-Message-State: AJIora/VVMQ85HR8rVffbyRZWuEqFtdKFwh5pIw/oQQRghSLVHfJSd7D
 G87vzf48xFfX4zEowu+AvrqpdfqDgmKNpOPW1Jc=
X-Google-Smtp-Source: AGRyM1tP1Lbn5B5LY3qZmXAsZhmPaWNY9k1H11Z+iNNUJ95Sbg3GqIedQmm2sjRFIq0o7rjWv4EtJoi64FFhlcIPqzg=
X-Received: by 2002:a92:b10:0:b0:2dc:e3e:195a with SMTP id
 b16-20020a920b10000000b002dc0e3e195amr3656509ilf.259.1657770929958; 
 Wed, 13 Jul 2022 20:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220713181324.14228-1-khalid.masum.92@gmail.com>
 <20220713115622.25672f01@kernel.org>
In-Reply-To: <20220713115622.25672f01@kernel.org>
From: Khalid Masum <khalid.masum.92@gmail.com>
Date: Thu, 14 Jul 2022 09:55:18 +0600
Message-ID: <CAABMjtG9PDPUm9vrK-Kho7WW+V5h9MmMox1EiLuvfKfiCNp=xw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1][RESEND] Fix KASAN: slab-out-of-bounds Read in
 sk_psock_get
To: Jakub Kicinski <kuba@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Pavel Skripkin <paskripkin@gmail.com>,
 Nikolay Aleksandrov <nikolay@nvidia.com>,
 syzbot+1fa91bcd05206ff8cbb5@syzkaller.appspotmail.com,
 Paolo Abeni <pabeni@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S . Miller" <davem@davemloft.net>,
 Stefano Garzarella <sgarzare@redhat.com>
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

On Thu, Jul 14, 2022 at 12:56 AM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Thu, 14 Jul 2022 00:13:23 +0600 Khalid Masum wrote:
> > Using size of sk_psock as the size for kcm_psock_cache size no longer
> > reproduces the issue. There might be a better way to solve this issue
> > though so I would like to ask for feedback.
> >
> > The patch was sent to the wrong mailing list so resending it. Please
> > ignore the previous one.
>
> What happened to my other off-list feedback?
>
> I pointed you at another solution which was already being discussed -
> does it solve the issue you're fixing?

Yes, this patch solves the issue I am fixing.

thanks,
Khalid Masum
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
