Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBFF192D65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 14:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727707890; cv=none; b=G8FEE26xi7mTy1Tf2zGeJlLna2M45nchUYLoZIrRVFy+QA6bIKSyNZ653j6T4tprquRqGxF3yEoMNPbxwa78QIeDR05XJl4Ihtl+xu/Th2Cp0AnwUbSnIy5sLAmTpRrue2o9a8/spDccxshI1kBO3HHrrEfE349BWSLSJfpz6iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727707890; c=relaxed/simple;
	bh=iq44ZSPXoH3DWyrORw+RLql2YfSaOsPWaY/yPc6+sr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=an7j5DCuJwNA2/uWgkPeUc27MDHTCJxGzQaJn0Sh+MuyV+8pmul/qT1JunU67slJQOGze1sCtmrTGybDCQO7Az9VRao3tyaaj96XDryEWmDkDAbWTzJDfhLSv49EYxHmxMPaMu4i9RCT7ceQ/AZSf2huwPJVAJ9DDlnajxZaTTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coJipxJh; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coJipxJh"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C92B805B7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 14:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7LLtKLf_fGR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Sep 2024 14:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 871F5804F0
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 871F5804F0
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=coJipxJh
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 871F5804F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 14:51:27 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e0b0142bbfso2698762a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 07:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727707887; x=1728312687; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6x7ZALWOWCmXqdia15jd3S0YfQVz65PAFjVKeDGN2pU=;
        b=coJipxJhLzAr5bQHAKjMQjNDIn3Hx868YvQrOqOvXEFUoagKPmt0lTyxRWH51ZhPRW
         aENmrIzfjNuee0ipf6D9Dy1B2qMsSiZpOFQjZAn2aC60Zl8vMxROSBheBuSIXCoOht01
         GjuGL6J2lZ26740C3HsQbDFzS1jYim8zMGI2S0kzQgP3mJdjrxYyGb0GrSo/gDSGi4QL
         WM0pxGgZDFhkTuGxCv48PXBE3GAwAZsK8Z8q7jF5KuICIi0OLj5u5OO1b6ZJKvOKzPcU
         LptIPsCONC0ibJs4zti1WrS6c3sb7ZGaTI4gjjo677KEpv+v6wGQtTXdK4oZQhv309k/
         xXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727707887; x=1728312687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6x7ZALWOWCmXqdia15jd3S0YfQVz65PAFjVKeDGN2pU=;
        b=HThrRWvwLdte8bF2YYJOOoFcrRtZtAFDul6KfY+LLZ8xglVtZ0r/bNC2AD7cGJ4DdG
         cUTEQpRaxZUIqsv9VXA3Y9tvXO7ggQbriFOyYFw+xv1pxBZZV6q3KTil090Mv+N47ANR
         irqM9aXM4NCyhFwf0ZGdiH6MNCTFX0p87eFCMgkXv3nBPSXCxybz9lobXZXrNJE207rW
         bPA/zclkArJDBpXcwCxYHdfb6TLOGjWWe7zd4w3O0edm8ZzMjnvwGqS6YUL5cnkKBP19
         2S42+HJN608CptpJUfmFMOtg3qsOWFDyqvw5j1ajWbByi28lmnxAHfDVV9B7rA36CHBA
         /Rgw==
X-Forwarded-Encrypted: i=1; AJvYcCWGAkPI9ZA8phhJuwWw7GKGnpyWGTRMXvh/sY2N1Z9DatRxFVywz15wPwnrZXYnLqpek+e1IlYWM/nPegsqLWvtk5d/fw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yzn5pVs3dKtVasgi/SHpRXkfntJEFuWB8ISevoazf9maikggRa+
	ikxRwJ+5P5GIxn5Dchm2vlBPhXR3qSxfD02RJuOcYgvwom/nAK6J
X-Google-Smtp-Source: AGHT+IHAhBDFglodz8Nwr8B8VPwGdmfLW6SddjDxnpRkxHHCt05UUbtuwZUux6z3aTbifAeKmwt5+Q==
X-Received: by 2002:a17:90a:8d12:b0:2d8:a943:87d1 with SMTP id 98e67ed59e1d1-2e09121b4c9mr24030612a91.13.1727707886389;
        Mon, 30 Sep 2024 07:51:26 -0700 (PDT)
Received: from embed-PC ([2401:4900:1c26:3294:a303:135d:2d56:fd2e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0b6e2a53dsm7988225a91.55.2024.09.30.07.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:51:25 -0700 (PDT)
Date: Mon, 30 Sep 2024 20:21:17 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
	sbinding@opensource.cirrus.com, simont@opensource.cirrus.com,
	josh@joshuagrisham.com, foss@athaariq.my.id,
	rf@opensource.cirrus.com, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
Message-ID: <Zvq65ccNr9L27BEq@embed-PC>
References: <20240926155112.8079-1-abhishektamboli9@gmail.com>
 <878qv9k1gh.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qv9k1gh.wl-tiwai@suse.de>

Hi Takashi,
Thanks for the feedback.

On Mon, Sep 30, 2024 at 10:09:02AM +0200, Takashi Iwai wrote:
> On Thu, 26 Sep 2024 17:51:12 +0200,
> Abhishek Tamboli wrote:
> > 
> > Add the quirk for HP Pavilion Gaming laptop 15z-ec200 for
> > enabling the mute led. The fix apply the ALC285_FIXUP_HP_MUTE_LED
> > quirk for this model.
> > 
> > Link: https://bugzilla.kernel.org/show_bug.cgi?id=219303
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  sound/pci/hda/patch_realtek.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index 4ca66234e561..94125a977f08 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -10315,6 +10315,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >  	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x88DD, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> >  	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
> >  	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> 
> The quirk table is sorted in PCI SSID order.  Could you try to put at
> the right position?
Ok I will put it in the order.
> Also, please use lower letters for the hex numbers there.
Sure.

Thanks,
Abhishek

