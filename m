Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DA6C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 16:36:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A7760EBB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 16:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72A7760EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36BF383709;
	Tue,  3 Aug 2021 16:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0OOA3QLaatsk; Tue,  3 Aug 2021 16:36:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5BAE6836F0;
	Tue,  3 Aug 2021 16:36:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 315D3C0010;
	Tue,  3 Aug 2021 16:36:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB452C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 16:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36BE40248
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 16:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQhTuIM7n_SZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 16:36:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8820740171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 16:36:15 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so1450003pji.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 09:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hKcu2om0RBoV5CUDg0ZExWWUpZ8NxEEVfhRYce/bDzs=;
 b=CCOxYfN7lYehPpSoxHCt2Ke4Qa0Gmc8MB0BU15T1aGvtRT8kiR4oEw8lwccjudTFH9
 tUuqLtR5plwVI7qBtV861cuJgkBgukHkO23GF+bFc7VjDeTXiMaXtcH61Jixh2mfId9N
 5R3KWI4P197TGXzDzoIpDOiwiNlbOKwo+TaX6K1vIkWgqE+OxOS9RtFfagNgn1Y3uJsD
 VjX1Y6KZj5py3UF3tLX/HJ+hxmphXpmsNX2qLSLFI+qEuIvdprhtw3z+D+hI5d0d1Bik
 fryvKcGiljwZd9e+T7vAmzaL8USslriWmbnVX9HWCudGeJOtx9J3V7iR1cQMkogwk1Gu
 5VQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hKcu2om0RBoV5CUDg0ZExWWUpZ8NxEEVfhRYce/bDzs=;
 b=LZdRaYXF/tu7c9zZShH8XL9IGdwk57aHEiiGCF9GNShRql37kK9sWygeVuNJy1vP8B
 haqtNDPi6Jp0IWn7+tkpdzrFc/AmxkZdNalb7l1nobuFe5BJ3OkyqC871TNyJmmxjDto
 3YQ4Fj0NcY7PUN6CMXjpFxqjEMPkQ1nwTPUaiK54WwvSQr3zEBYR0JUFsMv7VPO8b2I4
 lR7EI8s6PIv9s+6H7fWJQbrWUrEElTPJI+ZVvJY4nVe361jdxCcNfThr5elqbefpLLQh
 3+g0aAZ0BksJ+0O3aqWvM5i/KG7iZ0NgnMmylxf9MESJ7qHsBXe3i2xIUBGpgiye77+B
 HHfg==
X-Gm-Message-State: AOAM530yv9xRKM0krvK8hBXxRPmWWTyP5v4pYElT1Wb23lI5ada+OLGs
 7z/gplCGsQt8+zyXCwbE09U=
X-Google-Smtp-Source: ABdhPJyfd3MC1IWlCcC7diPPhLu/1e6udyeKLToKtyGwqag+2ZxDPXhkN4T+B2jxdqsVr+CVL3Ssbg==
X-Received: by 2002:a17:903:2444:b029:12c:8eba:fd6a with SMTP id
 l4-20020a1709032444b029012c8ebafd6amr3569964pls.0.1628008574778; 
 Tue, 03 Aug 2021 09:36:14 -0700 (PDT)
Received: from uver-laptop ([2409:4063:4e9f:d030:6444:e218:6d0b:ae0a])
 by smtp.gmail.com with ESMTPSA id r13sm18348219pgi.78.2021.08.03.09.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:36:14 -0700 (PDT)
Date: Tue, 3 Aug 2021 22:06:02 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: Linux Kernel: Checkpatch Documentation Mentorship Tasks
Message-ID: <20210803163602.GA3469@uver-laptop>
References: <20210717064653.GA4873@uver-laptop>
 <CAKXUXMwTs=JoMUFaigLsUmnG3XTs3B1NF+VTsYcQYgTSygWXVA@mail.gmail.com>
 <20210724220630.GA11748@uver-laptop>
 <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Jul 26, 2021 at 12:40:48PM +0200, Lukas Bulwahn wrote:
>
> On Sun, Jul 25, 2021 at 12:06 AM Utkarsh Verma
> <utkarshverma294@gmail.com> wrote:
> >
> > On Sat, Jul 17, 2021 at 09:23:19AM +0200, Lukas Bulwahn wrote:
> > > Get a clone of the Linux kernel repository. The script checkpatch.pl
> > > is under the scripts directory.
> > >

(snip)

> >
> > drivers/usb/serial/iuu_phoenix.c:1191: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > drivers/usb/serial/iuu_phoenix.c:1194: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > drivers/usb/serial/iuu_phoenix.c:1197: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > drivers/usb/serial/iuu_phoenix.c:1201: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> > drivers/usb/serial/iuu_phoenix.c:1205: WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
> >
> > The file permission macros used in the kernel code are defined in
> > <linux/stat.h> like S_IRUGO and friends. But it is better to use their
> > octal equivalent instead, because it easier for Linux users to
> > understand 0444 instead of S_IRUGO.
> >
> > There is no checkpatch documentation for this warning message, but the
> > message is self explanatory.
> >
> 
> Please provide a patch for the checkpatch documentation here. Do you
> find a reference to some coding style guide in the kernel or some
> discussion on the mailing list that stated the preference you wrote
> here?
> 

Yes, Linus suggested the tree-wide conversions for using octal permission.
https://lwn.net/Articles/696229/

(snip)

> 
> Good luck; we are looking forward to your patch series.
> 
> Lukas


Regards,
Utkarsh Verma
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
