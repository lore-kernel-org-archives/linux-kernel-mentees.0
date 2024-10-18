Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B0818CC1C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Oct 2024 23:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729293777; cv=none; b=tTxC95xgYEY2yXDEZM/Tq7urM/MNsyv9nhO/MszcFww5eypVXfO65be7iY6/NqQjyJG84uBtzkKF4jvdpUsNWKlYv6Q2JXw8kOArKUi8rSzajHXFsngFd92/q7Ly9mOWfxPHWXY+gOvgh3gXg5ZnMSaf2sQBdXD+Zt260LtDvEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729293777; c=relaxed/simple;
	bh=yVi2CBHNTAXqIwEu0lUukboe5GQpHdaPjfgHBK2A19E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PAq5IjOCrJwDzBdLwKdbqi9T+DSE1uPYaQ8OA46nRwQqwgujoPWdX381dYTK43Ey+EQbVP1A2k6GpCGRZgWqZN7GVbON0DWlDX++XPg/sMBfk6hVFjIXpo/CHo/15VUmrGYuAH/XhrEm7l987XmGWKAy9x1j8c7dQYPrNiZ3DG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R4d9qi7s; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4d9qi7s"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A599D40C03
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Oct 2024 23:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faHmVCyGKEzT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Oct 2024 23:22:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=dmitry.baryshkov@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1303940BF3
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1303940BF3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=R4d9qi7s
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1303940BF3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Oct 2024 23:22:53 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb49510250so26869501fa.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 18 Oct 2024 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729293771; x=1729898571; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX1Ed3MLmjAUFYDzujQv0rzYaNVm2pPy+pKKKWr8v3w=;
        b=R4d9qi7s0zgnCaWTJCiN3H2mxyvPOhz24SPpQsVQ+hsdpGhtFvzu0/ZqkqpuFx/Uyl
         tGj/G+7nzbmRmDVm93+XLOpIE6myn99527zSdZEDIA/vYQd8RrBLKvlN3Bx/zipbdP7I
         9Otg6RkdQu1znEM5Z1RBWT/RLWR3pW/5O4gXx+XDzIQX+kE9Rfjpz7P0vjUbAzHSDuHx
         04GMzhoR0Nno4ne+vbsUbEZaklNLmx5gXYm+20TGb5Ged2dYaNaPPsbpGZvwhCvr4sTy
         Wuo+5QN6K7qu/4NFhKKEWyIN2/o+B4GGkoSoX0HGgPPcAGJ4SXWC5iWTRu+FKynYiO1v
         3zYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729293771; x=1729898571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aX1Ed3MLmjAUFYDzujQv0rzYaNVm2pPy+pKKKWr8v3w=;
        b=DEz59atCL0WIVx0QdSMNYozaUShVeiDE8n4sYWSqdCTUTL7F227Xz5wvpJ1Wij4Q+j
         zpycYfz59N+JLPXu/KpchP5NvdYlitB17ZpN9ZXuNn0SPMoE4bDWxUtfbcmDCvuBZa+3
         OLrtCJ6zyXnrtZWrQ7UuGyMEqKgG6fHN+a4C/HzeH/GyT4WcMp0lRrEnOwGW0slX+7JL
         +lsKuSaGb4gaG+ykB+l6zT7hJoEgC4jcE7hsgJLtfK5cQ1v5oQKQ7yu8UPzjGWJ6w0QN
         tEwdte2ryRbxzg32Y+Yc+kJcl8TwZssAZj3vOZm8i8FBk/keXgArfL93O3ASUmlB29q3
         +0kA==
X-Gm-Message-State: AOJu0Yxe6WB7A+m+bJ3pAsW3c1MT9fACqJfrre66WvTj69rwpLevvVw3
	zLTTPzyD5qvmOQkAEzdeCmXGyNxIOKkbpqkRN+ZcBUOCS8o5oLA6DIreGcepBQk=
X-Google-Smtp-Source: AGHT+IGyfftMjWZHfQWKqWoQYQ8JI+p/ypISrL5eJ6+gCuABF4WiTfoXGbQLBF2l4svs55N/Vw1Axg==
X-Received: by 2002:a05:6512:3192:b0:539:fa3d:a73 with SMTP id 2adb3069b0e04-53a154e7966mr2320766e87.39.1729293771084;
        Fri, 18 Oct 2024 16:22:51 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b9151sm349825e87.75.2024.10.18.16.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 16:22:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: u.kleine-koenig@baylibre.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Javier Martinez Canillas <javierm@redhat.com>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	David Lechner <david@lechnology.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Alex Lanzano <lanzano.alex@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v11 0/2] Add driver for Sharp Memory LCD
Date: Sat, 19 Oct 2024 02:22:47 +0300
Message-ID: <172929376314.2587927.2624699121778996381.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241015230617.3020230-1-lanzano.alex@gmail.com>
References: <20241015230617.3020230-1-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 15 Oct 2024 19:05:42 -0400, Alex Lanzano wrote:
> This patch series add support for the monochrome Sharp Memory LCD
> panels. This series is based off of the work done by Mehdi Djait.
> 
> References:
> https://lore.kernel.org/dri-devel/71a9dbf4609dbba46026a31f60261830163a0b99.1701267411.git.mehdi.djait@bootlin.com/
> https://www.sharpsde.com/fileadmin/products/Displays/2016_SDE_App_Note_for_Memory_LCD_programming_V1.3.pdf
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] dt-bindings: display: Add Sharp Memory LCD bindings
      commit: 12f6baa472e097d4d55dfef9eacc36b04071bdc1
[2/2] drm/tiny: Add driver for Sharp Memory LCD
      commit: b8f9f21716fecac41d083ec8c77809ecd0b100d8

Best regards,
-- 
With best wishes
Dmitry

