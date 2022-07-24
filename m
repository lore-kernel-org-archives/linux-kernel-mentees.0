Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 770B7C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jul 2022 15:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C35A831E3;
	Sun, 24 Jul 2022 15:34:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C35A831E3
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ItTMBXUy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2mH4LsXzVNK; Sun, 24 Jul 2022 15:34:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 014BA82C99;
	Sun, 24 Jul 2022 15:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 014BA82C99
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0188C0035;
	Sun, 24 Jul 2022 15:34:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30A8BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A1C260FDF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:34:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A1C260FDF
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ItTMBXUy
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqBRwsPIALCD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:34:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA8B660FC7
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA8B660FC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 15:34:50 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 23so8241785pgc.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jul 2022 08:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kY/tRvPtpIY39uMgQW5s0cR39F3MzIZzHkDYQEsZMPg=;
 b=ItTMBXUyjPv6HcOb3SYDf5/MdnfdCLXCYcMlD9hAyif1aWdHgQjNUSm+Vg4gae5f3c
 cY8kskWDxUEL/YN8gSs5LIY/H8cGdDAAIdOP9s0U39Fd48Rair8NyuNRb4PouFFpvjnr
 VDdRCQX+3vka+zCu+4I1T+2vozHPT9DSfE7q3G36O0SIotO8t+UfCBCO9uGWu3vSzbRQ
 MPgw16lV9rZ8McW/iCTiPdjI20SULULhSzC1G803i7GZRf91b5Woy1uXXBksmRmRi8HR
 OAwTyuxdSFWsUAdpH52jaWQkeFEoG77491XrCmRSomFN39Jr9ui8BeyReuZrRB9PvNOv
 KVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kY/tRvPtpIY39uMgQW5s0cR39F3MzIZzHkDYQEsZMPg=;
 b=EwGVhgmc7ruD2JyD+gqlrln/YM+HmsuQhvG9cJTE/mFPaq2PLTPX1FWrGmoIOD3upr
 tNTUH2qq1SmIN5520SYwBcrUt8sv21sd/FUhwrFmrp/lbEJgSgNt3WaFCO8Y8H0PDjAk
 ZkxJ7ORLpmPUxorvQmTXI5CF0ekp9m6jrti0BqJzNdNbcrIkO1ExmRUfAzvzXmNgBkPv
 mz6F7uVncqc8OHtwfKG4CYslz2xdDMS0dB+T0u2NwBCHfH7qcaszeYzakWt/uFEk0T9q
 tYCihrRS9B4g3zoJ+ftW7O6qUE4OPeGSu68g/D6d1m2jUiDTLRV1o1LSj9JGu4NHsuLK
 A/tQ==
X-Gm-Message-State: AJIora+NYc714Df1R1Yd7Y3Etiw81d2wmrTRi3oET/mmnsLTQS9h57eG
 JgimPOfCih1WFeRfTBqNZh0=
X-Google-Smtp-Source: AGRyM1s4ibEGj/bxy9JCMRRgG/GYPr2SfsvmWkpxHkjhlxg2LeO+U+TDrVxC101EX/JGLNpP4zPi1w==
X-Received: by 2002:a65:49c5:0:b0:412:6e3e:bd91 with SMTP id
 t5-20020a6549c5000000b004126e3ebd91mr7658428pgs.221.1658676890045; 
 Sun, 24 Jul 2022 08:34:50 -0700 (PDT)
Received: from Negi ([68.181.16.133]) by smtp.gmail.com with ESMTPSA id
 n7-20020a654507000000b0041ab83d39d4sm2794995pgq.0.2022.07.24.08.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jul 2022 08:34:49 -0700 (PDT)
Date: Sun, 24 Jul 2022 08:34:48 -0700
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] ntfs: Ensure $Extend is a directory
Message-ID: <20220724153448.GA2608@Negi>
References: <20220724132107.1163-1-soumya.negi97@gmail.com>
 <Yt1NVQEOC6Ki3eUI@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yt1NVQEOC6Ki3eUI@kroah.com>
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

On Sun, Jul 24, 2022 at 03:47:01PM +0200, Greg KH wrote:
> On Sun, Jul 24, 2022 at 06:21:07AM -0700, Soumya Negi wrote:
> > Fixes Syzbot bug: kernel BUG in ntfs_lookup_inode_by_name
> > https://syzkaller.appspot.com/bug?id=32cf53b48c1846ffc25a185a2e92e170d1a95d71
> > 
> > Check whether $Extend is a directory or not( for NTFS3.0+) while loading
> > system files. If it isn't(as in the case of this bug where the mft record for
> > $Extend contains a regular file), load_system_files() returns false.
> 
> Please wrap your changelog text at 72 columns like your editor asked you
> to when writing this :)

I will correct the changelog(Don't think I can wrap the bug report
link. Checkpatch will still give a warning. Is that okay?).
 
> > Reported-by: syzbot+30b7f850c6d98ea461d2@syzkaller.appspotmail.com
> > Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> 
> What commit caused this problem?  What Fixes: tag should go here?

I don't think this was caused by any specific commit.The $Extend
directory check is not present in any previous releases. Syzbot has
also not been able to produce a cause bisection for the bug. So no fixes
tag(please correct me if I am wrong).

> Should it go to stable kernels?  If so, how far back?

Since the NTFS extension file was new to NTFS 3.0, perhaps the patch 
should apply all the way back to the first release with NTFS3.0 support?
I checked the stable tree history and 2.6.11 is the oldest release I could find.

> > ---
> >  fs/ntfs/super.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/ntfs/super.c b/fs/ntfs/super.c
> > index 5ae8de09b271..18e2902531f9 100644
> > --- a/fs/ntfs/super.c
> > +++ b/fs/ntfs/super.c
> > @@ -2092,10 +2092,15 @@ static bool load_system_files(ntfs_volume *vol)
> >  	// TODO: Initialize security.
> >  	/* Get the extended system files' directory inode. */
> >  	vol->extend_ino = ntfs_iget(sb, FILE_Extend);
> > -	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino)) {
> > +	if (IS_ERR(vol->extend_ino) || is_bad_inode(vol->extend_ino) ||
> > +	    !S_ISDIR(vol->extend_ino->i_mode)) {
> > +		static const char *es1 = "$Extend is not a directory";
> > +		static const char *es2 = "Failed to load $Extend";
> > +		const char *es = !S_ISDIR(vol->extend_ino->i_mode) ? es1 : es2;
> > +
> >  		if (!IS_ERR(vol->extend_ino))
> >  			iput(vol->extend_ino);
> > -		ntfs_error(sb, "Failed to load $Extend.");
> > +		ntfs_error(sb, "%s.", es);
> 
> Are you allowing the system log to be spammed by an untrusted user with
> this change?

The error message is written to the system log while trying to mount 
the file system(which will fail if the error occurs). I don't understand
how an untrusted user will be involved.

> thanks,
> 
> greg k-h

Thanks,
Soumya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
