Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA9EB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Aug 2023 11:44:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C67C6402BD;
	Mon,  7 Aug 2023 11:44:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C67C6402BD
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FZAQ6U1Y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ez6Sd4uc44Tq; Mon,  7 Aug 2023 11:44:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E313D40291;
	Mon,  7 Aug 2023 11:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E313D40291
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B91ADC0072;
	Mon,  7 Aug 2023 11:44:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD2F2C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 11:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B3C740227
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 11:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B3C740227
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=FZAQ6U1Y
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id daY1VBtMSTp4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 11:44:29 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD42940003
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Aug 2023 11:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD42940003
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68783b2e40bso2927523b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Aug 2023 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691408668; x=1692013468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QOkIol4hR/7Xp5+ZchryLNdE6H11vBt5X3cu3NIuMdw=;
 b=FZAQ6U1Y1GJmYiveH7OoBA/d7SuG2Q4mQa2C8A1p3nqxsUUDi2IaX+mreRbkwecRrX
 mpP9EjkIjcP2hq912NLJVLbR9VXO95Hi8xZACAHBwHdzzqKz2TP5YGL8FyHeflnoBits
 AVcu07vz4ZL/ic0U+wtaGmULdMLRNZf6uu7zc7M3nnGoZafTulK0YVm3C2WytdT+VFN0
 ZUUuS56gkObDy7l8rYRQWv50WoGQep0LUDw3Kk81Z1WR1qT8NbB3D+g9cMlkzSyvHpFF
 6q19Xh/FpWgJXoEAwXFFMb09rsveZujIWSEtwhrWZJcVFvgh+Y252O04PsVGtQITuev5
 8EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691408668; x=1692013468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QOkIol4hR/7Xp5+ZchryLNdE6H11vBt5X3cu3NIuMdw=;
 b=i/cB4WH3NAkWbQQ7ESvH2DoF/rZZ4Wdw3fcvvKrg5bVh4RV67qjcPB6QMkt1yfpJVH
 OimruXzxCTfu3r9vNT6AwZCpCSLQrk6TqkcUOFY+yFaTeqOVlxbMFaksC7WlebZGfPb3
 AccAPM+AsSesBcMvWJbE7zFdu9LrTq0+d6Ed0ti3XZlHMTEzdYdvj6nY9g4nli1ru2X+
 UDswuSC/gc8WGKtcacUt8d/p/y04d0jxqIf17qt5pBdpxGTQKcu+OA7AeILAAG7PStj0
 N3BMfmhynPtGkIQR0+kWvSR8kWBRhxx9z0WvWybS/5j3l7fxB97M4XYu5Cir+tiTQXYa
 xJ/w==
X-Gm-Message-State: AOJu0YwYsSKpzZPROfhpJAuHbnCfOQg/rU+ImRr3vPbX53VyDf4fK3RJ
 uDxBJZ32KNgcN0PfDGhFnYg=
X-Google-Smtp-Source: AGHT+IG4wOGScrDd781Ew8BOJkUd67naeJwhj+rXjQM3v/SE7uDYrg2SNYLgg04stiJNcFMGbZ/jMw==
X-Received: by 2002:a05:6a00:24c4:b0:682:4b93:a4d3 with SMTP id
 d4-20020a056a0024c400b006824b93a4d3mr9204926pfv.1.1691408667970; 
 Mon, 07 Aug 2023 04:44:27 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:4d3a:892b:8e74:8cec])
 by smtp.gmail.com with ESMTPSA id
 z22-20020aa791d6000000b006875493da1fsm6193034pfa.10.2023.08.07.04.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:44:27 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:14:20 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <20230807114420.GA5826@atom0118>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
 <2023080600-pretext-corporal-61e3@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023080600-pretext-corporal-61e3@gregkh>
Cc: axboe@kernel.dk, linux-kernel-mentees@lists.linuxfoundation.org,
 josef@toxicpanda.com, nbd@other.debian.org, linux-block@vger.kernel.org,
 shuah@kernel.org
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

On Sun, Aug 06, 2023 at 03:36:18PM +0200, Greg KH wrote:
> On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> > Updating the check of return value from debugfs_create_dir
> > to use IS_ERR.
> 
> Why?
> 
> > 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >  drivers/block/nbd.c     | 4 ++--
> >  drivers/block/pktcdvd.c | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 9c35c958f2c8..65ecde3e2a5b 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
> >  		return -EIO;
> >  
> >  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> > -	if (!dir) {
> > +	if (IS_ERR(dir)) {
> >  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
> >  			nbd_name(nbd));
> >  		return -EIO;
> 
> This isn't correct, sorry.  Please do not make this change.
> 
> > @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
> >  	struct dentry *dbg_dir;
> >  
> >  	dbg_dir = debugfs_create_dir("nbd", NULL);
> > -	if (!dbg_dir)
> > +	if (IS_ERR(dbg_dir))
> >  		return -EIO;
> 
> Again, not corrct.
> 
> >  	nbd_dbg_dir = dbg_dir;
> > diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> > index d5d7884cedd4..69e5a100b3cf 100644
> > --- a/drivers/block/pktcdvd.c
> > +++ b/drivers/block/pktcdvd.c
> > @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
> >  	if (!pkt_debugfs_root)
> >  		return;
> >  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> > -	if (!pd->dfs_d_root)
> > +	if (IS_ERR(pd->dfs_d_root))
> >  		return;
> 
> Also not correct.
> 
> Why check the return value at all?  As this check has always been wrong,
> why are you wanting to keep it?

    I'll check the code again. I was not aware that this check is wrong,
    so just tried to fix this based on return value of
    debugfs_create_dir.

> 
> Also, you never responded to our previous review comments, why not?  To
> ignore people is not generally considered a good idea :(

    I might have missed seeing your comments hence I did not reply back.
    Please accept my sincere apologies for this.
    I have one confusion though, regarding the comments that you are
    referring to. Are you mentioning about this patch? Re: [PATCH v5] selftests: rtc: Improve rtctest error handling
    Here I got the following response from your email bot -
    Patch submitter, please ignore Markus's suggestion; you do not need to follow it at all.

    Maybe I misunderstood this comment and hence did not reply/do
    anything in response to Markus's comments.
    If you were referring to some other patch then if possible, can you please tell me the
    suject of the patch? I will reply to your comments and will make the
    fixes accordingly.

> 
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
