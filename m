Return-Path: <SRS0=fG7l=4S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EBFC3F2CD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 22:24:51 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 626F924699
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Mar 2020 22:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="f02XpK2e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 626F924699
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3425785477;
	Sun,  1 Mar 2020 22:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xWHC-wUG0xtH; Sun,  1 Mar 2020 22:24:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E99B185465;
	Sun,  1 Mar 2020 22:24:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF86EC07FE;
	Sun,  1 Mar 2020 22:24:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF7F9C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 22:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 994498532E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 22:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njAztKcX0qyo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 22:24:45 +0000 (UTC)
X-Greylist: delayed 00:05:58 by SQLgrey-1.7.6
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
 [209.85.166.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DBF59852CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Mar 2020 22:24:45 +0000 (UTC)
Received: by mail-il1-f196.google.com with SMTP id r4so6295907iln.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Mar 2020 14:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idl6CAZ4ITJuBYPn9L4mQrfqGQ3iPRLrH1VIVeU0Djc=;
 b=f02XpK2ejCZoNah0VS/D/BTPPXjnnwlxaKHbPLZ1gNzdM8WoIRfmLM97gRYrrkNYzb
 /4UEOO6pkK9VGFzE/xMp8jBkDU7yhZBwVQMTYnUPS6N5I0l3ISvaWhDH1glPSAAsCRCS
 8YaVQcO/YyHQfzdaQOdKtLXt4hhcm3zjX+xPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idl6CAZ4ITJuBYPn9L4mQrfqGQ3iPRLrH1VIVeU0Djc=;
 b=NjKOhzso5NlJyFrhTf2OpSBlxFoR20LelNu79ZNAHTaPPW/ScN0dDokiR/aJLcITnn
 OMTFIyOZb3/pdFa3SYTDU1DwPHb1okn6pY/DzLL/ErnxXDJsmJf2hmL5f6WH5gkMOhqI
 raH+2FIdVieVIFcQqmd5ZT2ADHZ+Rb3vbtfA2Rg5bOBhyx7h/V08g49Mg66LJxUiDxf+
 qnPo+NPdLRrx0aNykp3YoQhbEd9CdN8YjV548VBlhuC4JkktxDcybFg8ftrv+zgCt/LP
 xc60VTnxrhpJz9U3yjq3AxA+3lvSkKdf+YJUFP01DN5CwyRtQiDvdUy/UHkPU4NLWbN9
 oClw==
X-Gm-Message-State: APjAAAVHErJxUGzYjX2MsuDiyiQydIBY76F7BvckgU53XYFsPzyGesuX
 Fv7t8b+dbr/Glt1cEuoQknx11EtVcyp6M07fj0InTHXEs84=
X-Google-Smtp-Source: APXvYqwLnS0nfF1/cQS73Q2LPYiqa+EUG8rSDYv9Fre1Q/MkLceZD9/brJKRSb0IQJQPd3q9fUNP9keq8GFm1k6ZCHQ=
X-Received: by 2002:a92:3cd7:: with SMTP id j84mr15067873ilf.176.1583101127203; 
 Sun, 01 Mar 2020 14:18:47 -0800 (PST)
MIME-Version: 1.0
References: <20200228174630.8989-1-madhuparnabhowmik10@gmail.com>
 <CAJZ5v0jhw+cVm=ViiOtZgKr+a1L_PbeVPNXpsPbgghUvMPODSA@mail.gmail.com>
 <C2E57D31-A459-4F5F-8ECF-484FBB26C065@joelfernandes.org>
 <CAJZ5v0jTSKd_23fJhM+XUmFX_yTjcD+c_s1Jvi3HA1EmXPkzZw@mail.gmail.com>
In-Reply-To: <CAJZ5v0jTSKd_23fJhM+XUmFX_yTjcD+c_s1Jvi3HA1EmXPkzZw@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Sun, 1 Mar 2020 17:18:36 -0500
Message-ID: <CAEXW_YRL0kum5yVm+9V8i_PK2FcHfPeUOxJKZ+T8P3zqhATxJg@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <len.brown@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, linux-kernel-mentees@lists.linuxfoundation.org
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

On Sun, Mar 1, 2020 at 4:23 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sun, Mar 1, 2020 at 9:53 PM <joel@joelfernandes.org> wrote:
> >
> >
> >
> > On March 1, 2020 3:12:53 PM EST, "Rafael J. Wysocki" <rafael@kernel.org> wrote:
> > >On Fri, Feb 28, 2020 at 6:47 PM <madhuparnabhowmik10@gmail.com> wrote:
> > >>
> > >> From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
> > >>
> > >> This patch passes the cond argument to list_for_each_entry_rcu()
> > >> to fix the following false-positive lockdep warnings:
> > >>
> > >> [  330.302784] =============================
> > >> [  330.302789] WARNING: suspicious RCU usage
> > >> [  330.302796] 5.6.0-rc1+ #5 Not tainted
> > >> [  330.302801] -----------------------------
> > >> [  330.302808] drivers/base/power/main.c:326 RCU-list traversed in
> > >non-reader section!!
> > >>
> > >> [  330.303303] =============================
> > >> [  330.303307] WARNING: suspicious RCU usage
> > >> [  330.303311] 5.6.0-rc1+ #5 Not tainted
> > >> [  330.303315] -----------------------------
> > >> [  330.303319] drivers/base/power/main.c:1698 RCU-list traversed in
> > >non-reader section!!
> > >>
> > >> [  331.934969] =============================
> > >> [  331.934971] WARNING: suspicious RCU usage
> > >> [  331.934973] 5.6.0-rc1+ #5 Not tainted
> > >> [  331.934975] -----------------------------
> > >> [  331.934977] drivers/base/power/main.c:1238 RCU-list traversed in
> > >non-reader section!!
> > >>
> > >> [  332.467772] WARNING: suspicious RCU usage
> > >> [  332.467775] 5.6.0-rc1+ #5 Not tainted
> > >> [  332.467775] -----------------------------
> > >> [  332.467778] drivers/base/power/main.c:269 RCU-list traversed in
> > >non-reader section!!
> > >
> > >I don't see these warnings in the kernels run locally here.
> > >
> > >What do you do to get them?
> > >
> > >Joel, any comments here?
> >
> > You have to enable lockdep in your config. Does your setup have that?
>
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> CONFIG_PROVE_LOCKING=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y

This should be it. I am not sure what else Madhuparna did to trigger
it. Madhuparna, could you elaborate?

thanks,

 - Joel
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
