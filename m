Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD15C433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 22:12:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7372067D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 22:12:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="S/WhYifu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7372067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A5A628AD56;
	Wed, 15 Jul 2020 22:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EGQvaNVwEq7t; Wed, 15 Jul 2020 22:12:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2762C8A4D3;
	Wed, 15 Jul 2020 22:12:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DD37C0891;
	Wed, 15 Jul 2020 22:12:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 814C5C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7D47C86EDC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LKB4DRR2TjTH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:12:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0919986EA8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:12:33 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3066F2065F;
 Wed, 15 Jul 2020 22:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594851152;
 bh=yiFReVioS6K+TBmJa6LKAY/XmzClp9+1AGEcxSQDlBk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=S/WhYifuBwhLApPX94Rc/0RHdh1EsD3Lsktt1aoGethpDycX9QnYAuXsckOndJhw5
 n3QaIQohtvY8AFWnVXQuc092VZjXlIZnqtKtIWZvilP5gx9OzeqCMahn+95Usq7PJx
 YtSiGFgryUo4JNKSiAdj114J+tlIwEPKap8PPewk=
Date: Wed, 15 Jul 2020 17:12:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200715221230.GA563957@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e2ae69a55f542faa18988a49e9b9491@AcuMS.aculab.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Christoph Hellwig <hch@lst.de>, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Keith Busch <kbusch@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 'Oliver O'Halloran' <oohall@gmail.com>,
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

On Wed, Jul 15, 2020 at 02:38:29PM +0000, David Laight wrote:
> From: Oliver O'Halloran
> > Sent: 15 July 2020 05:19
> > 
> > On Wed, Jul 15, 2020 at 8:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
> ...
> > > - config space accesses are very rare compared to memory
> > >   space access and on the hardware side the error handling
> > >   would be similar, but readl/writel don't return errors, they just
> > >   access wrong registers or return 0xffffffff.
> > >   arch/powerpc/kernel/eeh.c has a ton extra code written to
> > >   deal with it, but no other architectures do.
> > 
> > TBH the EEH MMIO hooks were probably a mistake to begin with. Errors
> > detected via MMIO are almost always asynchronous to the error itself
> > so you usually just wind up with a misleading stack trace rather than
> > any kind of useful synchronous error reporting. It seems like most
> > drivers don't bother checking for 0xFFs either and rely on the
> > asynchronous reporting via .error_detected() instead, so I have to
> > wonder what the point is. I've been thinking of removing the MMIO
> > hooks and using a background poller to check for errors on each PHB
> > periodically (assuming we don't have an EEH interrupt) instead. That
> > would remove the requirement for eeh_dev_check_failure() to be
> > interrupt safe too, so it might even let us fix all the godawful races
> > in EEH.
> 
> I've 'played' with PCIe error handling - without much success.
> What might be useful is for a driver that has just read ~0u to
> be able to ask 'has there been an error signalled for this device?'.

In many cases a driver will know that ~0 is not a valid value for the
register it's reading.  But if ~0 *could* be valid, an interface like
you suggest could be useful.  I don't think we have anything like that
today, but maybe we could.  It would certainly be nice if the PCI core
noticed, logged, and cleared errors.  We have some of that for AER,
but that's an optional feature, and support for the error bits in the
garden-variety PCI_STATUS register is pretty haphazard.  As you note
below, this sort of SERR/PERR reporting is frequently hard-wired in
ways that takes it out of our purview.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
