Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440121422BC
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Aug 2024 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723884130; cv=none; b=c5f3eO/LGakuMkwW3lnT9QGY8G+FpSmfa+bEvUX8loBPcxPj3LL09GZssd0UG7v9lL9ItMONPtn25TnDqletQ3iEFAOsHvbGP4hUL0ebpjIL+Ca4pnm1Cwclna9n0Fi+xc9+SU9SOsj8R4xgVx5FfqqkCh933OH+2sfKQ/ZeKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723884130; c=relaxed/simple;
	bh=4I1mupdmsAw4lOp3B/yUB4W64cuBTcGjFf3fQ5QUA/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aob4eNJZ8yXVntQZBt0c6DHU048kOwBCVkcySlAhVm/4OqCgE4jEUgq6zcyw+XsDIV8fkDOb4ZA743ZTyXUABKjn8aRVywJyw3Zo8iiggn2K2X5Kq41kaH1OnDM1qRg3NLSfSMz+U+352F2JCksBJqSlA9nWIKTQLKiDm1B+se0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al1My9PF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al1My9PF"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-690e9001e01so26716547b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Aug 2024 01:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723884128; x=1724488928; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eMsJxTM2zOmRS6+tqFj/KXfj/XkuR+C/+5c8VgCc3Y=;
        b=Al1My9PFo6/k5srny1qHwxXnwQ2W5NO8iXLK9NMX7TnWu4vEK43EhKmcxCld+1QQoY
         CeJeGvUZlqpkvjqN2gIyzaWXoj1ZtjtOAkLtuN2r4Syo1JRVsuF+7DtLad1lkWHfyJVT
         Te8K9FwVJ+8r6gw+6k+YtTGwwr/YAMxEBwEYw7WLJtRryP6boTn0Z318gLigT+PhgWRI
         HX1/wncMaqb0Pd3QLl0r4/MrETkdUvbz0katVlOb/M9EraMAz6TXNAd/vvGU/ppfWNMU
         +Wi8dGavPg0vEill5zRghnQLXskaKz12zZzPb3guJJ7Dq3ctEI+7LeEdxkaTA13bpL6V
         tF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723884128; x=1724488928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eMsJxTM2zOmRS6+tqFj/KXfj/XkuR+C/+5c8VgCc3Y=;
        b=r71ti/tMHfLJMxlLgdfLx5Q8cClGPs9qyTnPyHWFOEdEQ0utoCKj/SRQjAJTUOUHPX
         cVdgB+rbgQ8lnh1Vdf6Rd7N707zqu8uRwQ8qs/UdPpSHskc/ut5yIvDnpGpXKe5IYVj5
         dkPsJaoOcvyVWIWJB0C3W4fcA5bjVYC87u+GJKD3dEXDg1rCzFNVYP0I/Lj37LIJtkHj
         Z2sGutECS+oqCrUdcFgn+OjNWDE4YHksLXTBjV0OOpVDy+5dwXJyS8ZQZh4zdeAZwG1P
         B5uQTbj7T8EoSwcxx0/OadhzQPap7F6tliIAkjZuR3IWywiLMYng/dtjj+w5Eosef89k
         NiUg==
X-Forwarded-Encrypted: i=1; AJvYcCUf4o5pSiW3mrNP7lYwAsgNR+nXlBpFFwpr8cb00E0QMOafGy6OUUgDCNQl621QOC+UbisgCqA5DmioWDo0LjqGJTX5PNv9zoSI6AqdyxOdVjsYalo=
X-Gm-Message-State: AOJu0YxlYyJDCDfo4naNdf988u1W2zUh0FhZWXDVVucSNjXeq4SHCD9M
	RtSiwOVULw2lKfcuqXTYEpmC8n3tN4IWxlbwuDV5rppwPtdk7BrAmeqqltmefgBaRMuPLqddb16
	5ak5EhQYrC3kuxIvC14a+2HtfGvI=
X-Google-Smtp-Source: AGHT+IH/bN7m+GREt6zV/O8rtGprxJFVfkBD2hfqkVRmLL3zNnCApsctC6ZVhzVCMOnM1LN6O5ppOC8r090pASW/sGE=
X-Received: by 2002:a05:690c:4:b0:646:5f0b:e54 with SMTP id
 00721157ae682-6b1b9b5ae86mr67136927b3.8.1723884128092; Sat, 17 Aug 2024
 01:42:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817080408.8010-1-av2082000@gmail.com> <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
In-Reply-To: <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Sat, 17 Aug 2024 14:11:57 +0530
Message-ID: <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev, 
	skhan@linuxfoundation.org, vkoul@kernel.org, olivierdautricourt@gmail.com, 
	sr@denx.de, ludovic.desroches@microchip.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com, 
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com, 
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com, 
	linus.walleij@linaro.org, ldewangan@nvidia.com, jonathanh@nvidia.com, 
	thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, 
	michal.simek@amd.com, Frank.Li@nxp.com, n.shubin@yadro.com, 
	yajun.deng@linux.dev, quic_jjohnson@quicinc.com, lizetao1@huawei.com, 
	pliem@maxlinear.com, konrad.dybcio@linaro.org, kees@kernel.org, 
	gustavoars@kernel.org, bryan.odonoghue@linaro.org, linux@treblig.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > Correct spelling mistakes in the DMA engine to improve readability
> > and clarity without altering functionality.
> >
> > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > Reviewed-by: Kees Cook <kees@kernel.org>
> > ---
> > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > V1 -> V2:
> > - Write the commit description in imperative mode.
>
> Why?  Did someone ask for that?
No, I received a review comment on my other document patch.
So, make similar changes in response.
>
> regards,
> dan carpenter

Thanks,
Amit v
>
