Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1FF17B4FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720027959; cv=none; b=eEz1y0tw/gdDdjij8sAVe8qiMOx18Z7s77zasWG66pEftjEv+oObK23YMwQfO0PVI9yEROjHIFULB4sm7xf5N6uVcSH4QLOQDlzabnZ75D8EeiaSkgh/2rL4SixzrqmyjtRU+x8mLl1DvCKshF3XwFaymTtBf5s8BlpQSibwpV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720027959; c=relaxed/simple;
	bh=yiZwVs34KAsMmVpnWF6wgCRNg80IMF2DlKj/9xcYU0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EATgACqWM565bZDynTBRXTWlnNPB4G2wkXgeC2WhtmNb48+mYMj+DQyJlL9xuys7PRTpozfOHqY1TQ52A99ICB7pkmPeKzdBu06XYFiJguGGQO9yYde1WAMG2QhEUayivLZPaSrXSnkqjQ0axxvHwtzPNHklAg2TDP5y564cRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cbIXBQNx; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cbIXBQNx"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5524260EFF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 17:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.235
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l_HHbNa3RaZj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Jul 2024 17:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=srinivas.kandagatla@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3722060EE7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3722060EE7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cbIXBQNx
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3722060EE7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Jul 2024 17:32:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so34320255e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Jul 2024 10:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720027955; x=1720632755; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oskWmBG9bN19QP7asfXU5sdItpYr22CgLvmAviCVAVc=;
        b=cbIXBQNxVpWMUm97wCwQaIjmcnLn0gHIFnXV7Xcg4R0l9G0GdKDFjo4+YYeJRjctZv
         PmDjRwfrI9pEFvg3dPlpX9iA6J5KXfNYooOP1jxQcfwhgTop+RpauFiFrZE8nuX/EFkK
         9Uz43kO8+KPTrH8p5geUmlWY0s7odTU7gUlWULt7CdAglTNbrfXoIAl2+XPzghtX/QjN
         dpAwh0BuerrSfFUIZyTYlD8cGYqidAk2+4f0VCY7LIUJ8yM1NvH66kVL9wzcX1+pXl9g
         JmkJkaYhpxM2V7t3Mxz1UsJ+mLxUk+8EpMT/YEVTH2wbfv6FuTR8vd5tPquIPnGlroAf
         7zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720027955; x=1720632755;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oskWmBG9bN19QP7asfXU5sdItpYr22CgLvmAviCVAVc=;
        b=DetL7LrE0VJMjTVN478pOma2zN0o5tQw//XdU9+6eDqMNZ6qhvNCWttSgEw/MFzl+D
         O1JsY8fslcokKSRTTfunLREbswSX/UH0tuUxO3hHVdrBl/cnEmCsh175iD4DhN6Q75Cx
         tuIONreL9Efrk59vUMry09LzptqZN18mY+KL5aMEc5QTwlHzfG6IZJz5ZJys6RQdEDdu
         w0UzoCUpE16GvCBJx8AnScM8RD2Y7BBBYxXYpGT9+Dcc+Lvwkhs4uDxmJsLWEBmpDL7R
         AiVTbEGP5CN6xmlLVEi+RakcpY48RycYJ4gMi7/ztf/25g+FYw7jqIfzneaUvdRna2Af
         7uMA==
X-Gm-Message-State: AOJu0Yxe21IsMNbXPr0P78mHMwc8uYwkJ31lgAPWMpS/eHWcm11f4d6W
	dZeNebR76TWG32kOsbO9vrH/YLIkyHUiSRAgEDORGEIO+SOE9szMeVGIqgNXW6o=
X-Google-Smtp-Source: AGHT+IFyHHiiFlnwelv6JSIST8hjX2FhMJ9p/4P+xzny04uXYYyA9EwNzHKULeV4HsPzKoQ5t0WQLg==
X-Received: by 2002:a05:600c:181b:b0:424:c837:f54b with SMTP id 5b1f17b1804b1-4257a0270f4mr102800275e9.38.1720027954898;
        Wed, 03 Jul 2024 10:32:34 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c0f99sm252728595e9.41.2024.07.03.10.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:32:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 rbmarliere@gmail.com, skhan@linuxfoundation.org, 
 Amit Vadhavana <av2082000@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20240616203231.43724-1-av2082000@gmail.com>
References: <20240616203231.43724-1-av2082000@gmail.com>
Subject: Re: [PATCH v2] slimbus: Fix struct and documentation alignment in
 stream.c
Message-Id: <172002795407.299941.2477625564170300581.b4-ty@linaro.org>
Date: Wed, 03 Jul 2024 18:32:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2


On Mon, 17 Jun 2024 02:02:31 +0530, Amit Vadhavana wrote:
> The placement of the `segdist_codes` array documentation was corrected
> to conform with kernel documentation guidelines. The `@segdist_codes`
> was placed incorrectly within the struct `segdist_code` documentation
> block, which led to a potential misinterpretation of the code structure.
> 
> The `segdist_codes` array documentation was moved outside the struct
> block, and a separate comment block was provided for it. This change
> ensures that clarity and proper alignment with kernel documentation
> standards are maintained.
> 
> [...]

Applied, thanks!

[1/1] slimbus: Fix struct and documentation alignment in stream.c
      commit: cea500f1ad5f6e93e67ab6f9a317d713524732cd

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

