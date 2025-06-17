Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27DB238175
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 12:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163176; cv=none; b=MeIZQ7s1g1vvHickfItBsYucdQPBidjVuhbcR5myA+0+z1F81LaBS5rNpXebe4rXU/bQNyxwWKzGAlO/ryob2XjvceEbx4H8h+62LVNzJGURdGfQ6WjYZha0Azyi3VwD/zR55HCWJDfE3weVo/TOWOQ+xH+t7LRAKOhJL55CsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163176; c=relaxed/simple;
	bh=GapOKwyflP+ZpWPmihqgp7HGJ5ycxWDkT3/PcFW1nHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B7cbOapGt2sUzbHHrKQ3mhOGAWgNWEohqOh8l5MRNO3A36gYzHi99avng0LYp4OJM1hwDS9DbnU0ORU27cDNBX3GeT5+P1I7Qm62HdED0rZi2LTxlXRmr539xU+myQ/CMHeZhsZI1fshx3H0clcQBidFyQzBHD7r9/dxvVsaDmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGdui4Pe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGdui4Pe"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so4886606a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 17 Jun 2025 05:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750163174; x=1750767974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lmhCyj3oG+9b2plobKfmAomghZ2eZwtkaPqpuGuysqw=;
        b=eGdui4Pe9YUD5NXTOo3IWGAYk4xJU+i3PsdspM4TGNUW1i9rHZ+QHVksUNk+7/qOxw
         7tPTNHYUuW6P5Cmtp8KZPnefFCEmqr9O5LAelXfzhjSY/5GIFpsS06XT7G+ZY9XDeJAi
         /roxhreBlvudiLHrVnOWm0rhyWqExp7674naNwHNUXTHzHs4AGz9cb+cPmOkcWCu5Lbq
         Uc1jZcOvp1o+q5+FfU4KZcPy2K36l+/B5xyR/W4WTdL60oGlyzPDgtqehPER+bCRbiKc
         dvetxoveGX7DHm8/0qcU5ZRgFsRwmza/vVrXIRfJsxN0h85+UAnpsigsJxf7ICDVHSK9
         kQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750163174; x=1750767974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmhCyj3oG+9b2plobKfmAomghZ2eZwtkaPqpuGuysqw=;
        b=UCGOzNNeGPCae4E+SlvVDA5wHgJJJ9yIOl7Vryc0J9Rj+qnkLku1ZpqT/ObBipKYLE
         mORAGp5+aMJTRFdec0/XRy5O4emeGtK4M+mIOwBfCcTf3ezEPADgnpHs2/gMgsfxXV7u
         NkVNXfljDYq8phHAzWoQ3Gpo+XzKIGmjil40cuZ7omhmLBMVF5QT3PlGioOQaXaeOnRe
         wppYLduOCdX90UmqHlN6tdq143+hlPsQHUJYnQDkIWK5YZmq71BiUiJVM0fBHOnNljSu
         Q4UPsCPQ28ZQykRDjDJN3JE0gWgtwljXrcir69DZaFu7BVfwAhY97NXu52U6uu8DqAQ1
         mAjg==
X-Forwarded-Encrypted: i=1; AJvYcCVqDxnlsjqLAY7P9C3fqnUib7M4lXIaKEeoaz/9KEsH3hqqz0d50r1f8lADPA7CGa+XKEnuX3GG3anqpb+yUaX+TfGhwg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4DDsqSN1+77NDcLfmsQR1T1kA2M/voFraPvsX682xAEGkiD9C
	ioFEvWxcst17BBd+ewqBvT0rQuGqgVpiEQfd/XErN5ghSqDvUeM7zsh2
X-Gm-Gg: ASbGncu0JP9Nn/Indg1N+c/QR74yFIx2YlG68h4fihjPmrf4yo+EJgiogciLJOc/5zF
	T/B+Gtz2LQpg9X20sYpOJrRERHpZPYxRAZ2zVbWsCgCEYl51T6lydqYzWEMhmoAYAVJWLaTpBu/
	Cd4+nWyP04uj/WeNscSUgSb1AX6yb5yECZ1SVD1JP6AAy3kR7n2vN0gj+CfVMbaX9E4QmYkqmLR
	fejrGrn+K89sQgp7S+TCdW4DvWP6b8hiNxuqM/Ynj5/oHYMW+HUIup+jEKJVW4yqwGlgw6iFWXF
	Go910oJq3GKxGcnWONhmrDAzzTNE+JPciYv9WLRWrp5EZ9Eb7S3iItHdINOG+mLS1aLHPaB8SVy
	fTkBxltA=
X-Google-Smtp-Source: AGHT+IGTCN29BMxfXIJrKeN0ocQnXkWRuyj77RMW84BLrUAULMGJo41/CNVAbBqbUTHg6VLKB3GoSQ==
X-Received: by 2002:a17:90b:134f:b0:311:e8cc:425d with SMTP id 98e67ed59e1d1-313f1c00e26mr22432756a91.10.1750163173798;
        Tue, 17 Jun 2025 05:26:13 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b8139sm10573302a91.1.2025.06.17.05.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:26:13 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: wenjia@linux.ibm.com,
	jaka@linux.ibm.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: alibuda@linux.alibaba.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	horms@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] net/smc: replace strncpy with strscpy
Date: Tue, 17 Jun 2025 17:55:12 +0530
Message-ID: <20250617122512.21979-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the deprecated strncpy() with strscpy() as the destination
buffer should be NUL-terminated and does not require any trailing
NUL-padding.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 net/smc/smc_pnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/smc/smc_pnet.c b/net/smc/smc_pnet.c
index b391c2ef463f..b70e1f3179c5 100644
--- a/net/smc/smc_pnet.c
+++ b/net/smc/smc_pnet.c
@@ -370,7 +370,7 @@ static int smc_pnet_add_eth(struct smc_pnettable *pnettable, struct net *net,
 		goto out_put;
 	new_pe->type = SMC_PNET_ETH;
 	memcpy(new_pe->pnet_name, pnet_name, SMC_MAX_PNETID_LEN);
-	strncpy(new_pe->eth_name, eth_name, IFNAMSIZ);
+	strscpy(new_pe->eth_name, eth_name, IFNAMSIZ);
 	rc = -EEXIST;
 	new_netdev = true;
 	mutex_lock(&pnettable->lock);
-- 
2.49.0

