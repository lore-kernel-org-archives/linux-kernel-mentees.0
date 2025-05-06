Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2452836A1
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  6 May 2025 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547368; cv=none; b=naUK2c5RAhzhbMkeOw07oMGHt5yPb6CThr5SjHm3ArLWZas/HQTq1oDFhxOR5j1sE0jMybZUV1iy8PGTjcf8L/khzvLvSR3inhcjiV2IDCZlUeFN78m1hNe+zdIZfnhvdl00M9quon2bnv7vBnmwsw1dTd6C3zSLztMbyn9yt2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547368; c=relaxed/simple;
	bh=qv10xryQ+mAog3l4VvbVHJ0HbMIQA75QU5IkGTZPA3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGrMal8CymkD6t60E5A3i9+Cjjd1p9hqsDAXRibo3PKhPrHx5VU6seGswIu/M2bsUayulvzgCCYDZGV00LMsjiTuYP3onux6zXR/Dp0NEzdFcHXxoO/N6ohelMRgii1vd3A/pEUWsy+xvwM+gYZNj8jxp+E2UvHcz1uAoIXt8Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+GiD+NW; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+GiD+NW"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso626854a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 06 May 2025 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746547365; x=1747152165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxqQI7I56Bh3kt4m+ML+aSANba97iFsyz6IRsFIn500=;
        b=f+GiD+NWUpoEJHPTxZsbhy12IEqfNe9AewL8aMRqURphNi8QHDAwprwxll656MhCn3
         8DL0EWZimkxiLy0C6Tc1gvBpvFmg6NiNYm+eI3yRFXGW0e+AAJYXeOB1B4zbJkFljC2+
         aAXygjdFcyLQKaJSmY8RvD5GKrJC+a/9j0hEwIyMY0EIV27CVgqH8IMWJl3x03XIcJND
         Q9++sSfa2Qw1Qzr+NBTzppcdSDJqVGD5TNuCwuuqB3LLk7HnsyYKEoXogxBbBwlbvRMp
         LMCdW6l7Vhnqqqw0VyY3/wotbO3+qEEJin4WCGtgvce7vueHBvvtyfzsB3gxcEjFRvBh
         Hk7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547365; x=1747152165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxqQI7I56Bh3kt4m+ML+aSANba97iFsyz6IRsFIn500=;
        b=HKp6fWL0q31atyQWiKgc5awUMxEuj4jFgudpmtMW/3Hca5rY2zvQgJ7G8TliGEb+0T
         kVRxFgAB94w+bAKE/YLTN0Qives4yIXMTRbpQq0zF2inkC69ANplMo8fyIZ8rJ4aAJHV
         aG47CDGa90RwYzhqivvUu/wkDbvWlCf6Or2lLok5GbNfkqcm4MimRBWlT391lxq239sm
         s6ThRfXZH4uTn/hc/eaSOQyz37DE/BLUprBROushcJniQOVZ9Iz9oJ4Ccfl79SbXXCbT
         IPeMj+jaMmJnZPs4kWqWIhA7CKARDPWSlSMczTNLwkw1pr6juU8w7Oyt/iox7mk51wa+
         4lsg==
X-Forwarded-Encrypted: i=1; AJvYcCVPLaCVSujA6ImMXeiLkpU1m66RehU/9gRXoZCVMOE4F7Hf1Ex6RQiUoNPlrLOdS1ZRxGW40mnF06phkHXnXMB1ExsA/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzX49LcgcVe4FYYG7LA51DU4U1eYy5RiSu4EjsiWJcDr+ly1Q89
	qOi3KFL6/wum8i+CEPAFNICuv1BZIkTjc2IY85U2hTS5fpXbEWL10nzIAd8X
X-Gm-Gg: ASbGncv94lEYDWzAvZ9aY9Yl/1+BT0Tx4EJ29+lVjCIRXBjlFFLFIcP3M0/d1t+OWkx
	0YkEsIVljR9chYXFwwwrfh/Pr4CBUrfaQ7GDbwDu7FgnnKXfwdHSDWgxoJNkiEEgN95BjIxvmm1
	OjpEZqa6sdGuGVDjfPUigUpfA0p/pCwjU15l4XNv+e7lIJUO36VWAifyLHOX5jZojhEU3TMHTFP
	CDD3KrazPDcKPerAgs6Eve1oFknEQd5X7gOBvVTMYXfKoomrhXv951jWtqPapdSocs3LSwfwtTt
	dW391v3lru0P3ZaWi7l3LvHNGWSSuhhWid3Et5ppSCqhMdb9jklofI7WqqDenxmxBqyVwcVOLeu
	tYlD2Agwhk6+01XzMwlM8B4yWmLmRAPuIx8w=
X-Google-Smtp-Source: AGHT+IFevtUyWuSHvitYA7wFMvLwVik5JEG9Cmh0lTuhNVyWsmzQmvCZvPNXnXAFKtjlJybF/J+4yg==
X-Received: by 2002:a17:90b:3c0b:b0:2ff:58e1:2bb1 with SMTP id 98e67ed59e1d1-30a61a6f700mr15118582a91.32.1746547363134;
        Tue, 06 May 2025 09:02:43 -0700 (PDT)
Received: from server-kernel.moonheelee.internal (d173-180-147-14.bchsia.telus.net. [173.180.147.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e3b56576fsm15996285ad.47.2025.05.06.09.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:02:42 -0700 (PDT)
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
Subject: [PATCH] docs: fix typo in energy-model.rst
Date: Tue,  6 May 2025 09:02:29 -0700
Message-ID: <20250506160229.3720-1-moonhee.lee.ca@gmail.com>
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

