Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F352D978B
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  4 Nov 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762258600; cv=none; b=H1YfNKUwJaOnS2vZKWOEnVaPmNTjNMOc0r0OSMS7V8/fTKuu4m0YSmXWbo8TXnTu6om2bftywKb8db4CSQpzVDLqDxteAgfs2ueeJ2A5OG1eSyArb99ukwiITI3V2vQIg5/W6iL0oLFRp8vctor2dMhyWBN5pYIF0vi7x1x9mKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762258600; c=relaxed/simple;
	bh=KmF1ild1xRClyDBcecZ5U1luwkLXb/wS/QXdRFfIuPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s/JhVtKxm+j8e1M3IXH007kNhEU10YE7NLJOtSuuCWtTnhDx2FJyABPzncujGWBkmEANkyiLJ//lvkSXA/CDgGA1nvrC2KefUuSqKtVmp3v5kIQRI5xguzAg3n5ZdD0NJhiZ1h6rZwFXFh7SVoGJ9DHDJd0iwPc6yRaNXWXVnvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK9Xfuhw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK9Xfuhw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-27d3540a43fso53839575ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 04 Nov 2025 04:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762258599; x=1762863399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qm65bXeCJn5pnj+/OO3CyTJYCu+x03vH4a2TBarzblA=;
        b=FK9XfuhwFpq9TiSJ5Dda3IXEdNWh9Zhwp8c94rX+EB8SV6vHKyalnrpQ5kMaeuAyec
         sRJkzTFLNfztpOUqE8sqjykr0fsAP4kK2y8Lu2qCC8iT21ICWzYf0dqKHKq893Y+tcP0
         Y3Ad3/T6hAW2yVE0vMvH7JXiH01R8EePBNUSMZDu+eD6ZlIvK2oxQ66Idrr2nGUk1s8v
         W5aUA/sx2FziEQufNgbzOBv6A/cosLAQjEOfsKRrKXyACNmHpghaz0LSwSzwgOuKd1lB
         y4Mm/N4a+jqGz9mpjRh7d4a3dA+NAVYeCGgkaRVNBzVOnO/WUssE4F2RE9YBGMGS53tU
         V0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762258599; x=1762863399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm65bXeCJn5pnj+/OO3CyTJYCu+x03vH4a2TBarzblA=;
        b=ZnhgJlOZVaG3SNHKGNnnkhKikEGBuPqBFn3F6I5OJgm6Rw5UbNNN0qr0zabIT9V34y
         rbdGFrUTlKsnbo0z3h5kDu833ZXl36ovLZmCRHw3RNuHJn1IRfu2TTWn5NbdhDh6r+OA
         O0clVxCPvsiBrSuv34QelRTpCoZUBSxm3fXN1vaoFndOpW3XAU5oShPpz5eIhW1a4h6o
         ENtCYEptTsvR/Ao23TC3vxqshjfeTiryVJsMy9x+uR+fxnVUJpF2XXDoYvMfc3yxqaDQ
         ACaPU1T4z87qIjopXp12WGdTOPk2UpD1uiJdnPeCwz2Uc1yBiq0kx6P4j3R7q9DA/L/w
         OU3g==
X-Forwarded-Encrypted: i=1; AJvYcCW49XuelQpWx3RNuJ3NU8rO4hc7RjwyXqpkpsKfSXT4bBYBhjnwH7jrPYzia//P5WImpSWkI4nHoee+Fs0mJzA/ZpdOsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwWhlw7azgGqKi7fAQMupRGS9jrz+x4kON8Xrt45lunWDAz60Ls
	wAGG36WYgx5xAdx4bJsFLHVV44Rru8H9qYNnryeBRRCrcNR/KYjKLneL
X-Gm-Gg: ASbGncvsxwn6RjnZOVFGbMsHUuUSmY72AIvudWzyEZwc7EDrEz8YcMq4WhSHhtGT4sK
	eBke3vprBUI+Y3EOqqTG5w6oI2+6cal/ywDBYL1W4hzMKIZvyhM7yIqqCUNyc9hCDXm3OciMeIw
	x2g9iBUQjqNgl2PiIGMtT6W9yvocHn+6kxQCSeRcLV29k3otwRUnqu+GgPmvWHzNKEeu/yoEykE
	guoNwAktSvH4ojue7XIxARH6CtE95x3pUNAxi2QKH/KDSkpM6jTMZ2RmRc0z7jEd8i2QM3aKqcR
	5P4W37hQMNtbA2OJYMs5kKdGKSHD4kVWBbdfB0Z5oTMhjMCB/GuRozpFV99dDUQ11cwqKuUSAc2
	vd/6wtZCxSRh8RTGZRrwNK+YA8x12CkI74Mj98W+UYZs7puLE+1AAWeSnMkQazIjGDbfwlAuYwe
	hj6O5Ay3lvu7AjyQ==
X-Google-Smtp-Source: AGHT+IHWfL9ukqE2uuV3u9mjGfvafGL1d6Fs8/ftcpn2dBlsfCsDaAEiDNRs1yYtV7lZN1i+KrcEew==
X-Received: by 2002:a17:902:d486:b0:295:c2e9:604e with SMTP id d9443c01a7336-295c2e96112mr68237335ad.51.1762258598598;
        Tue, 04 Nov 2025 04:16:38 -0800 (PST)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415a1c2e69sm4436715a91.6.2025.11.04.04.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:16:38 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com
Cc: linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] drivers/hv: Use kmalloc_array() instead of kmalloc()
Date: Tue,  4 Nov 2025 17:46:18 +0530
Message-ID: <20251104121618.1396291-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against the use of
kmalloc with dynamic size calculations due to the risk of overflow and
smaller allocation being made than the caller was expecting.

Replace kmalloc() with kmalloc_array() in hv_common.c to make the
intended allocation size clearer and avoid potential overflow issues.

The number of pages (pgcount) is bounded, so overflow is not a
practical concern here. However, using kmalloc_array() better reflects
the intent to allocate an array and improves consistency with other
allocations.

No functional change intended.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/hv/hv_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
index e109a620c83f..68689beb383c 100644
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -487,7 +487,7 @@ int hv_common_cpu_init(unsigned int cpu)
 	 * online and then taken offline
 	 */
 	if (!*inputarg) {
-		mem = kmalloc(pgcount * HV_HYP_PAGE_SIZE, flags);
+		mem = kmalloc_array(pgcount, HV_HYP_PAGE_SIZE, flags);
 		if (!mem)
 			return -ENOMEM;
 
-- 
2.43.0

