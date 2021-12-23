Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB0C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 06:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA42381B17;
	Thu, 23 Dec 2021 06:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJCdNU5KIyMw; Thu, 23 Dec 2021 06:04:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DFA7481A6F;
	Thu, 23 Dec 2021 06:04:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6C43C001E;
	Thu, 23 Dec 2021 06:04:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62FC2C0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39247410AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QfVEA9HuxOtH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:04:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5313D409A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:04:45 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id p37so8077837uae.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Dec 2021 22:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5XR6lLGbVM6j7f4TfkI4T9+Vc1GDEp24Th+tejsjoxM=;
 b=oCkF2NqSMEBD27LuyLui+c1YfgkjfBk8KbOz3NpkBbqBCGkH+Am255FfH3A/ZInq1i
 9YAZ+6HEjD1ePXpL4g6t2YLZZRYHBlZz3DRYmc6b4WU3KsEHqTP4cap8zD4odOcCuYgW
 B1M6rQAxQBHi/UXnk2FSr2cjl9ua/l/VygNdQTOm2xz3ruEWwr5oAF3VLK0mMShGLyGj
 V0vwQNy/4meKoBr87E2Ofwnmzw9hRKBqu4+2TVYAs1VPO0vc4WEZmDh1rFlG0u7L4dYN
 q2MabiPjPNsCUzTxWMJXt74g7/73nE2AedFxCs+Ga4MLRefdbZZdi9CU6nUo/JpYs10Q
 jdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5XR6lLGbVM6j7f4TfkI4T9+Vc1GDEp24Th+tejsjoxM=;
 b=vT78i6yytUO3vyJl4Yicm7apnpkCqL6+5u4ymEGNLN49aZK6AfAZA5PlbICQYF70e5
 thnj6KSxFUZ+K6bR8r0U1ZKOF816pCy9y1mXK0c175cR3+lszho/Da4L28zjCM1z6vIY
 RSIO1u+vkAmf5kQlOTQ66mA4surBhFUWlqxUMY9kYA49UnaurQEg91ZbBg1C8E44r+p2
 1tLHQR1BCSboVNn9E558M9dcvdDe/0w5A+bzniIl6tBgroyvVigXQ8+UZTfiL6Ah5v9F
 /IVaLdnLZ+8Wcal6Rju76Z/pdfJkj9CkTntNC+TMSbw57/eL6fFcuFRPU+7FrMQWh8tu
 lcog==
X-Gm-Message-State: AOAM5335ytaIc/NWApcOdk2Nmwu3Et4iDiNpwLBr0HK+t+evcOwDyl2E
 1sBVyHv/aNJtkc8hPvSo+52OH+m/nd8eYRAQq2Q=
X-Google-Smtp-Source: ABdhPJwDbDuTISDqi+zhcgqOH8q9fsGiDk2NL6+HYKcHrWYWMNkFIpfqAnN28lPSHiN/kXqoasNjJlA6DBNeXSFbgL8=
X-Received: by 2002:a67:d51e:: with SMTP id l30mr255332vsj.1.1640239484159;
 Wed, 22 Dec 2021 22:04:44 -0800 (PST)
MIME-Version: 1.0
References: <20211223011054.1227810-1-helgaas@kernel.org>
 <20211223011054.1227810-17-helgaas@kernel.org>
In-Reply-To: <20211223011054.1227810-17-helgaas@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 23 Dec 2021 07:04:32 +0100
Message-ID: <CAMhs-H-nSTLiqgw4LxEPBiTGLh7L4n1mm4FbgOCdzCGxK5e47w@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] PCI: mt7621: Make pci_ops static
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Fan Fei <ffclaire1224@gmail.com>
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

Hi Bjorn,

On Thu, Dec 23, 2021 at 2:11 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> From: Bjorn Helgaas <bhelgaas@google.com>
>
> mt7621_pci_ops is used only in this file.  Make it static.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pci/controller/pcie-mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index b60dfb45ef7b..4138c0e83513 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
>         return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
>  }
>
> -struct pci_ops mt7621_pci_ops = {
> +static struct pci_ops mt7621_pci_ops = {
>         .map_bus        = mt7621_pcie_map_bus,
>         .read           = pci_generic_config_read,
>         .write          = pci_generic_config_write,
> --
> 2.25.1
>

This one was already sent and added to Lorenzo's tree. See:

https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/pci.git/commit/?h=pci/mt7621&id=8a0c1afb8560c2f64bcbdb559931f5ca8b83de87

Thanks,
    Sergio Paracuellos
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
