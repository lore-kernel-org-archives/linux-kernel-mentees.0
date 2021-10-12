Return-Path: <SRS0=UocX=PA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51856C433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 15:59:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2BF6112D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 12 Oct 2021 15:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A2BF6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9B7980C5E;
	Tue, 12 Oct 2021 15:59:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJtcbGKGzLMM; Tue, 12 Oct 2021 15:59:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CD53380D79;
	Tue, 12 Oct 2021 15:59:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A98B7C000F;
	Tue, 12 Oct 2021 15:59:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C595C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F28680D79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdPGp_V1LUkP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:59:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D147480C5E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 15:59:46 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id om14so4145156pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Oct 2021 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s85hH8OlLfuG7m34y2PmbBUsXhbTPJy7qKvzLqHFuts=;
 b=ofP+Z3s8eNEGO0B0FIO5AIpuQRG7ug6PZNOQMbIWV4jHXgS1f3BTb0Xmmt3E0cls31
 qNFD2XKWvC4KziFheNgPS8sM2gDcndB0XgHmrRy/JY7gB0rAvtBOWMCD3QBCQcGDCnAT
 JBpBQm9+CBJS0iMHD4/YbsDp7SjrmnmdHc4vpv+s9GkR7/Pf8cWD2A+SOafAfUsiBjyp
 QhwuNauwgjxrods43SCJYjs+x3rrbeica31XQgZsvqhup3mDnMTX9P7jpzWAZ6f5Nklq
 a2eKVT78ozWjtCugjbXefdNEIkHme+9n45bc6f+VOQN/559OOaxq1wF4NoG+J8ATFOiz
 RzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s85hH8OlLfuG7m34y2PmbBUsXhbTPJy7qKvzLqHFuts=;
 b=R+ZTfiewB7IEgs7WuaL+Tho0uC/jhoq3Z5JFa0RDB0lzwDeXzxkNmMxcxe+HxCcenK
 p0ESgodXWiy5kB8lOvM4If0p9wOeWuFJQhzfX649SNCxMnJACQnnwjPFhmYRCx+Pwg6u
 nrdDjfh/kyOJkqmiBmH63TsBuAP2o79F2FqY/Ta9SuQVlTQzFFpykW+sdob3DMw7QAiW
 hyTk/x3QYTCXHk5smrJwzo/2wrgYhL9R0jpM4fGea7p/2PgFiAqOR7yfxgbZES/PZK/K
 eD6w5G1hyK2THWpRyZOgSa6yZuBUzdjkmRMZi5P20eaMaSIYxMXoltPfXuQ1ZeXAxmqg
 NkRA==
X-Gm-Message-State: AOAM531kKn845RllkylhNs569DljnwxndCH1LBXSvRFZo/tznGY+/5p7
 QkyLXYeVK0A0nQXpxr2mCww=
X-Google-Smtp-Source: ABdhPJzJIZzu89Nsz/KDsuCTNqduOueDbscNAqrLgQ6duvBVxEA3fN2vSGJiQKc150Dvkr3qQbubqw==
X-Received: by 2002:a17:902:d202:b0:13a:709b:dfb0 with SMTP id
 t2-20020a170902d20200b0013a709bdfb0mr30570200ply.34.1634054386055; 
 Tue, 12 Oct 2021 08:59:46 -0700 (PDT)
Received: from theprophet ([2406:7400:63:cada:3b09:6c3b:61f5:2cfd])
 by smtp.gmail.com with ESMTPSA id i128sm11576268pfc.47.2021.10.12.08.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 08:59:45 -0700 (PDT)
Date: Tue, 12 Oct 2021 21:29:28 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 09/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when
 device not found
Message-ID: <20211012155928.3nuyzgrgvyjm2v3r@theprophet>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <f423dc9cc90e345680d289d5df7ff469e9b89c60.1633972263.git.naveennaidu479@gmail.com>
 <20211011180850.hgp4ctykvus37fx7@pali>
 <20211011182526.kboaxqofdpd2jjrl@theprophet>
 <20211011184144.qcbmif7hvzozdgzw@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011184144.qcbmif7hvzozdgzw@pali>
Cc: Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "moderated list:PCI DRIVER FOR AARDVARK \(Marvell Armada 3700\)"
 <linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 11/10, Pali Roh=E1r wrote:
> On Monday 11 October 2021 23:55:35 Naveen Naidu wrote:
> > On 11/10, Pali Roh=E1r wrote:
> > > On Monday 11 October 2021 23:26:33 Naveen Naidu wrote:
> > > > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > > > causes a PCI error.  There's no real data to return to satisfy the
> > > > CPU read, so most hardware fabricates ~0 data.
> > > > =

> > > > Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faul=
ty
> > > > read occurs.
> > > > =

> > > > This helps unify PCI error response checking and make error check
> > > > consistent and easier to find.
> > > > =

> > > > Compile tested only.
> > > > =

> > > > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > > > ---
> > > >  drivers/pci/controller/pci-aardvark.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > =

> > > > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/co=
ntroller/pci-aardvark.c
> > > > index 596ebcfcc82d..dc2f820ef55f 100644
> > > > --- a/drivers/pci/controller/pci-aardvark.c
> > > > +++ b/drivers/pci/controller/pci-aardvark.c
> > > > @@ -894,7 +894,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bu=
s, u32 devfn,
> > > >  	int ret;
> > > >  =

