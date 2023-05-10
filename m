Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A690EC77B7D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 07:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B097844B9;
	Wed, 10 May 2023 07:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B097844B9
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=tJa8a0Kb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IojDGxNt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xnu6eBoVoFKG; Wed, 10 May 2023 07:57:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 629DB844AC;
	Wed, 10 May 2023 07:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 629DB844AC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DC35C0036;
	Wed, 10 May 2023 07:57:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CF01C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C5FFD41FB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:57:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5FFD41FB5
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com
 header.a=rsa-sha256 header.s=fm3 header.b=tJa8a0Kb; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IojDGxNt
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a8Z1GHzMH00T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:57:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D442741E0F
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D442741E0F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 07:57:21 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 833672B0681C;
 Wed, 10 May 2023 03:57:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 10 May 2023 03:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1683705438; x=1683712638; bh=lu
 YuF/JxvULVmeDkbLyw1Zb3ZU/LU2UPbqzZwwIFgXw=; b=tJa8a0KbkrvxLGCR7o
 RenGyf/IB6qR1pixLlCkrrhzyY4nd6Hgh0GBNTsFmBpS0yMjL74a8jbaxz46Idci
 SbSk8gDCdjUF9MktAUpyyVurrve2RX/OUlZjer7wv7lNpvic911D/4E4OEUyg5Yl
 CsNBemqmjUcJsRVRfTneLAqz0mVFo75fWmzQg8OUbugSCgDvE8FdJDVbm4Dbqmoj
 1YpZKNl8oNskPtS6BxXH1Lq3mUjh400ZR/q5wuj6GCk5qtV6r3N/A94Sxu0Mv5Nc
 saY5yq+lnqIzpNAnBPijBvK8V0ZnoKZomnU0ISU4+RW7lk093hW9aX5chyoEv5kR
 PMtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1683705438; x=1683712638; bh=luYuF/JxvULVm
 eDkbLyw1Zb3ZU/LU2UPbqzZwwIFgXw=; b=IojDGxNtfD0DJ2+CDtWHQSSGfufa3
 mL3zg7qEiV1DwRNj71zq5VhPgXz26dFRGtLgymYCP7w5nSNkImbCcIwUctOOm7/B
 ILWPc13tLoAl3sR8mTTKHxmONTLbjgfmpSWPs1lOuK8U9zXaZi11/wdQnTnqsNa0
 fk9xG4zZO8A/FbAQfy7FJOgON5rUl9is5pA99i6YUy6B0NoO3wsQm+3c64IcgMpn
 lFCY54lj9He2nNNY8D5OKNO+zkZcWTMElhVf+R6m4KGjeXdzVCUDRhD+BDi0wTeA
 P/w+qzj0IDnU03FOBPAkIyURywhEcUJomw7TS5cJzS2/BCp/dOUZTwQ9w==
X-ME-Sender: <xms:XU5bZMf7Es_B0mwWdMR6GPrBKUfqIBy8Fv2iQcwsFpJEzP-LUx33qg>
 <xme:XU5bZOMZtC6bj_qHm8gMWnmPqo6h9LwJqGP9JE4E7mQwNeBHLJ3ZhwG-0B2G4kmbj
 5GCo-AXCaGUyw>
X-ME-Received: <xmr:XU5bZNhPlWCTwCYTsx7F-DVagjVKZm_GDne2UCLTFm9eOeG9JFudqwkmx0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeggedgtdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttd
 ertddttddvnecuhfhrohhmpefirhgvghcumffjuceoghhrvghgsehkrhhorghhrdgtohhm
 qeenucggtffrrghtthgvrhhnpeehgedvvedvleejuefgtdduudfhkeeltdeihfevjeekje
 euhfdtueefhffgheekteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:XU5bZB97UnXv30emiW9sr70rvQi2LVWwvNxvEf-JAoLlrxnFx0dAJg>
 <xmx:XU5bZIsKlK22zhz6WYqNwgO7ZnD9qhkdh6gJmsYnXuZzK5TdRaKDqA>
 <xmx:XU5bZIH7i6ymzx6TM4i5eFMSOp4qcaSjBHhPECWvkwh2qGSziJl6Cg>
 <xmx:Xk5bZB6scUFm3rT8fS8eGVX945sSW2Q7ZKiIHhmaToKgTntgMO0ltQpY_qg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 May 2023 03:57:16 -0400 (EDT)
Date: Wed, 10 May 2023 09:57:14 +0200
From: Greg KH <greg@kroah.com>
To: Vincenzo Palazzo <vincenzopalazzodev@gmail.com>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
Message-ID: <2023051014-foe-multiply-ffff@gregkh>
References: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

On Tue, May 09, 2023 at 05:39:12PM +0200, Vincenzo Palazzo wrote:
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -38,6 +38,10 @@
>  #include "../pci.h"
>  #include "pcie-rockchip.h"
>  
> +/* bus_scan_delay - module parameter to override the
> + * device tree value, which is 0 by default. */
> +static int bus_scan_delay = -1;

Please do not add new module parameters, this is not the 1990's anymore.
We have per-device settings everywhere, this makes that impossible.
Just use a DT value, if it is wrong, then fix the DT value!  No need to
have the kernel override it, that's not what DT files are for.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
