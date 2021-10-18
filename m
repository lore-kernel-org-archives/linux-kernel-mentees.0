Return-Path: <SRS0=ZPeZ=PG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF84C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Oct 2021 12:01:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3537860FD8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Oct 2021 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3537860FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04C9560A3D;
	Mon, 18 Oct 2021 12:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VlifIwjHiRUW; Mon, 18 Oct 2021 12:01:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0443C608C7;
	Mon, 18 Oct 2021 12:01:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6578C000F;
	Mon, 18 Oct 2021 12:00:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E85A7C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 12:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E30EA403ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 12:00:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kxHg-fTbInPm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 12:00:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0026403E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 12:00:56 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id q13so3138131uaq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 05:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugxvHlyhTx50acGfMe/mBaSIaa61RPwcWtMFE4GIscE=;
 b=EwrDqZccFYhnki9dNV5bcg2Z88n1LKmJpyWIrxTqzbAkYpGKDPWPSRw6zreKMNmrCV
 9j4o0UpAOuyJ4oyf968OVt57ElKKjO8QktTscC/BpIa4mlkjfmRZQye9wwO2cL4EeoZQ
 UisqRB6qGGVwlACYzf4tAcD3y81+XM1hxFFYk7u5dZ7XN7kkuvCZTeFdJ94DkLh+fh3K
 2C9Gaaol7YDH0smLOFRXAIkhWpz6Ql2mqrfC8INdYCkh9VxUakXbIYZydTHimmYb5TwH
 Pr4Pmf+n04+ytQG6bQk3HhZUCz4Ic8KCTeD3lnXzVsWXqva1qWsD+SegfY8O5jL3S7Q8
 PVcA==
X-Gm-Message-State: AOAM5321X5N5S4eU9uGKQIKU+PDRhLB1Ae2RSS15mq7g4FpBXSIGahdI
 Ym2jsv1LA5zVELncvVJc3sSu9yOkUbPhHg==
X-Google-Smtp-Source: ABdhPJzBKgXLJx4qLhRqs5IgOJNa0dpwHR/Tpf+1LcDVnR02JiRWGpRnI7pEZ64Y0CFx9wD6W4e4uA==
X-Received: by 2002:a67:df96:: with SMTP id x22mr26316066vsk.9.1634558455208; 
 Mon, 18 Oct 2021 05:00:55 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com.
 [209.85.222.50])
 by smtp.gmail.com with ESMTPSA id l5sm376310vkd.17.2021.10.18.05.00.54
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 05:00:54 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a17so1529494uax.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 05:00:54 -0700 (PDT)
X-Received: by 2002:ab0:3d9a:: with SMTP id l26mr893052uac.114.1634558453426; 
 Mon, 18 Oct 2021 05:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <2544a93bf8725eecbea510e7ddbff6b5a5593c84.1634306198.git.naveennaidu479@gmail.com>
 <CAMuHMdVh79gvAZn+nBeWWtkJqvUb3woi1rRY=BkY+bc4YXFj1Q@mail.gmail.com>
 <20211018115148.iwhiknpd6o4okudq@theprophet>
In-Reply-To: <20211018115148.iwhiknpd6o4okudq@theprophet>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Oct 2021 14:00:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXYhUThELrmTTwFyJbLEqcJE3sQyYmWZhb=5T-rYmQ+=w@mail.gmail.com>
Message-ID: <CAMuHMdXYhUThELrmTTwFyJbLEqcJE3sQyYmWZhb=5T-rYmQ+=w@mail.gmail.com>
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

On Mon, Oct 18, 2021 at 1:52 PM Naveen Naidu <naveennaidu479@gmail.com> wrote:
> On 18/10, Geert Uytterhoeven wrote:
> > On Sat, Oct 16, 2021 at 5:33 PM Naveen Naidu <naveennaidu479@gmail.com> wrote:
> > > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > > causes a PCI error. There's no real data to return to satisfy the
> > > CPU read, so most hardware fabricates ~0 data.
> > >
> > > The host controller drivers sets the error response values (~0) and
> > > returns an error when faulty hardware read occurs. But the error
> > > response value (~0) is already being set in PCI_OP_READ and
> > > PCI_USER_READ_CONFIG whenever a read by host controller driver fails.
> > >
> > > Thus, it's no longer necessary for the host controller drivers to
> > > fabricate any error response.
> > >
> > > This helps unify PCI error response checking and make error check
> > > consistent and easier to find.
> > >
> > > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/pci/controller/pcie-rcar-host.c
> > > +++ b/drivers/pci/controller/pcie-rcar-host.c
> > > @@ -161,10 +161,8 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
> > >
> > >         ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
> > >                                       bus, devfn, where, val);
> > > -       if (ret != PCIBIOS_SUCCESSFUL) {
> > > -               *val = 0xffffffff;
> >
> > I don't see the behavior you describe in PCI_OP_READ(), so dropping
> > this will lead to returning an uninitialized value?
> >
>
> Hello Geert,
>
> Thank you for looking into the patch.
>
> The described behaviour for PCI_OP_READ is part of the 01/24 [1] patch of
> the series.
>
> [1]:
> https://lore.kernel.org/linux-pci/b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com/T/#u

OK, in that case:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> It looks like, I did not add proper receipients for that patch and hence
> is leading to confusion. I really apologize for that.

Indeed. If there are dependencies, all recipients should receive all
dependencies.

> I do not know what the right approach here should be, should I resend
> the entire patch series, adding proper receipients OR should I reply to
> each of the patches for the drivers and add the link to the patch. I did
> not want to spam people with a lot of mails so I was confused as to what
> the right option is.

Probably a resend would be best.
Thanks!

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
