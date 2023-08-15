Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E7EC001B0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Aug 2023 20:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 269D241466;
	Tue, 15 Aug 2023 20:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 269D241466
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bmezdNaj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aXdY21lr_kjq; Tue, 15 Aug 2023 20:32:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 09E7C403BE;
	Tue, 15 Aug 2023 20:32:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09E7C403BE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFF83C0072;
	Tue, 15 Aug 2023 20:32:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FA6CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D894C41466
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D894C41466
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZDLCmObw9yt8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:32:45 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9299403BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 20:32:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9299403BE
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bc3d94d40fso49449975ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Aug 2023 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692131565; x=1692736365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=f78QLwWdjf5nhnpij9qeDiPQOcJiRGv74f6b7uyo3QM=;
 b=bmezdNajNttT3ChzGuDLC7xVQG8VnuPBiS7hTHhSDx2dZBp+mtf8hTjMgHlEJ1nxqW
 +u2x8hTxcFBecBDrjCobQCstwic5Wz9dJIYaCCTyddq0WxCMk5PQmMID7gL394UZfsWR
 QKa4RTPkqGUhoKoMHmF7e3gCB8Q5RzYp6kQ3RJN5fce25MrH/FpoJX3AomKsthj6E/i5
 kl5sYag54nRbLgITw11ybwnuNjmoIK2rtIuJeh24FQ9Rb65i5p+18GRsvilq75TTehZm
 AdNNG4KWeoty4fJmEBHYFQvy+SlbIOM/Vfy4PKBY7rUHTcPZeu/pWM4iQ/KymgEl7pAK
 w0zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692131565; x=1692736365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f78QLwWdjf5nhnpij9qeDiPQOcJiRGv74f6b7uyo3QM=;
 b=JyEDZAiNSdlwLJBV1GTTOep7OuTzxEZyXG/ce6mkWWSEhGG5x7B8a1NRLFlmsqBvQ2
 BUJBXR73MLxJg9Ss0d+6DkEQu5iGuExg9n6xRndDUv2rYlUVTPrInuDk2dYIysStqO15
 Lmj5yhnCzCgtLhanZloPr4nUIIfd8ahoO+npgu/+1nK7I4Nekx/Wl6h237xKJCt3ehNj
 /rGfvBaNdql5sXZBK/FkfvroSbG7SRr5f6GzuRUjBn2BVhOlyxuVZcbU6Fq+SZUXRIl9
 +9vMwVTHBLvypRqGHSwJItkQepzfxORidMyUF3CPnz/dFgLDgozOEOZkIR4kCUYHhPbB
 JaaA==
X-Gm-Message-State: AOJu0Yycku875moe2ykzXAIKO8cUsneBtrvEmwYIpfs1Syu6h22BTXtR
 tGfNKW0xq+UauAg7GbgUqvw=
X-Google-Smtp-Source: AGHT+IGvMbrBUd0UeJGvIVkEEz2k+h0uKVNb7GxkO8suDTf/vzzd5R4ANiVYsunoU5o57BAp7b87PQ==
X-Received: by 2002:a17:902:e751:b0:1bc:9651:57c6 with SMTP id
 p17-20020a170902e75100b001bc965157c6mr18632643plf.57.1692131565029; 
 Tue, 15 Aug 2023 13:32:45 -0700 (PDT)
Received: from atom0118 ([2405:201:c009:58e9:db85:3caf:1429:e455])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a17090301c200b001bb97e51ab4sm11489270plh.98.2023.08.15.13.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Aug 2023 13:32:44 -0700 (PDT)
Date: Wed, 16 Aug 2023 02:02:20 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1] drivers: block: Updates return value check
Message-ID: <20230815203220.GA51427@atom0118>
References: <20230806122351.157168-1-atulpant.linux@gmail.com>
 <2023080600-pretext-corporal-61e3@gregkh>
 <20230807114420.GA5826@atom0118>
 <2023080841-preacher-lunchroom-7c8c@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023080841-preacher-lunchroom-7c8c@gregkh>
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

