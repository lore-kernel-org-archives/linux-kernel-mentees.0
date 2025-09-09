Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDD83218D7
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Sep 2025 11:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757416147; cv=none; b=ipMzkVTUDDzzfeRejK29h0n7VkjdCM4sc9uPeI/AhOpjT68nfxU0kc4gsz6oLh41aJLG6xIzPehvnkbqfTQ1jzSidNGypJvnVPl2cC60BO/+NidL813gQ2EIGLMwN9MOaJRCalL/uNGIXFQEVtQ8Zh071yjhNQ8zYgl1Sc480MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757416147; c=relaxed/simple;
	bh=k6VG5O7q00a/a+YkOEVzLXHlH/LdT+cKIq2dw6clWDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLqh6P8AGEXHF47kb9tXVuF2KvwqJzeSI1tdSQUKgcMbFGZpADzWEJp6I9kZVV0WsGQKSua+7svGZ7P+9XwZBwC4C6ZYEzWsNnmN2ZZvHxJFt3Jylt11447wmyLr95746ChhyVebukIwGwYa1GYeaFYChic+BM+NIWCr06Vwwfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShOJx7C5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShOJx7C5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32d3e17d95dso2382583a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Sep 2025 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757416145; x=1758020945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/kqIBpGmaqjfdWv2U553qBzw0kO4MEkC0nT25ifs4mA=;
        b=ShOJx7C5wMxEFQaGbYdhOOPvvicJu4zjLc6SRHIGo6CT8VQTUyMHWiLGPDpLW7l60/
         ZiSZOMUV23XAHLCGPOl3+UNSKQ84ZY8Z2+xLef/oGi1h1XwIE8Dr8uRaorGPvARyux6r
         u+xCmjVzu+Fph6/Q6sS/7LL1CIt4AhBLYaZHgfAsfBt6cKRfRBbaihzlsNLAIsCRVO3E
         /MFifv8lGpqM9q5iFcl69TMLXDsWZEbi/YKv17qullADrw4SJLEf5UAQAD8O94YgWhW3
         +GnYeqY1i3V/wArN6lbaWLdTRl/2JiMeDASDJysCtLJETTKYpYpQdxBaRtUO3m+/TOtc
         HGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416145; x=1758020945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kqIBpGmaqjfdWv2U553qBzw0kO4MEkC0nT25ifs4mA=;
        b=q/KgRzZV1leMZGmm95gwPh9CEuNRYKR37HcFsLckzSSIc4o1/R8YJJBL/nLdSLXEnZ
         DOx7KJWEC9XyghOSkCOajCQGo1FzuEt8Gl0Lg8fGHhacRwMMRTv7QuUnS6FLMjtIl7OJ
         gf70P7JQJ8soSbtIaX23fI84RRSnnG0RC/dKHQ3FhJIkDSVVSFsEcRkj74CE434VGLEF
         Sm7Mm06CIAVQSdZ022kEJ2+X2KeJsDnAaQjjCcng3DumpPQQbw8rbTelS6gQdvPGNRRx
         17FTpymigSyKzs/P917uENwCX8FF2OiJaUQGewbI7uldwhlQH4sOB9sZe8iH4OVkjpW/
         7kIA==
X-Gm-Message-State: AOJu0YzFZhkVXAjbndwlGTKL2z2ONFtsYTdBKJy1hooC1pP3dtSBqBOn
	w/jidopxqnpeeEL2enqoh9XaPslzC2idO0AJnzOxOqth5NuHFwA4HGkf
X-Gm-Gg: ASbGncsxVR1iudGjs31y70ZliijarOV7Zaqa4NvgYnRTRj+UeA4MPXk9jV2lL31kDm+
	2fvpcqU3bvqwYIOktaPRcHezr2u/lDcLMBtco7/dNb1HKd1KccRXWSRpQAg3+lJqwbvjgc/t0vy
	NJfuqjXysxoSW28KBpZ8Th5tRQ4scUsqUa/5Fp6XYYddrFzKJpmAYBPhJoFy0E1trKSqa7osreD
	WNSf3se8D1YTlpsDiWsvbiCQVpnKZ1zGhBY4L09UmZ/Fmt2plPqLolaUMbyL3hxCEM2IgGWj1pA
	/shNprjTkwt18cWCVbvDYBDwWB+io1R8hT30exHyM2BmhxGiuaopzsDVBUhBabNQeWw0fn+PEVq
	xaQNku2t+JZaCs+2TG3j30cG9Rt/kKPkbNOhwpfSWD9PwGLw=
X-Google-Smtp-Source: AGHT+IF+RlXuj41RmCzuMtvcig7RTTgQYCSvnSceofYj588/JUlAWiHFZtQEhiGnX1uyJzV23IXvsg==
X-Received: by 2002:a17:90b:38cb:b0:32b:df0e:928f with SMTP id 98e67ed59e1d1-32d43f936ccmr15732556a91.37.1757416144774;
        Tue, 09 Sep 2025 04:09:04 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e9fd022dsm21342608a91.3.2025.09.09.04.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:09:04 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] wireless/ti/wl1251: Replace strncpy with strscpy in fw_version
Date: Tue,  9 Sep 2025 16:38:41 +0530
Message-ID: <20250909110841.2904546-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy is deprecated for use on NUL-terminated strings, as documented in
Documentation/process/deprecated.rst. It NUL-pads the destination buffer
and does not guarantee NUL termination if the source string is longer
than the copy length

This patch replaces the existing strncpy() and manual NUL termination with
strscpy(), which ensures safe copying and automatic NUL termination.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/net/wireless/ti/wl1251/acx.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ti/wl1251/acx.c b/drivers/net/wireless/ti/wl1251/acx.c
index f78fc3880423..73232f7e92d1 100644
--- a/drivers/net/wireless/ti/wl1251/acx.c
+++ b/drivers/net/wireless/ti/wl1251/acx.c
@@ -149,15 +149,8 @@ int wl1251_acx_fw_version(struct wl1251 *wl, char *buf, size_t len)
 		goto out;
 	}
 
-	/* be careful with the buffer sizes */
-	strncpy(buf, rev->fw_version, min(len, sizeof(rev->fw_version)));
-
-	/*
-	 * if the firmware version string is exactly
-	 * sizeof(rev->fw_version) long or fw_len is less than
-	 * sizeof(rev->fw_version) it won't be null terminated
-	 */
-	buf[min(len, sizeof(rev->fw_version)) - 1] = '\0';
+	/* copy firmware version safely, strscpy ensures NUL termination */
+	strscpy(buf, rev->fw_version, min(len, sizeof(rev->fw_version)));
 
 out:
 	kfree(rev);
-- 
2.43.0

