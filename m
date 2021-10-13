Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8EFC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 12:25:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB17F60F23
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 12:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB17F60F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2591407CD;
	Wed, 13 Oct 2021 12:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XrC60v6T0lT9; Wed, 13 Oct 2021 12:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D82E1406B1;
	Wed, 13 Oct 2021 12:25:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6977C000F;
	Wed, 13 Oct 2021 12:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58AF1C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 12:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B865608D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 12:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ac3jY056fBWt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 12:25:34 +0000 (UTC)
X-Greylist: delayed 00:05:09 by SQLgrey-1.8.0
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net
 [83.223.95.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 212296066E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 12:25:34 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout1.hostsharing.net (Postfix) with ESMTPS id 665DF3002AD66;
 Wed, 13 Oct 2021 14:20:19 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 52E72184F9A; Wed, 13 Oct 2021 14:20:19 +0200 (CEST)
Date: Wed, 13 Oct 2021 14:20:19 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 16/22] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Message-ID: <20211013122019.GA17324@wunner.de>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <36c7c3005c4d86a6884b270807d84433a86c0953.1633972263.git.naveennaidu479@gmail.com>
 <20211011194740.GA14357@wunner.de>
 <20211012160505.3dov6gjnmxdq5lz6@theprophet>
 <20211012231201.xj7fvfgvpde5wwrl@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211012231201.xj7fvfgvpde5wwrl@pali>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com,
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

On Wed, Oct 13, 2021 at 01:12:01AM +0200, Pali Roh=E1r wrote:
> > On 11/10, Lukas Wunner wrote:
> > > On Mon, Oct 11, 2021 at 11:37:33PM +0530, Naveen Naidu wrote:
> > > > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > > > causes a PCI error.  There's no real data to return to satisfy the
> > > > CPU read, so most hardware fabricates ~0 data.
> > > > =

> > > > Use RESPONSE_IS_PCI_ERROR() to check the response we get when we re=
ad
> > > > data from hardware.
> > > =

> > > Actually what happens is that PCI read transactions *time out*,
> > > so the host controller fabricates a response.
> =

> This is not fully correct. 0xffffffff is returned when some error
> happens. It does not have to be timeout error. Errors like Unsupported
> Request, Completer Abort or Configuration Request Retry Status (when
> CRSSVE bit is disabled) are also reported as 0xffffffff and they do not
> represent timeout. For example Unsupported Request is returned when you
> try to read from non-existent device behind some PCIe switch.

This particular patch concerns pciehp and in that context,
"all ones" responses are predominantly timeouts caused by
hot-removed devices.

Thanks,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
