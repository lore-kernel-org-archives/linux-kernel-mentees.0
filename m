Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0969C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 08:07:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82BCC20657
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 08:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82BCC20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B0EB8AEFE;
	Thu, 16 Jul 2020 08:07:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0TBCeIedrO0J; Thu, 16 Jul 2020 08:07:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 94B6C8AEEE;
	Thu, 16 Jul 2020 08:07:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 835B5C0893;
	Thu, 16 Jul 2020 08:07:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02958C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F2138887B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0dgW-X9brZLJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:07:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 87AAA887B1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:07:43 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-256-PplaHSnfMy-vJii-bmgfqA-1; Thu, 16 Jul 2020 09:07:38 +0100
X-MC-Unique: PplaHSnfMy-vJii-bmgfqA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jul 2020 09:07:37 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jul 2020 09:07:37 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Benjamin Herrenschmidt' <benh@kernel.crashing.org>, Bjorn Helgaas
 <helgaas@kernel.org>
Thread-Topic: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Index: AQHWWvotn5bD1WsSsUK40p+tBVrtaakJ2CmQ
Date: Thu, 16 Jul 2020 08:07:37 +0000
Message-ID: <5a7574c0efc1475a89f84c6393e598d6@AcuMS.aculab.com>
References: <20200715221230.GA563957@bjorn-Precision-5520>
 <5d4b3a716f85017c17c52a85915fba9e19509e81.camel@kernel.crashing.org>
In-Reply-To: <5d4b3a716f85017c17c52a85915fba9e19509e81.camel@kernel.crashing.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: linux-pci <linux-pci@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Christoph Hellwig <hch@lst.de>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Keith Busch <kbusch@kernel.org>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Richard Henderson <rth@twiddle.net>,
 Juergen Gross <jgross@suse.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, "Saheed O.
 Bolarinwa" <refactormyself@gmail.com>, 'Oliver O'Halloran' <oohall@gmail.com>,
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

From: Benjamin Herrenschmidt
> Sent: 15 July 2020 23:49
> On Wed, 2020-07-15 at 17:12 -0500, Bjorn Helgaas wrote:
> > > I've 'played' with PCIe error handling - without much success.
> > > What might be useful is for a driver that has just read ~0u to
> > > be able to ask 'has there been an error signalled for this device?'.
> >
> > In many cases a driver will know that ~0 is not a valid value for the
> > register it's reading.  But if ~0 *could* be valid, an interface like
> > you suggest could be useful.  I don't think we have anything like that
> > today, but maybe we could.  It would certainly be nice if the PCI core
> > noticed, logged, and cleared errors.  We have some of that for AER,
> > but that's an optional feature, and support for the error bits in the
> > garden-variety PCI_STATUS register is pretty haphazard.  As you note
> > below, this sort of SERR/PERR reporting is frequently hard-wired in
> > ways that takes it out of our purview.
> 
> We do have pci_channel_state (via pci_channel_offline()) which covers
> the cases where the underlying error handling (such as EEH or unplug)
> results in the device being offlined though this tend to be
> asynchronous so it might take a few ~0's before you get it.

On one of my systems I don't think the error TLP from the target
made its way past the first bridge - I could see the error in it's
status registers.
But I couldn't find any of the AER status registers in the root bridge.
So I think you'd need a software poll of the bridge registers to
find out (and clear) the error.

The NMI on the dell system (which is supposed to meet some special
NEBS? server requirements) is just stupid.
Too late to be synchronous and impossible for the OS to handle.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
