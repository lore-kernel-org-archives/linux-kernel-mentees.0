Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6A31328E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783066; cv=none; b=iTcZVyMHy050i79vuImWIxQ7tEXpc7Zaho70sw+uGNp/eh6nBVb6lPQBIJsNloWa523o45HfYstcSlery3rQIfAndsMlY5JLu9laLmDlVm7ZsUnGVuyO5APh717sBaaVUv/o+DhKHjQUJgmwRA+rcVLDnHw2lThXuRhOaNM4Z5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783066; c=relaxed/simple;
	bh=X5to5kJ9QCcHakcSKKmToFYntzDovncX5FCHRRR/eSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mzg+Fy1TQcdR4XVcKrCBAfS+krxgaXMiQUNgqbvBNkAY6yM8cXrc7nmAHlpB6ZX8DS+mWqfahbVIDXcqbLeYm9dT1/hgMvBGwg6QXD60TCKg3QPqvvWYbc7Rgr8oxUNIUYwZnvH9tkr8xddMnzGw3sAJGoRsVHErwfKn6nwef8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJ5ClIAs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJ5ClIAs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B31640327
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fID1beTvNlGD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 17:31:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E707D402F2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E707D402F2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BJ5ClIAs
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E707D402F2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 17:31:03 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2953e415b27so62845ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 09:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764783062; x=1765387862; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VL2LiGMIjzcKPs2iQRcmiYPq/BCDQfmJT/ipwX2Yjag=;
        b=BJ5ClIAsz8lZiSIfyFMB6mbLo4yKYIduFtTKXl+orgQBHq168slT2yRI9Pjv1tqSPR
         acrXrmlWA704Y2QTpJpRXwk+6E5SKsd7SSARxZpu6r3L9LGyzGo9dtCsj5ky5k1hqyGv
         P9EEBCbk9l69zQF7vESuOU7JPyx/RtgJACohCuKJ2Z/QKJT3THPPJsHQz3ZR+V+LOuoa
         JFrKA4tUFmYQ5QwHD/hF2GM9AmFAH8Fx54/Q//YOE25o4CfzGtc6NkP8/le3ICTCABhz
         gzbzPuBZB6XU1v+BuItqFcHwutZLxOzPGqMi8NK5xlcVY1QHdpE2q+bC6crecBt+zvPR
         545g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764783062; x=1765387862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VL2LiGMIjzcKPs2iQRcmiYPq/BCDQfmJT/ipwX2Yjag=;
        b=BJf4kBbmPKCB/4FBWIF5rzAWnjmF06eeRz/wKpAtRfEOqMJ4yHY3UF4wTxPhE2Kh2d
         kKa201nCiDn90OZm2RTxtdUoHWp4OfwkrZ17s1yhI8iY3SgrLrdToxbm7vMf9ODvfV1a
         R7bGFg3E4x7qD1iTRyKJf+yosMEnUJ93CuE6Qt7/1cAFKaYhokA1AV0cLmdT8zmXGfaX
         mURfTXKLd0Cqbv2gE0mEsk/BFzPxE97xevW3CDzu77ZRNGVmZJrfeTblak9ep1ThOG0A
         E4Dc1oJT3Nd/arE4OauoIMbSJZF1glOivESUWXTpohtPKg8U18U/a43Z3WDsydqfwXy3
         EZTw==
X-Gm-Message-State: AOJu0YzDgOeQHmprQEqO9YhrQ3/aKd7mxY/128+e126gonqkB5ZJvsu/
	GDXYXrLdrQAIZzmCpsbc5ui5TuXhQgPT1x5tcMObobH+C0czVSBgP/mQtdHjxQ==
X-Gm-Gg: ASbGnctqRMijO7J5fy3TN0tsBtGqHEDX4ATWPUolzcfa7/a01Erjm2oOpbqW3bIq3LG
	pmwPiZS7P0Kr4vgwY+EsTU7Nif0EBbRaM+LG0ibqX+9P7Mwx4NoQEThH+KIzRSEOu4hQl9OWrON
	fX+3dJ0qK+W3+T7cLXPeFL1X79celCG3cwiMhEhyoa/LuEuzBV0BSbhOh8As/wVNt/H5o1H3RUn
	ScxfH7w3qz2iwYgvnr0MRjHYBk/mahLL1iLTBtwRgo4CUi7LWY+clLWh2mrrlGQTKeYO3xExebn
	VEh9pTTJfNkGZXEy57H7LEOom1O/jRyHCr4LFnwA30z/YJBhQXCZF5aq8VOw/JDHc+8TOPij8of
	4bWpvSRtah69hMAMLKfxzFPJxjV71bOgEMR2Sqpe4MJCMtswZ0Vx9Al/W82x49BtEZBFhcjNSn0
	wrla7owDjStyuKutgJ/aQ=
X-Google-Smtp-Source: AGHT+IHwfzwNo3WgDLnMeITvwxsyF3Nm4DygMY+CPGD0yFiQOw0cFmDuP3b3Ag4gofjD9EGiOYdB2A==
X-Received: by 2002:a17:902:d50d:b0:295:8da5:c634 with SMTP id d9443c01a7336-29d9f67d5cdmr81995ad.9.1764783062301;
        Wed, 03 Dec 2025 09:31:02 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce47096csm190177005ad.44.2025.12.03.09.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:31:01 -0800 (PST)
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
Subject: [PATCH] Documentation: hwmon: g762: fix deadlink
Date: Wed,  3 Dec 2025 23:00:18 +0530
Message-Id: <20251203173019.46928-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding file 'g762.txt' has been converted to a YAML schema.
The current binding is located at:

    Documentation/devicetree/bindings/hwmon/gmt,g762.yaml

This change was made in https://lore.kernel.org/all/20240604164348.542-1-ansuelsmth@gmail.com/
and merged in 3d8e253724170ae9c8948c36801204fc2aa53682

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
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

