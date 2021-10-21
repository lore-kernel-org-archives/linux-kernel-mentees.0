Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D545BC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 17:11:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78D7761A65
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 17:11:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 78D7761A65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42820407CE;
	Thu, 21 Oct 2021 17:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oqadNLuIxEXg; Thu, 21 Oct 2021 17:11:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 53BB340411;
	Thu, 21 Oct 2021 17:11:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 339E8C0033;
	Thu, 21 Oct 2021 17:11:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 703D4C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 17:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C6C26065D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 17:11:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-_x0KKs25vA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 17:11:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07A43605F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 17:11:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4352461A0A;
 Thu, 21 Oct 2021 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634836291;
 bh=Q03u5Qex8eKAItP0Dg2YZHdrmPOdGUpwH80kTAfzZxI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Td5mGM7w14Slx9FIzv7BOb28GJoHrB9ns/c4MS4UE5lQCExsNbqqBd7gbnQBfGK6d
 wCxieyrBp59hT2zKHPX6adnJws0vsRC9Sz+bubNuDJ6BlWOBOwuh6OWp92vMmSALXk
 ET8S21c0NbukPIMV1IoLs4s0V9meVjRT+WnoP5VUEHnqTr3J8/jQQRxcEAAym2TPR9
 YK+2Mxgf1DT4IBJEH8GBr8iGvsGquy5OFgog5NihLEVIZHqbw9WvybbrpeL0RXJ7cm
 csOEwYACYrD8Q33ogHm2srHLkyKi5Z1cLiH/+8dNAXVEDbUINAVTuB6JcJ3iBZTlBX
 C2fA8AKo22srQ==
Date: Thu, 21 Oct 2021 12:11:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing
 AER registers
Message-ID: <20211021171130.GA2701430@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021165330.lcqajtwej4s7oadt@theprophet>
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, oohall@gmail.com, ruscur@russell.cc,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Oct 21, 2021 at 10:23:30PM +0530, Naveen Naidu wrote:
> On 20/10, Bjorn Helgaas wrote:
> > On Tue, Oct 05, 2021 at 10:48:12PM +0530, Naveen Naidu wrote:

> > > In EDR path, AER status registers are cleared irrespective of whether
> > > the error was an RP PIO or unmasked uncorrectable error. But in DPC, the
> > > AER status registers are cleared only when it's an unmasked uncorrectable
> > > error.
> > > 
> > > This leads to two different behaviours for the same task (handling of
> > > DPC errors) in FFS systems and when native OS has control.
> > 
> > FFS?
> 
> Firmware First Systems

I assumed that's what it was, but it's helpful to use the same terms
used by the specs to make things easier to find.  I don't think it's
actually the case that "Firmware First" necessary applies to the
entire system, since the ACPI FIRMWARE_FIRST flag is a per-error
source thing, not a per-system thing.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
