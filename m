Return-Path: <SRS0=RDF/=BM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50173C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 14:59:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2208C2072A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  2 Aug 2020 14:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="dIk0yrLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2208C2072A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6C7085A5A;
	Sun,  2 Aug 2020 14:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GG440aa5RvP5; Sun,  2 Aug 2020 14:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 924588567A;
	Sun,  2 Aug 2020 14:59:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79B79C0051;
	Sun,  2 Aug 2020 14:59:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC61C004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 14:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8600F87D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 14:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id np4Hkk-wkmfB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 14:59:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F10CE87CDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  2 Aug 2020 14:59:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596380368; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=BKtA1y2+cg1n0Oxr+QAJxIgbuRnTbM/9xV3TLuWzV9E=;
 b=dIk0yrLxl1Y6oD3jYOM3sdorIRVQuGfrICOLVKnnhtBXNEAnfdVoc/nANL2vGjvdNSapf5yT
 bcroRMNANHlDM6GlQfiBmyPRvmyFOAUqU+Tub5wXRxLDAMrhnle2dCiLQw+DiBlUmEXpDRKR
 VzDQHdDjZ7Hzg+DjPFWOVW/vZUo=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1ODQyZiIsICJsaW51eC1rZXJuZWwtbWVudGVlc0BsaXN0cy5saW51eGZvdW5kYXRpb24ub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5f26d4c6b59946e9e3add8bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 02 Aug 2020 14:59:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E41AAC433C6; Sun,  2 Aug 2020 14:59:17 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61ABAC433C9;
 Sun,  2 Aug 2020 14:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61ABAC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200721125514.145607-1-vaibhavgupta40@gmail.com>
References: <20200721125514.145607-1-vaibhavgupta40@gmail.com>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200802145917.E41AAC433C6@smtp.codeaurora.org>
Date: Sun,  2 Aug 2020 14:59:17 +0000 (UTC)
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 netdev@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] prism54: islpci_hotplug: use
	generic power management
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

Vaibhav Gupta <vaibhavgupta40@gmail.com> wrote:

> Drivers using legacy power management .suspen()/.resume() callbacks
> have to manage PCI states and device's PM states themselves. They also
> need to take care of standard configuration registers.
> 
> Switch to generic power management framework using a single
> "struct dev_pm_ops" variable to take the unnecessary load from the driver.
> This also avoids the need for the driver to directly call most of the PCI
> helper functions and device power state control functions as through
> the generic framework, PCI Core takes care of the necessary operations,
> and drivers are required to do only device-specific jobs.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>

Patch applied to wireless-drivers-next.git, thanks.

81cf72b74671 prism54: islpci_hotplug: use generic power management

-- 
https://patchwork.kernel.org/patch/11675653/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
