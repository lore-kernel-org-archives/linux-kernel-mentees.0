Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC32040B6
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 09:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760694199; cv=none; b=hwhT7iaWYEEz9rwn1WqvM+AfHSbtOM+IZnsPdajCYwswthSTIgiIcpg0iIjsFvlF2JWv4IFUJ8bLx34XB2YlSfPlJMRYbtEi+7mvy+P5bm7vruyakt01DA4wEJ9WVftXaL71qPVdYFr+ARxvhRat3jS/i58xIC1a0zxy1Nqn8Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760694199; c=relaxed/simple;
	bh=/M7Bnm3gjioI+Av04wQGAmQfU91Qw7IuTFIH55BhMAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpq8n2YAyn9NkPb1V22hSEud4abtslimUJSa5mhwW1yUhtbpo3NPKNbjKE1yKiNEruF75bgSFzx7ckd8wCN9YElFSzWqtM5NpawfYXJIyJ0I4Uhjp80zNjY6VDFBaAPSdof7iZ/AlyemYV6LayWM+uRtOH7IVNe8nmxWLUd2a+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4mCzADp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4mCzADp"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-789fb76b466so1664214b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 17 Oct 2025 02:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760694197; x=1761298997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DK/268SDlKo91KyuWt/Uk0juTRvqRZCB2PBwlunHbIo=;
        b=D4mCzADpb47PUL0oqVRUDb+AjeSosdVNrOiUrKO264tJMlJRWJr66m3CpEZskqmE1F
         L+/1LOHBAVv8O5t4HVjoeTDR/T5F3jDPt2y/GmxFnlGup8lhlWEMuu2I5FjyBEREvTsK
         wHdnmTobeIbLq3bOZdwhpiqRAU+gDPD4VvXOEKtakOCqOrJVn6+V8qgnH4GbgP7Ie+jC
         N7hwCkhEXspUItSpnAVQYhj9NCQggigXP/Ue0iU5USWf1VajVWCiXWYqUHsOx7Ml3uY+
         0tnFpmEnxhHCfQS1YcYaCR6jBsJq6W1iqZY4cPsoG+g0wXKq85gB8zov4ZFYk8EMP5yK
         wLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760694197; x=1761298997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DK/268SDlKo91KyuWt/Uk0juTRvqRZCB2PBwlunHbIo=;
        b=Ec0uQEACI7xEd+oeAlrH6/p6xIHEXty9Z6aJCwSMFzc5xEmUcIICjL9SZEF4Msrp0L
         USl4H9QqlDETA1j1EZjmC3EwTP/og2luSSTIFP+ThDx0a7ySZ9BFyXDWZ8ApeK1no6dp
         /eebSlpSTOGifqd71Ebpg/J81BlsFUVhAVOm+R7BZ/RFl/dOgSmv24Nl6cTvZbLeY1gd
         xCQfX9tYf6mHKbqs3TdlPWTIYZO8IOhnUH6cH4UcLnbv7U+DITBCTJJulOo9Fd0qKwaD
         CZFL8L/unEZb8AcBWmbxr3kfmdGCEbmhtAG3rBZwSv7ffx7HErEFfJUiObKoHDRaiIzq
         a7Fg==
X-Forwarded-Encrypted: i=1; AJvYcCWMy4Qo72Bp3VmybukpMRei8RkS/L+gq6Wyg9RfVBSfQYvmoG40ffOKcP71blvwJ1Kp+ml/b0AQT/8ccD0p2a3L+1gnOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzII58f0D4sKW9h+AcwApHMlc6aliv4j4UPcCEuQTiXDc27gBaQ
	NrYxcNnrepxMM5B9RpYLW98UK4QbgOgjCmdBbJjPJeQULe+tHvMvVp5hOmGnzrWr4vg=
X-Gm-Gg: ASbGncs8EY3E+hXx6N1WJVhh0GL0n+PIRsl9vPNyexltvNnmhUD1oYWqCRGRybleiBO
	ibUISkDNqmjbtRwQCwLSttlF+o0J50btZgrUM5HHOwpCOR9VKVTh3CrH3s/2iN+VyWT+WCqj922
	S5U+x5I5RhMKeUBcAVKbL0hPe3unwGFIBKuyfW6Fkl0bThUbG7yOw0S7ESmQxLV2+9afRraHDgV
	q9Gl4CGt7fNMoCV8t6pAXT4jvHyBe68wTMkswh+11bePVLE3odf5zRz2OQB5Xbvb2Nmw36m+LsT
	jdFB2d+ssCX1JyKOi/OrT25aLuM/8WT0kS+eOra5H4joF+5ZpzGsDW0efwxnwn156sB/yMO40aC
	7lnv0d7Bavmi4tOzEYTlmo9X0NzHXACySfPaN+WizvKIvJ2OcIH0bMVh1KlpxnjDKLOXqWs9Dkx
	D+o6/cuE5SCg==
X-Google-Smtp-Source: AGHT+IHVk1UlLvUv11fCrAvl7GZkv39UL14NzeVw04C1QLEJi71IrKA1z/tBFl1eYTam3trbIvNwag==
X-Received: by 2002:a05:6a20:3d84:b0:2b3:4f2a:d2e9 with SMTP id adf61e73a8af0-334a8515183mr3683681637.9.1760694197461;
        Fri, 17 Oct 2025 02:43:17 -0700 (PDT)
Received: from server.. ([103.251.57.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a1394139c8sm9963789b3a.18.2025.10.17.02.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 02:43:17 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	richard.weiyang@gmail.com,
	lkp@intel.com,
	reddybalavignesh9979@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] samples/vfs: add selftests include path for kselftest.h
Date: Fri, 17 Oct 2025 14:32:01 +0530
Message-ID: <20251017090201.317521-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016104409.68985-1-reddybalavignesh9979@gmail.com>
References: <20251016104409.68985-1-reddybalavignesh9979@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test-list-all-mounts sample includes pidfd.h from selftests,
which now uses the centralized kselftest.h include after the
previous change. Add the selftests directory to the include path
so the build can find kselftest.h

This fixes a build error reported by the kernel test robot.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510171513.6IWk005g-lkp@intel.com/

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 samples/vfs/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
index 6554b73a75c8..9256ca5d762b 100644
--- a/samples/vfs/Makefile
+++ b/samples/vfs/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 userprogs-always-y += test-fsmount test-statx mountinfo test-list-all-mounts
 
+userccflags += -I $(srctree)/tools/testing/selftests/
 userccflags += -I usr/include
-- 
2.43.0

