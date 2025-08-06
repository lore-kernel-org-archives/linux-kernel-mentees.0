Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45606288CAF
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754472212; cv=none; b=sCZ2o0MK118JC4l85gEgnNwR5s2UXcb43dR0tnE2B/0H/rspN2tdis27FLALihO4V2JZ/MIYNaQIa6gsaSSHzZX2sdIwXvOL4CxuZ0K6IBIfE9QzYwBdhzWbyThA6nOvtFFQ1XZAp9Qvs9sE3iGtIdZSGPnlU1zVxi9IYtcp5js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754472212; c=relaxed/simple;
	bh=Ti+S8H4iibQEtSi03TyOntCoD3rVLVhIDywWJ5k2hN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5wEvD7+PJC1bsewfBo+GLcOiF1P5GgF2zaUVdAh1RTPqDZEeMr+Z2xFuM8w0rQHHQPDjzfPzU2ukJLLaw2jRcWxXzcnhnSNZQhzDOkVXmZTPwk6v+0/LQNkbV/3mKxiLhdUs00VjiUMEYqPVa/0uTM6XzLauq3MpshYkHDUFwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/JVzGJt; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/JVzGJt"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b422863dda0so3668556a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 02:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754472210; x=1755077010; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8Z6UwM41h5NiICvVTC04LVNDedMghhwc5qhkKPNiEU=;
        b=B/JVzGJt58k/vqroIp1MdwwBBvOGMMY9pROjACpyjSn2ifOF+veO8Wro6WEaM4AKgR
         rBreJaw14w2vd0GgkgWu2h/wiXW8SAeVeSdcohVCm0IXzBMptFk2ZMbh0ITSfe01+QuL
         Gcka4dti5jwSwWlxYWO6uBzdhzXg8T9ON/Oux6TRRyu+0fPhOVjN7/qGH5nmOWYLTGiu
         YtcU20Wvfi+NWZVj7lfylwwK8A/Inuf41rMV5VAWUR8itw8eQsbqeHO9GgHRYzt7l4i+
         aymiHpsvdoZzHwzgarEjwID/V33Cm9/Qzk/pSc63jH6eQ+c0CNdTKgjejht0znZgE5h4
         2Ijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754472210; x=1755077010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8Z6UwM41h5NiICvVTC04LVNDedMghhwc5qhkKPNiEU=;
        b=wDVNfj7PSF6zEmH8e8wBxgVCg43+zWt4rV+AU61wlD/N5NggRwPAQWC0Ah561JYsrs
         ClWJAoto/uMIA2ig1tJE6CItp4x165Ts4sc/eAtr65orq7GGigeY0PS1StR7FlTej+pN
         n6hTrGl4SLxkWbwandYnEMHr0rs9dLrlKdr1vaX/FnjklnKaAXBgMawjad676QA4qwUk
         1ox+cvvoiHflcSPjr5EZAShmY72Aq+ZcVdLqsa/Kde0Rus2rNmEkcosKKSGq3VI2elfa
         vgvS8nfpPpVA8eTyVMTyWC/ikx5Jn6na5dDCPjXP/HAcTxBf9zFMkgKJ4tDSCC/5VseP
         dQ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVs3nc3TcK5mgX2+5q9I1qFLGjOMe7ET0hDaagUMeM1iRG9sQTbFh7UJ8ixpvQazJK71QkQN+cVHq4z3ElUfwQfj4dt8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxJSK7dboSMMqgUdewv4M1WJiIZNZ3NUiX99b1YgF1ANeOI/lL
	cYil2YNOiBQxUs5gVjfJ6g61mb4vnkBQHpRpq59eCaxtUn71XbOjFM8Fy03ikGwT
X-Gm-Gg: ASbGncv6pCfzanXOk1vBsE2sRA7BNtcq8SnGNhuKgE/ieR+YyOGEoshJLWkblgZG4zP
	MEtqN7i1TzvQ4MPgSXLPLWY6ZA1kKzb7JJjs3OEUK9nWlUeo/iAW898y2gXAPBGOWMs0z6RIHhM
	e3RUb4f6N6yCT3ld64jsbzMtY79e52RzqGKpw/ajM79wS5NxAj3e3wTFmOPVEIAxo7fCXnSDYKY
	xG1uF81tOnblvr5ZnnT/qFDZI9omCBTiLaZQrY36FoKp9dw5ZeKBBltDXse//POprq/qT8Ia0A3
	oIgl9Vd9x4lIVDiLmSw3om3qsWXkP/2kCbaDhrAO+Qy9qSSvNxZIH4rN6Pz2KvKXrBmNc2yuFn1
	USL7+tCIpiCx4TQ34dUvvVCYOhZJ3KAlz9EVvPpjOgs8=
X-Google-Smtp-Source: AGHT+IGFX5j5TbK6+REGB7qpAdkI35mGyzu2adIblYzRFaNPFutxs11NcuUBdGHRwwHLVgd7NS8hWQ==
X-Received: by 2002:a17:903:4b30:b0:235:779:edf0 with SMTP id d9443c01a7336-242a0be49b5mr22875205ad.50.1754472210416;
        Wed, 06 Aug 2025 02:23:30 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:7b0d:6527:282d:9edd:5f40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a8cdsm152807015ad.121.2025.08.06.02.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 02:23:30 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	shuah@kernel.org
Cc: mykolal@fb.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	pulehui@huawei.com,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests/bpf/progs: replace typeof() with __auto_type
Date: Wed,  6 Aug 2025 14:53:11 +0530
Message-ID: <20250806092311.17719-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace typeof() with __auto_type in bpf_dctcp.c.
__auto_type was introduced in GCC 4.9 and reduces the compile time for
all compilers. No functional changes intended.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/bpf/progs/bpf_dctcp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/bpf_dctcp.c b/tools/testing/selftests/bpf/progs/bpf_dctcp.c
index 7cd73e75f52a..0bab6cec6bbc 100644
--- a/tools/testing/selftests/bpf/progs/bpf_dctcp.c
+++ b/tools/testing/selftests/bpf/progs/bpf_dctcp.c
@@ -16,8 +16,8 @@
 #define min(a, b) ((a) < (b) ? (a) : (b))
 #define max(a, b) ((a) > (b) ? (a) : (b))
 #define min_not_zero(x, y) ({			\
-	typeof(x) __x = (x);			\
-	typeof(y) __y = (y);			\
+	__auto_type __x = (x);			\
+	__auto_type __y = (y);			\
 	__x == 0 ? __y : ((__y == 0) ? __x : min(__x, __y)); })
 static bool before(__u32 seq1, __u32 seq2)
 {
-- 
2.49.0

