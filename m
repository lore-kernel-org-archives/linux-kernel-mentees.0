Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB95CC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 02:13:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722B760C4A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 02:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 722B760C4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3869E4011A;
	Wed, 13 Oct 2021 02:13:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdn356py3s47; Wed, 13 Oct 2021 02:13:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D543B400E5;
	Wed, 13 Oct 2021 02:13:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF039C0011;
	Wed, 13 Oct 2021 02:13:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 498F0C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D15D82803
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2j96Tk7SVxIp
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:13:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4553A825C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 02:13:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 30DE560E0C;
 Wed, 13 Oct 2021 02:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634091192;
 bh=KiCOpXJtLtS5DgA89L5VHZVV6seYAK79kT/+26LXy+U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rbsD9cK4wZlyphGRjfr1ysvki7scvQqV5s3dfffPqIGaP/N/LkDsfLMB+d5CagphS
 4M4P783zd6dkXrVo7WRLzDUp/GDS2oqlaABys/puDUZ1JQ45KFZ5KXbai237P1udeA
 fPugekLr4JfA5M5S/mMyCGYl6R8tVZrXA7SZXhZL6mMg3bwwGcWh40vCqGEHo14LI7
 tJBBW68o+EI+RR10wK8fdNONA1j4Qp7GF2qZ6SPG3aJX4L7KiEjcgez7IKGkl6DiCw
 2wjGw63KR530UJz0DU17dQu12Spzf/cU+dG+gA33w5ZmtyYyQcR+ClKZWwnYeIKLEo
 co8UKkygxVpqw==
Date: Tue, 12 Oct 2021 21:13:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 09/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when
 device not found
Message-ID: <20211013021310.GA1864069@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211012155928.3nuyzgrgvyjm2v3r@theprophet>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bhelgaas@google.com,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 "moderated list:PCI DRIVER FOR AARDVARK \(Marvell Armada 3700\)"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Oct 12, 2021 at 09:29:28PM +0530, Naveen Naidu wrote:
> On 11/10, Pali Roh=E1r wrote:
> > On Monday 11 October 2021 23:55:35 Naveen Naidu wrote:
> > > On 11/10, Pali Roh=E1r wrote:
> > > > On Monday 11 October 2021 23:26:33 Naveen Naidu wrote:
> > > > > An MMIO read from a PCI device that doesn't exist or doesn't resp=
ond
> > > > > causes a PCI error.  There's no real data to return to satisfy the
> > > > > CPU read, so most hardware fabricates ~0 data.
> > > > > =

> > > > > Use SET_PCI_ERROR_RESPONSE() to set the error response, when a fa=
ulty
> > > > > read occurs.
> > > > > =

> > > > > This helps unify PCI error response checking and make error check
> > > > > consistent and easier to find.
> > > > > =

> > > > > Compile tested only.
> > > > > =

> > > > > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > > > > ---
> > > > >  drivers/pci/controller/pci-aardvark.c | 8 ++++----
> > > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/=
controller/pci-aardvark.c
> > > > > index 596ebcfcc82d..dc2f820ef55f 100644
> > > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > > @@ -894,7 +894,7 @@ static int advk_pcie_rd_conf(struct pci_bus *=
bus, u32 devfn,
> > > > >  	int ret;
> > > > >  =

> > > > >  	if (!advk_pcie_valid_device(pcie, bus, devfn)) {
> > > > > -		*val =3D 0xffffffff;
> > > > > +		SET_PCI_ERROR_RESPONSE(val);
> > > > =

> > > > Hello! Now I'm looking at this macro, and should not it depends on
> > > > "size" argument? If doing 8-bit or 16-bit read operation then shoul=
d not
> > > > it rather sets only low 8 bits or low 16 bits to ones?

> > Function itself is declared as:
> > =

> > static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where,=
 int size, u32 *val);
> > =

> > And in "size" argument is stored number of bytes, kind of read operation
> > (read byte, read word, read dword). In *val is then stored read value.
> > For byte operation, just low 8 bits in *val variable are set.
> > =

> > Because *val is u32 it means that typeof(*val) is always 4 independently
> > of the "size" argument.
> > =

> > For example other project U-Boot has also pci-aardvark.c driver and
> > U-Boot has for (probably same) purpose pci_get_ff() macro, see:
> > https://source.denx.de/u-boot/u-boot/-/blob/v2021.10/drivers/pci/pci-aa=
rdvark.c#L367
> > =

> > I'm not saying if current approach to always sets 0xffffffff
> > (independently of "size" argument) is correct or not as I do not know
> > it too! I'm just giving example that this PCI code has very similar
> > implementation of other project (U-Boot) which sets number of ones based
> > on the size argument.

I don't think there's an issue here.  advk_pcie_rd_conf() can set the
whole u32 to 0xffffffff regardless of the "size" value because
pci_bus_read_config_byte() and pci_bus_read_config_word() extract out
the part they need:

  res =3D bus->ops->read(bus, devfn, pos, len, &data);              \
  *value =3D (type)data;                                            \

where "type" is u8 or u16 (this is hard to grep for; it's in the
PCI_OP_READ() macro in drivers/pci/access.c).

> I am not sure too, if we would like to have something like pci_get_ff()
> which sets the return mask based on the size.

I'd like to see how pci_get_ff() works because this is potentially a
widespread, invasive change and it's always better to copy a good
existing design than to make up something new.

> > Anyway, I very like this your idea to have a macro which purpose is to
> > explicitly indicate error during config read operation! And to unify all
> > drivers to use same style for signalling config read error.

I definitely think there's a lot of value in making this consistent
*somehow*, so thanks for working on this!

Bjorn
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
