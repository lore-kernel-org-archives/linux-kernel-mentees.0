Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C7A1422B8
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Aug 2024 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723883144; cv=none; b=kbBlw3v6g7OzdUXSXh1QnyBYEEbsRBNXrLqNJ6vuB0YdCU7O0zb7kiWW/bgi5UmsySDaQS6plVLFS+TSk9BqWq/tNMgjStwHRoDdOR4WRwQLNL61av/N80Qp6opkReOXHyWB3knsLORfOdV9PWIvLnbfgcBxAFpixO+pOJvCTmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723883144; c=relaxed/simple;
	bh=7QYh5fWsYcBy4BjPUODYKtBT58CJYBQAeJg9WYheKL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dK3b2ACBsJh+O95JYZJIDCeRKH5UPc7/zrzG6v4n5WOLhYljilgMbz9Up7Y7vYZ2mtHD2vopcwQPYUTK1ekg0lFE4GhDEU/xeJRYRWUYghwXBAtSNGWpRxBIzwC6ZrA/PHhej+5nGDLQbBgT0bWhltA6aBPa1LgfxAR0osP5Tug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXI0MvZN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXI0MvZN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428163f7635so21680455e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Aug 2024 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723883141; x=1724487941; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=;
        b=AXI0MvZN3K8J1zzQcGGyDz+TnCsprGQi1LHkhUz1hI5sT0LGf8yPotllTxm2lZ17EQ
         JRnUxWQBA+D0G+n3qC6UCSUAO5nZ8lh6AZ0Myb/cNo6uSgCv/ztm8NFISA4kmcKsxl7s
         bi9KTbB0K8JNyPT+3DaEz/Wup1lmQr+WPlR3COT/2AFcalUIrRjN0xvjAcR7Z83zT6s9
         JX/pt1x0iMRS9yORZwYt97M7vq0pulGnRmOg16LUFmKnnDe6IwAZemSkokmOrR96QDHk
         xM995sKc58lLtjYZqxD6fXJAaJpTbPGcksPv+lXMlubXWDTeCY59KbsblXimnF86ILIK
         DOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723883141; x=1724487941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=;
        b=rUKJIRg/T3Mv0RDl7zuDrsyduhKYULUkMpEl6yDZi5ecg8bBJA3LtnwW1tTPjVbhMg
         wmCYhyEI7s9/coZTJnehaSQqHgUqDkWm8Vkg2k7pUhPG30J2W4vbYYtin3yua6H2saEJ
         OnoVkQqZHDu3Lw+GSH1phe4SG9a85S86XJBmdxenk8sC144V+bG4hIHCNpfZbjF8F/Y1
         auuy395n2lj3lTtptQG/5u2FQ+FGSkDWATYO+DY3lSKxByLjgYBBHj0Ot/nkbEf5t7zU
         0Td14upD10ocxVa6c3UspHIwIzIviaXD6bdD2A+ZrMgIe8vJl9K0MSUIyrNNxLRhJ1J0
         RTKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUh1uUyxOxBz+tEMKexvSguXikdYDG05T2GaGmGzwOEdf3H2gafN9+IhujsBBqicDNGkv7F4FVp/P7HbEcM7WzG+D82Jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/rKYCy6u26REhBWtS3EuKKnp+7cwF3DgRqMzb+g1f4cZrxXQl
	qqbyP9wVeXy0qCWaUnWS4YqhW1FC/nlgiPL8/j7gJKh0jIau+nuQmFqx7cDsf/k=
X-Google-Smtp-Source: AGHT+IFJ12nDtVRGYsYXFLwDyDsgUaCOjGBYJyBY4Zbk3GuRikGwJdu2MeEqx46imh4mG3NDHfzGgw==
X-Received: by 2002:a05:600c:3ba5:b0:426:6667:5c42 with SMTP id 5b1f17b1804b1-429ed7856camr34069445e9.4.1723883140978;
        Sat, 17 Aug 2024 01:25:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded364fesm96109695e9.27.2024.08.17.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 01:25:40 -0700 (PDT)
Date: Sat, 17 Aug 2024 11:25:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, vkoul@kernel.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	konrad.dybcio@linaro.org, kees@kernel.org, gustavoars@kernel.org,
	bryan.odonoghue@linaro.org, linux@treblig.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
Message-ID: <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
References: <20240817080408.8010-1-av2082000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817080408.8010-1-av2082000@gmail.com>

On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> Correct spelling mistakes in the DMA engine to improve readability
> and clarity without altering functionality.
> 
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> Reviewed-by: Kees Cook <kees@kernel.org>
> ---
> V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com 
> V1 -> V2:
> - Write the commit description in imperative mode.

Why?  Did someone ask for that?

regards,
dan carpenter

