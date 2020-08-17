Return-Path: <SRS0=pv6u=B3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47080C433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 04:54:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148D520789
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 17 Aug 2020 04:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3ZDjpHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 148D520789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D94C6860B0;
	Mon, 17 Aug 2020 04:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3uo_28kPXQV7; Mon, 17 Aug 2020 04:54:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 38C0886099;
	Mon, 17 Aug 2020 04:54:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1668EC088B;
	Mon, 17 Aug 2020 04:54:24 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B3CAC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 04:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 74891860B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 04:54:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXwXuy3joDCL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 04:54:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E0BBF86099
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 17 Aug 2020 04:54:22 +0000 (UTC)
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C975C206FA;
 Mon, 17 Aug 2020 04:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597640062;
 bh=dhDoHPim08T8tQIOUPSLJcDdqrcHotj1Ty6KdND+evs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P3ZDjpHvPf4QPepi2druAftU5PC//2v6z+wnDnBJU9eyp3MLwFmJeYK/SWFUuFL2r
 jpLrZNibJv4mG4kYUbOvL7yvp+gsoIHqDlb4BWX0bTFNmkklf7Aj6OcL6Uvc6L8o+d
 Q9VSiOwmzAqf+ZanDZnNC7f1Qx+mkLQgB5AYNwKs=
Date: Mon, 17 Aug 2020 10:24:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20200817045418.GC2639@vkoul-mobl>
References: <20200720113740.353479-1-vaibhavgupta40@gmail.com>
 <20200727085621.GL12965@vkoul-mobl>
 <CAHp75VesTCOffxiy6=HG=g2t4=js3SnTm4LcdrgAGYiNvSS65Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75VesTCOffxiy6=HG=g2t4=js3SnTm4LcdrgAGYiNvSS65Q@mail.gmail.com>
Cc: dmaengine <dmaengine@vger.kernel.org>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] dmaengine: pch_dma: use
	generic power management
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

On 27-07-20, 14:19, Andy Shevchenko wrote:
> On Mon, Jul 27, 2020 at 1:16 PM Vinod Koul <vkoul@kernel.org> wrote:
> > On 20-07-20, 17:07, Vaibhav Gupta wrote:
> > > Drivers using legacy PM have to manage PCI states and device's PM states
> > > themselves. They also need to take care of configuration registers.
> > >
> > > With improved and powerful support of generic PM, PCI Core takes care of
> > > above mentioned, device-independent, jobs.
> > >
> > > This driver makes use of PCI helper functions like
> > > pci_save/restore_state(), pci_enable/disable_device(),
> > > and pci_set_power_state() to do required operations. In generic mode, they
> > > are no longer needed.
> > >
> > > Change function parameter in both .suspend() and .resume() to
> > > "struct device*" type. Use dev_get_drvdata() to get drv data.
> >
> > You are doing too many things in One patch. Do consider splitting them
> > up to a change per patch. for example using __maybe could be one patch,
> > removing code is suspend-resume callbacks would be other one.
> 
> Vinod, while I completely agree with you in general, in this case it
> would make more unnecessary churn and will be rather unhelpful in all
> ways: for the contributor to do this work, for the reader to collect
> all the pieces. It also will be a bisectability issue, because the
> #ifdeffery replacement (IIRC you need to move from CONFIG_PM to
> CONFIG_PM_SLEEP). I really don't see any advantages of the splitting
> here.
> 
> > > Compile-tested only.
> >
> > I would like to see some testing before we merge this
> 
> I have hardware to test (Intel Minnowboard v1) but have no time. And
> taking into account that I did similar changes for many other drivers,
> I can give my
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> and take responsibility if somebody complains in the future (I don't
> believe it will be one).
> 
> P.S. Another scenario if Vaibhav can find that board (there were
> dozens of thousands at least produced and floating on the second hand
> market) and test himself. It may be good since he touches the full lot
> of PCH (EGT20) drivers.

Applied now, thanks

-- 
~Vinod
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
