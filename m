Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6447F2C6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 19:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477367; cv=none; b=H5o/2Kj8b5Ho16QpEssdVlhVssxhnPQFC2nBUtOyIAcCsZJVRafH1nPqnUe8H0LrnEqOB0hh6alCEs5FpH8eSBu1O8PwJ7WnfISqdpyg6BgJtPHwT2jW5te0R6tFUET3rUHZurfnA2U4d0xTFGiv74OVbG0a1JPNX9iKURt+HIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477367; c=relaxed/simple;
	bh=l4VG0FqV/vJrXP9/bYAlLrRX5IxIiYLLx7pkgrMFnTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eqyFFd5ECTuHJwiG9ebZF7SvHohh+cuyAG7C1dA/Z50RU6NGF8BK/kOI64BmR81YvVYwzFfjzh5TQW6TG9pXeiVJMjlWynujl4KJ7KZe/PNAGS/bOf21ds+AZP9F/J0kU3SeI8Z9VAiWkAgOEnj/XwzI0GxdBRpbH8gXxSLoeJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO7NWo3V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO7NWo3V"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so985345e9.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 12:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477364; x=1787082164; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F8qrj8CmLGjwQMZeVA2ZOifuwHu1xiIsioWlV9Mw2Jg=;
        b=AO7NWo3V8zX0MnNaPXJtg0nDm2Z2hoQ09HX1gZLlF/n3uaFyye8mohoLRwgGFGT60Y
         EkgSuBGg/xO0X9gbGY3Cw6eG17ZuUyjxNu9iQbrvLEgojjOBvb8LsFScOQvw8XxUqFUU
         NWAOO4j9GVnJ259xDeYoMdQm/PSKax99/1OiMvLCNU0WZqF+PnNqzQuwFMYms0JENAAN
         w+vMdzZAGsN5ZqaqhV6P7TQ4tAvj9k1SgDaYoHooQ+MwGCC5z8bTBd6wLXdPtLO8B/95
         jfBxcO2SMn+8mh556LHQfIoBc+HmVBaSRtRELQjsVKb4SKA7RI7y7K6utrwMT6mN4jXZ
         ijPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477364; x=1787082164;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F8qrj8CmLGjwQMZeVA2ZOifuwHu1xiIsioWlV9Mw2Jg=;
        b=h2k14LK3vGtKzDzbWzRaGpa92Dto3d0GIW+c8OH4Wu3vawvvUl0BZIBcuAraskThAv
         WaWhpIlkmCLMqJJ0kDH76Bsgs5FysTXHxNLjaP56jZA3Az10ugzGHJYAOAOo9889ErUu
         2hOY1WAlXovznwcfvA/k2gePudIZwGPsvORQbVBRT3ocjvfWrEeGwmfPTxq7X82cCXBF
         /ZGmfCt2nkpWOT543jKimpcCogtylJB3DQLK2OW6/J0C8Bbjm4a7eY0jSx7S00++Eubc
         uPG7hqh75u6JSJivkqg75uEKYVso9DTNYZbhYSaTFNzvCFFqbT8osGdfuhB8QFEPXRtg
         UjJw==
X-Forwarded-Encrypted: i=1; AHgh+RqsY+6UVIsSTsVqVbb44r72YBgVGO2V+KWbYa4nt/kc+hSUVgAqktWaE++VVEdEOaNiw3uGUpBZAFtrscgo+ZLu7asS1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7RRnUiVYRwxpG8UFmZz4iLlgprWNidiBjO/2lyncLFGoS/dwi
	cgxUM8Bs1t4q2ygoa2ikRYAHLG0tenT98Vayc8aUzkXRhp1jC7k6T0wC
X-Gm-Gg: AR+sD12VoUYVDyWfLSpqchSXGFXMFBCreC4tWZ3zkoVlfhRV0p5JP1NUDm2+1Tnv7Zj
	DKLSPMGt9Api7MAi60OrqXGCOzv/mK4eF+ol2INBIz9JJ1KwY2lfHF0n0XWlLgwcLiL/y88ZPzt
	wcizsbblNhpy3zmV6R+CLN/gPCRw9t2uJKibUxon5AGKlHB0dgv/6d5qZxGN11ZQ9sSjvscSpLS
	JBhgSouUmiypXA/dXO+6WX1Uu+uTMi0f2huESwox+/aHbjAJzd/iVQJkfiM4jsLysW16VQEFRuo
	GL8JJirZfSvzd8jnRWz4+s0UlZnqVnY7A84hngLXnlcsTf1aN9Ft8i6E8bP09fqIH7S7BZr5+SW
	4cxPWzUoP7DchnFobKstE8XdUaFg4R+F2l2TzvIPOnWasbztVS/2KKJITgrVHdp8Kg7a+R8vABH
	a0kanLY9Ou3DyAqsz1h59h/ZbBSpSG2DSoEhAcVtkr42AFle8W1YZsj7CUd88QWNm1i4j0CJwyM
	NoIwTPoWzM8UJUIcDKpK+YEl5x/4l141Cfco0FzV5nv2CxfRf32
X-Received: by 2002:a05:600c:1d0b:b0:499:51b8:d649 with SMTP id 5b1f17b1804b1-4997a5f2427mr38053465e9.3.1786477363864;
        Tue, 11 Aug 2026 12:42:43 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997adad05esm3986195e9.3.2026.08.11.12.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:43 -0700 (PDT)
From: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>
To: Christian Koenig <christian.koenig@amd.com>,
	Huang Rui <ray.huang@amd.com>
Cc: =?UTF-8?q?=C3=93scar=20Meg=C3=ADa=20L=C3=B3pez?= <megia.oscar@gmail.com>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v5 5/6] ttm_pool_mgr_fini() does not destroy the list_lru
Date: Tue, 11 Aug 2026 21:42:20 +0200
Message-ID: <20260811194224.121597-6-megia.oscar@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811194224.121597-1-megia.oscar@gmail.com>
References: <20260811194224.121597-1-megia.oscar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bug: ttm_pool_mgr_fini() does not destroy the list_lru.

Fix: Add list_lru_destroy() after ttm_pool_type_fini().

Assisted-by: OpenCode:1.17.18-Big Pickle/DeepSeek V4 Flash
Assisted-by: claude.ai:Sonnet 5
Cc: <stable@vger.kernel.org> # 7.1.0
Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 74d8770f41d8..876b6d3a632d 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1572,16 +1572,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
  */
 void ttm_pool_mgr_fini(void)
 {
-	unsigned int i;
-
-	for (i = 0; i < NR_PAGE_ORDERS; ++i) {
-		ttm_pool_type_fini(&global_write_combined[i]);
-		ttm_pool_type_fini(&global_uncached[i]);
-
-		ttm_pool_type_fini(&global_dma32_write_combined[i]);
-		ttm_pool_type_fini(&global_dma32_uncached[i]);
-	}
-
 	shrinker_free(mm_shrinker);
+	ttm_pool_type_fini_and_list_lru_destroy(NR_PAGE_ORDERS);
 	WARN_ON(!list_empty(&shrinker_list));
 }
-- 
2.55.0

