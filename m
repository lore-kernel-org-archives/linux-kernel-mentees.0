Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E21C7B8C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 Aug 2024 16:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724775439; cv=none; b=Az5h4CmI2uu3PzWYu/cMa8oF3XQmNp4H9tYUBWFKoGelVguZFBDz5GZff3ELhRIM9FajHUu43yNsIR54cWD11ML7YXNhiD8zb7kXE7GptgIG3Gz+WDcCAqDrFwPleFM9AVYB8iw32DrQSEJczfcnUuMei9jsRCpbE+0Y6nRx+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724775439; c=relaxed/simple;
	bh=e9/SnnD2Hc7nrmiUV26PmTlAN807y9TdOycQU6CJMA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EJaZWCNoZvPPSURgCb7/8jyxyD2x2qsqWjdnWQ4EvGetjMBr2ztN3erausoO1PAKbopSTvoIcBg3LXYkYgQ5kEf0p0StssXc4aSXQoAazU+pObLCrZyWfb6CZJV24KPZhxK+8tjavkB3+FWUsffMlIYZKrwjAT1jxRx8AMbNgyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIJQvEJO; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIJQvEJO"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6b6b9867faaso50818377b3.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 Aug 2024 09:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724775437; x=1725380237; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GgD4dqFDyUnD/vStQPVANJoNOpD1Qd5JKsejYAWVUn0=;
        b=aIJQvEJO5N3qcPcuyfXmNOndrN8z5ViCfBqNSRG4K4IZbOnz31tem5jCw7xiRt4ZtR
         IXdrcANGwCxiZmts/nUpJwN1v1A5V51FWfNb3dd7iJqItZjeQ54dYHyV5Jotqebo6PCP
         lYxTTiNQVqB1nSSaqTgg4kfeStyjt6fxfKyFhwVUX+zq1JmxDKLyrxJVBlocAtmX9Q41
         DixSu1ZfSrdVaV7uHdz3m+AByh2ApXgqgGWAtyclzvsrAfO6tLj4JEdZZ4mkMi/r/k7C
         eR57CFTJgG3xQqf75A88Qab5hI/TCg+TUhI1vE7JoX696AQ5XEfOiruiWmMabn5CNgLp
         tmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724775437; x=1725380237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GgD4dqFDyUnD/vStQPVANJoNOpD1Qd5JKsejYAWVUn0=;
        b=ODo8janIy11CtrbNnPD86nqF77HpEtIvc9rkXQwome8OKXoylKl3F+wk8NyR0wJOGH
         tcHdwODv0WS7f8BNpV8YdttWs9JtpUHLVm1IZkkerg+Kd2TuyZwNf+nilEjkqAZAD0d/
         cQthm7V3ujRsc4+IBRB9aOCnhy6z5LiwF+OHYur6fw7M0WDEViTV2YW3BrNA6WWXMI9L
         +s/j/I8oEKC0z7lO2hXA+kNw7P6yg2XgpzQVQRHBrjjip0YR8DZ1FsWlbAlsRxV06h89
         XRS9munHl0YSjWjS/M30t7ObVtyntzrPZQI1b2AQhTtOZyAdfA5SzeNxRwKmnWdE9cWg
         7DaA==
X-Forwarded-Encrypted: i=1; AJvYcCV2eylfSJPF+i/Ajt97Xma4c+JPX+nfOrjLjMU4DoS8DTDZUvO1IYnUnRQ8VU1yECKrY3ES1QUZAo8sQBf2nDPjaCjUsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4C8yb1xtn/XBuwM7vteo3q7mNfS5xylrPqepkBbJHxAp9EStw
	PuTnAolnufLko2r5zP3km7Buc6fhEGDTnYhO1J/SXDzOd+RTHwb2QwUmJFCh6tut9Z5nluldNLi
	30xkrv46vGgR7Fb8X20KX7dEj/VQ=
X-Google-Smtp-Source: AGHT+IHnzsaeAYPx8AAxOBSMK1fpK8G2cmPPm5333uqFeT+rlrVWxKv2QLBzOXLZg8T5AQY4Vh4hdFkNwQmz32UOBto=
X-Received: by 2002:a05:690c:688a:b0:6ad:8bbd:aec2 with SMTP id
 00721157ae682-6c6262f44e9mr177725977b3.25.1724775437350; Tue, 27 Aug 2024
 09:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240817080408.8010-1-av2082000@gmail.com> <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
 <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com> <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
In-Reply-To: <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
From: Amit Vadhavana <av2082000@gmail.com>
Date: Tue, 27 Aug 2024 21:47:06 +0530
Message-ID: <CAPMW_rJi46_2Ho6KNS9NK0kbfc3ujrx-EJ3586wf0u7vq2kUog@mail.gmail.com>
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

On Sat, 17 Aug 2024 at 14:38, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Sat, Aug 17, 2024 at 02:11:57PM +0530, Amit Vadhavana wrote:
> > On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> > >
> > > On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > > > Correct spelling mistakes in the DMA engine to improve readability
> > > > and clarity without altering functionality.
> > > >
> > > > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > > ---
> > > > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > > > V1 -> V2:
> > > > - Write the commit description in imperative mode.
> > >
> > > Why?  Did someone ask for that?
> > No, I received a review comment on my other document patch.
> > So, make similar changes in response.
>
> Ah.  Okay.  I was worried someone was sending private reviews.
>
> (There wasn't any real need to resend this but also resending is fine).
>
> regards,
> dan carpenter
>
Hi All,

I wanted to follow up on the DMA patch that I submitted on 17 Aug.
Kees Cook has already reviewed it. Have you all had a chance to review
it as well?
Please let me know if any additional changes or updates are needed.

Looking forward to your feedback.

Best regards,
Amit V
