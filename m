Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E910A14C5AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 07:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891312; cv=none; b=XmR+lr2dcHaUUkBCxz/XWiIRjC7rYWqctWnpRvfY7xtbbIqoQaOxzj+Of88gBbu7qP9KFeuF6m+I+JX/8yCm5Q2/5ZZs4bev0RuXwSFsNqAwGqso8A4e5AtlkfmBINjfWGlZPC6AEC/CGPEm1IHnPhaobtZKgOBN3GChMotJqSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891312; c=relaxed/simple;
	bh=NEIbyKWfSfDfYub7dOi2+DthG1dy6lDUSX8rgR7BuE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvZ9nt27YsG8wA99CEuo7xkYpR+QJtThHhLxGL9PEL0lVukVH7E0bl3+joAx6bnnEZYYIfzeFrut/+M/JKf6taizAzfQfKlGy0bCPTN9R1lIllPIOabg5ccG5IOYr9y45h4EO/hXgO7JmF7WxtmsznQPEO5WDPyogAG265vjUqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjeBrCEk; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjeBrCEk"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7951C605F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 07:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vm9zQi1VRUl1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Oct 2024 07:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07545605EE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07545605EE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cjeBrCEk
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 07545605EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 07:35:08 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-539d9fffea1so2625365e87.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 14 Oct 2024 00:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728891307; x=1729496107; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXd9IRsJ/Q2GAEkeQwvXUDlljQikHHqovvpnz4Mnaes=;
        b=cjeBrCEkoMENZCRpQRB+s2jnkNtJwtt/0I83sfwBuxQ3ckrUSteZzR5FG16bSYoa47
         OHMzz6UxFZ74nzhppSysR5E7DrbLtOkXdn8eB3YVBZMsV0c59ysnXyAp8ThdSp6P6YiS
         e8YCdSHLHyaSLY7rDlR30UYsnu0FWhHl1GgWh6oAxWfX7Va/1giT0ImmodmGMb/API60
         v9W2/hbV5DY3I9Xy0n9Jzg3CWjtBvsiiHlZrsjxFFLVPWqmF5Qu1fS+yEMYDGEhrQ6BC
         DS5zGgKr2b2MCJqaf5Ak1tFSaAaReSHULaNXFaO+8M+HIgs1fFR9VCIG8kJF3gi0KuP5
         apNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728891307; x=1729496107;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXd9IRsJ/Q2GAEkeQwvXUDlljQikHHqovvpnz4Mnaes=;
        b=tEXEH8IJ/kVc3J8XfGfLXut4pqaM19VuwAaVdpGYiG5K4WLiR9U+0dcnO3+gIgdKsO
         fPsjVBxuVK/7pcPX5Bn+XfgAqr5nBRCbkYZKD4NeGEJutm8wf2M3/7CG9NOxsa4jHsVW
         gWZOQogtGJAAaDuhrJeuj9QR1C3oKHcdlQPh3oQqKuMMYkeP60ijouC0v4aJOx4ySAxk
         TNL2NhjuCzSK+bz4CcxxNee/zg6hOuBnS4nsZv7VYd+H4ABybcg6zIOppdxzo/KiLeL1
         CmgaySZdBGuk601773m0o5Puwi1Dif/MKvAkf8eUErOj/HMM0NlNMTXBa8s9p8Eb//1v
         o1xg==
X-Forwarded-Encrypted: i=1; AJvYcCW1qcYe7Tdi+rE3wdACo+UTjiACOVUaZSKx08MPCh2T8EHPgcUF+Mq1e7mUsCchHr9QKKhgkTM4WAUF9LGSf3R5EBRvmA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxTTNfRwjKVNi760LtlITbGLc5z01dumBJJBkItLr8+dXPSzVqR
	ClzwnJ0Rsvp0snp6IVYOnWeuddEOavY25bbbG8qzR/a9LrsueGVVqDD1tUIO7c4=
X-Google-Smtp-Source: AGHT+IFG5mAcJza7yiles85LfH/G0lB/xgU5IoFW9zjQX8bagRJinxpczK+JtOryP0YxXrBGl1BZ1Q==
X-Received: by 2002:a05:6512:3c95:b0:539:d0c4:5b2c with SMTP id 2adb3069b0e04-539da595273mr4520019e87.51.1728891306540;
        Mon, 14 Oct 2024 00:35:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539e48c1807sm953064e87.237.2024.10.14.00.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 00:35:05 -0700 (PDT)
Date: Mon, 14 Oct 2024 10:35:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: u.kleine-koenig@baylibre.com, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Mehdi Djait <mehdi.djait@bootlin.com>, linux-kernel-mentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Message-ID: <hfpq35cxext6vd7shppa4ovtszywzqkc5gqo3t7p77uldasxts@gyfrypofijmd>
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008030341.329241-1-lanzano.alex@gmail.com>

On Mon, Oct 07, 2024 at 11:03:09PM -0400, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
> 
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> 
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> ---
> Changes in v10:
> - Address comments from from Uwe
>     - Replaced -EINVAL with PTR_ERR
>     - Error check pwm_apply_might_sleep function
>     - Remove redundant error message

Let's wait for an Ack from Uwe's side. If there are no further issues,
the series seems to be ready.

-- 
With best wishes
Dmitry
