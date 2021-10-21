Return-Path: <SRS0=0JKk=PJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A7AC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:19:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7632A6135F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Oct 2021 15:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7632A6135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42F6040720;
	Thu, 21 Oct 2021 15:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2YPdkdpQVORj; Thu, 21 Oct 2021 15:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2F6E340017;
	Thu, 21 Oct 2021 15:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06F76C001C;
	Thu, 21 Oct 2021 15:19:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3803C0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEE84404E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IP110SSuHrNJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:19:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F16CB404CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 15:19:26 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id s1so620922plg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Oct 2021 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qqnDqCjJmkwkqd0tn31z39TZlTbK4LZW1iNa62QCR2Q=;
 b=M/8LCnv10ewNtUivz51HXcBWK6M0VB9kFf5a+WtqK7XOSKxrr1pryerPOEyB413IAZ
 ExogKFflc0njjFMjEJusTcTGvZg44eISwwxw/J8CSPjR8pI7EOUnPsFNyh6ldXKoVu16
 XH5N6LecXdiYNcMXCTsBc0jHEX8c/O1TvDdthlJhPM5HQk0Xad6fjCrINfY4Ilfy4HgB
 2zeFrHw2ZE+m/QeyDjGF6lW8jx50xlYyyvY1zzjJ1T01JmbUgskTJa8o+OZZvcWQsuZF
 MCvNps4TW4ejZHSBpqsWl2YJvLCpZAjh4lrZVclpLCkCYM+8rHXDL3YshzYFw4wg+hVM
 /9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qqnDqCjJmkwkqd0tn31z39TZlTbK4LZW1iNa62QCR2Q=;
 b=ofK6PnyEh9x3ya/qbemANSmvDgtiqx5R809+RbAYYxreetO4a1e/44XuvwDu7HUFhp
 7UOvJDIM7jqEGf6l6GZpK/W4FqMWWtGiEW53oJ2ioe7EU5wSllgwPFaUfno3dO00+MPy
 snBPqjVaJxi7TNiiz1fBiV0TgSxL5JsU6juGP3x4/SzRcCTmI+yomR5QZYzgARs43vVK
 ZwvclCyDs5jwDZMlc7GQiY0PZynyhSq9jQ7HRgZkwE1YCoY7mXwFnrif40v00xeqQequ
 7Nhnao03WjKluN5bB0jtsdpPB5JX3Pek7cG/GamiJETnqgxW6H9I4w6brxX/mYKnmPDG
 xERQ==
X-Gm-Message-State: AOAM530bS/BqidSrRK683JW3ArEUTHqw5GqDiEPeueXK2hWvER9oWCF6
 snJqudSBTlLdgrQYFLyHJU0=
X-Google-Smtp-Source: ABdhPJxWG4HWHVbrBkYtNB1WueaH3dHRXvd0ib8tuJTqdS2XP+ju8Dy0G8bIm+dXVb370gRSNoJnnA==
X-Received: by 2002:a17:90a:2acf:: with SMTP id
 i15mr3194179pjg.91.1634829566382; 
 Thu, 21 Oct 2021 08:19:26 -0700 (PDT)
Received: from theprophet ([2406:7400:63:29a4:d874:a949:6890:f95f])
 by smtp.gmail.com with ESMTPSA id a27sm6466171pfl.20.2021.10.21.08.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 08:19:25 -0700 (PDT)
Date: Thu, 21 Oct 2021 20:49:13 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com
Subject: Re: [PATCH v3 17/25] PCI: vmd: Use RESPONSE_IS_PCI_ERROR() to check
 read from hardware
Message-ID: <20211021151913.nmnvfhqnyepnfok2@theprophet>
References: <cover.1634825082.git.naveennaidu479@gmail.com>
 <5be1fdfdcf4b4a453117ef4dea0f71c9555fac24.1634825082.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5be1fdfdcf4b4a453117ef4dea0f71c9555fac24.1634825082.git.naveennaidu479@gmail.com>
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

On 21/10, Naveen Naidu wrote:
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
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/controller/vmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index a5987e52700e..bfe6b002ffec 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -538,7 +538,7 @@ static int vmd_get_phys_offsets(struct vmd_dev *vmd, bool native_hint,
>  		int ret;
>  
>  		ret = pci_read_config_dword(dev, PCI_REG_VMLOCK, &vmlock);
> -		if (ret || vmlock == ~0)
> +		if (ret || RESPONSE_IS_PCI_ERROR(vmlock))
>  			return -ENODEV;
>  
>  		if (MB2_SHADOW_EN(vmlock)) {
> -- 
> 2.25.1
> 

Jonathan, I haven't added your Reviewed-by tag to this patch which you
gave in v1 of the series [1] , because the macro definition of the
RESPONSE_IS_PCI_ERROR changed slightly, and I was not sure if you would
be okay with it. I hope it was right thing to do, if not I apologize for
that.

[1]:
https://lore.kernel.org/linux-pci/f3aca934-7dee-b294-ad3c-264e773eddda@linux.dev/T/#u

Thanks,
Naveen
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
