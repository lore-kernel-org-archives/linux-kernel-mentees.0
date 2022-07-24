Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A23C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 22:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADC7C4174A;
	Sun, 24 Jul 2022 22:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADC7C4174A
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qvl4zc2v
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xfZnemaG8whl; Sun, 24 Jul 2022 22:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7A9B3415DC;
	Sun, 24 Jul 2022 22:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A9B3415DC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FAECC0033;
	Sun, 24 Jul 2022 22:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD3B5C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 22:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7934882AED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 22:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7934882AED
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Qvl4zc2v
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5Og3FPiuGrf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 22:17:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F32082ACA
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F32082ACA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 22:17:48 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id b10so8749064pjq.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TUqDJbKLgOrxeIK66AdtU2xlhyRBbEM5JPtjgrE7Gvo=;
 b=Qvl4zc2vdY7VOhBEZeh/tajiq3s8kDwrJvuu29nuvlN/UEnct+cTCsAoqBHYj3xgtn
 /Jfx3C/5kj3oXxNRSE7FiqQL3z6ldW71GyU87RBcAqLJ8MDFJUCt1Blu5FmiGVSmgPNO
 i+IOs+qucoURknEKoI/FtEkUrA+HqyuLx6NwuCKT1uJ9m/45i3ccx50742Yqxw5AjJyo
 YNVvBETSNseRPBs9YSWCfhNoG19mAILOWHeyxP1R5LuReIuJH+dRG7NXlrQI6LpYnTR1
 ES7t1GeabwJcMfg0qX+s7os1vRzlo4Q3XHefhkLXAeGt2pn301zMmhINOjW+oYFZjvZD
 qqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TUqDJbKLgOrxeIK66AdtU2xlhyRBbEM5JPtjgrE7Gvo=;
 b=kRtwtpPjCPBTFl8xTwzuJUs/b5pW2Mkap8RBIdKE2O5T9fSVYx2VJi6O8oZuNBchEA
 K4meR0AaE7RympOWva+BnQ/wIXparmtjIltZAJgJq7XH6FXgE782a2JfBUjptj6sXFd2
 XZScMCbbaJxB5N2JGeZpFCRTUPoQFeUa95dSThqwqNaeArGfbdNbQ8HkJzmyHuUrW3O6
 8C8xdhgie3aW35YlrheydVNnUD41qotpSeBK76wMpGBzh5XUOYcrAUFeknmaetE0siuA
 ZfhJdnXx+IviK+ViaEN+4xhsWTLz/tTqyFRp96FSoPp0yRCDvpQZ8OhwOvyjAn2KPmjQ
 ePLw==
X-Gm-Message-State: AJIora9zJTTkK99UkveyoPLQHtgww14s184/2jXZvYIN+xjRJmqV6Xs7
 DBaFdgSdNi5WHgbopmREohM=
X-Google-Smtp-Source: AGRyM1twdRgLTKQNbvpjNi3Gx6v3vLpNlLbQV7INoQFdw1GYzVamdyrmforpu+7k9gtAswRnIP1DOA==
X-Received: by 2002:a17:902:b60d:b0:16b:e832:7295 with SMTP id
 b13-20020a170902b60d00b0016be8327295mr9335775pls.144.1658701067767; 
 Sun, 24 Jul 2022 15:17:47 -0700 (PDT)
Received: from Negi ([68.181.16.133]) by smtp.gmail.com with ESMTPSA id
 186-20020a6214c3000000b00525496442ccsm4024844pfu.216.2022.07.24.15.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 15:17:47 -0700 (PDT)
Date: Sun, 24 Jul 2022 15:17:45 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ntfs: Ensure $Extend is a directory
Message-ID: <20220724221745.GB2608@Negi>
References: <20220724132107.1163-1-soumya.negi97@gmail.com>
 <Yt1NVQEOC6Ki3eUI@kroah.com> <20220724153448.GA2608@Negi>
 <Yt1rQ8Ft5klOOENg@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yt1rQ8Ft5klOOENg@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-ntfs-dev@lists.sourceforge.net,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Anton Altaparmakov <anton@tuxera.com>
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

On Sun, Jul 24, 2022 at 05:54:43PM +0200, Greg KH wrote:
> On Sun, Jul 24, 2022 at 08:34:48AM -0700, Soumya Negi wrote:
> > On Sun, Jul 24, 2022 at 03:47:01PM +0200, Greg KH wrote:
> > > On Sun, Jul 24, 2022 at 06:21:07AM -0700, Soumya Negi wrote:
> > > > Fixes Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> > > > https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> > > > 
> > > > Check whether $Extend is a directory or not( for NTFS3.0+) while loading
> > > > system files. If it isn't(as in the case of this bug where the mft record for
> > > > $Extend contains a regular file), load_system_files() returns false.
> > > 
> > > Please wrap your changelog text at 72 columns like your editor asked you
> > > to when writing this :)
> > 
> > I will correct the changelog(Don't think I can wrap the bug report
> > link. Checkpatch will still give a warning. Is that okay?).
> 
> Yes, do not wrap links.
> 
> > > > Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> > > > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> > > 
> > > What commit caused this problem?  What Fixes: tag should go here?
> > 
> > I don't think this was caused by any specific commit.The $Extend
> > directory check is not present in any previous releases. Syzbot has
> > also not been able to produce a cause bisection for the bug. So no fixes
> > tag(please correct me if I am wrong).
> > 
> > > Should it go to stable kernels?  If so, how far back?
> > 
> > Since the NTFS extension file was new to NTFS 3.0, perhaps the patch 
> > should apply all the way back to the first release with NTFS3.0 support?

> Yes, mark it there.

Thanks. I will send v2 of the patch. Just want to make sure that the
patch will apply to 2.6.11.y before marking it.

-Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
