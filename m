Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B420302747
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220709; cv=none; b=PuDH0LQqgwhOlfWrIkv3HhAahOZ6CYJeVQ1AMRt4JJuQDkgGgOSRhbyYMmrVl2/olxGmxPiIblhT9exChxI4FxPBo6lTh6ju/PN/Bq8COV7coV6LU8kBO4aCLw1ouSTyZrOjgQJt9g47MKyuCSNOfb4vwR9Vp9dCXsSkycDSX+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220709; c=relaxed/simple;
	bh=4CjGKPAq1W37+N36djPYAbOeKd0dVmX3F1YsS0DBKtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nV5Gc7TZ5/L2K31lIS8YRxH+X92VF0wst81djtJIuahAHsCkz8fB4hUpW347oDj9V0myA4lFn+M+LbGsh3nfCKqjfQsqGXkmDTnmoaOOlcsmRiZGTIChKbQR3m+KO0uO+YisFnXy5lS45KQ2EsaQv6EEw0rdLjqI4WeR8kclUnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDEmyvhu; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDEmyvhu"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso772270a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Oct 2025 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761220708; x=1761825508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaz37uli6J484fxFDKJ7GFD9eSfiZc74ATY0uVGQ7Go=;
        b=BDEmyvhuMF/EhtDGr/fu8VmAkzaYSQu3LdeHbDURtZVMCxX4eq2KJcMANdqhTmsDTq
         zVV0qnN8H2ID3Zl5os3x/wVza605Lnm0Xo25tI5qHE55FGaBKyYoPK4qOStW98S7Y3R0
         9SgmCzEpFcJZnm1PDIq/reUEIntZIC8y1RdKGMvCuA73xwsmL+7l4zek6ch3z5fye8My
         EU5HAgjF1cBER8NBpDTXeSur4KZY7mF1dAh0DxtsHbbpEu8SJm5dKgspk6tm5o3zCJen
         cuIUDnOJJGZBH8xqkjxOi3VT8tSN3yKiPvqA+f812atiksOUmvRYRuDWC16o7dt27EcL
         STJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761220708; x=1761825508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaz37uli6J484fxFDKJ7GFD9eSfiZc74ATY0uVGQ7Go=;
        b=srHjX7904FFBuBiL20sEe9sRLaKVwZEUWZfGANKKB2ecu9aIXjrxeowxLFsRrVetfo
         vmDkTgPCYNog7L5rBsYfH2FfIoDfla7IrKxV+ZDtCyT6r6YSVA0RgJbuiIRon7SLC3rR
         96GM313biEKsaQ9H4mDwFTutNmnXAjfd3m7Zwfy6imuKNRcf0Ap0tI5YdlJBXnjbZ43G
         BUCLh2AZsIJlKecBeoEiedm8tSthwHJ9zrOvD3PKPgPEWeGLj8xZGpMkEKpoYuJjGwk7
         iAQFDviVOLRJBtvD8gpCDOZOdmxSa/3QKZYrRP9OItOnCTl09i3GedGOq5ASI6h8UyG7
         LwXA==
X-Forwarded-Encrypted: i=1; AJvYcCUGaVfg145aHPoX70mgfgVHgGFmEF0S2hu5Yuu3mZMeYtO0x2f3lG4WMqv2QuzFhEtkRFuTNkZZmMcA1YsVLjqj3PxubQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrHLEYpGTAyb9uY5TxvWuXW+CVDTNgqTrbjOCOmib3+WHPaY0G
	cb85bnnqe+Zlot3yH8mIgaoDVhxSoXzp6sp+HA/sfzcG2x8ZdEa403MZ
X-Gm-Gg: ASbGncv9X7+FReOWRfLZ1sFcG6qQK0LMsqf10nfLlgdQskFTjCTijQLdQELXMYURe22
	rOmpj1AjbJB28CdY1gDyYzdIXvn7VkqMATA9e6neMLEVDTNVCpxi+zhy4EyjlwZzWZ8LzQVaQO8
	1w7o5bQJBPh0qOgZYCeF1Uf1u1h5yJjwAlxO4u/4xp7YzK1CMA5Q/ycV8RgaPSLXBy3+VXjvmUo
	vLVM+L8MEYMkD1cXaM/e95gSA3YRvh6XCMzh0C58cCSxIq60+wF95W5AGBxddBgxe6Iswv3M8+C
	m29vs47djKS6s/5u5GVszfKdkTC5tXkzdtvvpryI9jkMRsFHsQg3i/YD0yMugz4QrRWJOePK48K
	DV+JzNBQqiz1nzEK7Sd5ZdvrPNFdB0uR26f0UwkNhlU3yKr2idc1NcDHRAyve0wHN2qnZXEOAbB
	5RwRHVcaaLDdjSPAciXA==
