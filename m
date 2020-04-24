Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57ABC54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 13:59:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DAA8208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 13:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="y4EVUGJi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DAA8208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A20085C57;
	Fri, 24 Apr 2020 13:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wi-X77d5cym0; Fri, 24 Apr 2020 13:59:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8D1485BCC;
	Fri, 24 Apr 2020 13:59:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA13AC089E;
	Fri, 24 Apr 2020 13:59:15 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CACBC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52BFC88216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3qVAoBPekZt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:59:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F0E98820C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:59:13 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7045F20656;
 Fri, 24 Apr 2020 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587736752;
 bh=MkTzNMMhH4hrpuAiHp6PlWoIij1bogdyquYd6XxhL0I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=y4EVUGJiobLH/H1xipiX+kNrhWBE0WCGSD5J/W30lZVmNy11sRvdY0lkwIdECphis
 LJLL11HXvsNpSStbilZTlWCT03kwhcyIqJDoa/UbYiMAC2nk7y2Y9EnZiLDld/Ytj8
 sYXTapGpaPtHU728sm4/yVcRrymklQWp7GM51fxU=
Date: Fri, 24 Apr 2020 08:59:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Message-ID: <20200424135910.GA118662@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPBsFfARrVF1Ch-gMT6fbnBhdigY+qQKSZV8P_h3bZw5bXiFrg@mail.gmail.com>
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

On Fri, Apr 24, 2020 at 06:30:01PM +0530, Vaibhav Gupta wrote:
> On Fri, 24 Apr 2020 at 18:14, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Fri, Apr 24, 2020 at 04:01:43PM +0530, Vaibhav Gupta wrote:
> > > On Fri, 24 Apr 2020 at 09:17, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > On Thu, Apr 23, 2020 at 06:58:01PM +0530, Vaibhav Gupta wrote:
> > > > > Upgrade Power Management from legacy to generic using dev_pm_ops.
> > > > >
> > > > > Remove pci_save_sate(), pci_set_state(), etc. No need of directive
> > > > > '#ifdef CONFIG_PM' as, if CONFIG_PM is not defined, the binding
> > > > > will be by deafult set to NULL.
> > > >
> > > > s/deafult/default/
> > > >
> > > > I didn't quite follow this argument.  SIMPLE_DEV_PM_OPS() is defined
> > > > to SET_SYSTEM_SLEEP_PM_OPS(), and SET_SYSTEM_SLEEP_PM_OPS() is defined
> > > > to nothing unless CONFIG_PM_SLEEP (not CONFIG_PM).
> > > yes, and we can find about CONFIG_PM_SLEEP inside kernel/power/kconfig
> > > It is defined as:
> > > config PM_SLEEP
> > >         def_bool y
> > >         depends on SUSPEND || HIBERNATE_CALLBACKS
> > >         select PM
> > >         select SRCU
> > >
> > > Hence it is selecting CONFIG_PM. So any of the macro check works.So i
> > > should go with
> > > #ifded CONFIG_PM
> > > or
> > > #ifdef CONFIG_PM_SLEEP ?
> >
> > Well, the point was that it's possible to have CONFIG_PM=y but
> > CONFIG_PM_SLEEP unset.  In that case, using "#ifdef CONFIG_PM" will
> > mean those functions will be compiled but not referenced.
> >
> > > > But in any case, we don't want cp_suspend() and cp_resume() to be
> > > > compiled at all if they're not referenced.  So I think converting the
> > > > "#ifdef CONFIG_PM" to "#ifdef CONFIG_PM_SLEEP" is the right thing.
> > > Actually I removed it because Andy also removed them in
> > > 226e6b866d74, thought it has to be done that way.
> >
> > Hmm, yes, I see that.  I wish we had one canonical way to do this.
> >
> > In 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), I see that Andy
> > also added "__maybe_unused", which I think turns off the compiler
> > warning about the function being unused.
> >
> > I had been looking at recent additions of SIMPLE_DEV_PM_OPS() via
> >
> >   $ git log -p drivers/
> >
> > and searching with "/^\+.*SIMPLE_DEV_PM_OPS".  There's a mix of using
> > "#ifdef CONFIG_PM_SLEEP" and using "__maybe_unused", but it does look
> > like "__maybe_unused" is winning.  It leaves unusable code in the
> > image but arguably looks a little prettier.
> >
> > So I guess I'm fine with either way.  But I do think we need either
> > "#ifdef CONFIG_PM_SLEEP" or "__maybe_unused" so we don't get compiler
> > warnings.
>
> I totally agree with your argument. But in case of "#ifdef CONFIG_PM_SLEEP",
> neither the suspend() & resume() are compiled and neither ".driver.pm"
> gets bind.
> 
> But in case of "__maybe_unused", we don't keep a check while binding
> ".driver.pm".
> Hence, if CONFIG_PM_SLEEP is not defined, still the ".driver.pm" is
> bind with a structure
> with some random initial values.
>
> We can use the mix of both?
> __maybe_unused xyz_suspend(){}
> __maybe_unused xyz_resume(){}
> ...
> #ifdef CONFIG_PM_SLEEP
> .driver.pm = &xyz_pm_ops;
> #endif

I don't think we need the mix because when CONFIG_PM_SLEEP isn't
defined, SIMPLE_DEV_PM_OPS() compiles to:

  const struct dev_pm_ops xyz_pm_ops = { }

and the xyz_pm_ops struct should be zero-filled.  The #ifdef around
".driver.pm = &xyz_pm_ops" doesn't buy us anything -- the space for
the driver.pm pointer is there regardless, so we don't save any space,
and the default initialization is zero-filled, so the result is the
same.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
