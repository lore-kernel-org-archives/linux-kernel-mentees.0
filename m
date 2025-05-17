Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EC32A1D8
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 17 May 2025 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747444801; cv=none; b=HkX6kpOodMvmY6Kl7p3skWYvGLxJZAeDA77IIIcTUY1P5ZgSAZ5nVmex6vB7cg8jf02BRaKuiQthh876MyisPOfkG5dsefNhOunj2pFn+3Qx+Klrq6HnY5DKhOyiYm0rC0oqIiMMtnI+ezCbRzsbByS0pwLB+ZU8x9k43e+A400=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747444801; c=relaxed/simple;
	bh=YsKePZvqTWlFr6OhKrqVUpzRgw0bdJvrf5A8NoOOoKU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZxS/LjbSaJ55PWkd4+E9WyQACnvxKTTbc/17wjKQKeLtak0yz8c3G8BV83JBjDT19u0O2Ck6jFLYKm70bcW5LQXkVZ5neN1nqPCk+KkHOA4xvX8SN2/z21Bu2OkLnHcwwe6VLphfjGqTKcqfAYT1zqVKvlpC3hZgmpHvSj5kZ7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZit/fwz; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZit/fwz"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5a88b34a6so281626685a.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 16 May 2025 18:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747444798; x=1748049598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5B2LV4vwIzx30sEcS8DzEw+CgYVXQvdv+JneouFlZM=;
        b=UZit/fwzfpDTdx7g71PoINFJ3lT5Ysu4710zkWEk6tiFqHOD8HUYOHzGtp0sJI6Wlb
         hRW5qKufSgXh5Nrhvm5V1M0DMPeY2nHh6C+FS2sVFBZLnWdtlFaIGnDHh2F0BWhgwbKD
         2k4xxAR84buSR1FVDaKg3ut3EwerCbKYpNbc+hJgla54/GcGb+yD4tr3MzAR0dZ5BqsV
         FZ0nufyYpfqL+yDBeuciLfmIZ9bO/mnMzUPARusFOM7VwDEGheZc3m8XjPJBzX4Y7eMp
         A3WzKwyx98Jy8V7ASqfUzve4JI0CknconoXU1cUjNugagbF139q1CtSzaWDL73EDnBGP
         D7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747444798; x=1748049598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5B2LV4vwIzx30sEcS8DzEw+CgYVXQvdv+JneouFlZM=;
        b=kAypY2khORF8VLuD/q8BXQyY0VGl07ULpjzyBBhNoFAXmwhsegRqQJoiu4zvbX6d1F
         1irsbKcKOlmwp5rKNtKRJAywlxxYkmGsBgw5TnB775N8u/GJyk8+9Is/rX8FLqUenohy
         Olqmn5r6q6y/otcJc7oiHeRu2/Z/l91ZbVCiq8/xEU4NRfv3PsxIlsPc2jwQf3ELoFyr
         xkJxMg6Q0n/53yrEy393bnnS2xO0rgz1QnQqaqucnjttBPUznpesfI8jtzYlhzVpELaa
         lMbRNvHuKgVR752Ln3AGQ4I0dhGhSmJNGd4ys/w04KbjPj5a8ZOOLHSRlySuwuQwzDSW
         6z+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWUkwVYaDHD09SFGouUDMvBPgA7gSLHUdtNEJpq5nTO1wSiAmsxIbCded46OBTUHmvQtFp0kRh6xbFcGTvnVXX+hGbXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZCUN0w2mkjs6AfP96Cnlvd3IPNzQil8f9CIx6UZUo/rB9Ksq5
	uyYtHB7yUt5ip6uYWk3Ka3LWQtx1CobvEe5hNsWislGwzr9Hi/feOAU=
X-Gm-Gg: ASbGncuiXTLO2gJZovkHrRe8tR9hEraZ4bnVg2gKPYepsDOqoP/NHsXE77TUoYEQB9j
	W2Bx0mSVKe6rN/B/1bO3QXAT7ySxbXudCswbr4Xt49mGw+dEJUXjQppTC6F/UejTh4/I8COsdAv
	wCLHqjUMDW72ZFe/gv8bwVX0zVSJIUqueM5rjjpuoC2DoJNiUog6JPV2VAYtnMLfjDP2NxJvrq2
	CnYEfzI7t80Mau6LITAqFldEpctiGdYNbM+bpvBHZRL38pFcpkWWpYDd1pzZSZwQJhXja8J3dB8
	TDizf1zbRTgkOheIdh+boCeADzt+09XkTCcBC928hLvmgpQPGpECH2EYsKPE5Z8ntULxqn8KSwU
	lIYZXDX1kuPE=
X-Google-Smtp-Source: AGHT+IFt20saecnFbFsogWIYjVcuzAeRTdiKaetLRfG3JsrhwZZoQ7Zn+HfpuPK+p1/FbmaM+ZtRzA==
X-Received: by 2002:a05:620a:1794:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7cd47f63fbbmr635936685a.28.1747444798604;
        Fri, 16 May 2025 18:19:58 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:224f:4011:50ae:ea20:4b60:8f04])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cc89fsm186790385a.105.2025.05.16.18.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 18:19:58 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: skhan@linuxfoundation.org,
	shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/1] Fix typo in cpu-on-off-test selftest script:
Date: Sat, 17 May 2025 03:19:28 +0200
Message-Id: <20250517011928.673585-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in hotplaggable_offline_cpus function name:

"hotplaggable" is replaced by "hotpluggable"

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
index d5dc7e0dc..6232a46ca 100755
--- a/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
+++ b/tools/testing/selftests/cpu-hotplug/cpu-on-off-test.sh
@@ -67,7 +67,7 @@ hotpluggable_cpus()
 	done
 }
 
-hotplaggable_offline_cpus()
+hotpluggable_offline_cpus()
 {
 	hotpluggable_cpus 0
 }
@@ -151,7 +151,7 @@ offline_cpu_expect_fail()
 
 online_all_hot_pluggable_cpus()
 {
-	for cpu in `hotplaggable_offline_cpus`; do
+	for cpu in `hotpluggable_offline_cpus`; do
 		online_cpu_expect_success $cpu
 	done
 }
-- 
2.39.5

