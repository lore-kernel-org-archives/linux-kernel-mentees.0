Return-Path: <SRS0=//YW=BW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16571C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 20:24:35 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D65D0206DA
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Aug 2020 20:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n0hmcigv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D65D0206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9CBF724074;
	Wed, 12 Aug 2020 20:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYebMF6wT2Iw; Wed, 12 Aug 2020 20:24:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 922FD1FD43;
	Wed, 12 Aug 2020 20:24:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7625AC013C;
	Wed, 12 Aug 2020 20:24:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B0A8C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5AA8886A61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:24:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHdWN518507T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:24:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A1F1886A57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 20:24:28 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id s16so2573795qtn.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Aug 2020 13:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0JwWTfgMUWwOG2VdFhmTHy70OqTVhWrEaTFFUPlZs44=;
 b=n0hmcigv9AKqbYE9d8oRnL6p+38s8wXErBjMvc7vQCCJBe0VpT63Gr69kEk1wj3ME0
 yOLvVHPCf2J/EXKXQf27oneydYsig124HqHtDulBSQ3+9KbNxXJnISSupJZUzu5ipGTz
 Jnamunb7x2te6cWrDnOuw4sYtQ/YHYliT7mbida19VNs+QhkdUpLc8lPl3/ovy4AEYZ+
 GPMqn5623Xp6d229Y9HVwiYkDjkHZqfJd2Egs8/WlWKnZ1qD22FTrBFTc3eVsEZUYgdp
 li4oC3tz6AFGDf5YVoeDmCzoJZbr4KtogcOQL7d7vncFD9WmwUYs8jgx/eGt5JHb8XEr
 +BNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0JwWTfgMUWwOG2VdFhmTHy70OqTVhWrEaTFFUPlZs44=;
 b=Q9o4MmvO8tGKc5lfXnEuI/WKRpuWMXSe+g1pPEr04GxHFTwaP0B6VFeWGJ6gUzWEnq
 9e9KaohLOrPUpDXmLGfl+gElnSKfbbBtEKgAjH9/6zPMlzHdsIWrJsGJczQCzTYBOCzK
 cMquyb9Zdfaj/8Vbmd6iHdR8Ian12MB9CemZDTnl7IQhBIu9vCXo5yR0UFI4XU+WzOj+
 Yeebj/Y7bAGAOHhKBN3Lz89YEWMKmp88QYzsidn8EKds/dpgB/yOVtv9YT1VKwPHLIR1
 Omsu8hIp2ASrvkUt0VP6/9t/hgPz1MCaPhER3ZLDPK1z/FMH3FuCtT/GJ+kX06/mKRYx
 +v0g==
X-Gm-Message-State: AOAM530Mflf5JrMVV2d1W1Z2JWQ62LgJLuKadaJNDTwRKD7cfQJUrW2h
 yJRaFFAIq5Esxk2qeqgwFL8=
X-Google-Smtp-Source: ABdhPJxJeb9hHRLR88ZwXWiK4lyhVLzEuiWoV1JjpAi3EfuC1RgnZ8DUMsG4RsxsCQcL7hfoXHpeJg==
X-Received: by 2002:ac8:7606:: with SMTP id t6mr1585661qtq.348.1597263867572; 
 Wed, 12 Aug 2020 13:24:27 -0700 (PDT)
Received: from eaf ([190.19.79.86])
 by smtp.gmail.com with ESMTPSA id g136sm3324516qke.82.2020.08.12.13.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 13:24:26 -0700 (PDT)
Date: Wed, 12 Aug 2020 17:24:20 -0300
From: Ernesto =?utf-8?Q?A=2E_Fern=C3=A1ndez?= <ernesto.mnd.fernandez@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20200812202420.GA5873@eaf>
References: <20200812065556.869508-1-yepeilin.cs@gmail.com>
 <20200812070827.GA1304640@kroah.com> <20200812071306.GA869606@PWN>
 <20200812085904.GA16441@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812085904.GA16441@kadam>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] hfs,
 hfsplus: Fix NULL pointer dereference in hfs_find_init()
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

Hi,

On Wed, Aug 12, 2020 at 11:59:04AM +0300, Dan Carpenter wrote:
> Yeah, the patch doesn't work at all.  I looked at one call tree and it
> is:
> 
> hfs_mdb_get() tries to allocate HFS_SB(sb)->ext_tree.
> 
> 	HFS_SB(sb)->ext_tree = hfs_btree_open(sb, HFS_EXT_CNID, hfs_ext_keycmp);
>                     ^^^^^^^^
> 
> hfs_btree_open() calls page = read_mapping_page(mapping, 0, NULL);
> read_mapping_page() calls mapping->a_ops->readpage() which leads to
> hfs_readpage() which leads to hfs_ext_read_extent() which calls
> res = hfs_find_init(HFS_SB(inode->i_sb)->ext_tree, &fd);
>                                          ^^^^^^^^
> 
> So we need ->ext_tree to be non-NULL before we can set ->ext_tree to be
> non-NULL...  :/

For HFS+, the first 8 extents for a file are kept inside its own fork data
structure, not in the extent tree. So, in normal operation, you don't need
to search the extent tree to find the first page of the extent tree itself.
The HFS layout is different, but it should work the same way.

Of course this sort of thing can still be triggered by crafted filesystems.
If that's what the reproducer is about, I think just returning an error is
reasonable. But these modules will never be safe against attacks such as
this.

> I wonder how long this has been broken and if we should just delete the
> AFS file system.
> 
> regards,
> dan carpenter
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
