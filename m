Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E72C54FCB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 13:01:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9BD620728
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 13:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G10ZCwex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9BD620728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B8F5862BE;
	Fri, 24 Apr 2020 13:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9-A_9hWmHhHu; Fri, 24 Apr 2020 13:01:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9A145868D9;
	Fri, 24 Apr 2020 13:01:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D51BC1AE2;
	Fri, 24 Apr 2020 13:01:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4EDCC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A8DD203B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:01:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TquQSInx6eK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C390520370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 13:01:02 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f82so9127110ilh.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 06:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4N7jTRN0KYxBwC7roLhbINAt8O7UEOLHixj+FXvVtBg=;
 b=G10ZCwextagE7E26t+ZIz0Cvgi4VsJ++qLFxQ8ow4kio6KRbkZf9IChITuJ4b9eNNi
 qnBTu7XIsvDwf01+eQdoSFSbm718tVLpNASEBWiuHuKrfwZ+HI/OcpbjHNQnqOukjzvF
 W+wjE672S0K4bIEADf8uDXu7E9pIdiZ0M+zrEyL/pnTp/2l8BvAw/KlSjg2DVXBWNw7w
 wC5re7ErJusYLMbCdxTSJExZEgX/3qIxNMFReAbR3Y+w9T55zWczoBSVrtX7T39zDsVs
 We8EAMQJUJcpO7JY1AjQYR5oPB19lXNdIJK4pnFc7dF33BodGuUbNa/buDcot5Lqzaxc
 L+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4N7jTRN0KYxBwC7roLhbINAt8O7UEOLHixj+FXvVtBg=;
 b=eobgVPFiDlRiLjSFJOtip6PNEQm8ow508PB+ZacfKn2WGlcUdLSFQeTbKg55k+uXB8
 Hq8TAeFwiA4L+TyYsCAzGxXEaX3ZbgxeCkNQLKwv7Aef17fgJxrbWMYTY2HUevnMiaWk
 slFrbJ440EXJesZcSmGnbwdhejzJO6AZ35y5TQ9P3b8I/k9sRd1ZWNKMZn7s5/zEE8cS
 aSRAtnPICsGjEmiTJplRTSBJdcXabhjLRcvFWnL2U1xsxdcbiAsbR2ypRmD5GqTR+yfd
 /swADGrd2KyOsJ7jVhMy745Bzj6g9BD9T6dmHL2cjA19JnIWNiAfg5lvhmuZhb+FwxzP
 6R2g==
X-Gm-Message-State: AGi0PuYnKDLKG3YjYj11N2BiCHcM79xL15xteJ1t22ruw0sn2z9zvWbK
 1nxEOiWB1nHWGyMJGgJkOMgBXPvoF/GLgR3Xqq8=
X-Google-Smtp-Source: APiQypJviYTd3W/N2bbgCIZ6LkB2KRca2X+T07g2u46jO91/8olOUBAzkys4pKmMBKAHSnBL+NM9NywHorECnugbezQ=
X-Received: by 2002:a92:5a48:: with SMTP id o69mr8943428ilb.228.1587733261964; 
 Fri, 24 Apr 2020 06:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAPBsFfAdXZW3p_WFknvPVbvDhNw2iWt13BTHDXCUjXaSFYAo_w@mail.gmail.com>
 <20200424124432.GA100904@google.com>
In-Reply-To: <20200424124432.GA100904@google.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Fri, 24 Apr 2020 18:30:01 +0530
Message-ID: <CAPBsFfARrVF1Ch-gMT6fbnBhdigY+qQKSZV8P_h3bZw5bXiFrg@mail.gmail.com>
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

On Fri, 24 Apr 2020 at 18:14, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Apr 24, 2020 at 04:01:43PM +0530, Vaibhav Gupta wrote:
> > On Fri, 24 Apr 2020 at 09:17, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > > On Thu, Apr 23, 2020 at 06:58:01PM +0530, Vaibhav Gupta wrote:
> > > > Upgrade Power Management from legacy to generic using dev_pm_ops.
> > > >
> > > > Remove pci_save_sate(), pci_set_state(), etc. No need of directive
> > > > '#ifdef CONFIG_PM' as, if CONFIG_PM is not defined, the binding
> > > > will be by deafult set to NULL.
> > >
> > > s/deafult/default/
> > >
> > > I didn't quite follow this argument.  SIMPLE_DEV_PM_OPS() is defined
> > > to SET_SYSTEM_SLEEP_PM_OPS(), and SET_SYSTEM_SLEEP_PM_OPS() is defined
> > > to nothing unless CONFIG_PM_SLEEP (not CONFIG_PM).
> > yes, and we can find about CONFIG_PM_SLEEP inside kernel/power/kconfig
> > It is defined as:
> > config PM_SLEEP
> >         def_bool y
> >         depends on SUSPEND || HIBERNATE_CALLBACKS
> >         select PM
> >         select SRCU
> >
> > Hence it is selecting CONFIG_PM. So any of the macro check works.So i
> > should go with
> > #ifded CONFIG_PM
> > or
> > #ifdef CONFIG_PM_SLEEP ?
>
> Well, the point was that it's possible to have CONFIG_PM=y but
> CONFIG_PM_SLEEP unset.  In that case, using "#ifdef CONFIG_PM" will
> mean those functions will be compiled but not referenced.
>
> > > But in any case, we don't want cp_suspend() and cp_resume() to be
> > > compiled at all if they're not referenced.  So I think converting the
> > > "#ifdef CONFIG_PM" to "#ifdef CONFIG_PM_SLEEP" is the right thing.
> > Actually I removed it because Andy also removed them in
> > 226e6b866d74, thought it has to be done that way.
>
> Hmm, yes, I see that.  I wish we had one canonical way to do this.
>
> In 226e6b866d74 ("gpio: pch: Convert to dev_pm_ops"), I see that Andy
> also added "__maybe_unused", which I think turns off the compiler
> warning about the function being unused.
>
> I had been looking at recent additions of SIMPLE_DEV_PM_OPS() via
>
>   $ git log -p drivers/
>
> and searching with "/^\+.*SIMPLE_DEV_PM_OPS".  There's a mix of using
> "#ifdef CONFIG_PM_SLEEP" and using "__maybe_unused", but it does look
> like "__maybe_unused" is winning.  It leaves unusable code in the
> image but arguably looks a little prettier.
>
> So I guess I'm fine with either way.  But I do think we need either
> "#ifdef CONFIG_PM_SLEEP" or "__maybe_unused" so we don't get compiler
> warnings.
I totally agree with your argument. But in case of "#ifdef CONFIG_PM_SLEEP",
neither the suspend() & resume() are compiled and neither ".driver.pm"
gets bind.

But in case of "__maybe_unused", we don't keep a check while binding
".driver.pm".
Hence, if CONFIG_PM_SLEEP is not defined, still the ".driver.pm" is
bind with a structure
with some random initial values.

We can use the mix of both?
__maybe_unused xyz_suspend(){}
__maybe_unused xyz_resume(){}
...
#ifdef CONIFG_PM_SLEEP
.driver.pm = &xyz_pm_ops;
#endif

-- Vaibhav Gupta
>
> Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
