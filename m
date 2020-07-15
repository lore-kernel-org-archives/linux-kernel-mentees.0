Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2701FC433E4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 02:21:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E585F20729
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 02:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E585F20729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id AC53E2047F;
	Wed, 15 Jul 2020 02:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgavkZNT2EJL; Wed, 15 Jul 2020 02:21:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8C67820436;
	Wed, 15 Jul 2020 02:21:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 661F9C0888;
	Wed, 15 Jul 2020 02:21:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8357C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 02:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4515C89941
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 02:21:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njHiZk5a7-qO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 02:21:35 +0000 (UTC)
X-Greylist: delayed 00:06:42 by SQLgrey-1.7.6
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 99E338993F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 02:21:35 +0000 (UTC)
Received: from localhost (gate.crashing.org [63.228.1.57])
 (authenticated bits=0)
 by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 06F2JlC0001315
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 14 Jul 2020 21:19:51 -0500
Message-ID: <2629240c07af7fec5989127ed6da405e12cf77a3.camel@kernel.crashing.org>
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Bjorn Helgaas <helgaas@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 Jul 2020 12:19:46 +1000
In-Reply-To: <20200714234625.GA428442@bjorn-Precision-5520>
References: <20200714234625.GA428442@bjorn-Precision-5520>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Cc: linux-pci <linux-pci@vger.kernel.org>, Keith Busch <kbusch@kernel.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Toan Le <toan@os.amperecomputing.com>, Kjetil Oftedal <oftedal@gmail.com>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Kevin Hilman <khilman@baylibre.com>, Jakub Kicinski <kuba@kernel.org>,
 Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
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

On Tue, 2020-07-14 at 18:46 -0500, Bjorn Helgaas wrote:
> Yes.  I have no problem with that.  There are a few cases where it's
> important to check for errors, e.g., we read a status register and do
> something based on a bit being set.  A failure will return all bits
> set, and we may do the wrong thing.  But most of the errors we care
> about will be on MMIO reads, not config reads, so we can probably
> ignore most config read errors.

And in both cases, we don't have the plumbing to provide accurate
and reliable error returns for all platforms anyways (esp. not for
MMIO).

I think it makes sense to stick to the good old "if all 1's, then go
out of line" including for config space.

 ../..

> Yep, except for things like device removal or other PCI errors.

A whole bunch of these are reported asynchronously, esp for writes (and
yes, including config writes, they are supposed to be non-posted but
more often than not, the path  from the CPU to the PCI bridge remains
posted for writes including config ones).

> So maybe a good place to start is by removing some of the useless
> error checking for pci_read_config_*() and pci_write_config_*().
> That's a decent-sized but not impractical project that could be done
> per subsystem or something:
> 
>   git grep -E "(if|return|=).*\<pci_(read|write)_config" drivers
> 
> finds about 400 matches.
> 
> Some of those callers probably really *do* want to check for errors,
> and I guess we'd have to identify them and do them separately as you
> mentioned.

I'd be curious about these considering how unreliable our error return
is accross the board.

Cheers,
Ben.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
