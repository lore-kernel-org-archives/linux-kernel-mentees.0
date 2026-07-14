Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89566431E79
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784069577; cv=none; b=MK8teDJXJONW8JoM1LCbDGXPwrA7LOJWrpLKVz9MzpJkeKb2mBygyVVojRBF5VvnjA4Ba81iKBZOU8Z8yjr3siGcW73O2ddrKHVrGzWOPC1IKafUbPgsJnUYfEZBxl59wfl9+RHNTwP02CtbZDFigbY0Jx9J934ky72ITry+Tk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784069577; c=relaxed/simple;
	bh=aneHEOEVTUFpxhruqbXN4fpzumP0voPWx/etkXlO+EI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMKUx8Vy1Q4H+F/CNHklNKzbml4FWZ1LFYp3CJijlQ4bPOGSO7J5JhAo3ndtDGrQM+e8sjSfTPs1I/oeQ3LDmfn4op6bxczbDl3XoV21k1xwioSq0pge3ZeSdEHyAjmDThhq1nJzEAOJkpj9F1JTAKM6zspE/+z1ylvXZuY8lfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIpg5Aro; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIpg5Aro"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81ecf499af9so2218587b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 14 Jul 2026 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784069575; x=1784674375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huMAZLasX9MtSdlliVLSBQtahcShQoIS8BrLCB4qkoo=;
        b=PIpg5AroIj6rM/6X2hjb3v2GmC+i7U2JLYOOUuT4zTczPokK6Uk9EzHn8xN/MKbs+3
         ctY1e6wKCYjuFmF7e4l8zS3t/sTDchpEGs0d219zrKM4/ZPeBlcSKlesnNkwcmO/nFIG
         daGRd0kSq7Q2yWw/BDPhsBWuSZ4y2H1hOM4rLnBm8R5Ko9gahy9x7/lgr2k8sH1WJVdr
         VwEOVzUJT44vhpEoPWKycYUfc4JfhabNHJzd3I8OhSyD08sKs8iq8nUYx9Xhx5cEAb4H
         eQ9tlIoUzwRnXAT59NG+T4bvSDvUaKIrl3rDzZNo4G5VkCtt++r9t5hqeAIza6s5y5fC
         I3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784069575; x=1784674375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=huMAZLasX9MtSdlliVLSBQtahcShQoIS8BrLCB4qkoo=;
        b=kKX8fwZOzIh+tZKg6OIHKMWSF4gHtqu71cXgRSvam5G8H+ObPU/kDjLoRfnlp5KqPv
         5zrDNcYmGhn6ozsC3TJS3jUgQ2JpFT9VIFByD3N/vViM0k8HlE+ebLroHBn5FmT3zGcf
         ObdBRswt1RFFbqJv/bTQ0H2PyC36GMuXBm0lCNTAc2CX0jTCF7k3SSoXYzScXp5Bb5H1
         FdHuTQxygV1caiVAx6K/ocTVBr82aG2u0Not4d14UdJkcrzt4x4cCZwnJb3JMrXJ6YKx
         TSPryvUazxbV1TbVew09nqVFe921jW+C0WJ6Rc/E5VKo2ZaqE3VTKOF/ixb/7qgOZJEg
         Oa+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0/pzbnGAPyOiaeDIxob79pess3imBeeXOUED9hDK6DoNAefRkXRXLEQTdn1xKl0vuc2HWU23sOdyclex5mwePc6g2UQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywbd90qvHRqM3XppYUyX2398jcQ0zpxif4xOmpgwVCIG/K+QwTy
	VUY/AvskhwAhkUnhz8nKBuvinSzO7zyb6tJLeN0W+3zt4PBPlKxJoBW0
X-Gm-Gg: AfdE7cl7sctk3zmz5d3+BLvJ5lOEhct8MtxUK4/rl5Zv99Xxh70cCRPtB82xPWtFsac
	f0DjgK9vwgQ3qrDu3JHuKZLcod2rsa05QcXeyT8QSFwalzZBKkoJ7GoY2k7+M5+y6PhBc0cAB3+
	+qT3rHKM0ZziJRdRWYAGxIxKHVKutmJ1KaPshL/n1bKveGpCTn3bMUraleeyEdWbX15oW9nG70D
	XNpKwEaorbyUv/HapIZ3sX6FlHdpFLxRTzojUeXEIWU9mWnLnD3u/CVNESiiw5Q3UqP8BzpejpH
	kS48lzL+rB5PsTLDuxRI9MjJZ/fprHYT9SV+JI0Nx2QPfVvQ7+QYxQYFr5em3Kt/ki4hqZCOJAH
	3APakIFD4UGZnWqhuPZXhb+eESDvc1wmgpiW+t5/6mGeWOI8f0dwB0b6nDC9mj3zEXkryIAFkxp
	Uoql9aGG09sV6YPBxVApdtOeiOI71Qw+rbKHgssSVTK0uRhYVWn40SRjVkdxNBfzPpIbZ7m2oA5
	kdQ
X-Received: by 2002:a05:690c:4507:b0:7e8:6a6a:dc11 with SMTP id 00721157ae682-81ecf86d451mr4640387b3.19.1784069575635;
        Tue, 14 Jul 2026 15:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a510:f4e7:1a8:cf71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm153446897b3.49.2026.07.14.15.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:52:55 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	feng@innora.ai
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 3/3] staging: media: atomisp: drop redundant out-of-memory messages
Date: Tue, 14 Jul 2026 19:49:02 -0300
Message-ID: <20260714225235.47134-4-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
References: <20260714225235.47134-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On allocation failure the memory management core already emits a
detailed warning, so the driver's own IA_CSS_ERROR("out of memory")
lines add nothing but noise.

Remove them; the error handling itself is left unchanged.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_param_dvs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
index ad2a9b84e232..c0102056d421 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_param_dvs.c
@@ -25,7 +25,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 
 	dvs_config = kvmalloc_obj(struct ia_css_dvs_6axis_config);
 	if (!dvs_config)	{
-		IA_CSS_ERROR("out of memory");
 		err = -ENOMEM;
 	} else {
 		/*Initialize new struct with latest config settings*/
@@ -52,7 +51,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->xcoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->xcoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -60,7 +58,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 		dvs_config->ycoords_y = kvmalloc(array3_size(width_y, height_y, sizeof(uint32_t)),
 						 GFP_KERNEL);
 		if (!dvs_config->ycoords_y) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -72,7 +69,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->xcoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 			goto exit;
 		}
@@ -81,7 +77,6 @@ alloc_dvs_6axis_table(const struct ia_css_resolution *frame_res,
 							      sizeof(uint32_t)),
 						  GFP_KERNEL);
 		if (!dvs_config->ycoords_uv) {
-			IA_CSS_ERROR("out of memory");
 			err = -ENOMEM;
 		}
 exit:
-- 
2.48.1

