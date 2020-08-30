Return-Path: <SRS0=kRYb=CI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06DFC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 08:18:08 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F3B2076D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Aug 2020 08:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F3B2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mess.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CBE1F20107;
	Sun, 30 Aug 2020 08:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FNjiSzayc1hL; Sun, 30 Aug 2020 08:18:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5438120035;
	Sun, 30 Aug 2020 08:18:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 409C8C088B;
	Sun, 30 Aug 2020 08:18:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3A9AC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8717F855CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhCwQ-EWPpW5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:18:02 +0000 (UTC)
X-Greylist: delayed 00:07:53 by SQLgrey-1.7.6
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6655A855CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Aug 2020 08:18:02 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id E4624C63F6; Sun, 30 Aug 2020 09:10:04 +0100 (BST)
Date: Sun, 30 Aug 2020 09:10:04 +0100
From: Sean Young <sean@mess.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200830081004.GA17376@gofer.mess.org>
References: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728092717.937023-1-vaibhavgupta40@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Abylay Ospan <aospan@netup.ru>, Sergey Kozlov <serjk@netup.ru>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] [media] netup_unidvb: use
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

On Tue, Jul 28, 2020 at 02:57:17PM +0530, Vaibhav Gupta wrote:
> The .suspend() and .resume() callbacks are not defined for this driver.
> Still, their power management structure follows the legacy framework. To
> bring it under the generic framework, simply remove the binding of
> callbacks from "struct pci_driver".

Unlisted fields in a static struct initializer will get set to 0 (or NULL
for pointers) already. Removing the NULL initializers will not change
anything.

Possibly you want to remove the redundant initializers but your commit
message should say so.


Sean

> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> index 80a7c41baa90..6f3125c2d097 100644
> --- a/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> +++ b/drivers/media/pci/netup_unidvb/netup_unidvb_core.c
> @@ -1016,8 +1016,6 @@ static struct pci_driver netup_unidvb_pci_driver = {
>  	.id_table = netup_unidvb_pci_tbl,
>  	.probe    = netup_unidvb_initdev,
>  	.remove   = netup_unidvb_finidev,
> -	.suspend  = NULL,
> -	.resume   = NULL,
>  };
>  
>  module_pci_driver(netup_unidvb_pci_driver);
> -- 
> 2.27.0
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
