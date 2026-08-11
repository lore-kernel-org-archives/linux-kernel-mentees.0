Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA847F766
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477368; cv=none; b=hH1HRVIDlMJlBX4GXjAu7QUgwJFQR/8WXwA9h55KkIo1f8RWtTwVNBwFcH9FBWqPqsJ4jRjYkN+XL605DoHuRKg//N98oRgzaEmcf/0vOTWQQpc2k3yiSO+Q2cendpbRbyB2Nq59tzJuVwnypliIN8szYIJZrtXfBVY5TRiw/vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477368; c=relaxed/simple;
	bh=ddu9DCVg5CNBBxYAZ7C2IjQ6tIBqi+R18l9PMT0/plU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B+pd2icUDTpKMhi2+JLdt5nP77F5oTVOAXbq1W07/jLJvAd5xVZvGvbz2HnxjrtjHj8FpoAft0C2u38+D+dI0mGl88aSqK1UBhGT1MgRT6lDkvik9Iy9MTE51yLTIQfyk+UkMSPX8JL5LlBS1Utvx3xKEhyu9aP2jXymP828lkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HecMFGLb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HecMFGLb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4980dc26022so1742815e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477365; x=1787082165; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BuMfkemM9Oz2WhvZaC2ZnN/4G8tTmAb8WWo8t6gaQkk=;
        b=HecMFGLbSY0pfrbMAh88ZSMxnKxD0v9SGB05UiATYeBjNZEW0SHFXYDjP6/k0gPvUq
         0GYgA7SFRlTgaOVtuf6w6X3XKLqWw60Q5vySjJkRfm5NWdzPqUo2OyW5ZAkBO2vEd8Fa
         7dGY6c2v8nqAio+yyBFAffo24dnyMriVi5UXmZtVVBf42Vyto7P9efrEnsfD6emETPz9
         m8FYjM9s2WBz96DulAA84/Mj+bh3Hpiqw1iYJ1C23gEnRViyq2BYZyOsKA5DBqtJCk8j
         zMPoFmWJRj3AG9gXXeOPM5mUiq2jFp1QAyx/eDGabVXB0oEALYQDUSMxrDWSOB0tn3X7
         OPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477365; x=1787082165;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BuMfkemM9Oz2WhvZaC2ZnN/4G8tTmAb8WWo8t6gaQkk=;
        b=araqD++zF+jpvcEeGcaaq0QXneTqB6GitB9ESBeQhF9Qh5j2vfoGjeWBBCh3W9YltN
         DbEKObo+FyvX4y4NbdwBORGXyZy9Z8gsVJNoJWJ+h49xj9PQzpjcazpTwv7hj7roA0kK
         m9g0oMciATKw+hQOiew3NKuk9pdgAeRXXnGjfdzeyKmWqgFuReTWgFeK0LuWsUpYBpAi
         DaHGOw46+APmOTNbCc1+G+CH+38fSmM5qtwAQHdc9ylFoKTvj+f+nc6HXegMJGFmd0Au
         UWMzhgOVhJD+xAvjYeLMJbkyM/SzuUF34HvcEVSuDXDuEmQo079LgkKBKnfl2lScPs+v
         MUYg==
X-Forwarded-Encrypted: i=1; AHgh+RpiPsnv5KvGzlX2nFmP662crBP2htIqwgbGfe+gNtzadUDvznyHaNFWoaWyZsZt8N9KYBDEN2edYybTLP12MFTU6TtcNA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4aJtSXj3YLGZqZcImq1/YKWWg5k34uj/eXdeKEmvSCEKK72P4
	pSIBZNMzJt/U6S7VmEiLq7q/BIqiAXfFMTyCZGxcmW7lTGojcy+T69BR
X-Gm-Gg: AR+sD11NiycmA0i18mN+/ufWMzq3wL23IvlDLP5pJRthIivFuI3JbgDJeCzRdQcyfZU
	tXQJnj0sKvxzfP3XHrTwUxQ4/FTYMMbVBN4cECt/w+2L9+SJBO0iw12iq1Y5mQ7QJTiqz+2gPlC
	2l2BXt4IRfblZpxxb/Nw4Yb/Pb5ubWqNMf8CiBh8EQmzdxoZVIQtGr0qZcpPEzqqidAt9OuH6im
	d9JSn4lsvExbhzxXFqcz0GJr2E79v1gt3+gqC4vbBfcPymAtFzfdH1LID2y1UD9FbO/Dmdzg11Q
	EjV6jBIxkhlDsbm8BUOkd6bs7B9uSIwmV/TWJ75QqJyk9Bv3FxISIb8TLm4/edYMba6tiEPyxxJ
	ARYuTnILPGVOz3Wbs5KJWDyg7nU8X3A2yUlAljPhC2jguC9V/Okx3UlGCikzL3Xp+DxCBL/59PI
	r7Tx+jwc3VJXLk6FMuLrvtX0Iu2jDdlzG3AidhPSkW3DNe8i3keDzA44ykefhQaIJZm6qJBaHAa
	+g25+fCDxzPF40cBcTMJuS4U51ICF68QlDS2IZBxaEufohg70R/
X-Received: by 2002:a05:600c:c4ab:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4997842c213mr78119195e9.2.1786477364935;
        Tue, 11 Aug 2026 12:42:44 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997adad05esm3986195e9.3.2026.08.11.12.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:44 -0700 (PDT)
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
Subject: [PATCH v5 6/6] ttm_pool_mgr_init() does not check return value
Date: Tue, 11 Aug 2026 21:42:21 +0200
Message-ID: <20260811194224.121597-7-megia.oscar@gmail.com>
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

Bug: ttm_pool_mgr_init() does not check return value in
ttm_global_init().

Fix: Check the return value from ttm_pool_mgr_init() and propagate
the error.

Assisted-by: OpenCode:1.17.18-Big Pickle/DeepSeek V4 Flash
Assisted-by: claude.ai:Sonnet 5
Cc: <stable@vger.kernel.org> # 7.1.0
Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index d3bfb9a696a7..896b766712d0 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -96,7 +96,9 @@ static int ttm_global_init(void)
 		>> PAGE_SHIFT;
 	num_dma32 = min(num_dma32, 2UL << (30 - PAGE_SHIFT));
 
-	ttm_pool_mgr_init(num_pages);
+	ret = ttm_pool_mgr_init(num_pages);
+	if (ret)
+		goto out;
 	ttm_tt_mgr_init(num_pages, num_dma32);
 
 	glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32 |
-- 
2.55.0

