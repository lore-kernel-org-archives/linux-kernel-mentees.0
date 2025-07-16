Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A85E21B9E2
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 15:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752680055; cv=none; b=bHzoEJiidd2w7KCKSG5z4vHsrlHfzG6siMgQqK3h/H27CQbPt1KXAP878XHE60uymlP7AO1NhSWzt3dD4m+NWJlc54HcrhOZTVuuagkiEJAgdTvfDXAvbq2MYQp/llEoozxm2cAXy6MfzIAb7D/QPM6mt1VttLnDYk1dKVovR8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752680055; c=relaxed/simple;
	bh=wyisApwR2KJgRL+YpRHialeVAdbXt2SPFnPpApHzX6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K98I0x3CWXwAVBsLf4DqCUPi3THvgMSaieWq4F4fSxOgvyRHJWQ1wv1FzADAOwvTKU1JtD3xs4ej717BZj0eSp8XhE5xHKHJVNg5Sa+kmCJtxREuGUjGdvUuvHPfEsRcnZkVwWyEpbVosbaiwiIg+mhXoDFdyQciCd03ON1+Ces=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpKv2tp7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpKv2tp7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3137c20213cso50925a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680053; x=1753284853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kK2GS5jiIyNR2fbDCWhr6RAWmH8MnpgTjQZo6BcexN8=;
        b=HpKv2tp7XTkYZbuk0YOPaRD4P9bka12RpIr+PfvQdtoijAXXuKFbghE8IWHesOZGtm
         Re5H3pOX7aBujf0UmNIcM21R5BQe3YzygHdR2sdnh0ea91GXeGHE4BZmHoe8euu4URAg
         hOuiZmW6BH+10P9RBgflyumVuQjB8HJbksG94ZAGftxhECU4tVadXhYk4oucmnZxRDdc
         /R1rowdtp/UKyRixXPKq7lriRDHPyFkTmLuMLob4k7wA6yeGjnAV4Af/siQ/86ZXX5TB
         dttyF76HMVCLaWi6avELcpU4I4OVLmgieOL+FMJ8oow6Zbbyl+4YenUoztpPWy6qn7FP
         STJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680053; x=1753284853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kK2GS5jiIyNR2fbDCWhr6RAWmH8MnpgTjQZo6BcexN8=;
        b=VyaKDSAN2IG6MwRShq7mxHoxVDIJE8n1E89QiwjBikHBXsxOQp3uESxPRuiPfyap7Q
         oV9HhAvcBI4G3cl1KsJNhkV0MQmBeSZr0UdHT0c4/xnARsFlBPvTX3jxZoSdDG0SiQec
         NNwGZqeH0G3HGideegcTRvQoWYnpKFB9FS95n8YDTNo4i0cUaGDtphm7aHCrm8rvmWfQ
         dPMz269AbapdtJ9QFlD4bT7UXZtRvjLxocZj3bjsCipe67hJRyU/zf4JTqZygQ3PvT8F
         IIUZTyd1J6qc5FTkfz11T5MMBMQAkE3WXdPJkxpCrNv88J90xoJsnY5ZoT4zwcaiy9Y9
         t1dw==
X-Forwarded-Encrypted: i=1; AJvYcCVv9Hkm/yFNIIy7v/f1o8e0dC1whJ2Qd3kEPp4v1DBx1v4XGAfviNsJm0HhF9kkwg4eMWKSEmKeaMmCpmoMmWC2SpbTvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzuQaZbiIIdllMHU1fUEt88E6teC2PoqFAQHQ0RX3FmTe9y1AG3
	o5D1FTJ9HcEXApfuyRBGbUaBjjY7DHAMDXncNurNahmAkaL7Ci6Ege4Z
X-Gm-Gg: ASbGncsqVmctzJsxbws8ADSqZq4uX/SOASqXr9oKKLTZyJKOmLUApNjWbcPEwzFcC1L
	VuPoYY/cgvKPBuTq8iYewVp4uqaLVFWtmjc+TVY5G9J6cRxRCIrGJOYHc/5djnKPbZ+ljYVVMmG
	v50W/LdYo1K0TSlto/fQ9P6f63whEqWYI0VrnyMMF+Qu5x1UCW/pKkWXAeAZYMfWUi9vjaxjVBT
	qvz9R/VPyhwSDQuDxN/RB8abIcYyJsSt8f013Xx86puPhqN/Wp9anobmG71fXlTUUh3ZKXzkbCs
	ZA8s1DJea7eKjiTLc2KpoYAsFw0ux6NwZhsfHY+z3CPXae72bOM5hZtnBv/tYBpGrFbYJbtNZes
	847zRgu8jjrZEBZnwhEnA6lttBXck
X-Google-Smtp-Source: AGHT+IHsbkBGxL3bE2S2Qc8SHdyb9jAvmdsH+jD4WnQfn8GqhiaRwM4rdCJ+rOhuCkjDq25eMkJKGQ==
X-Received: by 2002:a17:90b:3b4d:b0:311:f99e:7f4a with SMTP id 98e67ed59e1d1-31c9f47ce96mr4419797a91.26.1752680053190;
        Wed, 16 Jul 2025 08:34:13 -0700 (PDT)
Received: from archlinux ([205.254.163.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4283b67sm127946245ad.3.2025.07.16.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:34:12 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH] net: stream: add description for sk_stream_write_space()
Date: Wed, 16 Jul 2025 21:04:04 +0530
Message-ID: <20250716153404.7385-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a proper description for the sk_stream_write_space() function as
previously marked by a FIXME comment.
No functional changes.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 net/core/stream.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/core/stream.c b/net/core/stream.c
index b16dfa568a2d..7a37e7dd2c43 100644
--- a/net/core/stream.c
+++ b/net/core/stream.c
@@ -23,9 +23,13 @@
 
 /**
  * sk_stream_write_space - stream socket write_space callback.
- * @sk: socket
+ * @sk: pointer to the socket structure
  *
- * FIXME: write proper description
+ * This function is invoked when there's space available in the socket's
+ * send buffer for writing. It first checks if the socket is writable,
+ * clears the SOCK_NOSPACE flag indicating that memory for writing
+ * is now available, wakes up any processes waiting for write operations
+ * and sends asynchronous notifications if needed.
  */
 void sk_stream_write_space(struct sock *sk)
 {
-- 
2.50.1

