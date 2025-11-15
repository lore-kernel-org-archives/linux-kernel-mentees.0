Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD0299AB3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 11:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763206973; cv=none; b=lF1yJFvMn6LeXsPHXYVajT/nsY8AFJk68DfaJEOYeNjUKGmcB1ngwxnytRQmwjZCibERDYM+REndC0586S4vS74Jm6qaMffWYTHTfg8Ssff29UBg93cPsZzRl90GYJr3C9opPrKHAhSdZvms2chimmF7/J5bg4IJkyy09ZR25P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763206973; c=relaxed/simple;
	bh=rFp/Xdva3jGM52uO5VTslo8C6wRd3X+KrevwjEi0We0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZhCPosyf0ukcHZPfP3Zn8Vceqh+HDYfuxstn7FcF7D6+eMcG5PSbJwAbFFkzP7JUOiOh48eP6CHd0HDPEXBN5vlNS0sNV6eN3pWxHNSmkbiA8MPoJb4xpmEK5e7laYc9JrWAWl4ggYj80PPra7VQsfDWnVZptZ//ahdtE/BFF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEcWG895; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEcWG895"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 284F984023
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 11:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ClyN8J4Q9M-z for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Nov 2025 11:42:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 893A384019
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 893A384019
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FEcWG895
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 893A384019
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 11:42:50 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-7b991081160so2895765b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Nov 2025 03:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763206970; x=1763811770; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rFp/Xdva3jGM52uO5VTslo8C6wRd3X+KrevwjEi0We0=;
        b=FEcWG895/5iR/Qau8pm8UiVkRHbblvvBUsjmfyB2N3Aoju7Xi0vmDWyeSvN0nfl/fa
         cgXveYmhHg/+qffcQrwhE/AH0hONjd765Dam/mW1MGzdHVdmp55XgHdLW0gegMzaTBdT
         sMiajXFKWFkJzLHVUQ5htjAz2ebilQegMNtIB2kEMBO0BmIKSX7bulMvpVR8y1Uzyeiv
         hWFweA4YbrnmJIhoIldnRKYoelc4WmfYMglbr87WcFuuhEC/Tbw1URRK6NW78WK5hci4
         TbPUJo2WfdPuq5j5KcbPSL+ml/GI+YHBLuvWlcCS04/9jurAExY3LKv7mS4HMaBfylpA
         8/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763206970; x=1763811770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFp/Xdva3jGM52uO5VTslo8C6wRd3X+KrevwjEi0We0=;
        b=fTBgjZXekkjRpD3oRyaV0xTKF5+sUmSKzNhe0rEjmEP5OJhANOztfkyx7WRTfoHaqL
         PfBJRBuhD9qy+33iHLP2k/KeIyLMamoCLx7unqGZ4yKJ+jEShtbADDqSprCFXp5m8yAf
         U+LAVVLGkSAX9aRc/lS8nNtSTAK9LIG1hdotdqyichR4ElCACsDTv135OUEsz44Rzl4s
         PBVAWUvWrzdFoMVhiCq4k1HyxtsabOsGufHsKYZOnhHMemjWUKkxxumLyz86+9Jiqyvr
         cNSThh3U7PTwsdCw5+ZPljLfhtu11j6MhxKIt3m4I6nh42v0KaavJ0JyIZ7j3wUwgVJv
         Y5kg==
X-Forwarded-Encrypted: i=1; AJvYcCWrkk7Jqj90Dc4MT0HS7oSb9IHLSB3tzPVfhuO0N/me3UlKgHN8WPN/wSIfT0PDelHAPFx6QRgxwPbozrZhs9OS586aTg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwclcXt+qYR6CW/2JLPz8hx6XsHXgpZJ8jai+ZVoC7ilqMZTQp0
	DPFrwbOmytmZj7WWO78fnYi0lA68U8xu2uk7O6YnuDLGei9ptPh9GZtIo3+/VmaW
X-Gm-Gg: ASbGncvNWABwqlq/TQccRSmU6uF+5ih+/tDxamjR6WwvgqFVwh+Gu47hg6/FlOUKXF2
	y0HH69BzoRht2ySahi/6ggiArcuGS7Aoom11l9MXzPKQeRHVfdrUN1pS74BBKroSANyu+nznGVq
	MP0+ySL2Zbv4Ct0MH3Gj6Gbu/9PrinJdUmZT6ug+nfE9VwCzvCLNTOKzD8FbtbCEhuJ57b3Dxzg
	jpCArXA3LEDu5fKuSPMhdHaO/IKWIy7J2kcaQko+NstQhtnGCltm+95whKWzlqTjT7XvvZtfWRa
	RnVlYUolTONubnUu0ZCWy/bSFaxyEYxxiy7IMt+jwjyUACRjvx920BnbXMfxwjFxvSfFIxg7tVN
	M+3p1nbx0HAf6RGC1MyRtA6KVyfoghvzWDFzHROLc1LuUkzJS01yCOGrl9GnMI6CHdLiHz+SuR5
	c50Ot6+CzMg+e5Ilc05bZDUnjLMH3mQjVORZUGdce9
X-Google-Smtp-Source: AGHT+IEAG2AbkEWEgsSkZu+MuSB+v5gfeMLkTTWEBMu2OjiTHCx/hYVcdA04MxhoZG6sPEBcfl+3xg==
X-Received: by 2002:a62:e715:0:b0:7aa:9723:3217 with SMTP id d2e1a72fcca58-7ba3bb8ed77mr5901432b3a.25.1763206970351;
        Sat, 15 Nov 2025 03:42:50 -0800 (PST)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b921cb6f44sm7982772b3a.0.2025.11.15.03.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 03:42:49 -0800 (PST)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH] docs: parse-headers.rst: Fix a typo
Date: Sat, 15 Nov 2025 17:12:33 +0530
Message-ID: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "vantage" with "advantage" in the description of userspace API
cross-references.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
 Documentation/doc-guide/parse-headers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
index bd34a6d00ca9..a7bb01ff04eb 100644
--- a/Documentation/doc-guide/parse-headers.rst
+++ b/Documentation/doc-guide/parse-headers.rst
@@ -5,7 +5,7 @@ Including uAPI header files
 Sometimes, it is useful to include header files and C example codes in
 order to describe the userspace API and to generate cross-references
 between the code and the documentation. Adding cross-references for
-userspace API files has an additional vantage: Sphinx will generate warnings
+userspace API files has an additional advantage: Sphinx will generate warnings
 if a symbol is not found at the documentation. That helps to keep the
 uAPI documentation in sync with the Kernel changes.
 The :ref:`parse_headers.py <parse_headers>` provides a way to generate such
--
2.51.1

