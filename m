Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346D5271468
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755189028; cv=none; b=pqROrcqRmMu+nNQVTTaL3tQT/dEDdLCgniO/gmSG+uUnQDRCFcPj0kS9P7A0AYikOi6xNbCfa7M60I/IdJIRBJuJ1IabUemxqxbcvcY5oVHzRZoxFsu70y4rnrvlu4qDJyk2wNRrlib8b/hkWOWIRIwxvCem/3XowmzCZt+RA/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755189028; c=relaxed/simple;
	bh=8eTEDvbS27yrss3ut74R9MdQYKV6UwvenQ7s+8Lw6ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LDBnNfBrEzLROGegFrCXbmux+QxyrkD5KZr26OM516GDEk+PPRqmpJdJhal2EwiqjDeRTkSyHlSQmduDyq72drquz/3/THLoNDML9FfxxGL+WAC1LODLIvWpck82Re8GCowg1gcbZbrzvmTDpcJLHhdPm6zbTBsRqw2bw9ARyOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwF2ZvRm; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwF2ZvRm"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-323267bc0a8so1927899a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 09:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755189026; x=1755793826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJUpVtdQJ13ix1MWZWj9H2jS6xpOO2nJmtE7Ac5hyE0=;
        b=QwF2ZvRm6OHSkRFy+jZJ+jnn8R5TbBCFveJhTh48zqlaFNyXeIOs8qpfAu3hhxBGSy
         VYQh37zpt3e9LgY+ZOYfZagHz0432fUrWkgyCyLE7FdAfeRXg75D6nQBe496cfx6MDni
         NVO4L6VCZzOci5LvSXy6Xqd/TKWVgrOCFUklVd+WAmCy8gHQN5FK6xQuCmsBm89yEDLK
         zmq6QjiYJJacO7FfEmsWvwTvgGuhFJgEYwT6Io7nqkzaCHQlROuY4xF8Qy+2Iu3eb8SZ
         lyjbArBrovyQWBkJltyxKVsUxZTkNv3z4KkXxJD/5xZL0F7O5lNJrkVIQkdzbaCBzLtl
         7yJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755189026; x=1755793826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJUpVtdQJ13ix1MWZWj9H2jS6xpOO2nJmtE7Ac5hyE0=;
        b=qGAd/wdGcYauzMzC5VOq9obZhCRsdBdy0VE6YJ0hWPbX3ndbXhyFLraGbg6Nc/eAgB
         4lul+3q5v/qRuEwLsA9oLOuvauFi5u6V8o60vzgREfdpjk9UWakta87+GsdMQ3ZZnYil
         uxupQvRjnP3818xkCVF5bp12V2cuMt843uRYeQ3134/t9V2gd9Wqv9BHm/x3lNPM9Xra
         TTkC1sXlqowNGCq744FV7BdY04wwit2byWT/8GCs9Kv7MemDu2WU+U5tAHJzQLM8fShC
         cKBFzhVG1Np5KkwAfhWSF+b4dQFNPjDgAMW5yi1oBN3+8l98j6CrtEkY2YQW4N+bNmxb
         QZTw==
X-Forwarded-Encrypted: i=1; AJvYcCUmhF/nitNLHChy+HJseo0mc4C23VQizrStp9J6bfOU0DMbcRKvTjOqrRijuue1QVoInkJK3V2lau4CEziaxmvNhVW0Fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyETWr1yak5anpRE0mC/HjrodY6e0uBZAJWgdYPHyYIoX+aymaK
	mQMUivCRz/wj8v31J7bcvWCzCnbK8IGVUNxGQn9W0Q499da9yvE2Zuqh
X-Gm-Gg: ASbGnct6yqJ4DLQr5XdG8OEfrgzL6Sf19eifVtHGeVEv+uGJ3jbI9a776bJjZjj2cm6
	dI3tf0RIXcwf6Nhcs7RPxXNNFAE45BABsT2K8boHA/4tfEzYDHOA444TamSgThPtlpsmX89ZhIg
	Ep2gkwztZoVLhyvNPkPl+KlKWLubBSCHhQXdCA303gBFqTuKNEIY250DjdtqRmfhT0DQinSOLRh
	cfEbJJRssWChmm4LJduMWsF/mi567FdgQB1U07qsLyLbEcwV1GLQzhXQJYjq1eWC0V9PLSg6ZnH
	6WuHwruvTNkjRA2Lz8ghoiEaY190uOw6aqzYuMxyL3QisWPp+XBQIMenIOtRl018vSWAPO9NXuz
	RJxScY54tBJsxUbKFserYamBnHLrOANQYGwcVVEJwoTyejvciFpzyAeAZkQsIuNx8oPQqi9k0iH
	olQAWylFIAiQ==
X-Google-Smtp-Source: AGHT+IFNM6MvQxFQMmvHfm8EWRclofWRxVkoIbeED3WGrsSMg5Q4XsYpxHjt33kdE4mVFnfSiZXBUg==
X-Received: by 2002:a17:902:ea0e:b0:240:3ed3:13e7 with SMTP id d9443c01a7336-244586daab4mr58933455ad.42.1755189026182;
        Thu, 14 Aug 2025 09:30:26 -0700 (PDT)
Received: from chandra-mohan-sundar.aristanetworks.com ([2401:4900:1cb8:7b85:37eb:c20:7321:181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899adc3sm356194365ad.118.2025.08.14.09.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:30:25 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: jiawenwu@trustnetic.com,
	mengyuanlou@net-swift.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH net] net: libwx: Fix the size in RSS hash key population
Date: Thu, 14 Aug 2025 22:00:10 +0530
Message-ID: <20250814163014.613004-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While trying to fill a random RSS key, the size of the pointer
is being used rather than the actual size of the RSS key.

Fix by passing an appropriate value of the RSS key.
This issue was reported by static coverity analyser.

Fixes: eb4898fde1de8 ("net: libwx: add wangxun vf common api")
Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c b/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c
index 5d48df7a849f..3023ea2732ef 100644
--- a/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c
+++ b/drivers/net/ethernet/wangxun/libwx/wx_vf_lib.c
@@ -192,7 +192,7 @@ void wx_setup_vfmrqc_vf(struct wx *wx)
 	u8 i, j;
 
 	/* Fill out hash function seeds */
-	netdev_rss_key_fill(wx->rss_key, sizeof(wx->rss_key));
+	netdev_rss_key_fill(wx->rss_key, WX_RSS_KEY_SIZE);
 	for (i = 0; i < WX_RSS_KEY_SIZE / 4; i++)
 		wr32(wx, WX_VXRSSRK(i), wx->rss_key[i]);
 
-- 
2.43.0

