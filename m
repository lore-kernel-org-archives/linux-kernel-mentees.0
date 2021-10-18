Return-Path: <SRS0=ZPeZ=PG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B9AC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Oct 2021 11:52:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55420610C7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Oct 2021 11:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55420610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12854403ED;
	Mon, 18 Oct 2021 11:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6IkMb-htMuER; Mon, 18 Oct 2021 11:52:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DBB7F400D0;
	Mon, 18 Oct 2021 11:52:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7413C000F;
	Mon, 18 Oct 2021 11:52:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DE40C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD1C5608C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:52:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlqSdgSsoIAL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:52:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B57AB608BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 11:52:12 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 75so15913943pga.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Oct 2021 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uRAY4X8owdY8nPICo6sM8mmRScQ57odxEdrE5BZO3fg=;
 b=lLW/sx9seF41ns6WqHqVgRo4ZIDaXamsZ+4e3CxEEI4Zzu6ej9A6NL0VFlxASZR37P
 pFABjVc76JTsA1lvjm6YgbvdMzD4cP5s5sucJcyqlc3qSS1IM3v20f6DfShDmdaqOcON
 BdzOgG0nUGA+XmA9qY5xk8mxkybUk8w21dprzQ9acSm72Yq8LeUO2DPhgo0YhkRYRh9t
 egt8GFz0s0i47ZeUQOpD+aPgn0SL5JIOo6Mi9yMkahq1cFS2gFPt+VF1eOXkJKJcJPfV
 sSx5WymcT0ty40x83D3Z8T2OwiTzWmuSO6RfUO78MpqoCOKp1YBvzb0v/fMHFu4BHXz+
 OO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uRAY4X8owdY8nPICo6sM8mmRScQ57odxEdrE5BZO3fg=;
 b=mluJoWLc5WJ8NKw15R6KVQqDZ17KNyr54TmKQbgx7v4m5kSIcFf8a5wz31Jsy0D4Y2
 ZbzL40uT1zw0twrAdk4MoIriJVWQdl8A0qK9V06A8ng+DEMuV0lpmfNLHdCs31BiOyp7
 qNIPjbjhHlMPfMDsTwexCbb/2YlixoF/8c5u2xSmgjPXnhyqAoOR/8WIPAFQm5xbUnpS
 qKgnmvIWYCDl9SegqmhtMMSamKqNvQOEqIczWq+Wkii7DFMQgaNfwGvZUO6njrnYbBdb
 kdU/rfuggZV7DVdgLeuoCPz0KxLiX3BbkMvC1UFvgN07eVx0Ljn1iow+9K0aqLhhahZe
 mCWA==
X-Gm-Message-State: AOAM533MKcuIlRPD3rJVi885mblfwiTBH9NS9x2NPJ2+vmZJpp6T1dYg
 yCRqZm5cdS6DkIfeHp9k+Ww=
X-Google-Smtp-Source: ABdhPJxtvO8Bq4YHHd6MoeEGykVU5WbXUmVMDCgGnwY4ZJm9lm+MyUAhrP7H1Nm5UUhNPn+8CHQX3Q==
X-Received: by 2002:a63:ed13:: with SMTP id d19mr23042349pgi.430.1634557932111; 
 Mon, 18 Oct 2021 04:52:12 -0700 (PDT)
Received: from theprophet ([2406:7400:63:eae8:5466:4cd4:63af:c661])
 by smtp.gmail.com with ESMTPSA id m22sm13297924pfo.176.2021.10.18.04.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:52:11 -0700 (PDT)
Date: Mon, 18 Oct 2021 17:21:48 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 14/24] PCI: rcar: Remove redundant error fabrication
 when device read fails
Message-ID: <20211018115148.iwhiknpd6o4okudq@theprophet>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <2544a93bf8725eecbea510e7ddbff6b5a5593c84.1634306198.git.naveennaidu479@gmail.com>
 <CAMuHMdVh79gvAZn+nBeWWtkJqvUb3woi1rRY=BkY+bc4YXFj1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVh79gvAZn+nBeWWtkJqvUb3woi1rRY=BkY+bc4YXFj1Q@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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

On 18/10, Geert Uytterhoeven wrote:
> Hi Naveen,
> 
> On Sat, Oct 16, 2021 at 5:33 PM Naveen Naidu <naveennaidu479@gmail.com> wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error. There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> >
> > The host controller drivers sets the error response values (~0) and
> > returns an error when faulty hardware read occurs. But the error
> > response value (~0) is already being set in PCI_OP_READ and
> > PCI_USER_READ_CONFIG whenever a read by host controller driver fails.
> >
> > Thus, it's no longer necessary for the host controller drivers to
> > fabricate any error response.
> >
> > This helps unify PCI error response checking and make error check
> > consistent and easier to find.
> >
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/pci/controller/pcie-rcar-host.c
> > +++ b/drivers/pci/controller/pcie-rcar-host.c
> > @@ -161,10 +161,8 @@ static int rcar_pcie_read_conf(struct pci_bus *bus, unsigned int devfn,
> >
> >         ret = rcar_pcie_config_access(host, RCAR_PCI_ACCESS_READ,
> >                                       bus, devfn, where, val);
> > -       if (ret != PCIBIOS_SUCCESSFUL) {
> > -               *val = 0xffffffff;
> 
> I don't see the behavior you describe in PCI_OP_READ(), so dropping
> this will lead to returning an uninitialized value?
>

Hello Geert,

Thank you for looking into the patch.

The described behaviour for PCI_OP_READ is part of the 01/24 [1] patch of
the series. 

[1]:
https://lore.kernel.org/linux-pci/b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com/T/#u

It looks like, I did not add proper receipients for that patch and hence
is leading to confusion. I really apologize for that.

I do not know what the right approach here should be, should I resend
the entire patch series, adding proper receipients OR should I reply to
each of the patches for the drivers and add the link to the patch. I did
not want to spam people with a lot of mails so I was confused as to what
the right option is.

Thanks,
Naveen

> > +       if (ret != PCIBIOS_SUCCESSFUL)
> >                 return ret;
> > -       }
> >
> >         if (size == 1)
> >                 *val = (*val >> (BITS_PER_BYTE * (where & 3))) & 0xff;
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
