Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4108DC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 22:01:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF0B62067D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 22:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcJGbRPs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF0B62067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5A2E8919A;
	Wed, 15 Jul 2020 22:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1hXeWdGxlgs; Wed, 15 Jul 2020 22:01:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B2CA988A71;
	Wed, 15 Jul 2020 22:01:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 994F5C07FF;
	Wed, 15 Jul 2020 22:01:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECA7CC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D82FE899EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1n12e9Y8ADbX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:01:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4A86A8991C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 22:01:38 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6936020657;
 Wed, 15 Jul 2020 22:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594850497;
 bh=Dz/aXCXx6hEm65ykjKGAALSDHDgV9W4n51TE8HVaNyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=AcJGbRPssyYC0nJ+ZVPaX639DVjl/UswzmNpCfYtIJ/9lFmLiqEsM8Oe+PVOaMtjA
 8PYZFuxwlwNeaxYlaY0rRvuyKueHVRBBr22r3PeGhVh/B0wzpcKP+NZFvlFVPKec7F
 rA+SlkNjfyr5hBkmPyt0Czd/Rsugt1iAY+IfWurU=
Date: Wed, 15 Jul 2020 17:01:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: David Laight <David.Laight@ACULAB.COM>
Message-ID: <20200715220135.GA563272@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4c994d9a804b4a2c8555c50b63e20772@AcuMS.aculab.com>
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

On Wed, Jul 15, 2020 at 02:24:21PM +0000, David Laight wrote:
> From: Arnd Bergmann
> > Sent: 15 July 2020 07:47
> > On Wed, Jul 15, 2020 at 1:46 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > 
> >  So something like:
> > >
> > >   void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)
> > >
> > > and where we used to return anything non-zero, we just set *val = ~0
> > > instead?  I think we do that already in most, maybe all, cases.
> > 
> > Right, this is what I had in mind. If we start by removing the handling
> > of the return code in all files that clearly don't need it, looking at
> > whatever remains will give a much better idea of what a good interface
> > should be.
> 
> It would be best to get rid of that nasty 'u16 *' parameter.

Do you mean nasty because it's basically a return value, but not
returned as the *function's* return value?  I agree that if we were
starting from scratch it would nicer to have:

  u16 pci_read_config_word(struct pci_dev *dev, int where)

but I don't think it's worth changing the thousands of callers just
for that.

> Make the return int and return the read value or -1 on error.
> (Or maybe 0xffff0000 on error??)
> 
> For a 32bit read (there must be one for the BARs) returning
> a 64bit signed integer would work even for 32bit systems.
> 
> If code cares about the error, and it can be detected then
> it can check. Otherwise the it all 'just works'.

There are u8 (byte), u16 (word), and u32 (dword) config reads &
writes.  But I don't think it really helps to return something wider
than the access.  For programmatic errors like invalid alignment, we
could indeed use the extra bits to return an unambiguous error.  But
we still have the "device was unplugged" sort of errors where the
*hardware* typically returns ~0 and the config accessor doesn't know
whether that's valid data or an error.

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
