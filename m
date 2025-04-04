Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7641A84D34
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Apr 2025 01:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730114; cv=none; b=pk9ItHJBBW8su6DlBhj0SV5nNXs3pqHdiD5CKvidFNIrObUrj3elRBJce0f1PIYnJAkXfEwsRt8DKqI0A98RLwa1f8svjc6lENTLDAjxFbo8+9dHIxmMADVT99svKiw4Ld/DXEhkh9Yiluo+DwHh8yw6tU2VNgA0WMLwOEjddAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730114; c=relaxed/simple;
	bh=ThCCTnlJqn1Oa31nv7NfH66Rmv9MGvCR0mQnVerABCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Go6OpgduFc0njySmueHeCVNf+g9EyGq50OsTdr+BC1cevts6G1XNluxRtWFqXSlOO5LqOaGCVAt1eYC+luwz2m7VlEL61tqeK6vDeV3inMw1cPxFrduepSbowfnbDTbL2TrPTuuR/tdrfyc/1KZkYt8uzRrc+VCIf9LViwG7ZG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkfAzNUU; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkfAzNUU"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5e39d1db2so89386985a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Apr 2025 18:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743730112; x=1744334912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vR5kIA+uWi4HUBvVSoOD2MczBGVAng4z2Yfd3q51pFs=;
        b=CkfAzNUUzDg6drf89vaISiJ9hr7EtXqGvsloqYqYYE2m35IFAzor8G+mtdTuHrVCQg
         lF51k4HGNWU6xWglJA8zaYxdC+SzB6NtY81m92YQwjQy/Yevq+Ri1xFR+9ke8/MHKQHi
         wsHzX5ih6aV86RIQF5cj2MRafZp4z0Kcv9yjgWvqiDCjYZn+Sf9iDOx+mS/xX32+zU7M
         +L+mJuF3xkGnBeSgXOnlf4etNtaHrc+W9KXrtHE4bo4Vx4YGr00heMntpOmWfreOVXP6
         L37i0VRhQt/JZxEam8vz9aPGChxqR4YJGgvf66C19pQ7uvqmqgOHeBn6Z/7d+v3UwFWd
         VG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743730112; x=1744334912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vR5kIA+uWi4HUBvVSoOD2MczBGVAng4z2Yfd3q51pFs=;
        b=rBaJrxmoETPhshG2xEudU+k6OqGdUkO6KzWH7dPETo87diN+G9YxqymfxWjvmbqfOb
         kUww5Lp7sqoBVZleOQ+wtC1Kk9Rw6YoRCYM/ISCyt5UHmQpVXg4csTXd8PTY/9vpfSIQ
         TNc5LF0mlyQSGRa/jF0r2P2/uBFgBDqd71u2edCOHPj12SrKIyR+QnAgwj4D4hMY/+r/
         S50SsKRxSYrC77kKz0VDE7QykRhKi4USvlZ4Pfr72nZUbPdcToNojrc90CpAdtnoxRP+
         9zWTqeRzRZmogY2aAMVZEeqIG3u1xhl/M820Lo+arDpE6lqT52mhFgwWY3DTtNZbgbzq
         E+gA==
X-Forwarded-Encrypted: i=1; AJvYcCUaWHoSCRBPLJ88ybABnyujWRA5CMo3wOT6wr3lomyIQ2W6CWYcOtJTFiYH1uyHyRSOKuN27DW2NJSpsPsCYGMvoCHm1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMJo5jJgyEf+iKR1nJqHytHHBfzqhV6sU2fPChY9Gp66Z2T5rg
	KUOAtyYfyX0eWbJiza26Jnyi2LdMxlYEXKRDrLbaLBbw8dkrhsre9iGKQ/fD8Ig=
X-Gm-Gg: ASbGncuxQFGbSnqGJMYabsfWnbybxzUwTjz79dQfZRBr+N2IiddeWMvNg0SJE25J3sL
	enRXzhY8WlScrk627iU2GhbF+N9gTUtzLdwQvZ2eaXiSaczZhcHclxndQtBxNhYAvVWhcPSbZAG
	Q0VvZHMwXm+7dLraJzuSRA9IU9spc/razBKS/5jLqa+5pyro6QsdP38P9JWpWdMz6dugVlRk3yX
	Nb4v7g9uGz6CoKjzf+Kfi+pr/WmzFvbV++diTJFVuCYrqCdnUbZNLG4dyJNMULEjJE+m4J08jru
	G2W+C11tAyHWDSq3DPISAQIc5kmHdxKxiaLLXgA3dteQiHdBo4KuFaUdSU9sWWCVdiOFbdML04i
	o4WyQMqYA4SolndByaWgnlxs=
X-Google-Smtp-Source: AGHT+IHOiCDsx8ydbyTXKh335o3fqUmJOSL2TVK2ugwhL+DPClZKp/ZqRN3CkYK7OcZu0VtvNzqt5w==
X-Received: by 2002:a05:620a:4727:b0:7c5:3e22:616e with SMTP id af79cd13be357-7c775af1552mr137092485a.56.1743730112437;
        Thu, 03 Apr 2025 18:28:32 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58f95sm147401185a.80.2025.04.03.18.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:28:32 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: kent.overstreet@linux.dev
Cc: gshahrouzi@gmail.com,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 3/3] bcachefs: Use cpu_to_le16 for dirent lengths
Date: Thu,  3 Apr 2025 21:28:22 -0400
Message-ID: <20250404012822.188485-4-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404012822.188485-1-gshahrouzi@gmail.com>
References: <20250404012822.188485-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prevent incorrect byte ordering for big-endian systems.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 fs/bcachefs/dirent.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/bcachefs/dirent.c b/fs/bcachefs/dirent.c
index d7f9f79318a2..82ea6c437143 100644
--- a/fs/bcachefs/dirent.c
+++ b/fs/bcachefs/dirent.c
@@ -287,8 +287,8 @@ static void dirent_init_casefolded_name(struct bkey_i_dirent *dirent,
 	EBUG_ON(!dirent->v.d_casefold);
 	EBUG_ON(!cf_name->len);
 
-	dirent->v.d_cf_name_block.d_name_len = name->len;
-	dirent->v.d_cf_name_block.d_cf_name_len = cf_name->len;
+	dirent->v.d_cf_name_block.d_name_len = cpu_to_le16(name->len);
+	dirent->v.d_cf_name_block.d_cf_name_len = cpu_to_le16(cf_name->len);
 	memcpy(&dirent->v.d_cf_name_block.d_names[0], name->name, name->len);
 	memcpy(&dirent->v.d_cf_name_block.d_names[name->len], cf_name->name, cf_name->len);
 	memset(&dirent->v.d_cf_name_block.d_names[name->len + cf_name->len], 0,
-- 
2.43.0

