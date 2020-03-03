Return-Path: <SRS0=4Pq9=4U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE85C3F2C6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 16:10:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A96A215A4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Mar 2020 16:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KCka3Q2w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A96A215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 45C0884BDF;
	Tue,  3 Mar 2020 16:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id weKo1IDdID_O; Tue,  3 Mar 2020 16:10:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3950885D70;
	Tue,  3 Mar 2020 16:10:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22AABC1D89;
	Tue,  3 Mar 2020 16:10:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D59D1C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CB14E20505
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-zYgb65rEf6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:09:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id C31582050A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Mar 2020 16:09:57 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id cx7so1538103pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Mar 2020 08:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PW2q1O1LawBhjKs2T037lJZGZjX7nCN1iWTrJRayolM=;
 b=KCka3Q2wKj2xVhjSXAi8XIkgJ9mhNXB/kTDBT1C1NuPxqIl8xXd6pVByb9ojoZejpw
 8TespAE8VKuf17GKiCRf6WiTmkKqznh4jQbzVppjBC3HK01CGZj/FjZHdhM9sRT7IPKz
 52ALAGynVBSMhGEuE2ueaEumNrG6kvlIlTwrkOAhhr6IpG3iG9iA2vmVnrGZbs7z8LcR
 99WgjY3WQyyqVBwQmWUxjBY+MFbULrzfoy1MpNME4AnJ/5qvU1+LzPfYgY/e/+0HKm+K
 KK7Tx4FruMouiQ9+DhneMzPHoZTM0iuvYfFemkH4JPOPsPYGiM0l1DLAX3J2wzfsnRg8
 XfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PW2q1O1LawBhjKs2T037lJZGZjX7nCN1iWTrJRayolM=;
 b=dIqJX1T6lNzKD09YQKSFGOx7HOaHAV/JoKw5rZgJQplPwUvfXDxEEVZxAKLj9Zn7vk
 iwd0pdgy4du/VF8nWwqjyRZcWvq2Ts6gn6JLo+ljDi6vdRcPBWvvpxuRcGhsNKSoAWLa
 rR6hXiKjgK6++yz2WdV94WlHSN0NNqS0uLLrSU0Ll9EHIPOJuOwFX3nXIh2KJJ8aFFLl
 F873pruK0JPvDjc3JXusxzQ45SkxSvr4lbxAfKPFXl8kdTEPtgKtZVjUaol33AjfoRq3
 IJiVm5gyJx0/npYoXOR2nuIXGBhnyIbCvSzFGtXzqMSns2cjG8p8fST4of6ZDfeAEnfA
 H0BA==
X-Gm-Message-State: ANhLgQ1Xt6zUwj+NHncq1kO0KrcVQ/CTZLMLyCVN7HzTGDMSPwwTbNxq
 Tqe1fITI62PBCWP1GYSMKQ==
X-Google-Smtp-Source: ADFU+vvU5CjB5y9u06eyei85NMjbw5qrIk3jyjI8+yUjUqJ73mj64gxiHt9qRLQ+G4XUWNomDb87UQ==
X-Received: by 2002:a17:90a:aa83:: with SMTP id l3mr4747518pjq.5.1583251797089; 
 Tue, 03 Mar 2020 08:09:57 -0800 (PST)
Received: from madhuparna-HP-Notebook ([112.79.49.138])
 by smtp.gmail.com with ESMTPSA id x65sm12449591pfd.34.2020.03.03.08.09.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Mar 2020 08:09:56 -0800 (PST)
