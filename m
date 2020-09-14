Return-Path: <SRS0=UGpm=CX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D80AC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 18:48:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7D4217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Sep 2020 18:48:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEswu/bU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7D4217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 03F1D86303;
	Mon, 14 Sep 2020 18:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id faHAYDyiMUZK; Mon, 14 Sep 2020 18:48:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D60D86168;
	Mon, 14 Sep 2020 18:48:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96631C0859;
	Mon, 14 Sep 2020 18:48:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5D94C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BDC1986168
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:48:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jr_epUT3ddia
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:48:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 17BB5862A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 18:48:03 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id o68so356761pfg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TktOLUiCsPv+mpZJL8cK/FeOYzPN9P96m1E+94gvEh4=;
 b=MEswu/bUFTxGJFDPMxldk8hQ0jsmnkfS5qZJ/PBH0aTk64MLfaJYlL9OG+4I34brDK
 hQl6RF7aa4miV3MwCE5eAUeCqRB/ehFWklavfjS9RNwbgeaIsM9srsRhK56lRD2pAwzz
 vknoGJFp1oC0va3WMnpHW3tLlSMI0xJyIWKih6QwhZgrDTWqAi2ih0z4Oj0hg2yOHUAc
 5conJYan1tShbiXA9oXc/fhP9LD/BkA78OwMv7IGt76Ityv01jj2K0xD/sz/qV4Bnu4j
 iRqFEw6gCB9/d3Ss8UEKExF26qaKH+4zK+XLxDKYB9tGDVJIeYv+Db8Nbi3hl74pBsZ8
 VOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TktOLUiCsPv+mpZJL8cK/FeOYzPN9P96m1E+94gvEh4=;
 b=tpeixF9RtmnZJun5S8TCl16tp6mLvPUhM0wUjDGxljWWELXzSprNxji5w0nOeubU0X
 oZy9LAKP9XVMrkTjlWL0HVHTObTmFt3wa2H6JWgkf6Akd6nie56YoJZ5Riqq68dXwIcr
 EVblddqshmPU9gHerWAtLePXIvti0LMltHDtqmu92/b1UJ1YvotaD5j7nA/bPg2g/VVr
 5J86OMhrDzzMj2RVsYnVlWDEB6rWABBvMS5kFKRa/iEMpDVgD8hb3r5KEDzCQriVK4u2
 UDfPwXJZ4Jw+VcBxPHQ8tXryI1AriKvZnDnQjcmu7MFPwM23LYHM9oFaFa3ZoC23OHGw
 Py5A==
X-Gm-Message-State: AOAM532EwHC5nvQlP/bzHO89F3vSqB2UvrGYVLt6i5+ni1NiqMGtLVoO
 P52kTCK+Nsl/DVKFornYhMs=
X-Google-Smtp-Source: ABdhPJzDGgyED+yg+ViGJ8weGRDUe/EqhSNYnMw1HrhqNBhRaDr5S8e73DEl593zJ9Qtz7A6vPCckg==
X-Received: by 2002:a62:7bc7:0:b029:138:9430:544e with SMTP id
 w190-20020a627bc70000b02901389430544emr14988012pfc.1.1600109282564; 
 Mon, 14 Sep 2020 11:48:02 -0700 (PDT)
Received: from Thinkpad ([45.118.167.196])
 by smtp.gmail.com with ESMTPSA id j4sm11674416pfd.101.2020.09.14.11.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:48:01 -0700 (PDT)
Date: Tue, 15 Sep 2020 00:17:55 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200914184755.GB213347@Thinkpad>
References: <20200914071724.202365-1-anmol.karan123@gmail.com>
 <20200914110803.GL6583@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914110803.GL6583@casper.infradead.org>
Cc: linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com
Subject: Re: [Linux-kernel-mentees] [PATCH] idr: remove WARN_ON_ONCE() when
 trying to check id
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

On Mon, Sep 14, 2020 at 12:08:03PM +0100, Matthew Wilcox wrote:
> On Mon, Sep 14, 2020 at 12:47:24PM +0530, Anmol Karn wrote:
> > idr_get_next() gives WARN_ON_ONCE() when it gets (id > INT_MAX) true
> > and this happens when syzbot does fuzzing, and that warning is
> > expected, but WARN_ON_ONCE() is not required here and, cecking
> > the condition and returning NULL value would be suffice.
> > 
> > Reference: commit b9959c7a347 ("filldir[64]: remove WARN_ON_ONCE() for bad directory entries")
> > Reported-and-tested-by: syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?extid=f7204dcf3df4bb4ce42c 
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> 
> https://lore.kernel.org/netdev/20200605120037.17427-1-willy@infradead.org/

Hello sir,

I have looked into the patch, and it seems the problem is fixed to the root cause
in this patch, but not yet merged due to some backport issues, so, please ignore 
this patch(sent by me), and please let me know if i can contribute to fixing this 
bug's root cause.

Thanks,
Anmol 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
