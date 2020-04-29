Return-Path: <SRS0=k+ap=6N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FF1C83004
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Apr 2020 14:42:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D272A21D7F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Apr 2020 14:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5fCj4BQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D272A21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7EEA22040C;
	Wed, 29 Apr 2020 14:42:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IUIa9OO3D4y6; Wed, 29 Apr 2020 14:42:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA4E720405;
	Wed, 29 Apr 2020 14:42:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACD96C0865;
	Wed, 29 Apr 2020 14:42:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27E1AC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 134DB8770C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDkQNFRnp0iO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:42:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F39658770A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 14:42:48 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id x2so2589477ilp.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Apr 2020 07:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqWtuuKGyccZnCAMErVogWBfiRD+U5fCxE5xiaJTzfo=;
 b=s5fCj4BQKrHN0Zovvg3Dr25wInQgTYs0QpmECbgHHuMzwOfZPpWBo5kbvDtkQXXTSO
 iXDdXHTqmTd7tdHb5K3vCr+nZ6G7qiXnMz078lmJjWeTAqZF5MjEb44MxQVO0aX+ljfQ
 /0c6q3bgMT7t0XSvGyJsfR0dnidb17q2HiJ7X5F/WbSn6W3ukIcAoSbUaOZYtqlc3dQH
 YmlE4eHfQ9RXtB4WmPRDsuiST3FZ4SuBpxQiy5IQK+wmr2PaJGMR1X1a2Nw1TqTFZmGH
 pHRm1Xf+CnOprzL8LoiY181dWiUMUTOuUF3P3A/0xGL0kIAw9FnTMlbxZxtEGza3Eq18
 Dh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqWtuuKGyccZnCAMErVogWBfiRD+U5fCxE5xiaJTzfo=;
 b=Ix9jxG2HVib9m1XFvvo+RoGk3ESc860dvtcA5ocBCqiENiFf1udC4IFqNOm7xDUs6V
 eBMdm9asAlHRhCdgWzU/g2EIpaPifYQ5WGYrDEJ+W4fr3b3x7zzze10afkBoWkoq8l5T
 q4I/UBvMKXRg1A2q8y4c5xOHPTs139qhkm1srKwV0PF0n0MrfjFMEDs55EvwC1s+hRk6
 LRL1BeBxKcmNey0auyGbzyV7Yamqhx3rRdkiFWjva8Tm562nktcjLTXg2TqvjDy6J9+1
 sqPqMdVcelCAq5VLWtZ/3JEBapzDQI+KK0qlMFvWv5+gGMUUXNJzA/yXxAXBCgPKjazN
 74Hg==
X-Gm-Message-State: AGi0PuaE/CvO3vfJoqO1GFKwS1YtIxrYdKuBiYErARGOk2IVCEsbVIAo
 PLDXh0vrPdUr1sVLACrKOxZUWkq/38bKKn/yZt4=
X-Google-Smtp-Source: APiQypJ7U9Prko6Vi5K48lXkGdf0yeTY8OK5a8KU1GkGRlP47cvtBGWMdJwRF+dEj65ASvEvOa24knaqwchBPTLuB7o=
X-Received: by 2002:a92:cac7:: with SMTP id m7mr32641141ilq.6.1588171368312;
 Wed, 29 Apr 2020 07:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200428144314.24533-2-vaibhavgupta40@gmail.com>
 <20200428171928.GA170516@google.com>
 <CAPBsFfDjVSRHjf36WcAgteH9XocrmrNYTPW4fD2Rwi0neJF6ww@mail.gmail.com>
In-Reply-To: <CAPBsFfDjVSRHjf36WcAgteH9XocrmrNYTPW4fD2Rwi0neJF6ww@mail.gmail.com>
From: Vaibhav Gupta <vaibhav.varodek@gmail.com>
Date: Wed, 29 Apr 2020 20:11:45 +0530
Message-ID: <CAPBsFfBtr12m1e9njtVct_V1RPSVYksuAdMjhgqUQ1WqFRLYsg@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, netdev@vger.kernel.org,
 Martin Habets <mhabets@solarflare.com>, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shannon Nelson <snelson@pensando.io>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2 1/2] realtek/8139too: Remove
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

> >
> > Uncapitalize "legacy power management" in subject.  I'd say "convert",
> > not "remove", to make it clear that the driver will still do power
> > management afterwards.
Sure!
> >
> > I think your to: and cc: list came from the get_maintainer.pl script,
yeah.
> > but you can trim it a bit by omitting people who have just made
> > occasional random fixups.  These drivers are really unmaintained, so
> > Dave M, netdev, Rafael, linux-pm, linux-pci, and maybe LKML are
> > probably enough.
I will keep this in mind next time.
> >
> > On Tue, Apr 28, 2020 at 08:13:13PM +0530, Vaibhav Gupta wrote:
> > > Upgrade power management from legacy to generic using dev_pm_ops.
> >
> > Instead of the paragraphs below, which cover the stuff that's fairly
> > obvious, I think it would be more useful to include hints about where
> > the things you removed will be done now.  That helps reviewers verify
> > that this doesn't break anything.  E.g.,
> >
> >   In the legacy PM model, drivers save and restore PCI state and set
> >   the device power state directly.  In the generic model, this is all
> >   done by the PCI core in .suspend_noirq() (pci_pm_suspend_noirq())
> >   and .resume_noirq() (pci_pm_resume_noirq()).
> >
> > This sort of thing could go in each commit log.  The cover letter
> > doesn't normally go in the commit log, so you have to assume it will
> > be lost.
 Okay. I will send v3 patch-series with changes. Thanks for
acknowledging :)

--Vaibhav Gupta
> >
> > > Remove "struct pci_driver.suspend" and "struct pci_driver.resume"
> > > bindings, and add "struct pci_driver.driver.pm" .
> > >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
