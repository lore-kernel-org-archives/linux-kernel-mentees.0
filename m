Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383ACC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 05:13:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F19F20770
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 05:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWNyXnsb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F19F20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A13808704B;
	Tue, 15 Sep 2020 05:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tFR1wDfs0sSW; Tue, 15 Sep 2020 05:13:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A6418704A;
	Tue, 15 Sep 2020 05:13:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F28F5C0859;
	Tue, 15 Sep 2020 05:13:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A223C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 20FCC854E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id idSIwBbEDv_M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:13:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A525F84C44
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:13:42 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id r19so716285pls.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Sep 2020 22:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yHkFrl3Bv6B6udCbLyaz9Af4oabGh1R3lkIWOhnNv0g=;
 b=ZWNyXnsbLfqzH3w9WKv2LKhpVULHRW2Txv3WiV7qjI6jIw9VVWj1mMWKmPuKLLUZ5p
 phHnhiIbSOy1/+I4h6vw1xC8Wb5PZ227bbpXqsWPQMd0c+aI+psliMJY4TvKvihxNeEg
 39xdUyuo1ac0woG+8AKKXMD5BrKJD4OLJZXkPGO6wKv3Sy0uq2szqnHPrYWnXWh6Fn6/
 GSm3oNbcR53fLjFOvNGgS3ee8pL3peP3lEiFTYjBX51NADHwH/FQvlxDlYKgyXZBSkh6
 kk/4DpHQeH+l8A7jaIW67QzBaBSUqSQ2DqmwWp4hE82tS8APStVQhQrpj6yFZcHs/2yB
 5VRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yHkFrl3Bv6B6udCbLyaz9Af4oabGh1R3lkIWOhnNv0g=;
 b=Ci9Jg7yCEEaeftqQ27+Vr8jeXKCeJKrZ/FsjOnhj8RurfRJ+xlhsp678GuvDwNmiI5
 XG4FgEbW3A+qENlVzTSCr7d6TzpygOVrWQChlkBXDeyjfaCPwwh0vQIb6Bt/SpL/w5+h
 MeXw3JHcfg965e9dmW+GHyA+sGVnBiOszy17VMAzjZdfFO9W6WvwhY5N/pmpK36PMVL+
 8/QS5VBrMW1Eqj6DxKTY2G6G17ch8aNfz79CllXicTavMfgfh+MKViuZN9WZJjJizAAU
 pPrPhJ2LcK4MUc2mBpUKjDsKDwqZ57h5sOM5+5E6tzjp06SgMNdlcyxSEKUr3Hea1JjE
 C1gQ==
X-Gm-Message-State: AOAM532O4g8QCj1pJz6Nid5ZD8r+pOHsUX0aiz6gAtCLrGz87NsYOQC2
 j2UU/QywZPwOFV5hyVagkfk=
X-Google-Smtp-Source: ABdhPJzPRd+YYR2ntFr9sZ2/8C78t45z+RCD4rx7cSP8YZgRl1yztspa+/c0WJuhap130BHzqox0Yg==
X-Received: by 2002:a17:90a:738d:: with SMTP id
 j13mr2524443pjg.114.1600146821965; 
 Mon, 14 Sep 2020 22:13:41 -0700 (PDT)
Received: from Thinkpad ([45.118.167.196])
 by smtp.gmail.com with ESMTPSA id m20sm12270590pfa.115.2020.09.14.22.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 22:13:41 -0700 (PDT)
Date: Tue, 15 Sep 2020 10:43:31 +0530
From: Anmol Karn <anmol.karan123@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200915051331.GA7980@Thinkpad>
References: <20200914071724.202365-1-anmol.karan123@gmail.com>
 <20200914110803.GL6583@casper.infradead.org>
 <20200914184755.GB213347@Thinkpad>
 <20200914192655.GW6583@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914192655.GW6583@casper.infradead.org>
Cc: Necip Fazil Yildiran <necip@google.com>,
 Eric Dumazet <eric.dumazet@gmail.com>, Eric Biggers <ebiggers@google.com>,
 netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-fsdevel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
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

On Mon, Sep 14, 2020 at 08:26:55PM +0100, Matthew Wilcox wrote:
> On Tue, Sep 15, 2020 at 12:17:55AM +0530, Anmol Karn wrote:
> > On Mon, Sep 14, 2020 at 12:08:03PM +0100, Matthew Wilcox wrote:
> > > On Mon, Sep 14, 2020 at 12:47:24PM +0530, Anmol Karn wrote:
> > > > idr_get_next() gives WARN_ON_ONCE() when it gets (id > INT_MAX) true
> > > > and this happens when syzbot does fuzzing, and that warning is
> > > > expected, but WARN_ON_ONCE() is not required here and, cecking
> > > > the condition and returning NULL value would be suffice.
> > > > 
> > > > Reference: commit b9959c7a347 ("filldir[64]: remove WARN_ON_ONCE() for bad directory entries")
> > > > Reported-and-tested-by: syzbot+f7204dcf3df4bb4ce42c@syzkaller.appspotmail.com
> > > > Link: https://syzkaller.appspot.com/bug?extid=f7204dcf3df4bb4ce42c 
> > > > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
> > > 
> > > https://lore.kernel.org/netdev/20200605120037.17427-1-willy@infradead.org/
> > 
> > Hello sir,
> > 
> > I have looked into the patch, and it seems the problem is fixed to the root cause
> > in this patch, but not yet merged due to some backport issues, so, please ignore 
> > this patch(sent by me), and please let me know if i can contribute to fixing this 
> > bug's root cause.
> 
> The root cause is that the network maintainers believe I have a far
> greater interest in the qrtr code than I actually do, and the maintainer
> of the qrtr code is not doing anything.

Hello sir,

I hope the patch will get merged soon.

also, i have tried a patch for this bug

Link: https://syzkaller.appspot.com/bug?extid=3b14b2ed9b3d06dcaa07

can you please guide me little how should i proceede with it, and 
also syzbot tested it.  


Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
