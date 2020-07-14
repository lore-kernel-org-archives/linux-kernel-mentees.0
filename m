Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECB8C433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 13:27:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3234422203
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 13:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3234422203
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F0D962EC53;
	Tue, 14 Jul 2020 13:27:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LH3WoUPxFbg6; Tue, 14 Jul 2020 13:27:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA6C421563;
	Tue, 14 Jul 2020 13:27:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B38EBC0891;
	Tue, 14 Jul 2020 13:27:53 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C16BC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 13:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 186B088964
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 13:27:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tr4XiBsNsSIl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 13:27:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7070088797
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 13:27:51 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id j11so13867174oiw.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 06:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Co+8zho8E5dTiD8cmg9/ZPavIQVoRg7kJl84C1fgX4o=;
 b=gFJy8Q1kc/PMsrkZzOM8dD7HphpsVyXHcU3/JXvSb1X2KFRHm/MxgcmwBKO3g4Bj+P
 /wdNXAI1JcBIzVfVjuGdPwD7p6wy83eC978h1bQHaWaKXNN0GT8b/Zp1baf53zJAMim2
 wNNMkMqMeuPKbhcR9Jyazt9+FgiN/1Hqzr2wy7ubazz3RkzBQK5RhoRYOC4tVuXGfxSu
 B6OPUqI6ANQAUQztDePI1AzBNLQxWHw1nUOtVgscof9NQawaP3rUpNgvkDJYWiWEhexf
 Wnfm5261R19VerA/IqZ/huOJmme4DbHB5nEJadCDhmEDCwJROB9b5yyYbVf0loBeQNd5
 W4Kg==
X-Gm-Message-State: AOAM530Ql2hbphoVSKBj9yrJsAusOlQMmqc52dQOngbVGpAjCdPuR/zw
 sg7bpI0QX6oSznKbA8DYqmuVK8CwSAvHlWAOPlI=
X-Google-Smtp-Source: ABdhPJzZCW5CAcdX22oZWNLapJZK91sy3IBs2TtUsKH0mXhc58jY+otLhQKYqyJqpqYGmfziPk7jXv4Of2khk72Y9k0=
X-Received: by 2002:aca:4a89:: with SMTP id x131mr3775944oia.103.1594733270598; 
 Tue, 14 Jul 2020 06:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200713175529.29715-1-refactormyself@gmail.com>
 <20200713175529.29715-4-refactormyself@gmail.com>
In-Reply-To: <20200713175529.29715-4-refactormyself@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 14 Jul 2020 15:27:38 +0200
Message-ID: <CAJZ5v0gDwtZ+oYSrj_Ta56QPSeW3OSq4XHkiubOHr4xki7muPw@mail.gmail.com>
To: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
Cc: ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH 8/14 v3] PCI/ACPI: Check the
	return value of pcie_capability_read_*()
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

On Mon, Jul 13, 2020 at 6:55 PM Saheed O. Bolarinwa
<refactormyself@gmail.com> wrote:
>
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
>
> On failure pcie_capability_read_dword() sets it's last parameter,
> val to 0.
> However, with Patch 14/14, it is possible that val is set to ~0 on
> failure. This would introduce a bug because (x & x) == (~0 & x).
>
> This bug can be avoided if the return value of pcie_capability_read_word
> is checked to confirm success.
>
> Check the return value of pcie_capability_read_word() to ensure success.
>
> Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
> Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  drivers/pci/pci-acpi.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index 7224b1e5f2a8..39eb816bc3b8 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -248,12 +248,13 @@ static bool pcie_root_rcb_set(struct pci_dev *dev)
>  {
>         struct pci_dev *rp = pcie_find_root_port(dev);
>         u16 lnkctl;
> +       int ret;
>
>         if (!rp)
>                 return false;
>
> -       pcie_capability_read_word(rp, PCI_EXP_LNKCTL, &lnkctl);
> -       if (lnkctl & PCI_EXP_LNKCTL_RCB)
> +       ret = pcie_capability_read_word(rp, PCI_EXP_LNKCTL, &lnkctl);
> +       if (!ret && (lnkctl & PCI_EXP_LNKCTL_RCB))
>                 return true;
>
>         return false;
> @@ -792,12 +793,13 @@ bool pciehp_is_native(struct pci_dev *bridge)
>  {
>         const struct pci_host_bridge *host;
>         u32 slot_cap;
> +       int ret;
>
>         if (!IS_ENABLED(CONFIG_HOTPLUG_PCI_PCIE))
>                 return false;
>
> -       pcie_capability_read_dword(bridge, PCI_EXP_SLTCAP, &slot_cap);
> -       if (!(slot_cap & PCI_EXP_SLTCAP_HPC))
> +       ret = pcie_capability_read_dword(bridge, PCI_EXP_SLTCAP, &slot_cap);
> +       if (ret || !(slot_cap & PCI_EXP_SLTCAP_HPC))
>                 return false;
>
>         if (pcie_ports_native)
> --
> 2.18.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
