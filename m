Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE0820CCFD
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 14:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086262; cv=none; b=MJ71CYN3RK2Tsu3CPyVN4FWAb6a6M6HE6P+pvzfyiDMvHDVbWi1xNl2Ku45YpWb0/HcfcFxC/0z2szqkwE8Y5epE7uYn/IL1tmLv2xOJl9KP3yISFfE+HDji/phgkaQPp/9PY2XlsXoZtqeNHaxvPw4HHyFlygAKOU+kYV7cnbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086262; c=relaxed/simple;
	bh=GLo2U48XggqMZYrVKO9tyrinnEnhVGCFvICD1241EVc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4ctApyvG7sSM9zfHVFmloDpHjTrOsiONgWX0zXU5uu7czIBNREVTOALPBVuVmWiLlHgw2mnLKHvxki8fsy9ejhJGjOMZ1UBbIAzqP+khjknjmF6AqQRtDF+zcnv6eOAWATVxGZ6Aj1ZSoFJmkX3RI7rzAv1HQxjmUniWjUcNr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc1ivgUR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc1ivgUR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224171d6826so27569915ad.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Mar 2025 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743086259; x=1743691059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EP3Q4yIAaOw0EZrUQx4cjM2Dze7YJXchCM6sEBsoiCM=;
        b=kc1ivgURucy1DKAxaHLLde7PJqhd1N72Kn90tQ80lUCkKETsCxNILMaHlR6etShj4A
         4fKdRB//Q7rPR+eDjGv2ltF3RwcwCQcPRDz0bHCgpdYpYRZJj67/QUq4xnG3BxPAQb2i
         T2+uCamPHMHWLZnGUQiwdigcl7Nou9kGhq8MOCLy6JDx9o534pTm1OQHb+YhsGaN9y7n
         2gcjzyzSQ5QPhPfwRBatZ/zWbTT8xn8lHIASWR+rSXa1mYTmF0zI3x5AB0P8Q3/Tcj9O
         tHpVzo0xEiK6HF1BRk0g6NEmEJjAoKFOLS9U2rT4FVnksXpRG3Jo90kVAudWbwv0+WyF
         nvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086259; x=1743691059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EP3Q4yIAaOw0EZrUQx4cjM2Dze7YJXchCM6sEBsoiCM=;
        b=Ub07CzzkroLGq+IeGAkxLMbDnhnfUPc4O0ZmmaaSTN001RRzm22sG0Qk0qO4VWUCR6
         0cg5XTme2pJstZ/XN/zemXebtiaNGVFvCqzsdZzbvRRQwhnvVqgaJ9/J2/o5Zwk4zJiN
         hJgNFm1A6hCcOcMGcIS1Tj/Epj4jLCfPcYX1/jISSBsuOCawsEfHi+VLU8FI9mLexIzC
         ahLzbhbm5fYwK8nunhJMP4VBEctYpyT1XMCVQ0z64QKIJ6CTFY/bSA8vcXEBwtYC5jpw
         Odm2pyQUT+lIaRnZJE3YzA9kM9voZrQaKveDFw2JZOQSWIodacZ5VIwXO4zarjxvqGGp
         8juQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR4hrLES62sxXLqeWAhLh0mc+P1aNsobM1ihDTO3LCA+5+uZHxYMU9xdDAXK+fEOxY1rwHxGlzK813CrTq9ln3A7cVfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvJ/UoxnHZCckg4hUMC2b/1r8sio/3JK3tai4xzbKuOEt974i3
	vjmJuuwBfxdOzUPaDy/fouL7wa1Z491nwn/mZsx1PkpbIeFWbqzHjuQ3ydzm
X-Gm-Gg: ASbGncuJYHH8OFTTuzsZzx9aFCrOke/YFu0YUGn/ew02lcMDH/JCu6G8jwwH1RyYS+I
	oQ+TKQspUqPy9zMjv2BJYGDVTAh2AYwQX+jxOs2ctnykAdOEfedqpmSyUgdROUlQpjbVZTMYVqE
	aLE9rtvFu20i5hHCy2YUpfyumyJtaOruhEez1JDT01RLU+CArhXBAM5KGpKbMnlPkWouGmBo+qY
	GEPtXnr9KOSgqJ07kflYxoHHA9OFtI4yiwL4fmiSb84mGeOkw012AP9fo3FVsj0os5dfWB2+taM
	OTYb8H7ejczoupR03FYyaAE+ptx5uoi/hWNlK7LIBxB1mDL2Lf0PpKXFP5MS7SD4FdpPdq1A6Qj
	dcNccqAaCBw==
X-Google-Smtp-Source: AGHT+IFLTjrLe6L1WJYlCp+rrPhU2EXLSBQqKf1OtGjGvATncHbkdAgpXIe7hZsv1NhBtdcnD/XVOQ==
X-Received: by 2002:a17:902:ebc3:b0:21f:617a:f1b2 with SMTP id d9443c01a7336-22804958326mr69992435ad.46.1743086259171;
        Thu, 27 Mar 2025 07:37:39 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:5351:77c7:8428:7286])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811b80b7sm129205185ad.110.2025.03.27.07.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:37:38 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jhs@mojatatu.com
Cc: xiyou.wangcong@gmail.com,
	jiri@resnulli.us,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] net: sched: em_text: Replace strncpy() with strscpy_pad()
Date: Thu, 27 Mar 2025 22:37:33 +0800
Message-ID: <20250327143733.187438-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The content within "conf.algo" should be a valid NULL-terminated string,
however "strncpy()" doesn't guarantee that. Use strscpy_pad() to replace
it to make sure "conf.algo" is NULL-terminated. ( trailing NULL-padding
if source buffer is shorter. )

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 net/sched/em_text.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sched/em_text.c b/net/sched/em_text.c
index 420c66203b17..c78b82931dc4 100644
--- a/net/sched/em_text.c
+++ b/net/sched/em_text.c
@@ -108,7 +108,7 @@ static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
 	struct text_match *tm = EM_TEXT_PRIV(m);
 	struct tcf_em_text conf;
 
-	strncpy(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
+	strscpy_pad(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
 	conf.from_offset = tm->from_offset;
 	conf.to_offset = tm->to_offset;
 	conf.from_layer = tm->from_layer;
-- 
2.43.0

