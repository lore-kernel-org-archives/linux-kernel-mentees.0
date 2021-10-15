Return-Path: <SRS0=mh8d=PD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 765F5C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:52:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E85460D42
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 15 Oct 2021 14:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E85460D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F375C6084F;
	Fri, 15 Oct 2021 14:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4TqRl0xCsYz; Fri, 15 Oct 2021 14:52:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CA8960794;
	Fri, 15 Oct 2021 14:52:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 090ECC000F;
	Fri, 15 Oct 2021 14:52:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F600C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 019A4607BE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVyxODKzD1ct
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:52:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48DEF60794
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 14:52:24 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so7428816pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 Oct 2021 07:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wSBkt9zYHPwlUZ1/2+m7OdxEgpbgJqT9W9WPrNpsTT4=;
 b=cd4+4EBvunAe+muc+Kj5ssmqyR/v1gZu4XoQ6Sfq9tyPLjTs++rfTRLjSaELmun2aG
 i2b1vNDWdhdMIe4twlANpIfG+N1djG5XczwFb7zy0SDUYl8BnoY9yAZR6aXN45UOSihz
 kNmgqw+6cBc3qqIwrJQXbvYq65haGMFePkaDWouycHNRp5eIlji1MDo/FPnc7ltQduvY
 ++o8BVa/VsU+VHZ+rkavg0FfKNu8KjxmzutwKyau3N/OvKJeAUMCarzPZndNMDlDPk7c
 TsCqLExSFpMLC+DW9Njm5d9Y6JG5J9BNO43qFpFeox48Vu3QKziSLticwSfTr2rzRBBd
 TpoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wSBkt9zYHPwlUZ1/2+m7OdxEgpbgJqT9W9WPrNpsTT4=;
 b=oDKMAMiwUZ4QeTvGIymRz8mnMPsGcEGJCM2S7ioGponSN9Dchw7ATG+ckWgtcRLOcf
 v/GyjWllAfuXGIwqjyUBmz+uL5YGRUIQIw74g8SRNt9eYb3whXfbZ4ycMC3Ner2D1i8v
 V6K6g9sODewctPZ7ruj6UvMQ0JhiyLgJ2U3ML3Cp7UnCpKMgpa3H1asI+1iJNc4El+Kz
 6Dt3ZN1Y5LObWqnZ8IRAQ3dfhzM4qhpiRcZ7kX04qWsaTcq/D9kfbz7X3077bU/mcFlc
 zWjQ5fM8AnzCKVEQRJXcyhsbspjwWAciWNwqkB1EWP2M37xxV5+YEtyRmN9SXnqpPJcE
 HqgQ==
X-Gm-Message-State: AOAM532UfaqOSLU6Xxm7rQdo6hFzyWyu/5r7JDiEweOCd8o5Kp/C78Xw
 aozvLBfzx4Kdbq5YndQrzSk=
X-Google-Smtp-Source: ABdhPJz9ueCV0j30JfV2DfEN7UWTuCXSeIzgd/QlYR21lkRRHqOiR7AruNUAHVn9UN8FS8XeNsb0wA==
X-Received: by 2002:a17:90a:5d89:: with SMTP id
 t9mr5655713pji.21.1634309543625; 
 Fri, 15 Oct 2021 07:52:23 -0700 (PDT)
Received: from theprophet ([2406:7400:63:4806:9a51:7f4b:9b5c:337a])
 by smtp.gmail.com with ESMTPSA id b8sm5548190pfm.65.2021.10.15.07.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 07:52:23 -0700 (PDT)
Date: Fri, 15 Oct 2021 20:22:10 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: Re: [PATCH v2 17/24] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Message-ID: <20211015145210.opb72brioa5tcbtw@theprophet>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <0da4dfe7642bf89d954c7062a40566bf28d94da1.1634306198.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0da4dfe7642bf89d954c7062a40566bf28d94da1.1634306198.git.naveennaidu479@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
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

On 15/10, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
> 
> Use RESPONSE_IS_PCI_ERROR() to check the response we get when we read
> data from hardware.
> 
> This helps unify PCI error response checking and make error checks
> consistent and easier to find.
> 
> Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/controller/vmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index a5987e52700e..db81bc4cfe8c 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -538,7 +538,7 @@ static int vmd_get_phys_offsets(struct vmd_dev *vmd, bool native_hint,
>  		int ret;
>  
>  		ret = pci_read_config_dword(dev, PCI_REG_VMLOCK, &vmlock);
> -		if (ret || vmlock == ~0)
> +		if (ret || RESPONSE_IS_PCI_ERROR(&vmlock))
>  			return -ENODEV;
>  
>  		if (MB2_SHADOW_EN(vmlock)) {
> -- 
> 2.25.1
> 

Jonathan, I have added your Reviewed-by tag from the first version [1] of
the patch series, since this patch did not change in the version 2. I
hope that's okay. If not, I really apologize for that and can you 
please let me know how to rectify that mistake.

[1]:
https://lore.kernel.org/linux-pci/f3aca934-7dee-b294-ad3c-264e773eddda@linux.dev/T/#u

Thanks,
Naveen

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
