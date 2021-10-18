Return-Path: <SRS0=ZPeZ=PG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17573C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Oct 2021 11:32:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA43160E76
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Oct 2021 11:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA43160E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 752C66090C;
	Mon, 18 Oct 2021 11:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aTBRoqBYecOo; Mon, 18 Oct 2021 11:32:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A7FFC608C7;
	Mon, 18 Oct 2021 11:32:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84122C000F;
	Mon, 18 Oct 2021 11:32:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F593C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E27C5608C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkt8o4wHAFsP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:32:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E41D16089F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:32:44 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id e10so5107868uab.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 04:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C0ObgRrATtrPSK/G4VV3LCyZwiCeoUzdzpzXNcktwlM=;
 b=jUxFKP7vtdTsfGy2wnHYYAmcpGrT0MKY5AOdL++4SXbTVAraa5c/uSnsqMRYIB1pYJ
 0TThU1RdUNr4kV/3unl6nR94ypbFZl0otRIZweCgAUrVqsXLzzRWJmwH/Xnric106yUl
 UZCkJKHsICxRbuMj777oX8sGGU2NqD/M+CZx9Ch0FjCsRmzGG3ykI2VOOjTg++RB2UYt
 kwKcIlNxynK1vQoazcxFrEcAjzhKIrDyF6PYIdOiqjOWNBXz7phO9xExQmnvRI4JHjYC
 bXBntO5SpTrv7THf8qB8WMPLdBj1NYd9USu2E60xOjruKvkBnKsT0l6w3d9CTKxniSEk
 EuAg==
X-Gm-Message-State: AOAM532tXzeNSyIeA+ABBfgNj7/R3eCWNotNInQ4PfToD4ziGFHFnYZ7
 h5QFKKzO0ZwzFv6KNfi60GOPfW7E9MqY2g==
X-Google-Smtp-Source: ABdhPJzdoGSoSMU7WgyjKog0/sDmhXrGMOgxnlI0ybsF4rj75KnCw1oDq4gbz13VPPxDr9l5mp5N+w==
X-Received: by 2002:a67:4307:: with SMTP id q7mr25811571vsa.54.1634556763731; 
 Mon, 18 Oct 2021 04:32:43 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
 [209.85.222.54])
 by smtp.gmail.com with ESMTPSA id p26sm1638962uaa.18.2021.10.18.04.32.43
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 04:32:43 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id i22so3185257ual.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 04:32:43 -0700 (PDT)
X-Received: by 2002:a67:d583:: with SMTP id m3mr26629786vsj.41.1634556763010; 
 Mon, 18 Oct 2021 04:32:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <2544a93bf8725eecbea510e7ddbff6b5a5593c84.1634306198.git.naveennaidu479@gmail.com>
In-Reply-To: <2544a93bf8725eecbea510e7ddbff6b5a5593c84.1634306198.git.naveennaidu479@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Oct 2021 13:32:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVh79gvAZn+nBeWWtkJqvUb3woi1rRY=BkY+bc4YXFj1Q@mail.gmail.com>
Message-ID: <CAMuHMdVh79gvAZn+nBeWWtkJqvUb3woi1rRY=BkY+bc4YXFj1Q@mail.gmail.com>
Subject: Re: [PATCH v2 14/24] PCI: rcar: Remove redundant error fabrication
 when device read fails
To: Naveen Naidu <naveennaidu479@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:PCI DRIVER FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>
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

Hi Naveen,

On Sat, Oct 16, 2021 at 5:33 PM Naveen Naidu <naveennaidu479@gmail.com> wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error. There's no real data to return to satisfy the
> CPU read, so most hardware fabricates ~0 data.
>
> The host controller drivers sets the error response values (~0) and
> returns an error when faulty hardware read occurs. But the error
> response value (~0) is already being set in PCI_OP_READ and
> PCI_USER_READ_CONFIG whenever a read by host controller driver fails.
>
> Thus, it's no longer necessary for the host controller drivers to
> fabricate any error response.
>
> This helps unify PCI error response checking and make error check
> consistent and easier to find.
>
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>

Thanks for your patch!

> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -161,10 +161,8 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
>
>         ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
>                                       bus, devfn, where, val);
> -       if (ret != PCIBIOS_SUCCESSFUL) {
> -               *val = 0xffffffff;

I don't see the behavior you describe in PCI_OP_READ(), so dropping
this will lead to returning an uninitialized value?

> +       if (ret != PCIBIOS_SUCCESSFUL)
>                 return ret;
> -       }
>
>         if (size == 1)
>                 *val = (*val >> (BITS_PER_BYTE * (where & 3))) & 0xff;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
