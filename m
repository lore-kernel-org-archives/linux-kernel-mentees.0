Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485315FA81
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976129; cv=none; b=pnT7VlvzJBZ6ojtU4VoRf2lJbxZK7SHLqf9nk8uganoV0tSXBAesEm1rNikWPx3p9rCnLowApQhNZxlGoA/j1lYvGjyLCG/jPdO/YTu+B2mxC72pBpLdLH/rWADjJAJmQLj2G5CpP3GbButE5s+Gq6fR6bn2OX+oC5ESj69Jjzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976129; c=relaxed/simple;
	bh=khoQ7L9VZjC/PNAUQ/Sjr9kIhxNa5Xx3U1PPkaqU5dI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IypZFJjQ19yJLyTt3PKBij/4fu/Y63ZY14NuU2T/lG9qJI5WQhCK19zjxpfBguijVMEtKvsmdtc9wdV2uFIV70HabWFMayy/xdxdIsem6L4Qz73uvjVe6Mz5ZN+icehaZoITwR/jAi5iv7SZdqcjWf9uHaN61iaAtCU2j8o/YZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vk+qAa/9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vk+qAa/9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1587255f8f.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Aug 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786976126; x=1787580926; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HJlP1AbCvj0GlzVokRh2GsjzM05mavP3fcHYeATpGMs=;
        b=Vk+qAa/95A1rc/cOMxq/Cqx+5tLxfsGbi0M+c2SR0WkAkKADRlhtJ/3SPMBdCfPuC8
         U7DNGry14KOkogv6sovi7mcBiRD57z07CocltGpdN4cmFAhKVjXpZbTnfNFuZleLk2jz
         nw8fhCvSvR3/c2d/FOE+vL+wEnCwieGSYdAV4ikzcVrqyiJIUK+iftkmwVUqDn7FqtfR
         7ywqZjqfLRuMNIDHD3NCIhVKWzrFcsFBuy9PYFkZvE/pu1wzUodw9kEo2JFxoLeXN/iM
         +3PrbbLK3XCNyYd4KYvS1/8e0up4wGFeUspvU+qLKzQpoYtilsxHAofO/XKGkdmLm8Mz
         a4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786976126; x=1787580926;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJlP1AbCvj0GlzVokRh2GsjzM05mavP3fcHYeATpGMs=;
        b=NCG4LS5k/R/zq1RImifACySJXQdqZUDGF931JLcPA1blmmqCd9iu5/0Dni1CqWihMe
         6Qbp9TYubZ6GQn6SF0xFceR4UPmWDsprN1efYoUtrGZSGmx/btqLr4VJEWotea8LAU6V
         3+I+GIwiZq8S7EYdsxX6iIenJdXar+9JLN8nA2qPad56KtPlCcE6d+Wh8ifZwQEo1NE+
         B6wsTBxMynWJ084xSEU9PiG+brF7YEmaKXyesImqDuBHyaIZIjqvPUzGaHL6964qVjEe
         KblJhA5aSHH9uLKXnJxWWtChSefi4PwRgGuV/+v2xwzDiON+7j3gMZsf0D11ZzK9T3Ap
         ZGSg==
X-Forwarded-Encrypted: i=1; AHgh+RqZUf/qA9TC4Gl/AIa5JWpdVAHKk9r1vFeaxhI20xb92GC+8YlanksV5h7y2FHUKb+nP5DhVIU3H4Nn7XpkGLDMz9IOlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6E3+XtaO39KUkvl5qiILZ4RCw4Kd8kexX6R6s1p01HuVfA8/V
	B+UiqbZfnSEA8b7pQO1TapFouTTH86nNWw38xs1/wGump12G23C4ZQ9r
