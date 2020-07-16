Return-Path: <SRS0=x3JG=A3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88741C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 08:19:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5593B2074B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 16 Jul 2020 08:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5593B2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3402B8949E;
	Thu, 16 Jul 2020 08:19:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u6AGKofhPpNy; Thu, 16 Jul 2020 08:19:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9784589480;
	Thu, 16 Jul 2020 08:19:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E594C07FF;
	Thu, 16 Jul 2020 08:19:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DC5DDC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CA265884AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DAcvl3XHCU57
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:18:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A977187BDE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 16 Jul 2020 08:18:47 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-49-8A3qEGEvNG-fIwJc6vWVRQ-1; Thu, 16 Jul 2020 09:18:43 +0100
X-MC-Unique: 8A3qEGEvNG-fIwJc6vWVRQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jul 2020 09:18:41 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jul 2020 09:18:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Bjorn Helgaas' <helgaas@kernel.org>
Thread-Topic: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
Thread-Index: AQHWWnPXll7fc/pDfESpF9qKWOuIcakIsKIAgABwtYCAALseUA==
Date: Thu, 16 Jul 2020 08:18:41 +0000
Message-ID: <f8022e41f3384d57a3802aafe8187e9a@AcuMS.aculab.com>
References: <4c994d9a804b4a2c8555c50b63e20772@AcuMS.aculab.com>
 <20200715220135.GA563272@bjorn-Precision-5520>
In-Reply-To: <20200715220135.GA563272@bjorn-Precision-5520>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Keith Busch <kbusch@kernel.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux <sparclinux@vger.kernel.org>, Toan Le <toan@os.amperecomputing.com>,
 Kjetil Oftedal <oftedal@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Michael Ellerman <mpe@ellerman.id.au>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christoph Hellwig <hch@lst.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-pci <linux-pci@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, 'Arnd Bergmann' <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Jens Axboe <axboe@fb.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Richard
 Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
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

From: Bjorn Helgaas
> Sent: 15 July 2020 23:02
> 
> On Wed, Jul 15, 2020 at 02:24:21PM +0000, David Laight wrote:
> > From: Arnd Bergmann
> > > Sent: 15 July 2020 07:47
> > > On Wed, Jul 15, 2020 at 1:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > >
> > >  So something like:
> > > >
> > > >   void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)
> > > >
> > > > and where we used to return anything non-zero, we just set *val = ~0
> > > > instead?  I think we do that already in most, maybe all, cases.
> > >
> > > Right, this is what I had in mind. If we start by removing the handling
> > > of the return code in all files that clearly don't need it, looking at
> > > whatever remains will give a much better idea of what a good interface
> > > should be.
> >
> > It would be best to get rid of that nasty 'u16 *' parameter.
> 
> Do you mean nasty because it's basically a return value, but not
> returned as the *function's* return value?  I agree that if we were
> starting from scratch it would nicer to have:
> 
>   u16 pci_read_config_word(struct pci_dev *dev, int where)
> 
> but I don't think it's worth changing the thousands of callers just
> for that.

It'll shrink the kernel text size somewhat.
It could also be 'fixed' with a static inline.

Actually you don't even want the result to be u16.
Even though the domain of the value is 0..65535 keeping
the type as int (or unsigned int) will save the compiler
having to generate lots of masking instructions.

Code performance here will be overwhelmed by the time taken
for the config space access.
But more generally all local variables should really be
the size of cpu registers.

On x86-64 you need to use 'unsigned int' for anything used
as array subscripts to avoid the 'sign extend' instructions.
In some code paths it may matter...

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
