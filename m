Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D552EC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:13:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28A6420B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 09:13:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4V3uOkV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28A6420B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9A8C58797B;
	Wed, 14 Oct 2020 09:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3NDzvndy+Qi4; Wed, 14 Oct 2020 09:13:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F0ED87974;
	Wed, 14 Oct 2020 09:13:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 307C8C07FF;
	Wed, 14 Oct 2020 09:13:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26DCEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1523D8797B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:13:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HuAMsMrcDSMB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E9A9C87974
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 09:13:42 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id d24so2867938lfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 02:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8W+DdcdllhdzPrQ4aAeTSoDRsfN5pPLvwlnvfE5cNM=;
 b=K4V3uOkVOOlSH3Iz9NwSHmsBokXwMdXhtZRgtuTDk1anhIHcFTYwz+3pb5dllYjfic
 9nOWt+aKvWM+QoFGsAArS8l0yHRbTLES0l3hHYw3lEsd1r0U/SMd9TuH2IPm6vuyA1yF
 vG0YlY0JYc6GvdEV+tuQ/QCScYZZ0mesHCu8uwRF7O3cYnN3P8jbAgkEI+tY0vN0y44k
 lPmVBBWX75zxUc3+4VXQ+HdwKUph0eRFAbvfoHoriiilOVYGepE4atkGLKXsTWLguPkk
 8JDXwoEhATDhRMrMR6AkGURxeixqA9Brtd6TpOrfp1cnoMrP1xOolkEvUHXPT6j0Egz+
 J+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8W+DdcdllhdzPrQ4aAeTSoDRsfN5pPLvwlnvfE5cNM=;
 b=UOK2ydvTRnAe9hk8Tdx5gqORiOoYF6t3yS8ge1tDMs5irmLcoPXzfDR0al0hwb/fV1
 FU4WaIVgHRVL4sxOwvN55Z9W9s5Of+OevqMydON+9SKazWyMs90yVn2IjncJELtnLFsg
 JlM1502qG/Hp1x1XfaHxHxdN2u9Q2bZVqU0l0tx7yBGiaivn8sgFetFilYkIWbnfByoh
 ww0RnxqBPiYhHSo7zafI2bz5dLvttJ4QEcVPBg5EQiHmHOhPC+BWS1zKxSOlFsfBPaZ7
 5fsALW66XAE6CTJCwXU+o2qFR6sRvzTOjGhj/jKBIT3GfZRQyHbyM905V7vt0zGAA+Qk
 KOkA==
X-Gm-Message-State: AOAM532zpsm63hlO9A2b/WzKFFwbkAj3Y5p79zDF+iSsBx4yuBLEeSGM
 B0uLw3EXjQ+F1fJmZrhHeDtKDLHciyeM8W8hwQ4=
X-Google-Smtp-Source: ABdhPJwyzjqCmA6X8GpbSzc6pkky32SkG25of+FAKaFZKlf/7ywbP97DAACnMcjIPZibxfY+hvTgFJztmRqELF+lfTw=
X-Received: by 2002:a05:6512:2098:: with SMTP id
 t24mr1173596lfr.116.1602666820882; 
 Wed, 14 Oct 2020 02:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002954fa05b02468d7@google.com>
 <300c32a1-a0de-4f05-b467-0822b3d21733n@googlegroups.com>
 <CACT4Y+bw2EXyKnO6mB3ZKBTWWJ1gd7VMkNvYxD=xwbuRjYwj8g@mail.gmail.com>
 <CAC2o3DKaaxoManhVoFVeB8bLQycPVY8z+ndAVqVaT76vvgzm=Q@mail.gmail.com>
 <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
In-Reply-To: <CACT4Y+ZBPTwvf9gH8JerBQLNCBvRPvXQpvGvDSHD2Y8Tsc91gw@mail.gmail.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Wed, 14 Oct 2020 17:13:29 +0800
Message-ID: <CAC2o3DJus556g6DOtecZB2a8cGJEtF-WrkvrYVj18EPfYHnK3g@mail.gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] KASAN: slab-out-of-bounds Read in
	squashfs_get_id
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

On Wed, Oct 14, 2020 at 4:27 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> Oh, from groups. Yes, that won't work for the kernel. That also
> generated an HTML email, which is generally not welcome on kernel
> mailing lists.
>

Got it! thank you!

If I miss the original email, without using "groups", how can I reply
to the thread??
Apart from manually copying/pasting the content, recipients, and
setting in-reply-to, Is there any convenient way??
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
