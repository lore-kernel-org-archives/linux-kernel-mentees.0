Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C4547DD6A
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 19:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477364; cv=none; b=OKf9MEMX9jNiaGThT6k29frCWyf8/jl4PN/s2oZnuzIGmWPAkV24Nqo9sQr1TBqZlxHM80zwKIk2/MGi0/Cdbzbrhnq/3YfFIIfz4jkO3JtTQpWhuF7bZzo1ATveToJtEbL4MsIMWImBoi0JwtU6ZSLulzgk/uArcbHZKHDkUo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477364; c=relaxed/simple;
	bh=0MSVQNAfX1H3iU3xjsiD/tQTHV1nkB6xpxwoTTdwURs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m2f8FQVH/SKWrXW9bBsytNUBrlyrD/dmty4ZSKjm/0MRNhxLox2F+2M/szz6CLWKnz2YvjHylsj7hNn8Zf1NcekQjU8m2OPP9bCi5jGlO0a0nFvt93OmJ6e4ltuR5eLTG+HLizVyWl5Sy42XGAGbuB8saIfCoEeve+uw3XHcyuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEntNcqP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEntNcqP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso521415e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 12:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477361; x=1787082161; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=maGvDaUsV8Puzc/vzM2VfATUwgjtE+oqcHZemKrSRow=;
        b=VEntNcqP5Z6CuCjz9NOumGUfRWN2370xfaVpSRUuDgkoQx9nUW7roZaVHW9gMNBi78
         mWXPe1OL9Ibqnuc9945lBv5lbiWAmIMeOmG/41rRbxph/X/F7sMlYSCCtZS0eLUucb+B
         p3xH7oD+pvSGhnf8nl/GbXMwWEZZMR52DvHM9uFnGqkX1Gq1OuNZ06wWvc2JIJL+JEUv
         z/H/fPMijmoWFPRFi2Ko0amuFtjBnLD2TZr1phMpN9ojuxkXPnVNwUlYrlF0Ugc8qTyv
         LreMKcaMmdqdK6rx0OZ4jXVFP95+hD40CMUiDlREZoYTNlFuAnyOMFM3OMskD4qFwaAl
         MWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477361; x=1787082161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maGvDaUsV8Puzc/vzM2VfATUwgjtE+oqcHZemKrSRow=;
        b=oXB9dm75B5xB/faZGRBnhallcxNH53gNKS1MFkcMGaKbJ7BjuHPv7JaP9nfldZTPTK
         3B+DGH6TGiJXT0zw2uO9qx+VrL0cFx4EuL9y6kSZLjHzfo/JzlGc4ju/rZnnkeiItuCq
         esGTqkg6QbTIHHVuH4wvQ3MzS0X0a5s/1s1yHClCMVursrCJYCTnHmuXHky5fyPXEfYj
         gP9CVH0PGxMSURK+cUs3pv0x+L1c0UDC6Eo4VB1RKiGr/UTnsbB39OPYSecwUIaQ4b8A
         6iUAko9nA8diy0TgeMm+9UchAhMiILGYjWzvpCWFFEfmTNeibbRf3z9Qsb9B47UyiEEJ
         bSMQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5lmCq4Dcr6LUhmp04o0Z8FEqysAHPebk9SgnvspXhDySiM3cu7AtnJonU0VrhuhMvQ/PlVk1Db4O6pu87YWyanoOs/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXS5beTvnb0RpEpq6pETy1u9Fk83QLMoTYucZHu5QMGhp1UPrX
	yx/TIVWBqNcUArniSl58TKezyP6ynvR2znmQ6L6yeIZWIUlPT0kvBzyq
X-Gm-Gg: AR+sD138sw1JBG7YVBlFw7mZHWQ6WufLMLe4NuuvToVxmIxy2nxetLQs6NzpQvATx0T
	WM0bImywHf//yfYAA0m9OP9ODyqf21Vp1rkjnz4HTTWCXewMMWHXAhphHR61QUsjwRzHdKY6dbX
	WvQ85ftkNzyOhQg64u/6+3BHjnI3go1FV7jmSLs0nskaa9JVPeanQinWeG+78xxcDmj9Wuyht5z
	+zEbJs9cO2zkWKEMBxez2ZI+y5h5VZo3JgGKlva9dLm/NKzSSxXxtZD5JSN52cTGawdulZUHeqI
	zdrmw8TQQ8E07NsYatKU/NVWBxBTxn26h/0xKKITfS3t4P5BaOO+nUGycSIuz53ryF86jZI0+1w
	0Pq1BRmStzoTdt4OPtjrtCUhDfV1ROFpIfo83mkOqmHPPy6+AfDpEggLnvWOPS4EWVUvBgLiStV
	jUFUccb0REmgi9fw45eDSlpNNts6f+Crlb+1F+2UjZQUvj70iwM1f+WCsGJT2jNiOJywOYESCGK
	4oyyCRhdQ6X98hfhn8yEgOk204nWJJeWU+jkINEVu8eSbLbYX8J
X-Received: by 2002:a05:600c:1d0c:b0:495:6bc9:62b0 with SMTP id 5b1f17b1804b1-499784611c4mr86084415e9.17.1786477360587;
        Tue, 11 Aug 2026 12:42:40 -0700 (PDT)
Received: from torre-GIGABYTE-B550-AORUS-ELITE-V2 (212.pool95-21-2.static.orange.es. [95.21.2.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997adad05esm3986195e9.3.2026.08.11.12.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:40 -0700 (PDT)
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
Subject: [PATCH v5 2/6] list_lru_init() does not check return value
Date: Tue, 11 Aug 2026 21:42:17 +0200
Message-ID: <20260811194224.121597-3-megia.oscar@gmail.com>
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

Bug: list_lru_init() does not check return value in
ttm_pool_type_init().

Fix: Check the return value from list_lru_init() and propagate the error.

Assisted-by: OpenCode:1.17.18-Big Pickle/DeepSeek V4 Flash
Assisted-by: claude.ai:Sonnet 5
Cc: <stable@vger.kernel.org> # 7.1.0
Fixes: 444e2a19d7fd ("ttm/pool: port to list_lru. (v2)")
Signed-off-by: Óscar Megía López <megia.oscar@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_pool.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
index 88c0d33eed1a..8637f7942347 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -354,17 +354,23 @@ static struct page *ttm_pool_type_take(struct ttm_pool_type *pt, int nid)
 }
 
 /* Initialize and add a pool type to the global shrinker list */
-static void ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
+static int ttm_pool_type_init(struct ttm_pool_type *pt, struct ttm_pool *pool,
 			       enum ttm_caching caching, unsigned int order)
 {
+	int ret = 0;
+
 	pt->pool = pool;
 	pt->caching = caching;
 	pt->order = order;
-	list_lru_init(&pt->pages);
+	ret = list_lru_init(&pt->pages);
+	if (ret)
+		return ret;
 
 	spin_lock(&shrinker_lock);
 	list_add_tail(&pt->shrinker_list, &shrinker_list);
 	spin_unlock(&shrinker_lock);
+
+	return 0;
 }
 
 static enum lru_status pool_move_to_dispose_list(struct list_head *item,
-- 
2.55.0

