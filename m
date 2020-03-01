Return-Path: <SRS0=fG7l=4S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B38C3F2D1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 21:23:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7851524680
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 21:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7851524680
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 29BD5834CC;
	Sun,  1 Mar 2020 21:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dG1UhVCWuewq; Sun,  1 Mar 2020 21:23:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B21BB83482;
	Sun,  1 Mar 2020 21:23:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F6E0C1D74;
	Sun,  1 Mar 2020 21:23:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79F4AC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 21:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 642AC83482
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 21:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGqDegHXCcpF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 21:23:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BFA8B83335
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 21:23:18 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id p125so8374162oif.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Mar 2020 13:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g90Jsy31XrppfqU2qdwvAKX4AQi5k+8zFJzl7y6CTO8=;
 b=Iaa6BaZEDDdWidsqDXXflcRP9eV9H7V7/Os78j5zqGKTMQq8ShHrxlKXCSNjI4CErP
 wHyq+RNsPG9PEWToAw5oY38W0UCITTVFrqwp3n8Z6BLLaOGQyCA9jELp4/uOM9oO+cLb
 qiurnzvsXvZu/z7CAOiQMEQmBHjx3a+SlzJr/MR+h/scewxm0JLRubZpSQXSE3QYqbcC
 uIKo9Mp+0nUTQ6aXm01cA15wZdPSbXVfCr3XoFwLaTGnqf1YQ/WKvxDbD5vJY4u/sb4d
 4ucOOUGWg4xaelHdcapY4BGHrcTTGc/JwkfKDXrgmAb/LVOccBT+B57BHmSZ5AqlOM2v
 MVhw==
X-Gm-Message-State: APjAAAVqjh4F7JFEnfrv9+i1nSyyTames0m49pNFZ+NocpHWR8E9/YTE
 0vIyMQyEM7hzMJ6kSIArDllyX9tP+chQwEYeLao=
X-Google-Smtp-Source: APXvYqzcg028OV6MOcUNz9riYTwG1HmNKNDoar9+w8ggrxYqXP3bcp5HMo1s3kEuWmpCdQOlzFaMz3PPlEVbBkxC6jQ=
X-Received: by 2002:aca:ebcf:: with SMTP id j198mr8056491oih.115.1583097798061; 
 Sun, 01 Mar 2020 13:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
 <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
 <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
In-Reply-To: <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Sun, 1 Mar 2020 22:23:07 +0100
Message-ID: <CAJZ5v0jTSKd_23fJhM+XUmFX_yTjcD+c_s1Jvi3HA1EmXPkzZw@mail.gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: Len Brown <len.brown@intel.com>, paulmck@kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 madhuparnabhowmik10@gmail.com, Pavel Machek <pavel@ucw.cz>,
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

On Sun, Mar 1, 2020 at 9:53 PM <joel@joelfernandes.org> wrote:
>
>
>
> On March 1, 2020 3:12:53 PM EST, "Rafael J. Wysocki" <rafael@kernel.org> wrote:
> >On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com> wrote:
> >>
> >> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> >>
> >> This patch passes the cond argument to list_for_each_entry_rcu()
> >> to fix the following false-positive lockdep warnings:
> >>
> >> [  330.302784] =============================
> >> [  330.302789] WARNING: suspicious RCU usage
> >> [  330.302796] 5.6.0-rc1+ #5 Not tainted
> >> [  330.302801] -----------------------------
> >> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in
> >non-reader section!!
> >>
> >> [  330.303303] =============================
> >> [  330.303307] WARNING: suspicious RCU usage
> >> [  330.303311] 5.6.0-rc1+ #5 Not tainted
> >> [  330.303315] -----------------------------
> >> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in
> >non-reader section!!
> >>
> >> [  331.934969] =============================
> >> [  331.934971] WARNING: suspicious RCU usage
> >> [  331.934973] 5.6.0-rc1+ #5 Not tainted
> >> [  331.934975] -----------------------------
> >> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in
> >non-reader section!!
> >>
> >> [  332.467772] WARNING: suspicious RCU usage
> >> [  332.467775] 5.6.0-rc1+ #5 Not tainted
> >> [  332.467775] -----------------------------
> >> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in
> >non-reader section!!
> >
> >I don't see these warnings in the kernels run locally here.
> >
> >What do you do to get them?
> >
> >Joel, any comments here?
>
> You have to enable lockdep in your config. Does your setup have that?

CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y

Anything else?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
