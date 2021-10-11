Return-Path: <SRS0=rOi/=O7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D190C433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:28:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1E360F0F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Oct 2021 18:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF1E360F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA4F1608A1;
	Mon, 11 Oct 2021 18:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e873iJdICpBm; Mon, 11 Oct 2021 18:28:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D57A36073D;
	Mon, 11 Oct 2021 18:28:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F093C0011;
	Mon, 11 Oct 2021 18:28:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42038C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27C9C402C8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:28:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRCXzQZJKsGR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:28:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F48D40120
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 18:28:24 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 ns7-20020a17090b250700b001a0937b87b7so416157pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 11 Oct 2021 11:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CKQ88c9j3ESKQlxCKVCJzIzhEW8MF9O1pZyFGKOEDrA=;
 b=oTJLSzyQmCsA6lgeeHn3VxbHP/ZOM0tZi+M/YKcnDvCFUl77KdxyP1DHUHGfghJnEl
 CXzyW7Oh+NADAL/pD0I5kOjOFjcUMNfnINCOLUbM6NF42GHYCMRmzdyxNOR/fe8EXgh+
 VUP3TfYmm/0k51dSuPgYLbN7BSgB+W2gaYslaEmh1LPGFF3PXoONvcwfSFYvr8uaiLVn
 U06MgH5wqjmgyKYO7svrg3Syld5W5Z1C9cTJbCuVC90S9NFSJvQnUL00t2nZIz42J0JP
 pN2IDRWx406mFVDwF4qdz7R7m50JVQE9XFVXtdf7ofMDZPDTyugGr0fJa4pYWELMwwtJ
 VcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CKQ88c9j3ESKQlxCKVCJzIzhEW8MF9O1pZyFGKOEDrA=;
 b=4tnFT5kTzHHHwaAeMjo0s7iWSzmElk5oKXSuAVrmwDIsPPWX2SIhnhi0BcP+5+356e
 98F6H1fGMarbK6WagSdCFY/IOu0rqn3GgBNqckMDKN9VCQ5NFzKrXlrRusX3sY5FKHq7
 /+uo7uORd3uJITKw179a+Pt0dL1rSc0M+42fX8wxipt2Dz2jm7BbQ1GrqFOiKJQ1GtAq
 aAfAiFyZX/TAC4vUr8cr16BNCChdDdCZk+UyWznQQ6bCOO5z8zNO5wzGw81akQY+qGUH
 p8prKl2FNhvPFpU9fR+19mqXpzvE13ZL5l31HJPtp35BAD94SDGgciG2ZHxKQlrJ3+kw
 kt+w==
X-Gm-Message-State: AOAM530z5CBTzv1qjKcfQ/IMqf7ejyeKGD9wi2z4fT5yv++5Fh+gbvFs
 Bqg8nGUi5PLQVzxiUYy4ATM=
X-Google-Smtp-Source: ABdhPJxia+sjT3Qg+xTt/VNqtfY33guuOiShsseFdWJ387zSt1snrx1KhCUiVCrhs20k1oIksdC5Iw==
X-Received: by 2002:a17:90a:708c:: with SMTP id
 g12mr634723pjk.13.1633976903685; 
 Mon, 11 Oct 2021 11:28:23 -0700 (PDT)
Received: from theprophet ([2406:7400:63:9f95:848b:7cc8:d852:ad42])
 by smtp.gmail.com with ESMTPSA id y17sm5130041pfn.96.2021.10.11.11.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 11:28:23 -0700 (PDT)
Date: Mon, 11 Oct 2021 23:58:13 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH 09/22] PCI: aardvark: Use SET_PCI_ERROR_RESPONSE() when
 device not found
Message-ID: <20211011182813.duescywvlkkvddjp@theprophet>
References: <cover.1633972263.git.naveennaidu479@gmail.com>
 <f423dc9cc90e345680d289d5df7ff469e9b89c60.1633972263.git.naveennaidu479@gmail.com>
 <20211011180850.hgp4ctykvus37fx7@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211011180850.hgp4ctykvus37fx7@pali>
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
> On Monday 11 October 2021 23:26:33 Naveen Naidu wrote:
> > An MMIO read from a PCI device that doesn't exist or doesn't respond
> > causes a PCI error.  There's no real data to return to satisfy the
> > CPU read, so most hardware fabricates ~0 data.
> > =

> > Use SET_PCI_ERROR_RESPONSE() to set the error response, when a faulty
> > read occurs.
> > =

> > This helps unify PCI error response checking and make error check
> > consistent and easier to find.
> > =

> > Compile tested only.
> > =

> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/controller/pci-aardvark.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > =

> > diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/contro=
ller/pci-aardvark.c
> > index 596ebcfcc82d..dc2f820ef55f 100644
> > --- a/drivers/pci/controller/pci-aardvark.c
> > +++ b/drivers/pci/controller/pci-aardvark.c
> > @@ -894,7 +894,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u=
32 devfn,
> >  	int ret;
> >  =

> >  	if (!advk_pcie_valid_device(pcie, bus, devfn)) {
> > -		*val =3D 0xffffffff;
> > +		SET_PCI_ERROR_RESPONSE(val);
> =

> Hello! Now I'm looking at this macro, and should not it depends on
> "size" argument? If doing 8-bit or 16-bit read operation then should not
> it rather sets only low 8 bits or low 16 bits to ones?
>

Hello o/, Thank you for the review.

Yes! you are right that it should indeed depend on the "size" argument.
And that is what the SET_PCI_ERROR_RESPONSE macro does. The macro is
defined as:

  #define PCI_ERROR_RESPONSE           (~0ULL)
  #define SET_PCI_ERROR_RESPONSE(val)  (*val =3D ((typeof(*val))PCI_ERROR_R=
ESPONSE))

The macro was part of "Patch 1/22" and is present here [1]. Apologies if
I added the receipient incorrectly.

[1]:
https://lore.kernel.org/linux-pci/d8e423386aad3d78bca575a7521b138508638e3b.=
1633972263.git.naveennaidu479@gmail.com/T/#m37295a0dcfe0d7e0f67efce3633efd7=
b891949c4

IIUC, the typeof(*val) helps in setting the value according to the size
of the argument.

Please let me know if my understanding is wrong.

> >  		return PCIBIOS_DEVICE_NOT_FOUND;
> >  	}
> >  =

> > @@ -920,7 +920,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u=
32 devfn,
> >  			*val =3D CFG_RD_CRS_VAL;
> >  			return PCIBIOS_SUCCESSFUL;
> >  		}
> > -		*val =3D 0xffffffff;
> > +		SET_PCI_ERROR_RESPONSE(val);
> >  		return PCIBIOS_SET_FAILED;
> >  	}
> >  =

> > @@ -955,14 +955,14 @@ static int advk_pcie_rd_conf(struct pci_bus *bus,=
 u32 devfn,
> >  			*val =3D CFG_RD_CRS_VAL;
> >  			return PCIBIOS_SUCCESSFUL;
> >  		}
> > -		*val =3D 0xffffffff;
> > +		SET_PCI_ERROR_RESPONSE(val);
> >  		return PCIBIOS_SET_FAILED;
> >  	}
> >  =

> >  	/* Check PIO status and get the read result */
> >  	ret =3D advk_pcie_check_pio_status(pcie, allow_crs, val);
> >  	if (ret < 0) {
> > -		*val =3D 0xffffffff;
> > +		SET_PCI_ERROR_RESPONSE(val);
> >  		return PCIBIOS_SET_FAILED;
> >  	}
> >  =

> > -- =

> > 2.25.1
> > =

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