On Tue, Aug 08, 2023 at 10:08:56AM +0200, Greg KH wrote:
> On Mon, Aug 07, 2023 at 05:14:20PM +0530, Atul Kumar Pant wrote:
> > On Sun, Aug 06, 2023 at 03:36:18PM +0200, Greg KH wrote:
> > > On Sun, Aug 06, 2023 at 05:53:51PM +0530, Atul Kumar Pant wrote:
> > > > Updating the check of return value from debugfs_create_dir
> > > > to use IS_ERR.
> > > 
> > > Why?
> > > 
> > > > 
> > > > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > > > ---
> > > >  drivers/block/nbd.c     | 4 ++--
> > > >  drivers/block/pktcdvd.c | 2 +-
> > > >  2 files changed, 3 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > > index 9c35c958f2c8..65ecde3e2a5b 100644
> > > > --- a/drivers/block/nbd.c
> > > > +++ b/drivers/block/nbd.c
> > > > @@ -1666,7 +1666,7 @@ static int nbd_dev_dbg_init(struct nbd_device *nbd)
> > > >  		return -EIO;
> > > >  
> > > >  	dir = debugfs_create_dir(nbd_name(nbd), nbd_dbg_dir);
> > > > -	if (!dir) {
> > > > +	if (IS_ERR(dir)) {
> > > >  		dev_err(nbd_to_dev(nbd), "Failed to create debugfs dir for '%s'\n",
> > > >  			nbd_name(nbd));
> > > >  		return -EIO;
> > > 
> > > This isn't correct, sorry.  Please do not make this change.
> > > 
> > > > @@ -1692,7 +1692,7 @@ static int nbd_dbg_init(void)
> > > >  	struct dentry *dbg_dir;
> > > >  
> > > >  	dbg_dir = debugfs_create_dir("nbd", NULL);
> > > > -	if (!dbg_dir)
> > > > +	if (IS_ERR(dbg_dir))
> > > >  		return -EIO;
> > > 
> > > Again, not corrct.
> > > 
> > > >  	nbd_dbg_dir = dbg_dir;
> > > > diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
> > > > index d5d7884cedd4..69e5a100b3cf 100644
> > > > --- a/drivers/block/pktcdvd.c
> > > > +++ b/drivers/block/pktcdvd.c
> > > > @@ -451,7 +451,7 @@ static void pkt_debugfs_dev_new(struct pktcdvd_device *pd)
> > > >  	if (!pkt_debugfs_root)
> > > >  		return;
> > > >  	pd->dfs_d_root = debugfs_create_dir(pd->name, pkt_debugfs_root);
> > > > -	if (!pd->dfs_d_root)
> > > > +	if (IS_ERR(pd->dfs_d_root))
> > > >  		return;
> > > 
> > > Also not correct.
> > > 
> > > Why check the return value at all?  As this check has always been wrong,
> > > why are you wanting to keep it?
> > 
> >     I'll check the code again. I was not aware that this check is wrong,
> >     so just tried to fix this based on return value of
> >     debugfs_create_dir.
> 
> The return value of debugfs_create_dir() should never need to be checked
> at all.  The value passed in can be later used in any debugfs call
> safely, be it an error or success.  The kernel logic should NOT change
> based on if debugfs is working properly or not.
> 
> So for stuff like this, where the check is obviously wrong (i.e. it's
> never caught an error, it's even more of a good idea to remove the
> check.

	Understood. I'll fix this in a new patch.
> 
> > > 
> > > Also, you never responded to our previous review comments, why not?  To
> > > ignore people is not generally considered a good idea :(
> > 
> >     I might have missed seeing your comments hence I did not reply back.
> >     Please accept my sincere apologies for this.
> 
> Oops, nope, my apologies, this was my fault.  I got you confused with a
> different developer sending patches to the kernel-mentees mailing list
> with the same first name.  I should have checked better, again my fault,
> sorry.
> 
	No worries!

> So all is good with your responses, but you should fix these up to NOT
> check the return value at all.
> 
> thanks,
> 
> greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
