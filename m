Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F2C2DC34F
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  3 Oct 2025 17:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513204; cv=none; b=kl1ZM2QZYI6U4RQdMDu63C83wLW2a3qUvvJi6ZjmrsHeQiy6AOBZwrN0ESGF0FZ8yy3sbpcAGBRiV0hzmkntvsSp5pe04AVvSP3m9siIySBSjY1Gwtdn1DP8kWmJyiCiuQOELIKMmRwARJe3/EU2+faP+muhXT+c6UODBRvRcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513204; c=relaxed/simple;
	bh=MNsJwzWoBFNGIPNp9zuEOLvCY9eIgUfAuWeZoycIM+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szFTdIMuHt0GFdq6MDs2//FwWfDfS+LDK3o4N0TZCMYykkc6VC1peHftmB8+qpW/AcehaIPLZkJ1EM9zkVgnEsXBGDAZlNfM1wUDFFdaHyZd3ms0VVDR3foGWRMn/WDZd8ZNfWTFvJntB74JzTHzf1eQixYMDxowppuujofom94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq/M720J; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq/M720J"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso2177637a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 10:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513202; x=1760118002; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C9k4xvKVCB2PiIDViG3AgdtqSvFkeUkq+FpVkkyBOY=;
        b=jq/M720JE1rVxpDxqP7DIKkPsAEQtSyvPPi7Ku7d3vqVOmfHuSQ96qVE1cx3jNVQAQ
         zT5DQ0aW2rfchit2zVlZk0STYNe5EfVhuaMz2W4r91jwVRRcn9UOOE7da/rm1YP/hp2q
         VWa7IzLsG6DJiz24BdY5LA2BdvH/CGi6ykuMCovWMJuc2rO/BY2NuiQ3Unm8nMm2m+Qg
         Kaorl6VoLtjDjgy7VKeIzE91GqOS7xYOLteeMVxYIW+0Cq8IarT0ZJgweQ7XZc0rH8DF
         uedmN8FotsWccAj/OLuvBNaa8FYlgTAdajdEeN6PDAotOQKZWR6g89qdzXJygeC1aC5V
         MVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513202; x=1760118002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C9k4xvKVCB2PiIDViG3AgdtqSvFkeUkq+FpVkkyBOY=;
        b=TnfxGJqjgz4l37T+vcPHXk/G1YaDdBHIDoOBNPss4oJhVUVIb2U8qTeWLBVqgHV9LM
         oz3LhaVTtjq+3D6ybX5t7kfPFC+haczzoFBH/Th/81hbHaK11hVr/IoFEuuGH4CAmilE
         fxoe7pxcSBH/DWzR/Uv2ZF9O+fPMDCgs/BtRxAzqS8Wy9eN/OnUqTV26+G2vVVzmC5gC
         4GaoMABcQxdT+giQ/IkY97UDn41n+Zr9uJGkSz4H/Hej8vPOQ0ldliaIsNmzD9Xts8yt
         OB/6M4ca58K7rPuuPlJnrFCOl02A9HWCQQYVwHH50uN4+1mpi1lUMoCmfZOyRvxV9Jh+
         QKKg==
X-Forwarded-Encrypted: i=1; AJvYcCVRqag1S85bEiGK0YkjoAacbn1P2YY7eMqRpWWXdnENNPC4i/VH0nT5eD57ZnBysgI2c3NGwQYY7GtuqPS+J5J2A+dx8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYih/S3Rqy4g+3XonosQ9c10YGbgpdherHLhREZY0rjSFYlK0C
	kcSrUVINfVmeXqZD2rblL87G7IowEoP0STUG9OPabD9+BKZIg+zhVQNf
X-Gm-Gg: ASbGnctVhfT1sFGXDuSae6vqpZLsNgJZ/6AcByym6g3ZLMPTzz7nytnEWLqkd9uH6VK
	ZWtVCwXLg92xkfIyqxBys7SsXBlcYctOhhk1Ml0Pst1jmnphtO7xirs2QNfzqNrFb+t3LgLMiP2
	rMQmwkwYflvrVvzs5ELFn1OgIKau951jJxXbRYWVczMvO+Qjp4cfqiy0wQ4kXC2G4mOIZG3iy6F
	FPRsbT3xvDB+lEkfk+pt82S0Yg0qVcNHRKfTctV5TxkLK9+isspHpxOG2yjzT3xZJK9MTzjD826
	S2T6LdHdkDlvfFOleFsOjmhHQMmLDzHeRwnDQBPDZ3Y0ZdE1xFuXIDBDzcTquIa3y2SRGlKLyd6
	JCu4/bwvxUv1j047OCRblzgE6CYhsqM7xGA6x+TH8yJv22V6GoDERs/XxqRLT9CLqNw==
X-Google-Smtp-Source: AGHT+IEu0QHNMiTMz+jkJAI/HHluAhQfPRVspjKoNVy8iLjTYJPba/8/tyVedWu6dgRBe5gPMr0YDg==
X-Received: by 2002:a17:902:d484:b0:269:8404:9a6b with SMTP id d9443c01a7336-28e9a6e4d0bmr47120545ad.57.1759513201655;
        Fri, 03 Oct 2025 10:40:01 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261edsm56267635ad.34.2025.10.03.10.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:40:01 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: corbet@lwn.net,
	zhanjie9@hisilicon.com,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org,
	2023002089@link.tyut.edu.cn,
	qyousef@layalina.io
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2 2/2] docs/zh_TW: Fix malformed table
Date: Fri,  3 Oct 2025 23:06:00 +0530
Message-ID: <20251003173926.10048-3-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003173926.10048-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-3-krishnagopi487@gmail.com>
 <20251003173926.10048-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generate the following build error
in zh_TW/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
- Adding missing TOs to the relevant maintainers.

 Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
index 5435c3928d4b..7f751a7add56 100644
--- a/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_TW/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心層註冊一個cpufreq_driver結構體。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在兩個頻率之間切換所需的時間，以  |
-|                                   | 納秒爲單位                    |
+|                                   | 納秒爲單位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 該CPU當前的工作頻率(如適用)          |
-- 
2.43.0

