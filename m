Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298EA1DE894
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755096019; cv=none; b=jDaYC3QJpgnOWev5irDIRawru0GjbOaLjq+3vdHpxxhWQ9q3KQEyYOlZH12mR/0zw9EeoTR232J5/4ai3DgW8UOU1aWIAmCEF2Z2sZSlHeWMLlk6N1AHzIVSYKA8Hal4wAuQyLqPyEhMe+kuA/h83QGC5GvIMelvTls7HbZskbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755096019; c=relaxed/simple;
	bh=3HeV/s8mf6bCb3MW1eY0o3zlnm8JOlPksfvUeKtjK1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QAEdFTfogVmNUtbxSgI6CY1zf0PV0RFyUA2IUu59wPId1oPPSfjtalTE2AHfnYi6fAXhO2LjtVEKEcHOs9lnP89uwz+c8t7/8+exhrHG505ooyMTiRY9vPMco/XOP5Uqi9MiaWEBtw+FGiqqt32qIZyqt2PQBUmTZcXWP+Ow1sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/Lq+aze; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/Lq+aze"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b47052620a6so826422a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 07:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755096017; x=1755700817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDjOa/Xp81rs87L9VpRbzpj63Uj07ISfrQi/o1gFpf8=;
        b=K/Lq+azevJyjgqV10Z30anFPtjK1WLXQ+43ZgWvT1vCbtQh5ijKFFDYCXzex7aFvjW
         euDRYn3Ljil48zvgNdG+nOAFnvA2ANygdNn/JinOC27nO3LHLU7lVWs7bXBYeiSyRrGJ
         aU5kG/B/ZilOjzxYVdmyMr+Q45xMTF9aAjw5rI6rMR9Txy+O5nvsJCraBwJ9FPncXCYg
         GxW0ZuRLJo9/rBGRZL7n9U9DOxfhN4NHHEZSrnZxJts27BYdFRUplQMCw9rWbodGLMlx
         I1640FCw/OZ5Kv9DAlbrRCccRzWi1WP5xaaFhcYmNC7ZmJ1S2zWgy81C2C95RsYewOfH
         72Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755096017; x=1755700817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDjOa/Xp81rs87L9VpRbzpj63Uj07ISfrQi/o1gFpf8=;
        b=vJo9eJ7owVWlRhdWw1JWjKHEcu/3xnWWtxoXLo0OUoCPntufxd3uxp/Koqv8wdxvik
         Xno5/iqaIlR3+adXGkoKKLLPl+L9F8x05fBycVD7ryHDXhSmsM22iZoD2hxGvZg13TlW
         Qj7j4dHhanAz9ZEY9C7Op5qOPgbP+vKf9jcfmjr3jfF9m+ZgPpz6PvpC8zB8eZQubMhL
         RSZtuPEjiB8+4lHw6Q9DgkGABj8HWa+mxN2M8BT2eEsE3OG3N9+LuZoEV+E8yI4hRErR
         uHT7P6ERs9sd265nohcdPd9KyBRyibOqikFKiWZVM0vtPUC20+E7vzvKTqRZCWK+TzxD
         QVPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvhV+uCgC7MD6T+ZI+Z/evp0iuZ9TZ8yCwNdye48psknULsseuDeYRB1pSMh0zMpFrOkWuBGlVDIe2dJx9apeBpzm5dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXP8huLydXuXR9oZVFt4P4lzNUPvanuzAjl4YrsWDEMD9wZjoH
	PES8Ywf3oRGfkzOFyHun21GHaveHlC0xb9Sw3UndkypmejPyZ9jDIhSe
X-Gm-Gg: ASbGncu763fxh3LI5XtrqCYS3uWODvkzELzCvciPhv9dc2uRd87LTGs8lxxba0N1/Gf
	GM0cVSPqKHpmiMIABcwOglneYRLvMSSMgDM0bPTzow8UEOrkgXwlvY3ukol/IJwC05dpEbiBp/c
	4M0jzaSaluq2588FOkxhdSCUAoflp2GImoSG3Web/jYDAXBkOk1//qfqvkD96n9ELGkrEdgqpDe
	YtK6t1C3it79QsqLwAx560eiNDrSE0WdKCgRWkij7jHgmN7H5Oe8oiaddkInIEmIsg/vHIVTh3V
	CTTnT8VZySltpJb+GPpVVBefa6ulTCLOe6SyKnsX8dFYRN0TnPzlXWMZPDJofuA+N0reerJ1KA4
	YjpladJTsBdLOEtN/ai2K9lkHZUkGlDhrq52twSmQkO59ySecwKEtjCwcDJeZ6kHPqhmKy7XePu
	rUJA==
X-Google-Smtp-Source: AGHT+IESod6XYiMhJI1NGrL964WHvDNp1rHtkyu3jVsoDJf3P/8fwBq8TlO5GT+GL3HwCUf4laJ+Nw==
X-Received: by 2002:a17:90b:164b:b0:314:2cd2:595d with SMTP id 98e67ed59e1d1-321d27edfbdmr4479992a91.8.1755096017234;
        Wed, 13 Aug 2025 07:40:17 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com ([2401:4900:1cb8:7b85:9b4a:84f0:66de:85c7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232556018dsm373059a91.12.2025.08.13.07.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 07:40:16 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/tidss: Remove unused value
Date: Wed, 13 Aug 2025 20:09:59 +0530
Message-ID: <20250813144002.111689-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The value "ret" is being assigned to zero but that statement does not have
effect since "ret" is being overwritten before being read.

Remove the unused value. This issue was reported by the coverity static
analyzer.

Fixes: 7246e09299455 (drm/tidss: Add OLDI bridge support)
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 8f25159d0666..7688251beba2 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -464,7 +464,6 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				 * which may still be connected.
 				 * Continue to search for that.
 				 */
-				ret = 0;
 				continue;
 			}
 			goto err_put_node;
-- 
2.43.0

