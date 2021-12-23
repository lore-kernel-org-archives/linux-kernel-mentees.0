Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCE0C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Dec 2021 06:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EFB7405BE;
	Thu, 23 Dec 2021 06:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1JYvTF1kPUy; Thu, 23 Dec 2021 06:10:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D604D401B7;
	Thu, 23 Dec 2021 06:10:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC80DC002F;
	Thu, 23 Dec 2021 06:10:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEBDAC0012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BED8981AEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q5FfzgR3emTa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:10:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE75C81A6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Dec 2021 06:10:34 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id r15so8369619uao.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Dec 2021 22:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mbHNzp0204AmGb5gPBzrhCaSQYS/qpv5OEmWLv004RY=;
 b=nmQzvwN31vfL6pLvMdPSyGBKc0/BjhCPChI0XF/UNmsxfyCq3noCj+jkkNrOSiBJ36
 n1Gf+iv9aqSOSU2Ji9nOt63ud5W88rSKrphUFbnk58wgWVMdQVr02G1uHiDSGbbKZv/u
 7X6oVkRrvi7rDZBwdishmTglfL4Om0uH9K2gTpjevxI5zeJYOO8merwJVWKQ8qcY4AgY
 Ikxt7b5+Xegk3CimZi5E8bNjWH5CFf/JWvHqLEZoieNx2x+pshuebOqjMikH9W/0wZPf
 94LQJ6r6i2V9HoLfMKH8Nkvueghodi58kfP32lARiLLvfmKVv1x5mG8ZMVQcKch+k3/U
 bioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mbHNzp0204AmGb5gPBzrhCaSQYS/qpv5OEmWLv004RY=;
 b=xF2LpA2muk2AOq7DgYCdTYHdTqyewRPc/kFRtwbS2UWUEJ5AzYOvHUICuJauMzBIb5
 nUVj2vMJtNBeQY+Qk8BhdcPX/H4HjEdT46MF7WJfD6i7SzL1StV/Jt7iAVDPi/s31hAQ
 151sG5r95tyw+OCvhVGS57M1Lpnuu9j5yVOFiCSVNomLkrc7kvqJtS80FCisbFj94jRn
 MJuYA/usocuj73Ic6g0r5YsJA2wavl2CYBQOBfbGmApJHLneUggvQ994rpQMMgfQipkI
 ERnkQqoYZQZDzwKmf/vwUMCRH+ZiYcJINwkFWcSQjiksU5CXQxXQQRiAujlHtORR1r1f
 PirA==
X-Gm-Message-State: AOAM533sqFG1La0J35Vpkhlw7k3lhu3iDUTfKdKkTM2yz3Mr1DVYEwV0
 6YAhH4iqkM1WnZHyd03j0MTDoUh9qR+e9dQVj04=
X-Google-Smtp-Source: ABdhPJxX4ofazdWru2duop3h2wcaB6hEw3qBHoxMUWn6OqVNFWPGiu3x2H6Mq80mQcMyVr2Kx3X5B3k7gd0i1DLMZMY=
X-Received: by 2002:a9f:25b6:: with SMTP id 51mr257897uaf.0.1640239833796;
 Wed, 22 Dec 2021 22:10:33 -0800 (PST)
MIME-Version: 1.0
References: <20211223011054.1227810-1-helgaas@kernel.org>
 <20211223011054.1227810-18-helgaas@kernel.org>
