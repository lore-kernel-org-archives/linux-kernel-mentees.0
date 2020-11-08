Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B06C388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 06:47:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1420620719
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 06:47:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CEzxz2qP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1420620719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8C04E20497;
	Sun,  8 Nov 2020 06:47:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 149oekDJ3R1S; Sun,  8 Nov 2020 06:47:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E2460203D5;
	Sun,  8 Nov 2020 06:47:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7691C088B;
	Sun,  8 Nov 2020 06:47:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE678C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 06:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C42B28728B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 06:47:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3PO0Rr8sxOMp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 06:47:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE9E98728A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 06:47:51 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id v4so5398989edi.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 22:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=6VdWXm0Dr/V3vteo9ozFA/B9JFV38RlbQSEIt7pPuaI=;
 b=CEzxz2qPGwjbYlvARcINHZH9jxgIc5VjiTqx+iZDDbIiFBWqgYYOaammzRuhdBxArZ
 vVKrEJkV4QTV4xkaMQBDa3rcxtDO2oi+HdZRuHKq4W5paxkWJPDhygPkrp/2+HKo7Nok
 mAyDjo+lx8nXtgrHp7ox6eiP2MdFLQsLxqaztgtO9MM6B8DQDdb37Ip08KP4OXWlH1jZ
 Iq1ZoNq5PKKRkza3tfDyeA7Nm18LIi3uZ/xq7ygHHgiL4TqkDIpfTEKiGK8HS7cH3ECb
 cz9+Z0uyecPgtaZiuqhADUvssPcmpXMejGSWmSV/aT1x3ljKnwahOKQLLaylrschksW0
 GDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=6VdWXm0Dr/V3vteo9ozFA/B9JFV38RlbQSEIt7pPuaI=;
 b=sLFKy7M4RmmZLJ1dX0t2wlTntlASQMh7pSCxR0WegeF/mxaPZEs3qoafpyAeV0TGe5
 8c5KU8Ae32Np6rqiSqhf+GXJ9l2YLo4ZvNsDKXIjZcCsPFN92VNvpQAO7HMOHth8HK6W
 9YsDJIh02XchtXZJedjWdlp0AGw/z+2XbaWPnUGL407m8NqqQNYCeZBx4447ZwgDGhIG
 MRVlimyzVjMKZqlA6lf2os3XBLgTR+8FkAwWlJYANc0EFimDn3UiqjJj9dM2pu25ylPj
 JLrS0OjE/SqyUOCfXd31GLMdBoemQXnsjWyECJR89gjdjJJKlwGHs3eAVE//XGpej+st
 mbjg==
X-Gm-Message-State: AOAM530acWLYBU1ic93yMSEuXz5Tm4/LQH71bHn7qiHdnxm/SkNRy/nu
 bk+yUeMlvCYLhDwm7O7+4Lc=
X-Google-Smtp-Source: ABdhPJyjsACu09+v35A/zQw+QB8LPTABHGvtEnPy4pRqwd+kN/YJlKwrTXrJPZyMP7LMb3EWDPXpNg==
X-Received: by 2002:a05:6402:1c84:: with SMTP id
 cy4mr9574530edb.382.1604818069877; 
 Sat, 07 Nov 2020 22:47:49 -0800 (PST)
Received: from felia ([2001:16b8:2d34:bd00:5df6:61b:5ed6:df51])
 by smtp.gmail.com with ESMTPSA id ds7sm5225985ejc.83.2020.11.07.22.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 22:47:48 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 8 Nov 2020 07:47:42 +0100 (CET)
X-X-Sender: lukas@felia
To: Aditya <yashsri421@gmail.com>
In-Reply-To: <b8aac750-e460-74ad-674c-a340a1e4f188@gmail.com>
Message-ID: <alpine.DEB.2.21.2011080738040.4909@felia>
References: <20201103151858.25375-1-yashsri421@gmail.com>
 <CAKXUXMzx=UacWsoPyiD5AVtfBpVDCcJpAFMo8OpXrf+KNpBFww@mail.gmail.com>
 <6fca02c0-4c4d-c6bd-67b2-35304cf25499@gmail.com>
 <CAKXUXMygzqgiCm+1SCaA5daO5HkoUXyhXS=QEE2d8GKUO4nypg@mail.gmail.com>
 <b8aac750-e460-74ad-674c-a340a1e4f188@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for
	BAD_SIGN_OFF
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



On Sun, 8 Nov 2020, Aditya wrote:

> On 8/11/20 12:08 am, Lukas Bulwahn wrote:
> > 
> > Can you share the six commits?
> > 
> > Then we check if the fix is really the right fix of if something different
> > is wrong with these commits.
> > 
> 
> 
> These are the commits where this warning for BAD_SIGN_OFF was getting
> triggered(over 4.13..5.8):
> 1) Commit 1d1f898df658 ("rcu: Do RCU GP kthread self-wakeup from
> softirq and interrupt")
> 2) Commit 6e88559470f5 ("Documentation: Add section about CPU
> vulnerabilities for Spectre")
> 3) Commit a35d16905efc ("rcu: Add basic support for kfree_rcu() batching")
> 4) Commit b7e4aadef28f ("locking/spinlocks: Document the semantics of
> spin_is_locked()")
> 5) Commit 621df431b0ac ("Documentation/memory-barriers.txt:
> Cross-reference "tools/memory-model/"")
> 6) Commit 1c27b644c0fd ("Automate memory-barriers.txt; provide
> Linux-kernel memory model")
>

I checked all six cases and think the proposed fix is always okay.

I guess there is still the warning that Co-developed-by: should 
immediately be followed up the Signed-off-by:, right?

A possible fix for that would be to check if the needed Signed-off-by: 
follows somewhere and then just move that to the appropriate place in the 
patch.

When your patch includes this information on how many occurrences, you 
found and that all of the fixes are correct in those cases, this patch is 
ready for lkml and Joe Perches.

Joe will possibly ask to name the six commits, so he can check himself. 
But no need to add them in the commit message or so.

Lukas

> > This certainly needs to be mentioned in the commit message.
> >
> Okay.
> 
> 
> Thanks
> Aditya
> 
> >
> > Lukas
> >
> >
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
