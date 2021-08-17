Return-Path: <SRS0=4CcE=NI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3FBC432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 17:32:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A8560560
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Aug 2021 17:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A8560560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A8F560790;
	Tue, 17 Aug 2021 17:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fELTgQA2Rsx; Tue, 17 Aug 2021 17:32:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 895BD60699;
	Tue, 17 Aug 2021 17:32:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60D26C0010;
	Tue, 17 Aug 2021 17:32:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B2EBC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25ACD4028D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwT-vhceKgJl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:32:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9530440196
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 17:32:10 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id n5so202508pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Aug 2021 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8V0aBEAXUKbzNyPVGyzX8W8ZO8Yk8w8Fat1TgUdEyOM=;
 b=VFWEXu36GOT7GiAwtAR0sqlNFX6kbdt0fnk3299s0fHbfObDFws6Qmmi0dIG+n1YCU
 SkvdrUHzspkab5MnoEl8z9/M9YMXSMfQUYpcTed9Z9oeE/AC619mK8FeS1CibO3Qup0F
 Kf0m9UR9RhGIu8J9XvRfP2GKvxf0sK8EUSxK1NfgaQWN6TuoNcZrT+d7tueuwcfk/AGW
 SePPSNqC0k09gjEBvpwe0R5L6tcD0/UxnuM2lZEpmjokb5b5nZcd7pM64cBia3LyjTqQ
 mRAtlXv6nX/rUHdEiFnmsJi6EK5DrE3yxbO8mn18A+e+fxho5HkxsfJPAemRL5WCXXyB
 y4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8V0aBEAXUKbzNyPVGyzX8W8ZO8Yk8w8Fat1TgUdEyOM=;
 b=O8tJiCXsBoAdqaC2Benh7ITZTKjxkijszQzOVLdGK3GRmz46C1A0jJ3RMOVcMlQrk1
 iqPV1Cca3Al7i2PYZbFFMYoRi0bwmtcZ13bAUngzY09RsIZSMtrAEFfw5Oe6T2qHbizo
 ZF2q+fnHt92WuOgE0en/TYkcVvp99yC1xud8IFotdPjldTQhfaNWDPt+xfzSfESqMmU/
 Yq9clKy1yY/umJyZGCTEaU/k0AGyqTC2zoDYql1M1HZ8nCsqoRN5/zN7jAvxgsMu4Mk6
 MFdcrUEVnN3bxp+qOaGC67sywqlp3UsDjpESBOwDGsQpcxJI0zlNJHfPoM1DFn3kFp8X
 4iKA==
X-Gm-Message-State: AOAM5339GdKA7yvDDU/3UXWtrj9AkyWlEWWEmkN7FgyD6wUPVxEWIl4P
 cNUqR52SEDilyZ/cm24ePcpWTQDZvrrIc0ZKCkg=
X-Google-Smtp-Source: ABdhPJzT40SDroXs6VsQp6G+dEmQxUKECNAXIOOK47Jr9nFZl1vdZDQsxCddYvk3dxVTjDRV+nwqi8FDJb672Orhu4Y=
X-Received: by 2002:a17:902:bb81:b0:12d:a7ec:3d85 with SMTP id
 m1-20020a170902bb8100b0012da7ec3d85mr3648635pls.17.1629221529919; Tue, 17 Aug
 2021 10:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210817170057.16783-1-utkarshverma294@gmail.com>
In-Reply-To: <20210817170057.16783-1-utkarshverma294@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 17 Aug 2021 20:31:30 +0300
Message-ID: <CAHp75Vc49M-bdRviytZojK8+vMWJPXA_7zmLx3EvyQNXh8veZA@mail.gmail.com>
Subject: Re: [PATCH] serial: 8250_exar: Add missing call to
 pci_free_irq_vectors()
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Valmer Huhn <valmer.huhn@concurrent-rt.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
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

On Tue, Aug 17, 2021 at 8:05 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Free the pci irq vectors if the call to pci_alloc_irq_vectors() fails
> or if the device is removed.

+Cc: Bjorn

This patch adds no value for all the code. This needs simply better
semantics on allocations (because freeing is happening here
implicitly).
Bjorn, this is an exact example why we need pcim_alloc_irq_vectors().

> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> ---
>  drivers/tty/serial/8250/8250_exar.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
> index 3ffeedc29c83..38b65d6980f5 100644
> --- a/drivers/tty/serial/8250/8250_exar.c
> +++ b/drivers/tty/serial/8250/8250_exar.c
> @@ -627,8 +627,10 @@ exar_pci_probe(struct pci_dev *pcidev, const struct pci_device_id *ent)
>         pci_set_master(pcidev);
>
>         rc = pci_alloc_irq_vectors(pcidev, 1, 1, PCI_IRQ_ALL_TYPES);
> -       if (rc < 0)
> +       if (rc < 0) {
> +               pci_free_irq_vectors(pcidev);
>                 return rc;
> +       }
>
>         memset(&uart, 0, sizeof(uart));
>         uart.port.flags = UPF_SHARE_IRQ | UPF_EXAR_EFR | UPF_FIXED_TYPE | UPF_FIXED_PORT;
> @@ -677,6 +679,7 @@ static void exar_pci_remove(struct pci_dev *pcidev)
>
>         if (priv->board->exit)
>                 priv->board->exit(pcidev);
> +       pci_free_irq_vectors(pcidev);
>  }


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
