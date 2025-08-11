Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19EE2C9A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 03:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754884048; cv=none; b=gnqHGqS5mcS3ZH6n54tU+WLiS4sy+6xDwZF9t4AISWIJWxjFgCRYmmygwDaOXYw6l7VDQCwt7PdGYHiTfxaIAeYxy6r48NDiNnozaIghh7AEYHRJCes9UjLoU9lo8o3WJ437T3rVrP9DgwxewktqR6nZTjE9fE6REzso7RFS9gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754884048; c=relaxed/simple;
	bh=rs1ZbDTkdXoK18Jlldz/kRW9hBLLB4AUFEUqTZReA0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NLS5h+ixKwSHU5QQBaQ77aRcI5VMSZE9YqhdqTcRSspyXeCbyYMuppCDzjyKwCp//XXNOzuT/4OlJ2AAXhjTQPy0yUjpArlB63UUrgxuN3p9MpaK5Op8kneBp9QrvmL8TbbqV0ydcTHlOMmm4wQ8IYlrJ7kJKEwBWVaSGQgFJts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ43NRsm; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ43NRsm"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-76bc61152d8so3233432b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 20:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754884046; x=1755488846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzgJOorJWfoxagIgZyAmkW/+CgCib8gpyjSc17Nah8o=;
        b=ZJ43NRsmWKBABzJf85QM53r3Ok1RlzGshjop3H9K4msME9+R6aZO+Pm3T3w4pXtvdh
         sDMC8/khtYcbydSvEBajdw4rfZRA+P+qUJcvkPVgdL+8pG0/fJYvz/YdTjjWVEoxBunu
         7J1cZRgk6la1lIAs7hdo7vokBQ7wBniqMusAI+6lrhBVm7d0+bJXyT9rVdnDcFj4qqTa
         oEyceHRpIC87dVNnpOS5xmnFNxFXAMbnB+wgGbo5b2ja+3iN5y7h2OEvv4MaDULK/lQn
         19mMEkS/sn+uwmUQCyH3ykG0Nesqf4zT1OEYqTVrU+wKtwAslmyHxfwSO2vJgLRTk0oT
         ZEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754884046; x=1755488846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzgJOorJWfoxagIgZyAmkW/+CgCib8gpyjSc17Nah8o=;
        b=YcGKWlh+PTTl3ft9D40JRk/CumaXJVC7am53nNCj8LP3yiOO+rcyVd7tXGMX6Mnup3
         sSdZlNIfMljU5SCJKRgRb4McGVepxNyL2KHu8FIm+Y1KEoTge6loPhQaPgW6AtYzVXgZ
         mTC1VSv34QP1fKDEoSGGYuPS+ILmvOA9V78CjpEPgn2m7azpSGBFdbNxnqw+MFOsibSF
         VPVndy0OTgYzsTYKW5yHQK8WGwprWyA2o9E8DdrctKnoze3BiF47DXgHsWF3xi988UP7
         2DCTB4QuDrhS/xovz0fDDlYDaBsZnfkA5n+rvmoMKRQdfqlOGCrILDzUuqPG+6Q7hBs0
         dz3g==
X-Forwarded-Encrypted: i=1; AJvYcCXcjRirewjDp68DIqey47Qxig24i4zK4wncbZuMM1NQJW3MQcpE2hhDEUjAXvyo439DGqNYDY+cQ0CRS1aks2p7bUqCzA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm/U531L1vFHoqjpQwy0o8L+5r/7hC5yXwOIHta+O5PpXcx3kl
	AGq9qV0oRB9xegnfVT4eimZDkbW+tqG0z3C0lsbrze79XqFg0MUUUbNSGvGJS5j4NMpHw8I=
X-Gm-Gg: ASbGnctuT9ByY5sxhXkqMs3fAXtI1rw+L+TcLD9ARsm4baiUQXW5OoKSAvF81knpOeM
	K9Lo5ZuB9h9awiMR9VFlnJkSV5ql68wG0/URgXicVSfEL1Wn3fKeX1N19QwL/BNPgWh3zPtnX0x
	Mj8CwxRntK5zHuamxduXbVIrJeoaIxdrex4BIupauOqeB+p9NHRyv4uOVbNzr3u1s4snDTVusOl
	AdlylNx7SgCHF7NwxPs/zCH290hP7rhTqiiwiAIsY1ns7fgmHVt+bG3pswf1TPA/+TzfztGO9er
	h45MUs4Pw5vyNd7gDso3LqKyVjEMAn9tyjavU24flJhCxBsDDQJ1SaYu9MU77gAUVrB6bJ3XaVA
	VVFZggGx2Bhgc9dMQfRl3isSMrLuAOUnK9AsnpSE=
X-Google-Smtp-Source: AGHT+IF4oM7SLruPY53gPR20B/yTto/vDJwxwk8SIxnGPvVl634pVWYjl4GCMAz4KqHHBfdvnZx9ng==
X-Received: by 2002:a05:6a21:32a0:b0:240:1a3a:d7ec with SMTP id adf61e73a8af0-2405501258fmr18221624637.4.1754884046009;
        Sun, 10 Aug 2025 20:47:26 -0700 (PDT)
Received: from kerneldocs.. ([117.231.194.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bdf61d092sm22706164b3a.116.2025.08.10.20.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 20:47:25 -0700 (PDT)
From: Nikil <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Nikil <snikilpaul@gmail.com>
Subject: [PATCH] docs: timers: Update dead OLS link in timekeeping docs
Date: Mon, 11 Aug 2025 03:47:17 +0000
Message-ID: <20250811034717.6100-1-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 Documentation/timers/highres.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/timers/highres.rst b/Documentation/timers/highres.rst
index bde5eb7e5c9e..24dcc32f8dcc 100644
--- a/Documentation/timers/highres.rst
+++ b/Documentation/timers/highres.rst
@@ -58,7 +58,7 @@ merged into the 2.6.18 kernel.
 Further information about the Generic Time Of Day framework is available in the
 OLS 2005 Proceedings Volume 1:
 
-	http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf
+	https://www.kernel.org/doc/ols/2005/ols2005v1-pages-227-240.pdf
 
 The paper "We Are Not Getting Any Younger: A New Approach to Time and
 Timers" was written by J. Stultz, D.V. Hart, & N. Aravamudan.
-- 
2.43.0

