Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EEEC433E3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 04:19:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2126206F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 04:19:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQAhGIZJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2126206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B507D89CCB;
	Wed, 15 Jul 2020 04:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1F1Vn2xCqh0t; Wed, 15 Jul 2020 04:19:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B59E389A8A;
	Wed, 15 Jul 2020 04:19:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98DADC0888;
	Wed, 15 Jul 2020 04:19:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 694F2C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 04:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 629DC880B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 04:19:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlVO61C6V2Be
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 04:19:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 813F888093
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 04:19:00 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id x9so834742ila.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 21:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vY2OIlneWe5ztE2bvwwhli0jm6HqPh+OWIpoUB8BSw=;
 b=bQAhGIZJE7XGnGYhwL0/1olYisauxe9ymI6u2tgG5vEOuz2Nq+QlDtF7dhHuDuByuD
 qW96jNuM4d+gf7D3wc8J8orrZQS9iM0Icv2ATeffIzl0qNeTkHmX83cMCjFi8nTTJm5v
 7ig6QsacBF0GCuiO/mGKrMcs7KLcULwA6yDS5Bhdj00wAveDS58I1htt6LsbCi5aopAo
 94cRQMbn77WvY0ntAe3eMQsVBODihtWQxeS8Nk4f6gtDn95RBRSxHL19GMAyBDy2dM6S
 N6sPHPVxHB/cnaCH/kcUf5eC7pYe8YR2n8bCiJu6OiN1Jb3CBLYelLNvpnWbwRHuU5zs
 q8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vY2OIlneWe5ztE2bvwwhli0jm6HqPh+OWIpoUB8BSw=;
 b=iuXgnRUx1Hd8sQoygOI3/J7VuNX3+Gg29aNCu4DDxDbhf43QKYo4E9R/1s7tUhUKpv
 7Kz9OL2BomFYecbHLtOCpmHWqVyuksxoaQ+xWWc+HsN25AZM5GM3QyUmPuXxDafzspnl
 x/fBHt9Y1GhWIKnqu9AGte8mkCvt8+9eDBI260CB98dnnZilzZ/Ktbipn57MiYwjzbsZ
 wM6/Bc50/1vU1andSRfr1uOfEckOVka0rtILTY8FftIxe9Om/r6xcd/hRvjvRpwo0rJY
 xkrxnUIwEhe/CijaPf0psHgACY+y99sQTHvPCVMEsAB92iUgckLfEfXeMms2TR6BODgT
 GjjA==
X-Gm-Message-State: AOAM530BrWuiDCmjPp4zfY+29av9cAPOqqOaI+uylBVmivRnGOi5dKsH
 Ky191aJxjUBKvzUdlgJgCyD3pwj6ntO6+VUqycY=
X-Google-Smtp-Source: ABdhPJxbEVXkXtWoblqKfj5L8JbBLsjm2+xbwAB3m5diPF3AzSD/1a23QyEn3OuWSfYYBfrU93OGI/PkJJ/ZoDLhhcU=
X-Received: by 2002:a92:9a97:: with SMTP id c23mr8119143ill.258.1594786739362; 
 Tue, 14 Jul 2020 21:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
 <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 14:18:47 +1000
Message-ID: <CAOSf1CEviMYySQhyQGks8hHjST-85wGpxEBasuxwSX_homBJ2A@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-pci <linux-pci@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Christoph Hellwig <hch@lst.de>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Bjorn Helgaas <helgaas@kernel.org>,
 Ray Jui <rjui@broadcom.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Keith Busch <kbusch@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-kernel-mentees] [RFC PATCH 00/35] Move all PCIBIOS*
	definitions into arch/x86
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

On Wed, Jul 15, 2020 at 8:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> - Most error checking is static: PCIBIOS_BAD_REGISTER_NUMBER
>   only happens if you pass an invalid register number, but most
>   callers pass a compile-time constant register number that is
>   known to be correct, or the driver would never work. Similarly,
>   PCIBIOS_DEVICE_NOT_FOUND wouldn't normally happen
>   since you pass a valid pci_device pointer that was already
>   probed.

Having some feedback about obvious programming errors is still useful
when doing driver development. Reporting those via printk() would
probably be more useful to those who care though.

> - config space accesses are very rare compared to memory
>   space access and on the hardware side the error handling
>   would be similar, but readl/writel don't return errors, they just
>   access wrong registers or return 0xffffffff.
>   arch/powerpc/kernel/eeh.c has a ton extra code written to
>   deal with it, but no other architectures do.

TBH the EEH MMIO hooks were probably a mistake to begin with. Errors
detected via MMIO are almost always asynchronous to the error itself
so you usually just wind up with a misleading stack trace rather than
any kind of useful synchronous error reporting. It seems like most
drivers don't bother checking for 0xFFs either and rely on the
asynchronous reporting via .error_detected() instead, so I have to
wonder what the point is. I've been thinking of removing the MMIO
hooks and using a background poller to check for errors on each PHB
periodically (assuming we don't have an EEH interrupt) instead. That
would remove the requirement for eeh_dev_check_failure() to be
interrupt safe too, so it might even let us fix all the godawful races
in EEH.

> - If we add code to detect errors in pci_read_config_*
>   and do some of the stuff from powerpc's
>   eeh_dev_check_failure(), we are more likely to catch
>   intermittent failures when drivers don't check, or bugs
>   with invalid arguments in device drivers than relying on
>   drivers to get their error handling right when those code
>   paths don't ever get covered in normal testing.

Adding some kind of error detection to the generic config accessors
wouldn't hurt, but detection is only half the problem. The main job of
eeh_dev_check_failure() is waking up the EEH recovery thread which
actually handles notifying drivers, device resets, etc and you'd want
something in the PCI core. Right now there's two implementations of
that reporting logic: one for EEH in arch/powerpc/eeh_driver.c and one
for AER/DPC in drivers/pci/pcie/err.c. I think the latter could be
moved into the PCI core easily enough since there's not much about it
that's really specific to PCIe. Ideally we could drop the EEH specific
one too, but I'm not sure how to implement that without it devolving
into callback spaghetti.

Oliver
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
