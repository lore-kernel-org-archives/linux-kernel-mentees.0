Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46388C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 10:02:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1895C2068F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 10:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="dSNDq5fq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1895C2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D922489611;
	Mon, 13 Jul 2020 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0omeX+YPQq5w; Mon, 13 Jul 2020 10:02:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3B03889E8;
	Mon, 13 Jul 2020 10:02:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC337C0888;
	Mon, 13 Jul 2020 10:02:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E599C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 175C724DFD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:02:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m97DstA2ykG9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:01:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net
 [194.109.24.24])
 by silver.osuosl.org (Postfix) with ESMTPS id 7E1A723265
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 10:01:58 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud7.xs4all.net with ESMTPA
 id uvHTj6d52GLmCuvHXjAusU; Mon, 13 Jul 2020 12:01:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1594634516; bh=Qvmhkqy8a9fuPe1CeKmBjQ4cwdl+ZofLMoa2K+Ph6Jw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=dSNDq5fq0noaKLmUIOxNZXt4OQrZfN0Rr0TxTQIi+DVUwGWLEPXyfct+USQuhYe1J
 DSU9NMQMNd44ekjlUOtNHvDkj3N75EQkV0dK0eB9JN2V2AXm1m+YPrGj8aBtSKz2yI
 55RCKsNFrn97ONJ1k76E1/bbH1ApaSHnX/yltJDGwIL4VLMJhi58SzX8Hqwn0ouEFi
 JiNhxgjcY4vpdT8wfxzhE9cJWat75KjROnvAMMXW02pxqDWo1lVmnjy0VO3268g4iQ
 +2rYLjhuBIkgsXoGkvn3msJJw7tErLsrk4RSQ6yeosChTXWsDXn6Lz19AL43Rj/FB1
 bA1zduNYFQnXw==
To: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 bjorn@helgaas.com, Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200629073604.205478-1-vaibhavgupta40@gmail.com>
 <20200629073604.205478-3-vaibhavgupta40@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c4a46846-208f-c834-56d7-02543c395795@xs4all.nl>
Date: Mon, 13 Jul 2020 12:01:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200629073604.205478-3-vaibhavgupta40@gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfEgDG4469ro2DKZtOFm+RMAiztJsuP9cXotS0TmKFGSp+9SgAmFhYVWhxx8yl1HV3fhJ0MUp67jAVE65zOxo52NzY9xIlIT4UHuJ5eIKrEQOM4LDUySb
 NgT01kC82efUbFUt0D2pfcDAlO7NOj0g1HAx5eODA2118fHYGLTjGvV65hvujMh1Kz/ZBgGV1FJERCgwknLrHWRkb68/0KqJkSjmLUSh8rlupLyIlpXI1sxL
 pttMKR+pabmKYUydmGw3JtBPaxZv1SXfsUcriO17OD3CRQIt17Ib15JgVW/GXbPYpnYofun0Y0Fv1JCXIKXN+d4QGY8N/y07yAUMW9B5Sz3PwiFf+8X+Aloc
 pSF3EBCnXi4bNNx+oG6C1AoUys5Tvw1Vtm1qy0OWsP3+AuOUISE5qP0/Dt/BXyILhVLlgj/HAywqgLGUhCxJkcfkE1zx+YW9DITON62v++oNDWzT4xUlHbxO
 vjB81y8ZqBQaG2D4Dz4+/X/8JASOUyBBLQwR0MF2PnoBAZ/hlQKxyCKT0ok=
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1 2/6] [media] cx23885: use
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

On 29/06/2020 09:36, Vaibhav Gupta wrote:
> The .suspend() and .resume() callbacks are not defined for this driver.
> Still, their power managemgement stucture can be easily upgraded to

management structure

> gemeric, without affecting its normal behaviour.

generic

> 
> Hence, define them NULL and use struct dev_pm_ops type to bind them.
> 
> Compile-tested only.
> 
> Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
> ---
>  drivers/media/pci/cx23885/cx23885-core.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/pci/cx23885/cx23885-core.c b/drivers/media/pci/cx23885/cx23885-core.c
> index 7e0b0b7cc2a3..da9ee7270dfd 100644
> --- a/drivers/media/pci/cx23885/cx23885-core.c
> +++ b/drivers/media/pci/cx23885/cx23885-core.c
> @@ -2230,14 +2230,18 @@ static const struct pci_device_id cx23885_pci_tbl[] = {
>  };
>  MODULE_DEVICE_TABLE(pci, cx23885_pci_tbl);
>  
> +#define cx23885_suspend NULL
> +#define cx23885_resume NULL
> +
> +static SIMPLE_DEV_PM_OPS(cx23885_pm_ops, cx23885_suspend, cx23885_resume);
> +
>  static struct pci_driver cx23885_pci_driver = {
> -	.name     = "cx23885",
> -	.id_table = cx23885_pci_tbl,
> -	.probe    = cx23885_initdev,
> -	.remove   = cx23885_finidev,
> +	.name      = "cx23885",
> +	.id_table  = cx23885_pci_tbl,
> +	.probe     = cx23885_initdev,
> +	.remove    = cx23885_finidev,
>  	/* TODO */
> -	.suspend  = NULL,
> -	.resume   = NULL,
> +	.driver.pm = &cx23885_pm_ops,

I don't entirely understand this. Wouldn't it be sufficient to just
drop the .suspend/.resume assignments here? It is now required for
driver.pm to be non-NULL?

I'm not up to speed on the changes, but normally you can leave things
NULL if you don't support a feature (PM in this case).

Regards,

	Hans

>  };
>  
>  static int __init cx23885_init(void)
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
