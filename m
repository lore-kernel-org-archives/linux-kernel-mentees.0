Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C08C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:17:04 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57002053B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 22:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx4HT5NI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57002053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9A62E21556;
	Sun, 26 Jul 2020 22:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLoq1Uuv3BBs; Sun, 26 Jul 2020 22:17:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 319FD20414;
	Sun, 26 Jul 2020 22:17:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A4A0C0050;
	Sun, 26 Jul 2020 22:17:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A83ECC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9206187D0D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y2jncm6ntYFN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:17:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F03BB87967
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 22:17:01 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u64so13653920qka.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6Po5jgD/fTz0bRHehR/lWSrKrlH1nrDPT2JvC+xllTY=;
 b=Lx4HT5NID57037yokxvkZPUjrE/D90unh+sBukejVAmsIq7RoqYVpY0WwIokIWNyMw
 CQxqKXt8a4bfHf3Sx5qfEvXWUidDR1hAN3RT2jx+5BK4Agb93fzf3HGT9NhxX3zNcIsb
 e+PGMYXqBMEitk7OqxzkbvwEspBjp9c05jbSuOOt9+XREApVDHwwMt4+TNRDK3b+UyWj
 qZ/TQRhsB7llNg+QjqyyNGS3fjrf4IY0J+X1f8TAYSV1vuOI9osOMOZIL+v4x0VDaARz
 akj+B+PvQRRLUURVw5eArC8o7cPVk1CJua7U8tib/CcpGvK5GajxewWWzRv3CY3WlwB0
 1fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Po5jgD/fTz0bRHehR/lWSrKrlH1nrDPT2JvC+xllTY=;
 b=enLFxNgmoyjSjOhBPe4U4sUuTE92Vlb7Z55sb0iu+vZa4waejKHswJHLIeN3G5yFRS
 aVjKyp7zyV1oxe9XMQ4IHfFpwnvMskmtnR6AO+NA31rsmeBfhscawiLBhmceHzwCuA/t
 YT+ebDOt1NCYEWiTw8Jb/uC47RB5hsooLK1SPC9QuPU6e+HAwRk9lLTiwXjmk4tycaEw
 m+5I/VdTFZMnP5S0qJKiripJisGHBqdFWAqXNxgOxlBLDXWn+jrgBo8YNKy4SeU1KqGD
 utBygNFGZYVjFoOB8BGGI4UQcXDl22xtG3jdVPhvDZwQC53rvq9sA05vnGyJpeFy6Asc
 48aQ==
X-Gm-Message-State: AOAM531i6Ss19d2hx4kapO+sKXVUQEL9ECy72r/GT16GXdztHeyuTnD9
 HlTpXdCnh07NuBBosrsB0w==
X-Google-Smtp-Source: ABdhPJycW1/dNpTwFlADTGfxlc4/sQ6jWQQLjQA4Qrfjhby3OJXoi3cgIp6aV4mU43x6Zeo2pFglXw==
X-Received: by 2002:a37:4cd4:: with SMTP id
 z203mr20156401qka.399.1595801821047; 
 Sun, 26 Jul 2020 15:17:01 -0700 (PDT)
Received: from PWN ([209.94.141.207])
 by smtp.gmail.com with ESMTPSA id i65sm1780394qkf.126.2020.07.26.15.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 15:17:00 -0700 (PDT)
Date: Sun, 26 Jul 2020 18:16:58 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <20200726221658.GB102357@PWN>
References: <20200726164439.48973-1-yepeilin.cs@gmail.com>
 <20200726220557.102300-1-yepeilin.cs@gmail.com>
 <20200726221056.GJ28704@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726221056.GJ28704@pendragon.ideasonboard.com>
Cc: Niklas =?iso-8859-1?Q?S=F6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Arnd Bergmann <arnd@arndb.de>,
 syzkaller-bugs@googlegroups.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Vandana BN <bnvandana@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Ezequiel Garcia <ezequiel@collabora.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] media/v4l2-core: Fix
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

On Mon, Jul 27, 2020 at 01:10:56AM +0300, Laurent Pinchart wrote:
> Hi Peilin,
> 
> Thank you for the patch.
> 
> On Sun, Jul 26, 2020 at 06:05:57PM -0400, Peilin Ye wrote:
> > video_put_user() is copying uninitialized stack memory to userspace. Fix
> > it by initializing `ev32` and `vb32` using memset().
> 
> How about mentioning that this is caused by the compiler not
> initializing the holes ? Maybe something along the lines of
> 
> video_put_user() is copying uninitialized stack memory to userspace due
> to the compiler not initializing holes in the structures declared on the
> stack. Fix it by initializing the structures using memset().
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I see, that makes sense. I will send a v3.

Thank you,
Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
