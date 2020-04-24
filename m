Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9609C55191
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 15:01:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B370520706
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 15:01:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgCxmXYp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B370520706
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8CC7B87858;
	Fri, 24 Apr 2020 15:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L77n1QfIw7sc; Fri, 24 Apr 2020 15:01:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1552A8779F;
	Fri, 24 Apr 2020 15:01:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00E46C1AE2;
	Fri, 24 Apr 2020 15:01:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F20E2C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E4923203DA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:01:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypA4IQ42NtM4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:01:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 274A9203EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 15:01:26 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A092F20706;
 Fri, 24 Apr 2020 15:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587740486;
 bh=mxNnMulcXYqS2CSqO9B6QVqkROZCjy4SPs6Ig+Tgknw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=pgCxmXYpubUdRqx01HbZcNIcS92PMPa3kFaXov1rubwXy5PAWhs1dYFD0BN4976H6
 z/h6pOVEY5mp3C7XHqtGf3oWQYRcBx2uw58IWMUZ2SLHzpKst53gL089JHciSdJGwm
 DF0gdI0cywnhb4ullPEcDa67cLCWHXK4FXUrG7tw=
Date: Fri, 24 Apr 2020 10:01:23 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Message-ID: <20200424150123.GA133694@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPBsFfDvP2zGUbGj8nNZcBfTRhTeAsxMZtS1Kea_p9V9dWBYbA@mail.gmail.com>
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

On Fri, Apr 24, 2020 at 07:34:50PM +0530, Vaibhav Gupta wrote:
> > >
> > > But in case of "__maybe_unused", we don't keep a check while binding
> > > ".driver.pm".
> > > Hence, if CONFIG_PM_SLEEP is not defined, still the ".driver.pm" is
> > > bind with a structure
> > > with some random initial values.
> > >
> > > We can use the mix of both?
> > > __maybe_unused xyz_suspend(){}
> > > __maybe_unused xyz_resume(){}
> > > ...
> > > #ifdef CONFIG_PM_SLEEP
> > > .driver.pm = &xyz_pm_ops;
> > > #endif
> >
> > I don't think we need the mix because when CONFIG_PM_SLEEP isn't
> > defined, SIMPLE_DEV_PM_OPS() compiles to:
> >
> >   const struct dev_pm_ops xyz_pm_ops = { }
> >
> > and the xyz_pm_ops struct should be zero-filled.  The #ifdef around
> > ".driver.pm = &xyz_pm_ops" doesn't buy us anything -- the space for
> > the driver.pm pointer is there regardless, so we don't save any space,
> > and the default initialization is zero-filled, so the result is the
> > same.
> 
> Then, I guess my step to remove "#ifdef CONFIG_PM" won't go complete
> waste, I should just use "__maybe_unused" with suspend() and resume()
> to suppress warnings. Right?

Yes, that's what I'd do.  This is all window dressing; the important
thing is getting the semantic change right, i.e., the transformations
of the xyz_suspend() and xyz_resume() functions.  This #ifdef and
__maybe_unused stuff can be trivially changed if necessary.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
