Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E3130ACEE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764785570; cv=none; b=BUThRrEIhtaYOxQoliguEjwip10pxEl7zlrZ8rKowvcsbvmU7yEFV1WoUdbEljr140T2bz5zmTsC4kMntPpS8ut1Ty38mYhCcB4zjhw5yKiWkpZD1rl2IpBEEApDDirqb+HF3Zbqw5OQwwz4pksj7ok9V0bh8f0ojj7ZCcCBYds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764785570; c=relaxed/simple;
	bh=dq7F0uo55KGJeoowbZ9mn+/+bBkR9BMF4bPhrTA5kps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lTwYSPe1euzoAQME0iy771ASEGX9qkLJef3SQR9VijSVUyQhFA1w0iX/xbWLFJJrWm+KRYYyvC8308nz2w3etJd5RIjTr1ErLQz+efGpaJskF7mRTeYVUTleXMVcRl2+3WeSntSQ64w2VtS7QFxcA8Ymg+a/ECiZy7DBp0Zahss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCgl/UVK; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCgl/UVK"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01407841AA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsjWwH8BJfyX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 18:12:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 66932841A9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66932841A9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DCgl/UVK
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 66932841A9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 18:12:48 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3418ad69672so4622334a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 10:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764785567; x=1765390367; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RuIrONfPlUsQW0/G+UHR3N64wTGPf7SXig/c0u6w874=;
        b=DCgl/UVK4QHCBThfm2tYe4lnx1tQUjaAO52Gj1aQP7YFQNz3PcVVGtl4hr9xW8fV/r
         TiQCN9e2LAI4wTsWtRKIOnujh9ESoJqYD96039aJs6mFn9k2O2I6O1Z/Tgk1iyo1eMRJ
         1ICDC7j1dCe2a1WORRH7KN4FMPOWPTKnt0PuMWYK90r59te9UcH1qHRtJcTzu0ofjE0a
         VXOE5fbVr15OLJIxpRsbPExJRKy+QyOmMxBTZksEVg60Oib8IEPePCzH9Uc0M2Vw0el0
         JRLOFCDL7zi1XSDm49EnnnggPqifxWY0ifiy5T9vEjLSgMSheS66xTEAQ2ICxpspC5yn
         XTYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764785567; x=1765390367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RuIrONfPlUsQW0/G+UHR3N64wTGPf7SXig/c0u6w874=;
        b=v1W++kF8HJnfrkAUynmdUR6+x/a/9CwI8Zv6+hm/sfjvjqEIwJZzRZ0U1Pn8TMFCn+
         1mfxlfPC2gHyZ3SoIpxi13u1IUTknSDni/WjHYPN+y1qSebt+xxlUBdZGOSQ21GGlGgx
         aZLgBZYODPGeDbU28oYDX9SR2Kxj3cZjLW0ooGNs2123wQx8cZ91LHR6bTCMJoIYmacc
         8l5K8g+6B+sLrm1VcyE0o+TpkyzlcAwyYZgOR96GoQ9Xq+6JSIrsNuZoaHziPebxoR1J
         TxP5LPLunOsTn4nIJ3vqmlTif+mgPGmnEF+Od5dI2x0l9nEMqdNWxUdIu3AaOlYqhYe/
         //KQ==
X-Gm-Message-State: AOJu0YwTpBoNVMFoSFw7p5lrUeOVD637G94v/EH6M3Zrg8v6iG83/h0X
	RUp0AgKve6y+Ls0uxdXVK2IS5+go45lW90GHwH3+b1Taaaq64+T3/4IECCNmkA==
X-Gm-Gg: ASbGnctf90rPaWg487PY7YOkuwDG84UW+t6qtkSguKUh3OWh6zXhzi7p14hcxQk7Dwe
	BTpTTCr3iFoZXsgk/GRVtG/GGCepzcmPHNGupFEksCDXHudHP0ZkIkPyUZgZHL+v0hX3mMF2EQY
	PxcwlcgMClwCfsHFF708Tz8KFmyJDEs5g/3nGkS7yb66Xc33/UpD3h4HwiFvA2Dph64daDpTiIb
	od62WetRrc8kMCgYYgD+NCeaIKHegbA4abPyHTS42U2Xbyfz7I4oUxsF8DVegRi8O4pGTLnMmAU
	gaEKEbCwTUnCVwkjY6DQA4tTug3FdXUxzJnUq3VYJqiFE8JBMaKsJAjl+6oLiycHmIOoP+GUCIJ
	/dWDP4Qvk7+OE4Y9BSpwy/K56oGUf3ekqzSP28dyHGziUdBxunMTsVX34Z1dXz65TvcXief/bgU
	6//4bXkCL2ATmFhMBioFI=
X-Google-Smtp-Source: AGHT+IGZrryg5z3Z/u/8JFpgB0WolHytle+7b50MsN8Rhr9Rq03qsmx+6dhKqLkzgC6AajyFnVhnjw==
X-Received: by 2002:a17:90b:2d47:b0:32a:34d8:33d3 with SMTP id 98e67ed59e1d1-349124f6c2emr3577411a91.0.1764785567109;
        Wed, 03 Dec 2025 10:12:47 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34910bf9fd1sm3475565a91.13.2025.12.03.10.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 10:12:46 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2] dt-bindings: hwmon: g762: fix dead link to G762 binding
Date: Wed,  3 Dec 2025 23:42:13 +0530
Message-Id: <20251203181213.51618-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old text binding 'g762.txt' was replaced by a DT schema in
commit 3d8e253724170ae9c8948c36801204fc2aa53682
("dt-bindings: hwmon: Convert g762 to YAML schema").

Update the reference to point to the new YAML binding:
    Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
- Use proper commit SHA reference syntax

 Documentation/hwmon/g762.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
index 0371b3365c48..f224552a2d3c 100644
--- a/Documentation/hwmon/g762.rst
+++ b/Documentation/hwmon/g762.rst
@@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
 Note that those entries do not provide ways to setup the specific
 hardware characteristics of the system (reference clock, pulses per
 fan revolution, ...); Those can be modified via devicetree bindings
-documented in Documentation/devicetree/bindings/hwmon/g762.txt or
+documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
 using a specific platform_data structure in board initialization
 file (see include/linux/platform_data/g762.h).
 
-- 
2.34.1

