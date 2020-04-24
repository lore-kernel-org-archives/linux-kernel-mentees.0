Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEBAC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 15:14:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37932206D7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 15:14:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mB1CGCWS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37932206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FC7C88619;
	Fri, 24 Apr 2020 15:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2D9suIL91zqN; Fri, 24 Apr 2020 15:14:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAD30885FD;
	Fri, 24 Apr 2020 15:14:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2235C089E;
	Fri, 24 Apr 2020 15:14:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2468C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A0ADF20433
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nZ0F0YGtGGWo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:14:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id E91E2203F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:14:36 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id c16so9593621ilr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDHglrQaEHhtVoVxNXkS9kUtQ6w2T8OTXMo/6NvzOgc=;
 b=mB1CGCWSgFFT2pYK90bnjClX9pIrRHMdtUYk+WFet6PNkox+SfL2Ci8fahir0y1dV6
 d4aR16jH3cMQ1yjahvzsGyJOlot0X86H9r2uafHd+hqcH1HTlq8cAoh6rEdk+bJPzO7v
 HB6Dlx6J5OhML24A8lPMwX0MJoEd0fdOFpqVkhnt9CdFqpLTzNsrDEysk5Phhr7TqDLH
 VhoJQlCxON9V6krl2zrO+xAOo2QRGghuvpfJ2LS7pXhIYwynNSPFJvxHZkx/9qkC6pUs
 ST5ULGqjQblkSwj+7yoFBvJUXmvuEnOiNljesZBEFjpiRwVxxNs5G191z3kB6lTOJGgv
 GEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDHglrQaEHhtVoVxNXkS9kUtQ6w2T8OTXMo/6NvzOgc=;
 b=G090c1sb25kqAnVhHMFx5NNUGKOd1I2wZYLIf0sxNlte0LpxLrd+2NEXwDtWaEo0fq
 7/+Qrz8DhafC4eKH1xtgO6nzkLtLfgqf0/GRkE8U5nII5Jjcls0FlWzj+SojMH9UOAGU
 CghmpNsV3gOJjHSNUyEhPHS5pzynWzGQtgaNa/yuFnknoYM6ptauA8gAFK+Lle0Oxld0
 wDH1UB+eTdkndpTEZz9QfmwxHshW+ZieonftnVsePUtmcVsdcHoYaRoPUr83VWW6+o9H
 +pLNADWH95/sVHg7H0k9rO2ByrtCTXgfEhyg55udbz6JqWrGX11M36ieDbWaDn07DP/Q
 l3hw==
X-Gm-Message-State: AGi0PuZowK+qMCsOHGQEaLGQdxDrdGKCgt1soA14HG7orloaXhbvq/Ri
 HRTvUSEsgggs83pzpt4nizOKiMaY75HEU2rUe2Q=
X-Google-Smtp-Source: APiQypIiUEyXBDx+OXVyL61Yp9EPInVn60/s2fb5M+WP6JAXFQ18IK8phOKyR1bdr6QZJl02HNNqEkBCOigRHMLD6sc=
X-Received: by 2002:a92:b70d:: with SMTP id k13mr8798657ili.143.1587741276190; 
 Fri, 24 Apr 2020 08:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAPBsFfDvP2zGUbGj8nNZcBfTRhTeAsxMZtS1Kea_p9V9dWBYbA@mail.gmail.com>
 <20200424150123.GA133694@google.com>
In-Reply-To: <20200424150123.GA133694@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 24 Apr 2020 20:43:35 +0530
Message-ID: <CAPBsFfBypUQczFMnOV6dxt=7rrB8up2WvyWgTHZv0zE3GbKYLA@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/2] realtek/8139cp: Remove
 Legacy Power Management
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

On Fri, 24 Apr 2020 at 20:31, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Apr 24, 2020 at 07:34:50PM +0530, Vaibhav Gupta wrote:
> > > >
> > > > But in case of "__maybe_unused", we don't keep a check while binding
> > > > ".driver.pm".
> > > > Hence, if CONFIG_PM_SLEEP is not defined, still the ".driver.pm" is
> > > > bind with a structure
> > > > with some random initial values.
> > > >
> > > > We can use the mix of both?
> > > > __maybe_unused xyz_suspend(){}
> > > > __maybe_unused xyz_resume(){}
> > > > ...
> > > > #ifdef CONFIG_PM_SLEEP
> > > > .driver.pm = &xyz_pm_ops;
> > > > #endif
> > >
> > > I don't think we need the mix because when CONFIG_PM_SLEEP isn't
> > > defined, SIMPLE_DEV_PM_OPS() compiles to:
> > >
> > >   const struct dev_pm_ops xyz_pm_ops = { }
> > >
> > > and the xyz_pm_ops struct should be zero-filled.  The #ifdef around
> > > ".driver.pm = &xyz_pm_ops" doesn't buy us anything -- the space for
> > > the driver.pm pointer is there regardless, so we don't save any space,
> > > and the default initialization is zero-filled, so the result is the
> > > same.
> >
> > Then, I guess my step to remove "#ifdef CONFIG_PM" won't go complete
> > waste, I should just use "__maybe_unused" with suspend() and resume()
> > to suppress warnings. Right?
>
> Yes, that's what I'd do.  This is all window dressing; the important
> thing is getting the semantic change right, i.e., the transformations
> of the xyz_suspend() and xyz_resume() functions.  This #ifdef and
> __maybe_unused stuff can be trivially changed if necessary.
Yes, I will send a new patch series for this one.

-- Vaibhav Gupta
>
> Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