> > > >  	if (!advk_pcie_valid_device(pcie, bus, devfn)) {
> > > > -		*val =3D 0xffffffff;
> > > > +		SET_PCI_ERROR_RESPONSE(val);
> > > =

> > > Hello! Now I'm looking at this macro, and should not it depends on
> > > "size" argument? If doing 8-bit or 16-bit read operation then should =
not
> > > it rather sets only low 8 bits or low 16 bits to ones?
> > >
> > =

> > Hello o/, Thank you for the review.
> > =

> > Yes! you are right that it should indeed depend on the "size" argument.
> > And that is what the SET_PCI_ERROR_RESPONSE macro does. The macro is
> > defined as:
> > =

> >   #define PCI_ERROR_RESPONSE           (~0ULL)
> >   #define SET_PCI_ERROR_RESPONSE(val)  (*val =3D ((typeof(*val))PCI_ERR=
OR_RESPONSE))
> > =

> > The macro was part of "Patch 1/22" and is present here [1]. Apologies if
> > I added the receipient incorrectly.
> > =

> > [1]:
> > https://lore.kernel.org/linux-pci/d8e423386aad3d78bca575a7521b138508638=
e3b.1633972263.git.naveennaidu479@gmail.com/T/#m37295a0dcfe0d7e0f67efce3633=
efd7b891949c4
> > =

> > IIUC, the typeof(*val) helps in setting the value according to the size
> > of the argument.
> > =

> > Please let me know if my understanding is wrong.
> =

> Hello! I mean "size" function argument which is passed as variable.
>

Thank you for explaining! Now I understand what you mean :), Apologies
for not being not understanding this beforehand.

> Function itself is declared as:
> =

> static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn, int where, i=
nt size, u32 *val);
> =

> And in "size" argument is stored number of bytes, kind of read operation
> (read byte, read word, read dword). In *val is then stored read value.
> For byte operation, just low 8 bits in *val variable are set.
> =

> Because *val is u32 it means that typeof(*val) is always 4 independently
> of the "size" argument.
> =

> For example other project U-Boot has also pci-aardvark.c driver and
> U-Boot has for (probably same) purpose pci_get_ff() macro, see:
> https://source.denx.de/u-boot/u-boot/-/blob/v2021.10/drivers/pci/pci-aard=
vark.c#L367
> =

> I'm not saying if current approach to always sets 0xffffffff
> (independently of "size" argument) is correct or not as I do not know
> it too! I'm just giving example that this PCI code has very similar
> implementation of other project (U-Boot) which sets number of ones based
> on the size argument.
>

I am not sure too, if we would like to have something like pci_get_ff()
which sets the return mask based on the size.

If we were to have something like pci_get_ff(), I can think of one
problem, some of the functions such as pci_raw_set_power_state() which
checks for errors does not have a "size" argument. An excerpt from that
function is as follows:
  static int pci_raw_set_power_state(struct pci_dev *dev, pci_power_t state)
  {
    pci_read_config_word(dev, dev->pm_cap + PCI_PM_CTRL, &pmcsr);
        if (pmcsr =3D=3D (u16) ~0) {

For these functions we wont be able to use pci_get_ff(), I mean we could
definitely put the responsibility onto the programmers to write down the
correct size. But that might lead to mistakes, I guess?

Then for those cases, we might need to maintain both the
SET_PCI_ERROR_RESPONSE macro and the pci_get_ff() functions, which then
means that we might not have the same style for signalling config read
error.

I am pretty new to kernel development, so I am sure that whatever I said
above might be totally wrong. If so, please correct me :)

> So probably something for other people to decide.
> =

> Anyway, I very like this your idea to have a macro which purpose is to
> explicitly indicate error during config read operation! And to unify all
> drivers to use same style for signalling config read error.
> =


Thank you :D, I think I'll wait for other people to chime in here with
their opinions and then I'll redo the patch with whatever will be
decided.

Thank again for the detailed reply.

> > > >  		return PCIBIOS_DEVICE_NOT_FOUND;
> > > >  	}
> > > >  =

> > > > @@ -920,7 +920,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bu=
s, u32 devfn,
> > > >  			*val =3D CFG_RD_CRS_VAL;
> > > >  			return PCIBIOS_SUCCESSFUL;
> > > >  		}
> > > > -		*val =3D 0xffffffff;
> > > > +		SET_PCI_ERROR_RESPONSE(val);
> > > >  		return PCIBIOS_SET_FAILED;
> > > >  	}
> > > >  =

> > > > @@ -955,14 +955,14 @@ static int advk_pcie_rd_conf(struct pci_bus *=
bus, u32 devfn,
> > > >  			*val =3D CFG_RD_CRS_VAL;
> > > >  			return PCIBIOS_SUCCESSFUL;
> > > >  		}
> > > > -		*val =3D 0xffffffff;
> > > > +		SET_PCI_ERROR_RESPONSE(val);
> > > >  		return PCIBIOS_SET_FAILED;
> > > >  	}
> > > >  =

> > > >  	/* Check PIO status and get the read result */
> > > >  	ret =3D advk_pcie_check_pio_status(pcie, allow_crs, val);
> > > >  	if (ret < 0) {
> > > > -		*val =3D 0xffffffff;
> > > > +		SET_PCI_ERROR_RESPONSE(val);
> > > >  		return PCIBIOS_SET_FAILED;
> > > >  	}
> > > >  =

> > > > -- =

> > > > 2.25.1
> > > > =

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
