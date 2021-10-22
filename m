Return-Path: <SRS0=hpie=PK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16298C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Oct 2021 07:10:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EE456109F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Oct 2021 07:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EE456109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6661180FF2;
	Fri, 22 Oct 2021 07:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_xF2Rfl01mN; Fri, 22 Oct 2021 07:10:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AD3B580F3D;
	Fri, 22 Oct 2021 07:10:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87744C0020;
	Fri, 22 Oct 2021 07:10:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FD78C001E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Oct 2021 07:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1B9060665
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Oct 2021 07:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiD7mbvc1uuD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Oct 2021 07:10:49 +0000 (UTC)
X-Greylist: delayed 00:08:56 by SQLgrey-1.8.0
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net
 [IPv6:2a01:37:3000::53df:4ef0:0])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8EFA60638
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Oct 2021 07:10:48 +0000 (UTC)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "*.hostsharing.net",
 Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
 by bmailout2.hostsharing.net (Postfix) with ESMTPS id A42C028005312;
 Fri, 22 Oct 2021 09:01:48 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
 id 979BF16E5C7; Fri, 22 Oct 2021 09:01:48 +0200 (CEST)
Date: Fri, 22 Oct 2021 09:01:48 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v3 18/25] PCI: pciehp: Use RESPONSE_IS_PCI_ERROR() to
 check read from hardware
Message-ID: <20211022070148.GB17656@wunner.de>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <c21290fe02a7a342a8b93c692586b6a2b6cde9e0.1634825082.git.naveennaidu479@gmail.com>
 <20211021152253.pqc6xp3vnv5fpczj@theprophet>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021152253.pqc6xp3vnv5fpczj@theprophet>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Thu, Oct 21, 2021 at 08:52:53PM +0530, Naveen Naidu wrote:
> Lukas, I have not added your Acked-by tag from the v1 [1] of the patch 
> series, since the RESPONSE_IS_PCI_ERROR macro definition slightly 
> changed. I hope this was the right thing to do.
[...]
> If that is not the case please let me know. But I am not sure what to
> do here? If RESPONSE_IS_PCI_ERROR does not fit here, should the right
> option would be to revert/remove this patch from the series?

My Acked-by still stands.  As for the macro name, I'm fine with
whatever Bjorn and the community settle on. :)

Thanks,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
