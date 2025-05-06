Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D517121A444
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 May 2025 22:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746568862; cv=none; b=SsESMgHAp0lvWOl/a73zzot1BVQ1qDcI72CSC+3CbL4A6Ipb8hpnt0fVj17WfB+JKTIw/V1KtcStT/sIXreA/bxd2TZu9HX5vD4gptRLxvTD7tzN84ky8FhZH/N0A+w5G1q8YI8pECCY5LpslYglRktR3MknIkcSsRD3e/mX7ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746568862; c=relaxed/simple;
	bh=LV0ruNcHRpMJi2vfvfpRfLtobecYu0JIoRgAf4DBbYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eMZBiQnyPggh1FVPUbKFTM5sdmM4F1IjH3LnCFDVxfzN1dLb6kr8VScyRsD5UoNcXVc3P2QwXrB5CtjmjA4vO5a19zW6Lw+D05CP/AvA7crut45XoexdAZQcPonT5mFFmxDTIHSK/F6k143z35XDwUMiKnX6TejpMCV0iqCrQUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxcPjAsk; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxcPjAsk"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2279915e06eso68981055ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 May 2025 15:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746568860; x=1747173660; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+rDcZ92GkQmefn+4rDVGL9lHZUyx4g109kWVrq63bKg=;
        b=mxcPjAsk7FLClcQRc8KcJfNcVw7ui0WvCtCzQ+xL7dmG4JpivHKvoCaaoOg5wlehSm
         jbKHZ38OsmTo+QoZYixflmOdt2EXn3DSkxqk5yLaP8y1nEEbKUJ3aJKsogekA7EW/9BO
         deEPx16pc36ExiyNFTVLGRVHSr20x2YONNP/9OmTc7nX16Y3O3BVQxePxg5OsXdYc9dA
         bhcwy8kTOmtW8aWzN/LQELyuL0hN7hJq9liyjYWni3VyyhFzuSrTN2nmRiMB1IQ+t9tQ
         uZC1whlevskQOZKpgOTtszu+kkFM8rYctsxyUe8x+URJXUSW4uHKp+E81BHHw5ds2l/u
         U0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746568860; x=1747173660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rDcZ92GkQmefn+4rDVGL9lHZUyx4g109kWVrq63bKg=;
        b=OoWdbDAhYSx4J1ZKkz0BG1es0kBny/x5ngFuVp2luaSIDUmeGWA5bZi2452zw+1hat
         mMFHLwzLMaNlVZ8p6dsAT0YChD2gHypLpV+eH1kfT/Ctl0vxfwezo6d/qLF9PEeg2lNh
         xUkBlSmCYcZ/2NcCmpUSDYl4V0l9nWP8sGgUIpF+bhLy54uh/hm76aQrKmfMlqzA/4uQ
         UibxWLjD6QWma8Fg+eAvgAiySGGS/ceaqKuNf+CA5rUUhvepCl18EJnibRI6ggxTEcFw
         1hDC8cYTU5M8V9Q+Xn/Ag1MQ3lAsxcMUAAawhpFH4dn83jCn5R/aJd9Kb+dBDN09zIAO
         EWqg==
X-Forwarded-Encrypted: i=1; AJvYcCW9MCIZUfQcnUyn8W/S+WgjY96QiWmQ+1Gevn6wsOZPx0+3qmO+1XoH8fGDYPkJgfpPBQS4CibNahFLixYtSzzHEbDaeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmDG6PADXUO+5ME6ksfekoC8YwW6wM4oiPgRim4YKXYnJexhdU
	+VqK2Jp3BjdhtXrnpgRfL7cU70BMadHhM6gNiqJ96axzcs0L/1Lp
X-Gm-Gg: ASbGncvfD7xQrsEysu+1RlJ+GFxmHFTC11IRXcCqOwz7QZxz8DOBCCROIaULAWftzdQ
	WnKfuGPA1xxa2zTGdL4pHplcMOevSeb4MR+3rgdnNI79parI0hPyXXkzn7H0VmC7PnxO+0+R3Tu
	Z3Tjs1dtFqKgvJYAVGSpbN5h1Yx4GD+fO0p7XxgkBOBQ35hpcUijLGnQrKqfnSfzjkJ1zAED7J5
	oJQtCZO+prihSdaz8m3RHPIDEcdRjeRy08UU8GvrJ8+LCvtL6h4w5inOE1d316XiUCc2RekJ8xn
	MPrT9XhZdHFsvVsU7QXajQeEtLh+amC0qivSZTqAlteZp45GoL31huVQyiwApaQsnAgugVV6euh
	OvjlnQH1le+Ba5AtkPmnPM/JpMxc3AnZakBs=
X-Google-Smtp-Source: AGHT+IENa9/kGarw9mxc/t5RKacJDRPAwdfKQlLEIUah+OKX/huZhyAfxQFY94dTpj+9W/i6cXNtxw==
X-Received: by 2002:a17:902:e743:b0:21f:61a9:be7d with SMTP id d9443c01a7336-22e5edfa34bmr10893105ad.49.1746568859875;
        Tue, 06 May 2025 15:00:59 -0700 (PDT)
Received: from server-kernel.moonheelee.internal (d173-180-147-14.bchsia.telus.net. [173.180.147.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb3esm78746415ad.121.2025.05.06.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 15:00:59 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: lukasz.luba@arm.com,
	rafael@kernel.org
Cc: len.brown@intel.com,
	pavel@kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH v2] docs: fix typo in energy-model.rst
Date: Tue,  6 May 2025 15:00:57 -0700
Message-ID: <20250506220057.5589-1-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a grammar issue ("than" -> "then") and changes "re-use" to
"reuse" for consistency with modern spelling.

Changes since v1:
- Limited scope to .rst files excluding translations, using:
  find Documentation/ \
    -path Documentation/translations -prune -o \
    -name '*.rst' -print | xargs codespell

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 Documentation/power/energy-model.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/power/energy-model.rst b/Documentation/power/energy-model.rst
index ada4938c37e5..490ddd483f46 100644
--- a/Documentation/power/energy-model.rst
+++ b/Documentation/power/energy-model.rst
@@ -230,7 +230,7 @@ Drivers must provide a pointer to the allocated and initialized new EM
 and will be visible to other sub-systems in the kernel (thermal, powercap).
 The main design goal for this API is to be fast and avoid extra calculations
 or memory allocations at runtime. When pre-computed EMs are available in the
-device driver, than it should be possible to simply re-use them with low
+device driver, then it should be possible to simply reuse them with low
 performance overhead.
 
 In order to free the EM, provided earlier by the driver (e.g. when the module
-- 
2.43.0