In-Reply-To: <20211223011054.1227810-18-helgaas@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 23 Dec 2021 07:10:22 +0100
Message-ID: <CAMhs-H_dTkp6_1Loq973JqotW26GtRYQv-vdQ2i6Heo7oGCL3w@mail.gmail.com>
Subject: Re: [PATCH v2 17/23] PCI: mt7621: Rename mt7621_pci_ to mt7621_pcie_
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
> Rename mt7621_pci_* structs and functions to mt7621_pcie_* for consistency
> with the rest of the file.
>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pci/controller/pcie-mt7621.c | 36 ++++++++++++++--------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
> index 4138c0e83513..b8fea7afdb1b 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -93,8 +93,8 @@ struct mt7621_pcie_port {
>   * reset lines are inverted.
>   */
>  struct mt7621_pcie {
> -       void __iomem *base;
>         struct device *dev;
> +       void __iomem *base;

This change is unrelated to the commit message and the rest of the
changes of this patch.

>         struct list_head ports;
>         bool resets_inverted;
>  };
> @@ -129,7 +129,7 @@ static inline void pcie_port_write(struct mt7621_pcie_port *port,
>         writel_relaxed(val, port->base + reg);
>  }
>
> -static inline u32 mt7621_pci_get_cfgaddr(unsigned int bus, unsigned int slot,
> +static inline u32 mt7621_pcie_get_cfgaddr(unsigned int bus, unsigned int slot,
>                                          unsigned int func, unsigned int where)
>  {
>         return (((where & 0xf00) >> 8) << 24) | (bus << 16) | (slot << 11) |
> @@ -140,7 +140,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
>                                          unsigned int devfn, int where)
>  {
>         struct mt7621_pcie *pcie = bus->sysdata;
> -       u32 address = mt7621_pci_get_cfgaddr(bus->number, PCI_SLOT(devfn),
> +       u32 address = mt7621_pcie_get_cfgaddr(bus->number, PCI_SLOT(devfn),
>                                              PCI_FUNC(devfn), where);
>
>         writel_relaxed(address, pcie->base + RALINK_PCI_CONFIG_ADDR);
> @@ -148,7 +148,7 @@ static void __iomem *mt7621_pcie_map_bus(struct pci_bus *bus,
>         return pcie->base + RALINK_PCI_CONFIG_DATA + (where & 3);
>  }
>
> -static struct pci_ops mt7621_pci_ops = {
> +static struct pci_ops mt7621_pcie_ops = {
>         .map_bus        = mt7621_pcie_map_bus,
>         .read           = pci_generic_config_read,
>         .write          = pci_generic_config_write,
> @@ -156,7 +156,7 @@ static struct pci_ops mt7621_pci_ops = {
>
>  static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
>  {
> -       u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
> +       u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
>
>         pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
>         return pcie_read(pcie, RALINK_PCI_CONFIG_DATA);
> @@ -165,7 +165,7 @@ static u32 read_config(struct mt7621_pcie *pcie, unsigned int dev, u32 reg)
>  static void write_config(struct mt7621_pcie *pcie, unsigned int dev,
>                          u32 reg, u32 val)
>  {
> -       u32 address = mt7621_pci_get_cfgaddr(0, dev, 0, reg);
> +       u32 address = mt7621_pcie_get_cfgaddr(0, dev, 0, reg);
>
>         pcie_write(pcie, address, RALINK_PCI_CONFIG_ADDR);
>         pcie_write(pcie, val, RALINK_PCI_CONFIG_DATA);
> @@ -505,16 +505,16 @@ static int mt7621_pcie_register_host(struct pci_host_bridge *host)
>  {
>         struct mt7621_pcie *pcie = pci_host_bridge_priv(host);
>
> -       host->ops = &mt7621_pci_ops;
> +       host->ops = &mt7621_pcie_ops;
>         host->sysdata = pcie;
>         return pci_host_probe(host);
>  }
>
> -static const struct soc_device_attribute mt7621_pci_quirks_match[] = {
> +static const struct soc_device_attribute mt7621_pcie_quirks_match[] = {
>         { .soc_id = "mt7621", .revision = "E2" }
>  };
>
> -static int mt7621_pci_probe(struct platform_device *pdev)
> +static int mt7621_pcie_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         const struct soc_device_attribute *attr;
> @@ -535,7 +535,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, pcie);
>         INIT_LIST_HEAD(&pcie->ports);
>
> -       attr = soc_device_match(mt7621_pci_quirks_match);
> +       attr = soc_device_match(mt7621_pcie_quirks_match);
>         if (attr)
>                 pcie->resets_inverted = true;
>
> @@ -572,7 +572,7 @@ static int mt7621_pci_probe(struct platform_device *pdev)
>         return err;
>  }
>
> -static int mt7621_pci_remove(struct platform_device *pdev)
> +static int mt7621_pcie_remove(struct platform_device *pdev)
>  {
>         struct mt7621_pcie *pcie = platform_get_drvdata(pdev);
>         struct mt7621_pcie_port *port;
> @@ -583,18 +583,18 @@ static int mt7621_pci_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> -static const struct of_device_id mt7621_pci_ids[] = {
> +static const struct of_device_id mt7621_pcie_ids[] = {
>         { .compatible = "mediatek,mt7621-pci" },
>         {},
>  };
> -MODULE_DEVICE_TABLE(of, mt7621_pci_ids);
> +MODULE_DEVICE_TABLE(of, mt7621_pcie_ids);
>
> -static struct platform_driver mt7621_pci_driver = {
> -       .probe = mt7621_pci_probe,
> -       .remove = mt7621_pci_remove,
> +static struct platform_driver mt7621_pcie_driver = {
> +       .probe = mt7621_pcie_probe,
> +       .remove = mt7621_pcie_remove,
>         .driver = {
>                 .name = "mt7621-pci",
> -               .of_match_table = of_match_ptr(mt7621_pci_ids),
> +               .of_match_table = of_match_ptr(mt7621_pcie_ids),
>         },
>  };
> -builtin_platform_driver(mt7621_pci_driver);
> +builtin_platform_driver(mt7621_pcie_driver);
> --
> 2.25.1
>

Other than that minor unrelated change, this looks good to me:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