From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
X-Google-Original-From: Madhuparna Bhowmik <change_this_user_name@gmail.com>
Date: Tue, 3 Mar 2020 21:39:06 +0530
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-ID: <20200303160810.GA5486@madhuparna-HP-Notebook>
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
 <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
 <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
 <CAJZ5v0jTSKd_23fJhM+XUmFX_yTjcD+c_s1Jvi3HA1EmXPkzZw@mail.gmail.com>
 <CAEXW_YRL0kum5yVm+9V8i_PK2FcHfPeUOxJKZ+T8P3zqhATxJg@mail.gmail.com>
 <CAD=jOEZ3vdNC4qTMxptaXLjs7i8TCTYjeiv9vXhcapLSkrr9RQ@mail.gmail.com>
 <CAJZ5v0hee4FxeVub_ZkAYn9z8q1_ZLA_AcmTtS-w39VzSe0UxA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hee4FxeVub_ZkAYn9z8q1_ZLA_AcmTtS-w39VzSe0UxA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Len Brown <len.brown@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 1/2] drivers: base: power: main:
 Use built-in RCU list checking
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

On Mon, Mar 02, 2020 at 06:02:21PM +0100, Rafael J. Wysocki wrote:
> On Mon, Mar 2, 2020 at 1:34 PM Madhuparna Bhowmik
> <madhuparnabhowmik10@gmail.com> wrote:
> >
> >
> >
> > On Mon, 2 Mar, 2020, 3:48 AM Joel Fernandes, <joel@joelfernandes.org> wrote:
> >>
> >> On Sun, Mar 1, 2020 at 4:23 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> >> >
> >> > On Sun, Mar 1, 2020 at 9:53 PM <joel@joelfernandes.org> wrote:
> >> > >
> >> > >
> >> > >
> >> > > On March 1, 2020 3:12:53 PM EST, "Rafael J. Wysocki" <rafael@kernel.org> wrote:
> >> > > >On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com> wrote:
> >> > > >>
> >> > > >> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >> > > >>
> >> > > >> This patch passes the cond argument to list_for_each_entry_rcu()
> >> > > >> to fix the following false-positive lockdep warnings:
> >> > > >>
> >> > > >> [  330.302784] =============================
> >> > > >> [  330.302789] WARNING: suspicious RCU usage
> >> > > >> [  330.302796] 5.6.0-rc1+ #5 Not tainted
> >> > > >> [  330.302801] -----------------------------
> >> > > >> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in
> >> > > >non-reader section!!
> >> > > >>
> >> > > >> [  330.303303] =============================
> >> > > >> [  330.303307] WARNING: suspicious RCU usage
> >> > > >> [  330.303311] 5.6.0-rc1+ #5 Not tainted
> >> > > >> [  330.303315] -----------------------------
> >> > > >> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in
> >> > > >non-reader section!!
> >> > > >>
> >> > > >> [  331.934969] =============================
> >> > > >> [  331.934971] WARNING: suspicious RCU usage
> >> > > >> [  331.934973] 5.6.0-rc1+ #5 Not tainted
> >> > > >> [  331.934975] -----------------------------
> >> > > >> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in
> >> > > >non-reader section!!
> >> > > >>
> >> > > >> [  332.467772] WARNING: suspicious RCU usage
> >> > > >> [  332.467775] 5.6.0-rc1+ #5 Not tainted
> >> > > >> [  332.467775] -----------------------------
> >> > > >> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in
> >> > > >non-reader section!!
> >> > > >
> >> > > >I don't see these warnings in the kernels run locally here.
> >> > > >
> >> > > >What do you do to get them?
> >> > > >
> >> > > >Joel, any comments here?
> >> > >
> >> > > You have to enable lockdep in your config. Does your setup have that?
> >> >
> >> > CONFIG_LOCK_DEBUGGING_SUPPORT=y
> >> > CONFIG_PROVE_LOCKING=y
> >> > CONFIG_DEBUG_SPINLOCK=y
> >> > CONFIG_DEBUG_LOCK_ALLOC=y
> >> > CONFIG_LOCKDEP=y
> >>
> >>
> > I had CONFIG_PROVE_RCU_LIST = y and I think these warnings were triggered when I had closed my laptop (like just close without shutting down).
> 
> OK, so let's define a macro for that in this file to avoid code duplication.
> 
> And analogously in the second patch.
>
Sure, I will do it and send the patch soon.

> Thanks!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