X-Gm-Gg: AR+sD10UL/14Q2e8qB7w32gYdIkE0gRgx6hBE9JAcGj4/a+Vc8+zouwCdKraz2SmFDn
	ezoZXdbv/5HE0n+SLWzeFNsBe7W4gmqJOfG4p+aVkeVJqtsQDE61cfdhbGyJxtVL1hxFQlKVUTJ
	Dhs1Z/dYekDp8WSmaGssrJrrIj5YaaR8Ha94C1vqaFjfW8PC5Rf7vDojCqC3j+AO1VG4bhtkj+r
	MqJZyDsIA78FTVRmar7GffHYA0W3vZNbPN9N8jGNo1OdNuwLnfkEXFFWBvKzFDatN3Gh8oGwYli
	koLn+EPq57QDkaY5N4+GRQunMjF1gPR9yEMmGdZabb3mXbEUikeIAcDeyU21mxF2DFHQVfG/QE7
	TThEgk1FVWcNnwLUmTna/toWTb4faeqrzQv+Lmae5KsHpGRwVhn5LzQiFWsBSsxSTYyfgdrGeN8
	EiltZ4arM/HNK31hgemsnvyew7CF5NuQi0HWT3K5smALC23iXv3uFyG2PjWOTx1BeXGUdp3XKWJ
	LJomJxqT+gWghtThCrNDVPwR3DuoeOJY1H+fSOjXLigDGtpCsXsglemwgCYaXhmCf7/eL6jOGub
	DxT5tuyZrVEni8r/LNdeK6HNq1m4gKPALUsQvnIN9hH6RAKBKS6wNfl3a1L2H+wZOsmbW0ETmSH
	xvuXIKLB+J8pG01eoZ5O+oNMgDQ8ijox711cI9QAahkmGRY4j/IvKwuQ3jLgFWx/ZGinL4g==
X-Received: by 2002:a5d:52c3:0:b0:47d:fc23:abe8 with SMTP id ffacd0b85a97d-482a90919dbmr622111f8f.28.1786976126114;
        Mon, 17 Aug 2026 07:15:26 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a315bfsm4566475f8f.1.2026.08.17.07.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 07:15:25 -0700 (PDT)
Date: Mon, 17 Aug 2026 16:15:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Marco Chen <marcochen.dev@gmail.com>
Cc: dan@dlrobertson.com, jic23@kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, jagathjog1996@gmail.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v1] iio: accel: bma400: remove completed tasks from TODO
 list
Message-ID: <20260817161523.00001feb@gmail.com>
In-Reply-To: <20260813150103.56350-1-marcochen.dev@gmail.com>
References: <20260813150103.56350-1-marcochen.dev@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 11:01:03 -0400
Marco Chen <marcochen.dev@gmail.com> wrote:

> Two of the four tasks in the TODO comment have been implemented.
> 
> Interrupts were added by commit ffe0ab6a9698 ("iio: accel:
> bma400: Add triggered buffer support"). Support for events was added by
> commit 961db2da159d ("iio: accel: bma400: Add support for single and
> double tap events"), among others. The driver now has an interrupt
> handler pushing IIO events, and event configuration from
> read_event_config(), write_event_config(), read_event_value(), and
> write_event_value().
> 
> A step count channel was also added by commit d221de60eee3 ("iio: accel:
> bma400: Add separate channel for step counter").
> 
> The power management and sensor time channel TODOs remain unimplemented.
> 
> Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
> ---
> I would like to take on the remaining power management TODO. The driver
> has bma400_set_power_mode() but neither bus assigns a dev_pm_ops
> struct. POWER_MODE_LOW is also never entered. I don't have a BMA400 but
> I would definitely buy one to develop and test on. I also have access to
> a logic analyzer for testing. Is this a patch that is desirable?

Strange that these weren't removed in the commits that introduce said
changes... Anyhow, not sure if this patch on its own is too much churn,
Jonathan and the other usually prefer these to go in a series of more
changes (i.e. if you do the power management TODO, you send this patch
in the series). This is up to Jonathan however.

-- 
Kind regards,
Joshua Crofts
