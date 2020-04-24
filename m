Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254E6C54FD0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 12:44:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC4CD20776
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 12:44:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxDqdvs0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4CD20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C644D88193;
	Fri, 24 Apr 2020 12:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X-GGPkxn4Vwy; Fri, 24 Apr 2020 12:44:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8AAC58825E;
	Fri, 24 Apr 2020 12:44:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77CA8C1AE2;
	Fri, 24 Apr 2020 12:44:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2682C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 12:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9C1A487DE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 12:44:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gW6IDkDQLdCN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 12:44:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1FF8287DCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 12:44:35 +0000 (UTC)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73EAF20728;
 Fri, 24 Apr 2020 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587732274;
 bh=bE81LGQ9/GZu61d7WhyLPTqi6ip3W6XIfTiODWSx49o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=UxDqdvs02US+1U6CR1acbibOW2DnHkif8CVz2O6Cz4vj7grUJs9hasmmzARwOAw8z
 XzSdJDkBNiMImwzkIs/g77j1Z69YWNlU9IuF83qJiW83MvYhdXh25/XxKFXndEh/g7
 BQhqAdE0S9rCTrTeEUE7bzBsB58bbjWUiwqZV/ic=
Date: Fri, 24 Apr 2020 07:44:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Message-ID: <20200424124432.GA100904@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPBsFfAdXZW3p_WFknvPVbvDhNw2iWt13BTHDXCUjXaSFYAo_w@mail.gmail.com>
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

On Fri, Apr 24, 2020 at 04:01:43PM +0530, Vaibhav Gupta wrote:
> On Fri, 24 Apr 2020 at 09:17, Bjorn Helgaas <helgaas@kernel.org> wrote:
> >
> > On Thu, Apr 23, 2020 at 06:58:01PM +0530, Vaibhav Gupta wrote:
> > > Upgrade Power Management from legacy to generic using dev_pm_ops.
> > >
> > > Remove pci_save_sate(), pci_set_state(), etc. No need of directive
> > > '#ifdef CONFIG_PM' as, if CONFIG_PM is not defined, the binding
> > > will be by deafult set to NULL.
> >
> > s/deafult/default/
> >
> > I didn't quite follow this argument.  SIMPLE_DEV_PM_OPS() is defined
> > to SET_SYSTEM_SLEEP_PM_OPS(), and SET_SYSTEM_SLEEP_PM_OPS() is defined
> > to nothing unless CONFIG_PM_SLEEP (not CONFIG_PM).
> yes, and we can find about CONFIG_PM_SLEEP inside kernel/power/kconfig
> It is defined as:
> config PM_SLEEP
>         def_bool y
>         depends on SUSPEND || HIBERNATE_CALLBACKS
>         select PM
>         select SRCU
> 
> Hence it is selecting CONFIG_PM. So any of the macro check works.So i
> should go with
> #ifded CONFIG_PM
> or
> #ifdef CONFIG_PM_SLEEP ?

Well, the point was that it's possible to have CONFIG_PM=y but
CONFIG_PM_SLEEP unset.  In that case, using "#ifdef CONFIG_PM" will
mean those functions will be compiled but not referenced.

> > But in any case, we don't want cp_suspend() and cp_resume() to be
> > compiled at all if they're not referenced.  So I think converting the
> > "#ifdef CONFIG_PM" to "#ifdef CONFIG_PM_SLEEP" is the right thing.
> Actually I removed it because Andy also removed them in
> 226e6b866d74, thought it has to be done that way.

Hmm, yes, I see that.  I wish we had one canonical way to do this.

In 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), I see that Andy
also added "__maybe_unused", which I think turns off the compiler
warning about the function being unused.

I had been looking at recent additions of SIMPLE_DEV_PM_OPS() via

  $ git log -p drivers/

and searching with "/^\+.*SIMPLE_DEV_PM_OPS".  There's a mix of using
"#ifdef CONFIG_PM_SLEEP" and using "__maybe_unused", but it does look
like "__maybe_unused" is winning.  It leaves unusable code in the
image but arguably looks a little prettier.

So I guess I'm fine with either way.  But I do think we need either
"#ifdef CONFIG_PM_SLEEP" or "__maybe_unused" so we don't get compiler
warnings.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
