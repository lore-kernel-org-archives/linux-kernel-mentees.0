Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13903191
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754478165; cv=none; b=Rdsv220PGhsuMBoHeog1nWME/SiVIrsiS/I5bYakLdsgyiRjXNRxSNK39SuPMo926Ma9148TrEhOyvif3fu+B+33Q8dhF0yETdTKXTb9qgR7CJFox32kHolopw948dbjvID8hXRP9Q5K+EsXli917dfcMy/GesHmYIcGbOdxgjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754478165; c=relaxed/simple;
	bh=fGwQvuZekVYWNVp+xHF2By/+OhCeDXLdr6UFjCBMrmU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tl9xh8+4IAabuAyuimm/B8qyenuV+41KEgEeScupcGc3FPnj+B7K0Z/+KSSmAQhEP3P7otfmFTnUlpJS96z+MmjRnsjHTF9/HnTQRoT//uk8omVOVXr1wvsWg8P2dbMVkLN572g+LkCekXEkzDzryVBuwU2tsQhi+y7FAQ66VcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ET0j2C7y; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ET0j2C7y"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-76bdea88e12so4552927b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754478163; x=1755082963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rnS6VYdGfdFt/krsus/FgbrkiOQovzavFwfxL0kycI4=;
        b=ET0j2C7yL4w5u917U5cge6VF8+xKAphl+jjF3YEMDQEVLDlvTw89fLCRufugLj7A+E
         vPFKPDa13JOrnqtTrK8W0ik3TUIY11suHnbRkvWSCbZ4w9GHQUe/Lqhop7ViSRjRZmbU
         f+UQEeQoTkJ8yLsUgDBUEPj8919sm0YXKoeLmrTwrnAdmYgI3VxWZlLdWBT7AWdZTqtX
         0ipzVElGP5IhzGQIM7IUCGzlBQqpdZ8zhdPbJprVNVHa58QKXUn7USU+P7lHumX5/hnD
         dJy4XHgozFVpGfmCN/kvlmC/UE91peCE141rPx+MX+PPlCR12habQ1ISpGC8kf6Rj9Vl
         VGwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754478163; x=1755082963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rnS6VYdGfdFt/krsus/FgbrkiOQovzavFwfxL0kycI4=;
        b=A808APzj3Vy07cxNO1B6Eiyid2Nrcj3gwYWMmE81Y9ibckBkcesi7WIYLH7zBIoGhb
         XouTiNcP1TP8glvQ+xNGJd1nzMgAzPm8Jeo9qdwN+XNaKfO7R7IRz/1eLuH8V+kJIVpt
         DUQoOVYugu+U9Sz6LhCs9YQWDNpp7seUKecOx+JCyApc01lqxJSNApWuO4OrA6JCXNr9
         jLQVk5FzHUkPaYVGd006d9AN+GMkjvGkBV9mUIUY5+9TpdQu7e7CkZr14onpU+tumwvQ
         RoCrPd/F2H9nGKxD/MASZZCwcEvM9Paz5hgdC/fXo7LBIVkP3gbB0zdeoUiYJDoVHx1Y
         okMA==
X-Forwarded-Encrypted: i=1; AJvYcCX1phrou+vEXFTeH5CfFhJ1b89n7QFWrp2MRd/ADnm17ZO/BqNFEG15mSE1T8JlgPXn3GojWGjEngG8VeypzO9q6EwRMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ44f4Dml9Wb41/uOPmE+READMURtOllArjYxivKZ+UylWpuji
	hnmKrqf5gD8MRhoH8gRSoyNi4KRd3qF7rBcgwUzyvBjXbOJ7u9qSCUFB
X-Gm-Gg: ASbGncssrG5wrYiWuLTfcCOkjmvOcQyIGGanjbMX/MTqsfYMopz7IMpPuINqtuuXThf
	QE7U3/iX34PqA0oxZgsme3c4ZFP35SlJe2Ot+nTtLha+uEaj+TDE54lQYvLPkP3qgAGk7SREUnB
	nqcM3swPxbckehqjbi+SqA3Ngf+DqpDc8F7DMu5RKXjCMOCd8EIwBDUoVBpd/hCjOVFexxI37Du
	vpXiCnxfYC3tL4C1RxjH2hMKIhRRn6bHMFYdFCc6xm7/dysxjOLOHwC00c0ExnPHiAV/BqipGIT
	KKTpwvY2MMaGw45mSbvholI3kXRpmz2GyAw/fy1IFLry5auYbOrsbgdCZXHpp6LFB7wsV82UCgF
	weZikY5ZTnRuIo8B79qyAuhd/JZa2QicyhDcNoCTnqeY=
X-Google-Smtp-Source: AGHT+IFjR517vCAUNyZmP/NtQ6JbvJmH4KhkzCA3/4f876CAu+LnOExtfNWpNrpMCkeAqIM3e2h6Sw==
X-Received: by 2002:a05:6a20:7487:b0:240:30c:276a with SMTP id adf61e73a8af0-24031463e79mr4059373637.39.1754478163258;
        Wed, 06 Aug 2025 04:02:43 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:7b0d:6527:282d:9edd:5f40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8de28sm15074948b3a.39.2025.08.06.04.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:02:42 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	kuba@kernel.org,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	eddyz87@gmail.com,
	shuah@kernel.org
Cc: sdf@fomichev.me,
	mykolal@fb.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	haoluo@google.com,
	jolsa@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] selftests/bpf/progs: use __auto_type in swap() macro
Date: Wed,  6 Aug 2025 16:32:30 +0530
Message-ID: <20250806110230.23949-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace typeof() with __auto_type in xdp_synproxy_kern.c.
__auto_type was introduced in GCC 4.9 and reduces the compile time for
all compilers. No functional changes intended.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c b/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
index 62b8e29ced9f..b08738f9a0e6 100644
--- a/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
+++ b/tools/testing/selftests/bpf/progs/xdp_synproxy_kern.c
@@ -58,7 +58,7 @@
 #define MAX_PACKET_OFF 0xffff
 
 #define swap(a, b) \
-	do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
+	do { __auto_type __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
 
 #define __get_unaligned_t(type, ptr) ({						\
 	const struct { type x; } __attribute__((__packed__)) *__pptr = (typeof(__pptr))(ptr); \
-- 
2.49.0

