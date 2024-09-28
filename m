Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65E1B299
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 28 Sep 2024 02:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727489702; cv=none; b=r1ktynGYyWSI9TraoyVFr6vP6eHtoapnQaSBXcxXYSUhk3YgZ9JlshpCPBAizwhovyXgjJqCqfefrxdJ/L3EHFv+T1MlwPkm84qQmlOSv1pV8PdgD7PrjiDFH1OaJAGFwd++WWlygTkS31leox38trbegYkVuPy62vmux0qa/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727489702; c=relaxed/simple;
	bh=0N9z9QkdKLDNcbh5vPuhtWxnbaagBATs4qiwqABmrFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elBaes4jo3TwhGiaEgbFO5hDvzrrl7db0wUY5VPmThnXYPCtcNm0X3FrQZadWDyz2Mf+KUlDULRrYqTWf/5oi9Co+mr9ctmexOtjIfudCLBmfKcpHTc8xvI8DhDV4lJY58xDXACnyskUeqZySeI0oath6H3oR1RoFEdjRElOs9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crEMlpco; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crEMlpco"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 974884012F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 28 Sep 2024 02:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-VvQorx-Z79 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 28 Sep 2024 02:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 505B0400EF
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 505B0400EF
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=crEMlpco
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 505B0400EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 28 Sep 2024 02:14:58 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso144832a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 27 Sep 2024 19:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727489698; x=1728094498; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqrgAdB0rZN+RLFsmGURscFhnQ+qvKVFVUuv62yRYuE=;
        b=crEMlpcoChDWiWCi2jbVXd32M6NGV4xO3ZTA7VPjA8ZGplTw8C2zY89gH++BdbF9Tf
         YdRvQo0w0LTCb7MclVs6CLnnc9a9nM02SyV5Xy6KeIw77ELqFZtgG9tZfxbfXZOJES6O
         cjC/sWd0EjxWcZlTcOV/FKhHA4d52ABvmS7fG2D/29sUCsSmUMDbmWkyd/CMwWD1C88I
         dBdU/KX8STxKz0yNThlGjgMOqm/88vVZ8IL1nzhM18sp3QcAOsZKjTueh3k0nxuvlH+V
         16g4baoxc3GTYeHZdgdNgAdxWfXrF/vv/Sjtl0a0zfRUGRIDyr1HiJyjstJ+Yi5I0XaR
         n6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727489698; x=1728094498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqrgAdB0rZN+RLFsmGURscFhnQ+qvKVFVUuv62yRYuE=;
        b=DFD5kWGpE/68IBzVzO2qUydZsqKSCMsQqD8bgFosydTRCcBmBimpv060SBV7fHq2/L
         B4OP+FRXJq8W5yXkkUmQMQUi7MWYVLLb0CJ9M3nKW+OUIa5tYRkEX4HsaIelsbDT8nAm
         DsAFqrikRlguXODvVQs6zxywD9e3+ZqXa46Nq1my1S0ow67xiUkWsYkgLyQF8Ctlv/c0
         wimN5/h3khRbDCVQCp0E3WqdItzToYZHSd+Od4Xw6dxEnfCWuTOfLuHlAAzlwEA6vUTK
         UhIjfmjMHYnughyBxcRkA5EbhSJ3HGHQPCW5VXpxBV1SU8OsMLjtLPjh0mk1HGmPco7O
         vOOA==
X-Forwarded-Encrypted: i=1; AJvYcCVxeaoejy44UMHkd+l/NJu3qn98X8LlDTSUdN1Xqt9DfhvwRFwDmiy4nFAUS5m8iQN9JxuEwz01lYzoCvcuht02OwuG+A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyEOjIiktr0G5y1c8zQOJouG6RvASV/6U2GKqEjaXAlhQIXp7wP
	XFnHosSpKTHMZMUaeJ9z6z0xCbHrh4Y548Jv3YwwB/aIGPh4f8HZ
X-Google-Smtp-Source: AGHT+IHuTV7WYUUPQwB5pjr/BMdyWBPHJHV6WFyqQ8PRIEao1mkbuWDVSHjGDHU6SDAviEAnNHG2Cw==
X-Received: by 2002:a05:6a20:4393:b0:1cf:edad:3bc7 with SMTP id adf61e73a8af0-1d4fa639f28mr7601337637.7.1727489698047;
        Fri, 27 Sep 2024 19:14:58 -0700 (PDT)
Received: from embed-PC ([2401:4900:889d:8638:3e48:c969:47ab:86b2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2928f7sm2312087a12.5.2024.09.27.19.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 19:14:57 -0700 (PDT)
Date: Sat, 28 Sep 2024 07:44:48 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: perex@perex.cz, tiwai@suse.com, kailang@realtek.com,
	sbinding@opensource.cirrus.com, simont@opensource.cirrus.com,
	josh@joshuagrisham.com, foss@athaariq.my.id,
	rf@opensource.cirrus.com, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
Message-ID: <ZvdmmIHsUjWq4bp/@embed-PC>
References: <20240926155112.8079-1-abhishektamboli9@gmail.com>
 <ad6b7073-4fcf-41f9-b6ff-e01bf7089017@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad6b7073-4fcf-41f9-b6ff-e01bf7089017@linuxfoundation.org>

Hi Shuah,
Thanks for the feedback.

On Thu, Sep 26, 2024 at 10:12:03AM -0600, Shuah Khan wrote:
> On 9/26/24 09:51, Abhishek Tamboli wrote:
> > Add the quirk for HP Pavilion Gaming laptop 15z-ec200 for
> > enabling the mute led. The fix apply the ALC285_FIXUP_HP_MUTE_LED
> > quirk for this model.
> 
> Were you able to test  this on HP Pavilion Gaming laptop? If so
> please add that to the change log.
The person who reported the bug confirmed that the patch resolved 
the issue on his device. 
For your reference: https://bugzilla.kernel.org/show_bug.cgi?id=219303

> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >   sound/pci/hda/patch_realtek.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index 4ca66234e561..94125a977f08 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -10315,6 +10315,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
> >   	SND_PCI_QUIRK(0x103c, 0x8786, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> >   	SND_PCI_QUIRK(0x103c, 0x8787, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> >   	SND_PCI_QUIRK(0x103c, 0x8788, "HP OMEN 15", ALC285_FIXUP_HP_MUTE_LED),
> > +	SND_PCI_QUIRK(0x103c, 0x88DD, "HP Pavilion 15z-ec200", ALC285_FIXUP_HP_MUTE_LED),
> >   	SND_PCI_QUIRK(0x103c, 0x87b7, "HP Laptop 14-fq0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> >   	SND_PCI_QUIRK(0x103c, 0x87c8, "HP", ALC287_FIXUP_HP_GPIO_LED),
> >   	SND_PCI_QUIRK(0x103c, 0x87d3, "HP Laptop 15-gw0xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
> 
> Looks like this has been fixed:
> 
> https://lore.kernel.org/lkml/20220918171300.24693-1-dhould3@gmail.com/t/#m0c6aeebe5cc89c9a4228d49f56f4a0a4c516e012
No, this patch seems to be for the HP OMEN 16. 

Thanks,
Abhishek
