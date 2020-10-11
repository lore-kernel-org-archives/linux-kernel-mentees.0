Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1EEC433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 19:08:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5AE720776
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 19:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGOJ/SWR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5AE720776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 57D51865D4;
	Sun, 11 Oct 2020 19:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 60Enbe5vMPl9; Sun, 11 Oct 2020 19:08:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C95FA864F4;
	Sun, 11 Oct 2020 19:08:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A730BC0052;
	Sun, 11 Oct 2020 19:08:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0CD2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 89EE82044C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z6C6L58dDTh7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:08:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id CED51203D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 19:08:10 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id d24so16111489lfa.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 12:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GGPf0Ai+cdZzA8pg4bWhAmqLseFTaZSi05u7rjNimbU=;
 b=NGOJ/SWRY4H7gbvG6VzGLMX3GsPv/LWyxJN6wSy0KX5rKiYtswKKK6IDwzpY2gRpqv
 4cQwPMy1BjhPeGkQdiCsGtBwt5AHWBuK1B0yZFSwb/Yn8w/WOSjj8ja8o4d6q4CDKqoJ
 6EdtSXuMetdBIpVEp0DRk8BKUB9q+h+VFiVaX65beZoFfWxJIN1pjUvfy/TznWWkHKud
 XIpUPmacyVBl8QrVkAULFsWe9nUXiCXK9sdMsW66aBQramyBnDgtUaxWTjrqab54Mvcm
 eezM22QunvYG7KqLNE0INkyoYM22fG1rvX+NwsTK9rpO4m5Rh1Nk+mOpUXeFqKN6LfUR
 58yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GGPf0Ai+cdZzA8pg4bWhAmqLseFTaZSi05u7rjNimbU=;
 b=Y6VLzbW0+JJOWcXFm7/ObNm9OG0a1Ad/H64tnDpQNqv+rgXNw9XQy3IvWORqmxCcGQ
 mFr4LDCbceps7EMhtZtxaedyWpU/U5IYhoQab7EXaP7aZaMBw6qZE6PegnMwylj9/kvZ
 Ls33MR1Trf4mqRB3lmzGzN0cgIT+v1lUoszne10vjWAfF1+n/ldWmvrKa/pkhbZ/mV+1
 50R9/UKVJDyJyn3z4fie/P6bXy0/TFSvZWMo6C+kZU62N69W4cXFYG8YoZ3jhPjeomg8
 4bEYf4bhihumTi8DV5Hn4C/xe0o43AgSkek/l375S4DqU1Tcv5lqC8RDJ7QyUU3OCqae
 UA9A==
X-Gm-Message-State: AOAM530geQyEwMzsDY1Y5jVBP5wuV5rVMw7DXmH8niXM+fke5/CLY7ib
 y3n5OV/oEYmjFoX3z+f+ZRVQBnajKwES5W+eCt8=
X-Google-Smtp-Source: ABdhPJyLSLt7KFipNUuTUDAvQzA7yv8F0RnrRzO0D6BvjarI40PRbp8W9O5OGB458/Lsjmxt6IF24FLEgnphbXwq1Wc=
X-Received: by 2002:a19:c68a:: with SMTP id w132mr6710919lff.106.1602443288614; 
 Sun, 11 Oct 2020 12:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201010210929.620244-1-anmol.karan123@gmail.com>
 <20201011095436.06131ff3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201011095436.06131ff3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Anmol karn <anmol.karan123@gmail.com>
Date: Mon, 12 Oct 2020 00:37:56 +0530
Message-ID: <CAC+yH-YgC1r+-J50TFSkK=NvSE0eHiXNkvgVFuLRQq4daeQZJw@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: mkubecek@suse.cz, andrew@lunn.ch, f.fainelli@gmail.com,
 syzbot+9d1389df89299fa368dc@syzkaller.appspotmail.com,
 netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH net] ethtool: strset: Fix out of
 bound read in strset_parse_request()
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

Hello sir,
On Sun, Oct 11, 2020 at 10:24 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Sun, 11 Oct 2020 02:39:29 +0530 Anmol Karn wrote:
> > Flag ``ETHTOOL_A_STRSET_COUNTS_ONLY`` tells the kernel to only return the string
> > counts of the sets, but, when req_info->counts_only tries to read the
> > tb[ETHTOOL_A_STRSET_COUNTS_ONLY] it gets out of bound.
> >
> > - net/ethtool/strset.c
> > The bug seems to trigger in this line:
> >
> > req_info->counts_only = tb[ETHTOOL_A_STRSET_COUNTS_ONLY];
> >
> > Fix it by NULL checking for req_info->counts_only while
> > reading from tb[ETHTOOL_A_STRSET_COUNTS_ONLY].
> >
> > Reported-by: syzbot+9d1389df89299fa368dc@syzkaller.appspotmail.com
> > Link: https://syzkaller.appspot.com/bug?id=730deff8fe9954a5e317924d9acff98d9c64a770
> > Signed-off-by: Anmol Karn <anmol.karan123@gmail.com>
>
> I think the correct fix for this was already applied to net-next as:
>
>  commit db972e532518 ("ethtool: strset: allow ETHTOOL_A_STRSET_COUNTS_ONLY attr")

I am glad that it's fixed now.

Thanks,
Anmol
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
