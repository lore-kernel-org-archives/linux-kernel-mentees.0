Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5CD1922DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 29 Aug 2024 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724930553; cv=none; b=XVswUPkaR9qXRmasQBKtjj4obgzZIBiNpS7/A49jZHqe+gIRonfXw/Kymg6r8b05OZJglyIf9n0T7Wd3vAUbd/dLeC3ydXAW0hqnZdx8XxEi6sL3DKsyiwSWckn8mw01tgteDv/Tmn5Nv1ov1s5/EEpWONSFIKGNt+FHYFAINIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724930553; c=relaxed/simple;
	bh=m0zGPee70htKLNG1aroZHLqSMeK6wL0UCCQrWEPQUg8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TwtYpJyJWKKJJErMFuKcfwbIT56gXTtpzT2A0ICsyQ2r4NJLg6m3IujUpSmzhG7xbS5oB6xshThzg9/OXKc7NiapYIjqXn8yoGBJHEBc+oeuotGSM0BjHQpLxA/8rS18Xbkm0B9SZHvoQw40biyHG27V3ZLY5GlqVO7iyrXBJGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EbeXWOCu; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EbeXWOCu"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3986401BA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 29 Aug 2024 11:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lmP_h4qGCb5j for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 29 Aug 2024 11:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=neil.armstrong@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6E2F440185
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E2F440185
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EbeXWOCu
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6E2F440185
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 29 Aug 2024 11:22:29 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42bb8cf8abeso1470955e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 29 Aug 2024 04:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724930547; x=1725535347; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGUXNcN04Y9MaZPBhh9adsoWjhrmOFV1DxQRKRls/NY=;
        b=EbeXWOCuT9ZQeA5zvCaMkBgYeD/Oi32tilLhDTkqfnQzxfhyNhmAuST2sKfHEwW5a5
         s9MLauhW4z906lZaHf6DyK0Xim9q5Eb5N3aUV4JW75joKXHSiK/ulFRETUrKulIjjxCi
         uwXi3wcifHTBGNlkWfCpf+D/nwBlzZtGhqAScC83HL+jWT32wRNZNfC7K86ugursOZvb
         58aqEX/I2k2h8uX36ovF+/wPYH/jH7n2koizW1Jwc54Hl/qVg/p00Amzr9G4HaAIXVdd
         soRom0yNaP/fwWoTPkPvK+twJq41//7y9oqkVpr/+TT/afxPNgYwnmGRbM/3oxMLCmhE
         7qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724930547; x=1725535347;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGUXNcN04Y9MaZPBhh9adsoWjhrmOFV1DxQRKRls/NY=;
        b=dKkCIBgoXrPW/3SMJyvfjz+/p15bjL0U0QuT3CpHwp+5J1W15YuKV2bWylBK43jDZb
         HdQZHw+gBWsk3rAF7PSJgF5EGeAZDXjENuyio4fi5DKn6kh9sXLKVrG2hBiS8cfx+pUq
         1x/WA6vTICNIoThPT53zO9fCbfA5/a+CAal5Rr9JXQDmPFBvIxqxyiay+dsHqi1UAxdw
         q7QwiGEOeDSb2x7GVG03GcrTMpAnQROk4L6vESUfyAQzZMV/U71szUm7CICKn8wQ1Ddi
         8LPl2K0BlFzrifvbvIq+2mgoSS/Tys/hpyFKBcQWewyP0ywaFtZnfXn1sJbbnT9Fwty/
         hzuw==
X-Forwarded-Encrypted: i=1; AJvYcCUzA+B1buu+gmxiN8x2oWchMUd+9+gLlOh536qdSHK7vEbqJA8ZzGbUsnjfXvAaEvJ2g+16W7i/aGnhCjioc3yU+lMjVA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxonjDrLkvVveOxV3mPP9ctcduzF4gOgzDGle52NWREj6pXf1Za
	kfsTY19QRcGCVXj///n2C6TWeTFYk02sZqGo+CH2uBLVoZSX2eFQtmvK1IXpFsM=
X-Google-Smtp-Source: AGHT+IGpqUMCzEBAM6RTehWTEXC3oIO+Obb9EuLNoraNM2SjW5aJQ09jYdcjL27yffI4QE1CzaO0TA==
X-Received: by 2002:a05:600c:3b97:b0:426:59aa:e2fe with SMTP id 5b1f17b1804b1-42bb01c2071mr19975075e9.19.1724930546877;
        Thu, 29 Aug 2024 04:22:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e33d60sm14122015e9.43.2024.08.29.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:22:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, 
 rbmarliere@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240827152504.30586-1-abhishektamboli9@gmail.com>
References: <20240827152504.30586-1-abhishektamboli9@gmail.com>
Subject: Re: [PATCH] drm/panel: nv3051d: Transition to
 mipi_dsi_dcs_write_seq_multi
Message-Id: <172493054606.1145269.2440128121534341021.b4-ty@linaro.org>
Date: Thu, 29 Aug 2024 13:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

Hi,

On Tue, 27 Aug 2024 20:55:04 +0530, Abhishek Tamboli wrote:
> Replace deprecated 'mipi_dsi_dcs_write_seq()' macro
> to 'mipi_dsi_dcs_write_seq_multi' macro in
> panel_nv3051d_init_sequence function.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: nv3051d: Transition to mipi_dsi_dcs_write_seq_multi
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/bfbdf72d6c145e008805f0745ff79f9b8e301e0e

-- 
Neil

