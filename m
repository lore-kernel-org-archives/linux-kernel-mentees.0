Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F9AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 14:38:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92E4C20720
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 14:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92E4C20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6648989687;
	Wed, 15 Jul 2020 14:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUykz-OLhW4h; Wed, 15 Jul 2020 14:38:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B317389682;
	Wed, 15 Jul 2020 14:38:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93829C0895;
	Wed, 15 Jul 2020 14:38:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4543C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 14:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9DC3220437
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 14:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02SeBl0YNWgh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 14:38:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by silver.osuosl.org (Postfix) with ESMTPS id 1D417203D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 14:38:33 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-77-9crfze-iNZqlCsLzYG0IKA-1; Wed, 15 Jul 2020 15:38:30 +0100
X-MC-Unique: 9crfze-iNZqlCsLzYG0IKA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 15 Jul 2020 15:38:29 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 15 Jul 2020 15:38:29 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Oliver O'Halloran' <oohall@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Thread-Topic: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Index: AQHWWl8Tn5bD1WsSsUK40p+tBVrtaakIsp9A
Date: Wed, 15 Jul 2020 14:38:29 +0000
Message-ID: <1e2ae69a55f542faa18988a49e9b9491@AcuMS.aculab.com>
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
 <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
 <CAOSf1CEviMYySQhyQGks8hHjST-85wGpxEBasuxwSX_homBJ2A@mail.gmail.com>
In-Reply-To: <CAOSf1CEviMYySQhyQGks8hHjST-85wGpxEBasuxwSX_homBJ2A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: linux-pci <linux-pci@vger.kernel.org>, Paul
 Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>, Toan
 Le <toan@os.amperecomputing.com>, Christoph Hellwig <hch@lst.de>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Bjorn Helgaas <helgaas@kernel.org>,
 Ray Jui <rjui@broadcom.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Keith Busch <kbusch@kernel.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Richard Henderson <rth@twiddle.net>,
 Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, "Saheed O.
 Bolarinwa" <refactormyself@gmail.com>,
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

From: Oliver O'Halloran
> Sent: 15 July 2020 05:19
> 
> On Wed, Jul 15, 2020 at 8:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
...
> > - config space accesses are very rare compared to memory
> >   space access and on the hardware side the error handling
> >   would be similar, but readl/writel don't return errors, they just
> >   access wrong registers or return 0xffffffff.
> >   arch/powerpc/kernel/eeh.c has a ton extra code written to
> >   deal with it, but no other architectures do.
> 
> TBH the EEH MMIO hooks were probably a mistake to begin with. Errors
> detected via MMIO are almost always asynchronous to the error itself
> so you usually just wind up with a misleading stack trace rather than
> any kind of useful synchronous error reporting. It seems like most
> drivers don't bother checking for 0xFFs either and rely on the
> asynchronous reporting via .error_detected() instead, so I have to
> wonder what the point is. I've been thinking of removing the MMIO
> hooks and using a background poller to check for errors on each PHB
> periodically (assuming we don't have an EEH interrupt) instead. That
> would remove the requirement for eeh_dev_check_failure() to be
> interrupt safe too, so it might even let us fix all the godawful races
> in EEH.

I've 'played' with PCIe error handling - without much success.
What might be useful is for a driver that has just read ~0u to
be able to ask 'has there been an error signalled for this device?'.

I got an error generated by doing an MMIO access that was inside
the address range forwarded to the slave, but outside any of its BARs.
(Two BARs of different sizes leaves a nice gap.)
This got reported up to the bridge nearest the slave (which supported
error handling), but not to the root bridge (which I don't think does).
ISTR a message about EEH being handled by the hardware (the machine
is up but dmesg is full of messages from a bouncing USB mouse).

With such partial error reporting useful info can still be extracted.

Of course, what actually happens on a PCIe error is that the signal
gets routed to some 'board support logic' and then passed back into
the kernel as an NMI - which then crashes the kernel!
This even happens when the PCIe link goes down after we've done a
soft-remove of the device itself!
Rather makes updating the board's FPGA without a reboot tricky.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
