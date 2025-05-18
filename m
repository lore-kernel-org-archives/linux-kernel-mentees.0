Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FD74B1E40
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 18 May 2025 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747549945; cv=none; b=RvlAZQhU/GVpVMdfXcuj8MQqq4/2I26KLfP4A21ji88Cih0s8Gmx5+gdcRQQoBX4MeTs5m1EHSNaPAq7wt8YnmaMpNjc6cLffJUN9iiNcHgz6Q+zAIlHUVTSxVDLu885hw3SCaaAeYP4YSviesHnry49Y4l1p9RAhh1AFmRpkPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747549945; c=relaxed/simple;
	bh=k7e232aRXBYnLIidA4C1W6sTVW1tyPAB4FFr/gmyPl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XbnsFwcXI9SFqAlRiLHSeMJ60lMi34SB6FXC0cCIcdL2aHo5eoiTuasCG6wu0O2zBfN++nmwkrVpkSMYMmHXHJjJ09CWaxUJ+l8B2P6DJheRDqj/clWSqQqtrQaOABMEHKapyDStjxz1JkvSyWNPWVjCkuRmcDfzcZeKx+FcuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=nq4GcVkR reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="nq4GcVkR"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3da785e3f90so19123635ab.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 23:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747549942; x=1748154742; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KwP48AH0f+VzkpR044SBe5hj4tEB/4qffvp665GiJdI=;
        b=nq4GcVkR391qU6TJBh/KQaa7yoohmDbVSWpqlJ9UrV83U53u3QJYavSQoBtEi2HDkb
         mzhxZ3AJfL3pWQgXe9cEuzxJTHwc/JFgFF9uUGmuIszB1NFOSGw+FmR94UN5b7g7lPf2
         MDo5Aqmt6Ni6lYYyr0Z0TA4QX8/fjBgZR/DUeM1ppCYxXfV5SQ4IyYrEsH3YXrwMY5zT
         ljhCMjHE08p8Fa5WuH/FiShCrRZwXAsv1/vIqRPJLSt8SK8lsjVxEocptTL4mbNw/4vY
         Uw5Xnc6kVSDFxiW/AciKtMpmBrjmnNwJxUVBmVsQmkQG+EN2n7cwTAt5LkQAF4ZptOrW
         2h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747549942; x=1748154742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwP48AH0f+VzkpR044SBe5hj4tEB/4qffvp665GiJdI=;
        b=H59L2pFNOHYwrXisX4JSjPPPNJ6mbwaQnADf65oQyIdkfR8IXmfKLcWQGcXDW050tP
         5fEc9frFpI/5X8z+k1Pr0OZ6jZV4zJN170QkZ7j4boOD4KHZt1H1M3NK2p5qmEcE3vRr
         Ou9y7JLLj72RODpz2R0J61XkxWxsPP0SNXGufw71cWW0jOctix7REEs6hJBhjbMxvaX+
         uzewF6oSfSYD/fCrOdx3h9gfToq7uSSWkgtyf1KRgb5zs1il3n8/AHfUEseziKsB0J29
         38Tg6wNdiZuEIahRmjuuYckGxgRvxufZJdt7ntedWPJsxAiFreRk6RYHPB0vH+JQg1HZ
         N1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWu4L2woBHx1Vxl+oENJHJfsAupjO/C5tEivNlT4sY3WAzxU1tm5Cyz39vrsKgNbBVftTh9f/xifCpDziUqsq2X9TohRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwgubwoliBOHKZJRtNIiqDcaXkTdJCswo+78ypyO6r22YFCMFqh
	pr0eDeHNpPmUv5xmk/+zEx1A9AdVPCt2ip4vWQ4XYtwCMjCYqghGdC7vjBWKRrt+2G0=
X-Gm-Gg: ASbGncv9x5QF2qnvQo/XcYii5Z02sCHuTNJDo+n5QhkxUeOT//4GOsWZNdzlFkuVThB
	56p6oHf4pNckoG7W/SVrFcZrV7RDrjYRvLBnxTbaDMuRY0/jadMn9J36USAgkw/Rw/bmBn8AHbt
	fTOG0QTPxo56JgHiZTQtXccRxJeev7+4nhonSGoD/+jSXAgGCQD3amHf1oYf1oWCfEMzB/FYf8i
	nvt+WBg+YZkL/kaQ6ES/mfdnN/srViINancXG1JAoV69ozkX+Jbp1X65j5PHTx/KDv71fXsLX8z
	K92+1FWfzN8bAT4+W5Xv4PrGdUQkbnEDwdEhUFdL4y9tuwoExWlwk4YUXiZ5G5pND4UM+wE4QYY
	AHbgLY6Y=
X-Google-Smtp-Source: AGHT+IEJnu7rOfOWw165nj2xc2++BeA1tyNcutxhMIII9tv0OpltHssTeqXnkk3yhpYX2DQ5ZUgMnQ==
X-Received: by 2002:a05:6e02:330c:b0:3db:839d:7b36 with SMTP id e9e14a558f8ab-3db857bc504mr89067845ab.21.1747549941790;
        Sat, 17 May 2025 23:32:21 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dc61e15b2csm4945525ab.58.2025.05.17.23.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 23:32:20 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] kselftest: x86: Improve MOV SS test result message
Date: Sun, 18 May 2025 00:30:26 -0600
Message-ID: <20250518063025.1467672-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently, this test completes successfully when it completes execution
without either causing a kernel panic or being killed by the kernel.
This new test result message is more descriptive and grammatically
correct.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index f22cb6b382f9..d80033c0d7eb 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -269,6 +269,6 @@ int main()
 			);
 	}
 
-	printf("[OK]\tI aten't dead\n");
+	printf("[OK]\tkernel handled MOV SS without crashing test\n");
 	return 0;
 }
-- 
2.49.0

