Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71D823C50A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756016086; cv=none; b=o0woG6Jk9t8jTPJvS7470XeuzTFQWljezQ46dgjsKLl6fiW5sMezGo0v18+pijLNz6v2stYVWlb41wQzWS9qX9nOcJ6yNIMgFwlQcmVXSmQfPkPhl0/NCngpPGGrhczvX/F6HPeSWuurgumwq/t7I7whozfoItrUeC0PHRAEaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756016086; c=relaxed/simple;
	bh=dEFjZ0irkD8kkz4VLaw3rsm64cw0sBJqoMvvNXPG+uQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mXhlKdhdnF6tRDEWzOfuWDTIMycvUPUf5YQsYC8cGUpWxwUM1YbVUlB+xNbxJBDbLLsEX7P19vLoWm5JDUi6MeVyY9em+odQS3MAiMpP6NTmhsgyEsrkVzr2NjLU7cZjzmE6HeRX9UXndfZe5sxwyVsAHYrtT/K62y+dBOMEdpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJJ/kCVj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJJ/kCVj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E15E614A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFuSTfI9ITFE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Aug 2025 06:14:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 01E2F6147D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01E2F6147D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cJJ/kCVj
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 01E2F6147D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:43 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so2832775b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 23:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016083; x=1756620883; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=;
        b=cJJ/kCVj0kVuR/GYWLGVZJZdpkwp3mfhPskfi/+5Ciim0OFhcC+/EWi68F04g6dCqO
         ttVizTyQHC61iO+rTrKjNrXEbdE5CDKSB47efwTL1GsIlGdZegl3YQEbG+G0foIWATol
         ClelJIPYwcegJ4mmyO9+EbXTGLklMuP1OfYJdR+L/h8W2aW4qohz1fLhgoGVOi8ETsXb
         Umpr3ivXYmrkBDkEvzIDmLm2uYz727Zx38+TGkE6PO3W5AmQ6+tICEfPMyrmOfR+Y4f6
         HaMao9+MlH+bSryjYAfR9MXPD7vi+bYdcr9xW4FideyaqXGKEBjALCo6QbiXgcfhkRn2
         3aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016083; x=1756620883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfzDzbQEvI2nMK5aWsczii03Df0gZy+c2/ZhXQWQ8fE=;
        b=wqvBz2tX9+dh6YjhOlr/0a++G9UrotYzy7qPnzsSpqdwY3655Y6/qkSifjKO1lIIvW
         Dqei+5D0nVS8mtuzu56/eTicLnEHmLH6nsjirE8MRpsyrvev3T1YA3eWyi+sqHOijA5Y
         OCvdOeySt/VhNem+4O3NvVKQxuxuGGTm/WC/GPkIjgiipu1AfskkZHO4HvpQEIoqISC3
         NqDSPXVSn+iMMrSM1GCMRNOyneeMuZE3SuicoZE68Ocd9bZoa0QdwfuCub1pKX/9IITY
         qsPRZPH8EzVGJMSyg3MKI0Lmb7xnGkvD7ym1N6BOaipdoMka+dWD0B9SvSbvljFUeDyx
         5H8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB8a+u0WsSj1gYkyxm+4wXKPPbwX9Xbp/15j6ETStYvjHCmlA6ctUrfWv19OekDzeewCDI5x3XrYOp1u5qMSMCX4WU4Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yziq+HCIAKhoyeF2bf4VX0wqRPrPWMOGzCVzHaRs0aUMi9mQHBE
	R7cduK5mf9zCaEmmna6s31jSGAt8QbW1N4wVWr3dEo8P7PFdfqESZgCE
X-Gm-Gg: ASbGncs4+yNwNgD8NpNUvkNf08wGvYb7dvin2Yk5g9YoPzFZZZ03niA/gId/pD0fKyG
	7Bn6opmcOyvrDsirfaVODe3AEpK4Bw0QCiY18g+29u3n6BIG776E4/LZP5Fwr3kfBdJEIb7TdDf
	bzK2RjyfhCzdjupIDnY/79eYJ082XdSerJDnKoLbA/foFtxk41pAp+I4puwbYVTF8cLzbtjbxxs
	/wlIJ4LP1g0mAj8y/RHW1aEnQCHYiKLABmoy9TkAIiwetiUMI/NOOZJ2J/757zAaaQJXhRzch7y
	iTfzNKzXyrN7Ka89KSQF7CKCriBxUe00/3fwArSl7pU8Cn6R/Q+I2mARJkF+d0ia/089Hqd2nBo
	p/qRpKafp8lg5ks0T00drZsatQIofCWrD+DidTMduyGXKrOYzv7b+
X-Google-Smtp-Source: AGHT+IEqAFYx6AisrGgN6ojBhMS+11Jpj/ZwAjl0loDmwXyLPUL3fcKiuqDVFbHLxkK8FpX3ngzJtw==
X-Received: by 2002:a05:6a00:3d06:b0:771:58e:5b1e with SMTP id d2e1a72fcca58-771058e5effmr111559b3a.12.1756016083290;
        Sat, 23 Aug 2025 23:14:43 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:42 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 3/3] kselftest/arm64: Add parentheses around sizeof for clarity
Date: Sat, 23 Aug 2025 23:14:02 -0700
Message-Id: <20250824061402.13432-4-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Added parentheses around sizeof to make the expression clearer
and improve readability. This change has no functional impact.

```
[command]
	./scripts/checkpatch.pl tools/testing/selftests/arm64/fp/sve-ptrace.c

[output]
	WARNING: sizeof *sve should be sizeof(*sve)
```

Fixes: 0dca276ac4d20 : selftests: arm64: Add test for the SVE ptrace interface

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-ptrace.c b/tools/testing/selftests/arm64/fp/sve-ptrace.c
index b22303778fb0..90c56b38dabf 100644
--- a/tools/testing/selftests/arm64/fp/sve-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/sve-ptrace.c
@@ -115,7 +115,7 @@ static struct user_sve_header *get_sve(pid_t pid, const struct vec_type *type,
 {
 	struct user_sve_header *sve;
 	void *p;
-	size_t sz = sizeof *sve;
+	size_t sz = sizeof(*sve);
 	struct iovec iov;
 
 	while (1) {
-- 
2.25.1

