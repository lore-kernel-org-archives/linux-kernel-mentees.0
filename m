Return-Path: <SRS0=ws9g=C7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39248C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 06:49:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B0B6239E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 22 Sep 2020 06:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="l9JYVW3U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B0B6239E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C79C885BD5;
	Tue, 22 Sep 2020 06:49:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iz1grsWqccqf; Tue, 22 Sep 2020 06:49:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 88CAC851FB;
	Tue, 22 Sep 2020 06:49:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72223C0859;
	Tue, 22 Sep 2020 06:49:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A47A3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 06:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 934C385AA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 06:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6zqx_rj7Jmk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 06:49:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DF958851FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 22 Sep 2020 06:49:52 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id b13so8949818qvl.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Sep 2020 23:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SLHAP6IosqBz3sFAeXX/g/uswwmtEjUdI1x19+SMA5c=;
 b=l9JYVW3UaZkyRVD1hO0Bw9X1aNvPBrvdjRm3KjcXGu6j0mEv8uSLLScbADnbDcRusZ
 Obrcorv0vPbsI9QDWeKyvDCzyEDTBMVOu5xFfiq+juGAKh+TgiYMm/g3OOcTnAoAD+of
 4wHcUUQEsqr+x3+f520bAOWlEF8kjRVZ4Jbod1b3IHqgST5v1EogdbpTICFJPiL7ZudN
 y78HM3fUUPi4ZHWZbkzQstxqByO1GqdkU14s47rDZcRpKg0oKAGuwmVSxQSHIgbfLziG
 +Ix8JIyUtR4wcCUw5G3WSW37oxm2AmfJZJxHoMsDGSta/aoAoYe6IegW4vCmVyfS4gCT
 QMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SLHAP6IosqBz3sFAeXX/g/uswwmtEjUdI1x19+SMA5c=;
 b=ZO13Fs3W1bI+wJVIR2TcLI08SAPypizx1E0poRG93Re9lvDA9mb4geFxDvaGH2a/9A
 tcqS8xXDdGtdKuD0DxwZViqJIdbxUXBJQvmQne5/TaCxNXT/ldg1A43kjFFcRVV31c1b
 OpFNuY+VhWkzM6HbqkR+d5mfy4M1L3N22V+sOqujC4mX/kJ3aQ29Ez09lTENnChDIXwm
 b8tRlZSF/bF/JF9Txk+8Irgs3r4mEBdu6bWk7t7ul1lxOnm1SMCH7mEQbLmsLkA+ysPZ
 2aqjbaEqzIrb0vuaPNsxtEYd3aKNCUfuYa6fFEKvlhsZDoj0v4WBeq2aDTftDFeg3Pma
 T8CA==
X-Gm-Message-State: AOAM533REO8ftIALTCtxs4FrX0w+2Y3+gvF5KZRvZMOcr9MUMTgIu0qF
 8GZca3qcNafSE9UfxCkRNBh508/35065ns4w+fQfPA==
X-Google-Smtp-Source: ABdhPJzM24GhNT4M6B1P/iysuMWufusCuHXjpcvcOVjDC6z2NLJEmDS22sjTXHTQSESh6Nkb/npU2t9mUDePXvjkwbU=
X-Received: by 2002:ad4:4e33:: with SMTP id dm19mr4311142qvb.47.1600757391695; 
 Mon, 21 Sep 2020 23:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <13659a4e-ad71-0cef-4bfa-3eb4b8c73f4b@gmail.com>
 <000000000000cce55c05afe0f8f0@google.com>
In-Reply-To: <000000000000cce55c05afe0f8f0@google.com>
Date: Tue, 22 Sep 2020 08:49:39 +0200
Message-ID: <CACT4Y+YmbmrH9gCCnCzP-FYa-dKxx9qhKZ+RQxi1f-+Hoj1SUg@mail.gmail.com>
To: syzbot <syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com>
Cc: Brooke Basile <brookebasile@gmail.com>,
 USB list <linux-usb@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] INFO: trying to register non-static key
	in ath9k_htc_rxep
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Sep 22, 2020 at 8:21 AM syzbot
<syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger any issue:
>
> Reported-and-tested-by: syzbot+4d2d56175b934b9a7bf9@syzkaller.appspotmail.com
>
> Tested on:
>
> commit:         98477740 Merge branch 'rcu/urgent' of git://git.kernel.org..
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c523334171d074
> dashboard link: https://syzkaller.appspot.com/bug?extid=4d2d56175b934b9a7bf9
> compiler:       gcc (GCC) 10.1.0-syz 20200507
>
> Note: testing is done by a robot and is best-effort only.

Hi Brooke,

As far as I understand, UBS is currently completely broken on upstream
HEAD, so testing any USB bugs on upstream HEAD will lead to false
positive results only.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
