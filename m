Return-Path: <SRS0=RTaY=BH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D43C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 20:04:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF212065E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jul 2020 20:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VbcJ1DiA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CF212065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35671883D7;
	Tue, 28 Jul 2020 20:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qv6HeKQihUUB; Tue, 28 Jul 2020 20:04:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C423C883B7;
	Tue, 28 Jul 2020 20:04:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA2B8C0050;
	Tue, 28 Jul 2020 20:04:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B450DC004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 20:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 74060883B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 20:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t5fK58P7i063
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 20:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AF815883B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jul 2020 20:04:15 +0000 (UTC)
Received: from localhost (mobile-166-175-62-240.mycingular.net
 [166.175.62.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BEF22065C;
 Tue, 28 Jul 2020 20:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595966655;
 bh=HK9+5a3U0dOMIeI24gLVh05vN2DyqhK9yZq8rvNgwyk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=VbcJ1DiA/1z3TFiwQzadcYJoGqKMQKFyWA1TZUuqLqRlwKX7rO/akEgvZGFokCMRN
 iLc4KnCOvB22INR4XqzgZ79U+P8DSSsYd91wqgoXQ8UKR2Df3eTCb0c6hwoutzkPkZ
 ON8qZGEOWQxNKLvHnqbEdOo7ywhzhaXU+mgzxvJ0=
Date: Tue, 28 Jul 2020 15:04:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Message-ID: <20200728200413.GA1857901@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200728042809.91436-1-vaibhavgupta40@gmail.com>
Cc: linux-kernel@vger.kernel.org, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 netdev@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-kernel-mentees] [PATCH v1] farsync: use generic power
	management
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

On Tue, Jul 28, 2020 at 09:58:10AM +0530, Vaibhav Gupta wrote:
> The .suspend() and .resume() callbacks are not defined for this driver.
> Still, their power management structure follows the legacy framework. To
> bring it under the generic framework, simply remove the binding of
> callbacks from "struct pci_driver".

FWIW, this commit log is slightly misleading because .suspend and
.resume are NULL by default, so this patch actually is a complete
no-op as far as code generation is concerned.

This change is worthwhile because it simplifies the code a little, but
it doesn't convert the driver from legacy to generic power management.
This driver doesn't supply a .pm structure, so it doesn't seem to do
*any* power management.

> Change code indentation from space to tab in "struct pci_driver".
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/net/wan/farsync.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wan/farsync.c b/drivers/net/wan/farsync.c
> index 7916efce7188..15dacfde6b83 100644
> --- a/drivers/net/wan/farsync.c
> +++ b/drivers/net/wan/farsync.c
> @@ -2636,12 +2636,10 @@ fst_remove_one(struct pci_dev *pdev)
>  }
>  
>  static struct pci_driver fst_driver = {
> -        .name		= FST_NAME,
> -        .id_table	= fst_pci_dev_id,
> -        .probe		= fst_add_one,
> -        .remove	= fst_remove_one,
> -        .suspend	= NULL,
> -        .resume	= NULL,
> +	.name		= FST_NAME,
> +	.id_table	= fst_pci_dev_id,
> +	.probe		= fst_add_one,
> +	.remove		= fst_remove_one,
>  };
>  
>  static int __init
> -- 
> 2.27.0
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
