Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B10479877
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 19:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477365; cv=none; b=n+iOlcMNi96b6eBBXzsHWCYPXSKI2Knzy9aQVNkHzD0OIk9L3gUNcMpUvaZbWyIBqQq17W+0yWEj6XfrPuQCjSpeyX5yZHk/KOOkar6V0HkHd8qpuRTNbABgbQy9s6gB30izPvCkI+u7no3eRFTxaodLCBDfX+R/YjrdzjNvIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477365; c=relaxed/simple;
	bh=JqKxq/IOJGoEcnOQcFWHghdDL43RcY0jUPwMdDnrmpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pLppb245ptGAD/66VPpJhjCEpwyg6ufIXIPhYO60bzKk7h1N9t2gjGlz+WzAeP4Sy0gXct0z7/QQJEVfLWM7thSL9P3NmrvKzGAeAqRfCOFQmTQmlVY+wli9ySi2hEjhWbZBV4XZxTSwfiK1NokltMoTpM7OKpJTVmw4gvJ0cqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efxpj9TD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efxpj9TD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so1325715e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 12:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477362; x=1787082162; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4v0iZboq/uLDu8mV5Gkz82xHeLB+QGVZ8axU862tksE=;
        b=efxpj9TDpUd4RC199qswZuLjsr/AUALbJ6ELHPp6cRqhWxwiSt4IwmktCXowhT2Atz
         O9bw+rMEVIAZ/vYA7AlV353IsNmXKS/9aLHQd/3c11OoOVqb4P2RDYRarWva4CjkyGLt
         WB7Ytw/D1hE1yr2bQL+FEfjnR71uk2ATxSlvpUgftF1M4Gqo0IaBf4HCb9vLTRF0Fq6I
         pJqefY3OfQL/FngYla/02t9NkrwGjb+h69229aFD/2i4hElC4l7/X6XAfCQT6e64Ylol
         haqlFnQChJtyh1b+RxqsyLbGQJHM/TzLPQN8YkZi3MdNn6YfgA6vDC7xbH74qGTeDvs8
         6dAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477362; x=1787082162;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4v0iZboq/uLDu8mV5Gkz82xHeLB+QGVZ8axU862tksE=;
        b=IwRwecaf44lEH94ZGVA9GYMWJpC0k1cwBMQPjaGRymUqCIBvopkXKVCyMuMbCRabJ5
         QCmlqzCsC+xuQ1/TjW0LEVsN4bhk18Vmum3BWq6siosoYsRHrv48gT4KpuFpXK99/b++
         N3bxQ3KQevkxwT6PNYKM1O27qwsrPcxrRsLLg7WZJKzso7Gao91JY411ai6WB5VAI9mk
         BSEbVVzjPo4/r9xkYuNR27gRW+hnDy7gYYUxEQRgBscNhCKWQ11PNKFIIbWEIIAmSak9
         cr24hOkoCPI+V1qKV2l/okKZDZVq/CIzqfw9BIyja0vPeNasdQdX0PR510YhwB2U+l8Q
         YnHA==
X-Forwarded-Encrypted: i=1; AHgh+Roxf8VkGX1GFwXrSynQeo5OJihduWMvOT4q9ul9oYT3LfITObLUZmy6syyzBXsxN0y2l7B2bGIo4PPJEJmRAnuVrzgJzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbve0WYW+ZKv9cwKGxVqfjUv+XxdRGQWEYjJpzZiXeW5k9UD6Z
	ZEJOBY4DyIxWuxqB61myu6WxkvcQvCrd99To6y8jpFxL3C73560ud+fZ
X-Gm-Gg: AR+sD13hGsyemhYMu9Xm/2VnE8TEmOol1gVuN4WharUPBl7EDgIh2hrWzyJv3epEVjC
	DJ2eCRv3IGmpD82WcAH8lwuVyTwtGhOlfdzzNnDOZ2at80p8ubgg5+H8qS9rylkbSB+dh8PJSCv
	6IpMyPO3Zmgdvh7rnEn9Q6fsz3KKzwrnKqUMDun0QsaH12ewRJZVxZNRU3gVgGwFeaAT+fiQ7FN
	hWd5b+xK4La+4EiyU4XlRmuPZtJKFfLUSq0NZagFXmqA9JX8jOgBwjqrkW+4RpbIo4a0S2s2SQD
	Fjt5aie9yId2yY6b0ptQ5Zm5Yk8Ovn7RGMctCRb9XwAhNPFT7FB7ZM28OxMeYIbivvl5A42fPve
	aeZktTHykZuPvDKu9Gl371tpszIS7ooVouR0Pb4C/jIGdk1YeH3tLV/1hhdGjzKXLu4CbsD2sHx
	CELRExT2XHSX40o0ytkhuV1Abbo+Wik0sKBnv6WubhzBZhg1PTVgH/jKEmxzy9ujT9c/Y+BZT99
	Ye3XerveoMtDl9Vnp8VmVgPtbElbgODieZU21ry5PTrN77eyzlj
X-Received: by 2002:a05:600c:34d3:b0:499:6eac:36d2 with SMTP id 5b1f17b1804b1-4997846d9c5mr93834455e9.17.1786477361645;
        Tue, 11 Aug 2026 12:42:41 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997adad05esm3986195e9.3.2026.08.11.12.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:41 -0700 (PDT)
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
Subject: [PATCH v5 3/6] ttm_pool_fini() does not destroy list lru
Date: Tue, 11 Aug 2026 21:42:18 +0200
Message-ID: <20260811194224.121597-4-megia.oscar@gmail.com>
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

Bug: ttm_pool_fini() does not destroy list lru with list_lru_destroy().

Fix: Add list_lru_destroy() after ttm_pool_type_fini().

Assisted-by: OpenCode:1.17.18-Big Pickle/DeepSeek V4 Flash
Assisted-by: claude.ai:Sonnet 5
Cc: <stable@vger.kernel.org> # 7.1.0
Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 8637f7942347..87c843f52736 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -1232,6 +1232,17 @@ void ttm_pool_fini(struct ttm_pool *pool)
 	 * that no shrinker is concurrently freeing pages from the pool.
 	 */
 	ttm_pool_synchronize_shrinkers();
+
+	for (i = 0; i < TTM_NUM_CACHING_TYPES; ++i) {
+		for (j = 0; j < NR_PAGE_ORDERS; ++j) {
+			struct ttm_pool_type *pt;
+
+			pt = ttm_pool_select_type(pool, i, j);
+			if (pt != &pool->caching[i].orders[j])
+				continue;
+			list_lru_destroy(&pt->pages);
+		}
+	}
 }
 EXPORT_SYMBOL(ttm_pool_fini);
 
-- 
2.55.0