X-Google-Smtp-Source: AGHT+IGz00O6KaHXIzzRCHXCrtBw16lzTqxkkQ/sun9CtpCWlM1f0PPU+ZDXb1kY+gRHfHRjuOVsug==
X-Received: by 2002:a17:90b:3909:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-33bcf8f7376mr33270394a91.23.1761220707433;
        Thu, 23 Oct 2025 04:58:27 -0700 (PDT)
Received: from rakuram-MSI.. ([2409:40f4:204e:d0b9:ba00:6f56:8250:ddb3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8b259sm2295936b3a.36.2025.10.23.04.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:58:26 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: u.kleine-koenig@baylibre.com
Cc: chenhuacai@kernel.org,
	dan.carpenter@linaro.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	lkp@intel.com,
	rakuram.e96@gmail.com,
	skhan@linuxfoundation.org,
	ulf.hansson@linaro.org,
	zhoubinbin@loongson.cn
Subject: Re: [PATCH v2] mmc: pxamci: Simplify pxamci_probe() error handling using devm APIs
Date: Thu, 23 Oct 2025 17:28:17 +0530
Message-ID: <20251023115819.11094-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: opvid2ycmgbkbmegnnzwl4hyev6e2smusxk5olkuqxfwxzykz2e@jlvolirolrxl
References: <pvid2ycmgbkbmegnnzwl4hyev6e2smusxk5olkuqxfwxzykz2e@jlvolirolrxl>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 21 Oct 2025 at 14:01, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
>
> Hello Rakuram,
>
> On Tue, Oct 21, 2025 at 12:02:07AM +0530, Rakuram Eswaran wrote:
> > On Thu, 16 Oct 2025 at 14:20, Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:
> > > On Wed, Oct 15, 2025 at 12:16:57AM +0530, Rakuram Eswaran wrote:
> > Sorry for the delayed reply as I was in vacation.
>
> I didn't hold my breath :-O
>
> > Ah, got it — I’ll drop the clk_get_rate() comment since it was only a reminder
> > from your WIP suggestion.
> >
> > Just to confirm, are you referring to adding a call to clk_prepare_enable()
> > before clk_get_rate()? I can move the clk_get_rate() call after
> > clk_prepare_enable(), or drop the comment entirely.
> >
> > If my understanding is correct, I’ll keep v3 focused on the current set of
> > fixes and handle the clk_get_rate() precondition (by moving it after
> > clk_prepare_enable()) in a follow-up patch. That should keep the scope of each
> > change clean and review-friendly.
> >
> > > > -out:
> > > > -     if (host->dma_chan_rx)
> > > > -             dma_release_channel(host->dma_chan_rx);
> > > > -     if (host->dma_chan_tx)
> > > > -             dma_release_channel(host->dma_chan_tx);
> > >
> > > I was lazy in my prototype patch and didn't drop the calls to
> > > dma_release_channel() in pxamci_remove(). For a proper patch this is
> > > required though.
> > >
> > > To continue the quest: Now that I looked at pxamci_remove(): `mmc` is
> > > always non-NULL, so the respective check can be dropped.
> > >
> >
> > Understood. Since pxamci_remove() is only called after successful allocation
> > and initialization in probe(), mmc will always be a valid pointer. I’ll drop
> > the if (mmc) check in v3 as it can never be NULL in normal operation, and
> > remove the dma_release_channel() calls as well.
>
> Yes, I suggest to make restructuring .remote a separate patch. (But
> removing dma_release_channel belongs into the patch that introduces devm
> to allocate the dma channels.)
>

I believe ".remote" is a typo and you're referring to the _remove() function. 
Removing if(mmc) condition check from pxamci_remove() can be handled in a 
separate cleanup patch, while removing redundant dma_release_channel()
will be included in v3. 

Is my above understanding correct?

> > I’ve prepared a preview of the v3 patch incorporating your previous comments.
> > Before sending it out formally, I wanted to share it with you to confirm that
> > the updates look good — especially the cleanup changes in pxamci_remove() and
> > the dropped clk_get_rate() comment.
> >
> > static void pxamci_remove(struct platform_device *pdev)
> > {
> >       struct mmc_host *mmc = platform_get_drvdata(pdev);
> >       struct pxamci_host *host = mmc_priv(mmc);
> >
> >       mmc_remove_host(mmc);
> >
> >       if (host->pdata && host->pdata->exit)
> >               host->pdata->exit(&pdev->dev, mmc);
> >
> >       pxamci_stop_clock(host);
> >       writel(TXFIFO_WR_REQ|RXFIFO_RD_REQ|CLK_IS_OFF|STOP_CMD|
> >                       END_CMD_RES|PRG_DONE|DATA_TRAN_DONE,
> >                       host->base + MMC_I_MASK);
> >
> >       dmaengine_terminate_all(host->dma_chan_rx);
> >       dmaengine_terminate_all(host->dma_chan_tx);
> > }
>
> Looks right.
>

Thank you for the feedback.

Best Regards,
Rakuram

