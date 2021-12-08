Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6110C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  8 Dec 2021 20:51:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 370C34013D;
	Wed,  8 Dec 2021 20:51:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QiS7GAyIEGFL; Wed,  8 Dec 2021 20:50:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3D41B400FC;
	Wed,  8 Dec 2021 20:50:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 111F7C001E;
	Wed,  8 Dec 2021 20:50:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1475DC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFB3A82496
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dS80cldDKL2W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:50:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD7D181010
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Dec 2021 20:50:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5D673CE2394;
 Wed,  8 Dec 2021 20:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E394C00446;
 Wed,  8 Dec 2021 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638996649;
 bh=cgGLauJN3WSyMttADxJC4UysVrmx7b6+FQJ2qOGZRX8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=r69E++mU1pI8Xd3veo2bc1L6mG2Ti5ny/ulxtYVWDLXrbMp2gbaLLGMGas7hQSvk6
 kudk/S2GYu+RtgdX8v627WQzDIF5+CR6eY+3bbfNxueq2KO9N00S3pVtAQvKfzN8eQ
 V/B8XVaJwnwIHmh9D/M/siOcTbNYIkPPJSMCWR7+1NzfaQ1G3bsWyvNqDTnkO1M3Wt
 kCcrKigr7+JhD7LJhPCo7letseiqoLklEuQkrJyzgCTH9kgHc9xGSRCCOebam5QKEY
 0jKfErqVy6yAX8B3BSGt7OyTqGUnQ4fbnlMNwrj9Yjxoal0/oBJn0YI7Uf8VlcWdtC
 abWghJhrUoc1A==
Date: Wed, 8 Dec 2021 14:50:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Fan Fei <ffclaire1224@gmail.com>
Subject: Re: [PATCH 0/7] PCI: Prefer of_device_get_match_data() over
 of_match_device()
Message-ID: <20211208205047.GA153767@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1637678103.git.ffclaire1224@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Nov 23, 2021 at 04:37:55PM +0100, Fan Fei wrote:
> Some drivers use of_match_device() in probe(), which returns a 
> "struct of_device_id *". They need only the of_device_id.data member, so 
> replace of_device_get_match_data() with of_match_device().
> 
> Fan Fei (7):
>   PCI: altera: Prefer of_device_get_match_data() over of_match_device()
>   PCI: cadence: Prefer of_device_get_match_data() over of_match_device()
>   PCI: kirin: Prefer of_device_get_match_data() over of_match_device()
>   PCI: dra7xx: Prefer of_device_get_match_data() over of_match_device()
>   PCI: keystone: Prefer of_device_get_match_data() over
>     of_match_device()
>   PCI: artpec6: Prefer of_device_get_match_data() over of_match_device()
>   PCI: dwc: Prefer of_device_get_match_data() over of_device_device()
> 
>  drivers/pci/controller/cadence/pcie-cadence-plat.c | 6 ++----
>  drivers/pci/controller/dwc/pci-dra7xx.c            | 6 ++----
>  drivers/pci/controller/dwc/pci-keystone.c          | 4 +---
>  drivers/pci/controller/dwc/pcie-artpec6.c          | 6 ++----
>  drivers/pci/controller/dwc/pcie-designware-plat.c  | 6 ++----
>  drivers/pci/controller/dwc/pcie-kirin.c            | 6 ++----
>  drivers/pci/controller/pcie-altera.c               | 8 ++++----
>  7 files changed, 15 insertions(+), 27 deletions(-)

Applied to pci/driver-cleanup for v5.17, thank you, Fan!
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
