Return-Path: <SRS0=TY1r=PB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD44C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 22:03:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E3860F3A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 13 Oct 2021 22:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13E3860F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED2C60D78;
	Wed, 13 Oct 2021 22:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eKYgOy5ZLWPw; Wed, 13 Oct 2021 22:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 12E2360D75;
	Wed, 13 Oct 2021 22:03:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3240C0011;
	Wed, 13 Oct 2021 22:03:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F9F6C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8A2F60D76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hNukxdj4iJIG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61E7560D75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Oct 2021 22:03:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5CF0610CE;
 Wed, 13 Oct 2021 22:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634162597;
 bh=e6Vbm4yp7xvXhw5QyTAzwWmSLUWIUDk7Gr5Hr+bJzP4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F5BTdUjF5GBsZXf6TNFcyUlmumdcwehRsYioroL1Q2VLZVmVzg2lGK/4Unpsu8Je/
 ycKw1VPw9OZyygtXpI70bnJnkB8ZhtyuJoLLmol/K5u/DgFWr6BG4n4YZUnsu3dCRf
 LS1Kzwvd9isv4FuapMLd3xudWfaaYe1BUzaKwZKiBZMD+EourUt3uFCtSXxSI1K1DC
 Xa2nCBLHxOEZzwhdg5YqrPva2rOShkNoq3INIXTB+bCagCwuhbhSGIEJ475ZSdrlMB
 WHvDw9nVQ072C/erA6LjEwEDzHo2YN1q4h32arbRpMpbsrgxQwdYU8PYsH2y/AwvLk
 XU7z58zGuPnaA==
Received: by pali.im (Postfix)
 id 023C97FF; Thu, 14 Oct 2021 00:03:14 +0200 (CEST)
Date: Thu, 14 Oct 2021 00:03:14 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 02/22] PCI: Unify PCI error response checking
Message-ID: <20211013220314.pz3dzskd23axkdg4@pali>
References: <YWS1QtNJh7vPCftH@robh.at.kernel.org>
 <20211013024355.GA1865721@bhelgaas>
 <CAL_JsqLobP9MM0EFnof_nDOBrox=gKH3xe3EQbqPceq8pRRgyA@mail.gmail.com>
 <20211013171653.zx4sxdzhvy2ujytd@theprophet>
 <CAL_JsqL0d4qOR+wsnpdRUc+EQ6_diUzPbMj3Tv-Ly29or6Asvw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqL0d4qOR+wsnpdRUc+EQ6_diUzPbMj3Tv-Ly29or6Asvw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: PCI <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
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

On Wednesday 13 October 2021 16:47:43 Rob Herring wrote:
> On Wed, Oct 13, 2021 at 12:17 PM Naveen Naidu <naveennaidu479@gmail.com> wrote:
> > The thread does bring up a good point, about not returning any error
> > values in pci_read_config_*() and converting the function definition to
> > something like
> >
> >   void pci_read_config_word(struct pci_dev *dev, int where, u16 *val)
> >
> > The reason stated in the thread was that, the error values returned from
> > these functions are either ignored or are not used properly. And
> > whenever an error occurs, the error value ~0 is anyway stored in val, we
> > could use that to test errors.
> 
> Presumably, there could be some register somewhere where all 1s is
> valid? So I think we need the error values.

I guess that "Prefetchable Base/Limit Upper 32 Bits" PCI registers can
contains all-ones value and it is valid value in these registers.

And also PCIe regs like "Slot Capabilities Register" can also have all
bits set.

So 0xffffffff does not mean that error happened. It is needed some
application logic which can decide based on other things (like register
number, device state, etc...) if 0xffffffff indicates error or not.

Therefore return errno values can help, but only for controllers which
provide this additional errno information.

> Also, I seem to recall only the vendor/device IDs are defined to be
> all 1s for non-existent devices. Other errors are undefined?

In PCIe spec for vendor id register is mentioned that 0xffff indicates
no Function is present.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
