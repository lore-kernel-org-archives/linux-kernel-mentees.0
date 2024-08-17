Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01894145B0F
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Aug 2024 09:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723885685; cv=none; b=bAOTxCLcLiIbf7wDFxefrYpOpdoHkYPzR7zKjLZsXfuAj+HbCl8TC7B36vx30s92mGMaG+/+CNg4UzrsAYbatbkk772k/JO/uOn6SnMMGCK9yO1GVw9PI9D9h0E7nFJFE/OhR8lLOQQaxO1lsbr8q/s4qKNeVvtycFS1yU1eXvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723885685; c=relaxed/simple;
	bh=C9VVaFBGTal8QMa+obbM4icDEq9C82/NMX9XkzX8J2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfWeuMLMHIb9sTITBom66FLX4WwGRn8mQrHIVG09lf1sSsaaemyQV6iiPDNMcgpKyEIReynzXYh4TrGPoKhZd7evJG1K/b1lFIQaOYkNIityoK21+C0q7I0fZpOJa/9eDXz16sWONIgWwNSdxog0ddvqw8qOuOh/gt225BogdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tRQlmSrN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tRQlmSrN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42817bee9e8so19034905e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 Aug 2024 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723885682; x=1724490482; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=;
        b=tRQlmSrNugjNUo95f8nPlV0K1M8qCjWF8dHfjXWUlOx1Aig8aufpHYel+xO+5wKNFv
         sbE1ZiB/zlVlsTE/uBKSgtGWZ1+pzY/E6013HEkgx351wkl0ZO3WsaTw59TIeHlOY/Ko
         k4yvAg9wv37jFk0t9KFbhcxOzwOgqBtr8BCL98q9hEqcgez5AGrKhG8636Dsi/c1byLx
         VM3fvhrLX4rxqGU4A10g+ULgooKYtdz/lR/q7gXQJkk175dwGIsmZ2Cks3vFNnudpjf4
         hnBlggQ+lFP2mkoDEjP01elhSEtg2f6dCjM+DJ8NVUnb+YtSnwI8EvrKH75sltdlK2iC
         nuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723885682; x=1724490482;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGF9YJkO5A7YVtlAJixymINWnO2oLXUTJ5Rdb0OiTlc=;
        b=S3EorhDsKVnkVSLSBdeuw7r/VoLCJqCfJ/K7eI9sPbKFIpLJKy3ydUmOaIT4iNWJUb
         0XtDDh0r+Tt18OYn6q0zCW6vBqSsoreEP49XSqJKvOimre84rwFEQPK7QUkNNp/QQ8e1
         9ut6bXnScpVQL7smbDMp4XH4fBAd+73UgoWG3VxhpWJJlaOd6Qhrmgjl7XmbNz6/yLCn
         Yx+gCkY5qUuXVOtdGlWV9q6GHjoUkrV0EMDH4Q/pt8XuyVG5AtL0KBemCI0KSpwKWrJJ
         W1ZZLtUbBHLZorz1OAF6tOCAzmN8nLll/YozLKd17/a19YvM2dyDluDIJ7XvGj9DSDLV
         C/ow==
X-Forwarded-Encrypted: i=1; AJvYcCXQDTBfyMJBOmkFyEQqJcDUb3jMGEU1FFhKvY6g5Lu3u8YMPRb+HBDCAhyvqx/9fz78HjHE5PE5pntB8z9jyh6a8raXDDrOAcvMBBQKQ20M/e1wbq0=
X-Gm-Message-State: AOJu0YyFhGAxn4AeX53KM5Wi9QEq8x0XAFmTdfTMFhee+BNTIq+5T+MM
	cYiPR71QTBsFGaYo0UG1R+Z4hfov9u0R0uBK19MAXN0ipCjlk8cmfainNBMHAXY=
X-Google-Smtp-Source: AGHT+IFqPK78U4SliOQYt4MFyXyezxY5YXxZuEpRIOtN+fnxyD4VwFBOGWGb/VPGGTvD3eHpkc3FQw==
X-Received: by 2002:a05:600c:3145:b0:426:62c5:4741 with SMTP id 5b1f17b1804b1-429ed7870afmr31694215e9.2.1723885682237;
        Sat, 17 Aug 2024 02:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded7cfbasm97704135e9.45.2024.08.17.02.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 02:08:01 -0700 (PDT)
Date: Sat, 17 Aug 2024 12:07:54 +0300
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
Message-ID: <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
References: <20240817080408.8010-1-av2082000@gmail.com>
 <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
 <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>

On Sat, Aug 17, 2024 at 02:11:57PM +0530, Amit Vadhavana wrote:
> On Sat, 17 Aug 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> > > Correct spelling mistakes in the DMA engine to improve readability
> > > and clarity without altering functionality.
> > >
> > > Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> > > Reviewed-by: Kees Cook <kees@kernel.org>
> > > ---
> > > V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com
> > > V1 -> V2:
> > > - Write the commit description in imperative mode.
> >
> > Why?  Did someone ask for that?
> No, I received a review comment on my other document patch.
> So, make similar changes in response.

Ah.  Okay.  I was worried someone was sending private reviews.

(There wasn't any real need to resend this but also resending is fine).

regards,
dan carpenter

