Return-Path: <SRS0=auPP=PI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0418BC433F5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 15:13:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A55E61359
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Oct 2021 15:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A55E61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66E41607DE;
	Wed, 20 Oct 2021 15:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RC6X_O0mh9Oi; Wed, 20 Oct 2021 15:13:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7EA46607F2;
	Wed, 20 Oct 2021 15:13:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BCFCC0011;
	Wed, 20 Oct 2021 15:13:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBCA1C000D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EE4983B3E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:13:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QyDBWz48msYk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:13:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 199B983AA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 15:13:21 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 75so22827334pga.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Oct 2021 08:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nMEsOmoLIE03X0FEz1y57WbkFMuY6Pnj05lXdP5SXsk=;
 b=kOp9YmMFWMdxdBRR28gPoWRp1qUf1yXPEpvnyRze9W5hQeVyLVudcV4nW47Ob3EeWY
 3CPMRo3WlOgu3WtGibMuSt6NxpctXgWAoo6HDKg/ifmKRC19+HZyvyeZw7RlBJzLHylX
 PWPxc+ckCH9veExv1O/A2AMC7s4c2Kr255TsRNfvHRx6VfwJthUlBIG5jHla6eGyTNj9
 e3VyJVZvr1mEuvlfGcyIwwmuSuvc/hNgbYSZy7icesmFsCHu9U43CmQET35wlAcEryx7
 MxGFXsyz/q2dZt7g2Sk4o7LH+OJ0/fR0ylcnwNA6QlWcGBi8uhAsc4kVfnoa4vx+eyu6
 P7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nMEsOmoLIE03X0FEz1y57WbkFMuY6Pnj05lXdP5SXsk=;
 b=To/czWQx+xCL++enfCSFoKx3oTyxfaT+YhT4YKK12DddxKjcl/OQryQwEy/3QTRZyS
 NRHB8b+jOTD9muXq9SHDaGZ4y2QMveXtKOi94fEgo4x32vpsX+9sCI+dTlTkXyuK4nc6
 52fA/t2xLKHCvT6+/1Xn7KEQX2m/IVWTvIebgHcxwolT1hwxaf3mdSeiSUHcmhwL3bPt
 xqag7mM/mmB4V7HGVeT20xpZa5QKaZQEmloTL5jDR8nCCImT+6GlCm3DJ3VvaQi9tBf7
 IVy5hUHLNDfWkfSeAF4aLQJfyFClUo7ZZ7ehfmLsyZyx2Btwp+88Sb/pq0TyA0rt0/PS
 YCdA==
X-Gm-Message-State: AOAM530P6eUVyWP2VGyv6TnyDb7FAxtXO2VhtIc0ET5ksgiVWVdutXe2
 twVkmIv0wBtllOyY4cp9XME=
X-Google-Smtp-Source: ABdhPJyT1Dpx5ytuFQBG1GcteoPGwMW77UosJ0q6tZ2985YqbQZ9ShKJIAfaSsUJpJcOXOnf9ai8Hg==
X-Received: by 2002:a63:f817:: with SMTP id n23mr40868pgh.250.1634742801348;
 Wed, 20 Oct 2021 08:13:21 -0700 (PDT)
Received: from theprophet ([2406:7400:63:46e9:439a:b490:ed63:26a1])
 by smtp.gmail.com with ESMTPSA id n9sm5097115pjk.3.2021.10.20.08.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 08:13:20 -0700 (PDT)
Date: Wed, 20 Oct 2021 20:43:09 +0530
From: Naveen Naidu <naveennaidu479@gmail.com>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: Re: [PATCH v2 02/24] PCI: Set error response in config access
 defines when ops->read() fails
Message-ID: <20211020151309.gklnsksd7ce6b3q6@theprophet>
References: <cover.1634306198.git.naveennaidu479@gmail.com>
 <b913b4966938b7cad8c049dc34093e6c4b2fae68.1634306198.git.naveennaidu479@gmail.com>
 <20211020135208.zgm2gvhqd7ukb57m@pali>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211020135208.zgm2gvhqd7ukb57m@pali>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
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

On 20/10, Pali Roh=E1r wrote:
> On Friday 15 October 2021 19:58:17 Naveen Naidu wrote:
> > Make PCI_OP_READ and PCI_USER_READ_CONFIG set the data value with error
> > response (~0), when the PCI device read by a host controller fails.
> > =

> > This ensures that the controller drivers no longer need to fabricate
> > (~0) value when they detect error. It also  gurantees that the error
> > response (~0) is always set when the controller drivers fails to read a
> > config register from a device.
> > =

> > This makes error response fabrication consistent and helps in removal of
> > a lot of repeated code.
> > =

> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> > ---
> >  drivers/pci/access.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/pci/access.c b/drivers/pci/access.c
> > index 46935695cfb9..b3b2006ed1d2 100644
> > --- a/drivers/pci/access.c
> > +++ b/drivers/pci/access.c
> > @@ -42,7 +42,10 @@ int noinline pci_bus_read_config_##size \
> >  	if (PCI_##size##_BAD) return PCIBIOS_BAD_REGISTER_NUMBER;	\
> >  	pci_lock_config(flags);						\
> >  	res =3D bus->ops->read(bus, devfn, pos, len, &data);		\
> > -	*value =3D (type)data;						\
> > +	if (res)									\
> > +		SET_PCI_ERROR_RESPONSE(value);			\
> > +	else										\
> > +		*value =3D (type)data;						\
> =

> Hello! Just one small comment. It looks like that in this patch is
> broken alignment of backslashes on the end of lines. Prior this patch
> backslashes on all lines were at the same column. With this patch they
> are not.
>

Thank you for spotting this. I apologise for this. I did not configure
my editor properlly so I couldn't recognize this error. But I'll fix
this when I send the v3

> >  	pci_unlock_config(flags);					\
> >  	return res;							\
> >  }
> > @@ -228,7 +231,10 @@ int pci_user_read_config_##size						\
> >  	ret =3D dev->bus->ops->read(dev->bus, dev->devfn,			\
> >  					pos, sizeof(type), &data);	\
> >  	raw_spin_unlock_irq(&pci_lock);				\
> > -	*val =3D (type)data;						\
> > +	if (ret)								\
> > +		SET_PCI_ERROR_RESPONSE(val);			\
> > +	else									\
> > +		*val =3D (type)data;						\
> >  	return pcibios_err_to_errno(ret);				\
> >  }									\
> >  EXPORT_SYMBOL_GPL(pci_user_read_config_##size);
> > -- =

> > 2.25.1
> > =

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
