Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD752BDC00
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 12:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752754019; cv=none; b=gzN61jNzTXn1RLtTGPKW7h9Ia4jHgOqBB95pN4qJAf2oqCdJvOTiUQW16WYdVdxI+S1zdcDwva1pBVMq0bUrcbzJBuV1/qWBL6MfHsYqZ9mOZoFLMgOrp4DdBc4WRIOBuIJ9JM8unCzIV+6rOItcuk0vnznH61tBW4FDatvkE7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752754019; c=relaxed/simple;
	bh=GxfW4clTrYdWDgt2B0ob0S/y/KzST9qHo75GgYMee8c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CrbAUvVpjBeBJecqogPwGTw+y0YGfhbbAxiANX0kEvvuF9qSemnerzJgVl4SCYnzNttBxwuoTGosiBd0NgkFwzSCUPBtTuLrJAbq/3hvrbr9AVcapKErbnLx70eMdJSE9D8NOqKBwgbcPk+fhwTLXvdAuTSHV98hX74AzPco9eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvDfNkmp; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvDfNkmp"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236470b2dceso6675005ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 05:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752754018; x=1753358818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+nJTi9+q4kpfv+a+czXe7cETLVFWBjiMNVoEDBKpJo=;
        b=mvDfNkmpGkklEy5FdxljaIZqkK3lKkB1QG8Go1ZCuVECv55X7lqIgN5vUTFCNzlxS8
         s9djYDXnHKwHmjt30L2gCEuhMuYXKpveAP2m/8PJ1rM9D1wimeicFrTob4bstg9nPSul
         7Af6XKMS7aZRIFDuzrymEN4Kgbzc/ozW3AHG8WeKC/32RtX+CmbByvphGLi3WikCA/FO
         XOBD09e8QBb+YCXtP8R/PmluJLOApjvQ/Sc1BoAjQZYv+iiqlmvE+Wa4hfzWxrFxWXuz
         uKbbFy0nU4Kc/n5ZnJtmAWRmDKhWuJmC4+ov2Gj2MrSZZ9os4pXReHbZEB9nNCuDHpAH
         /oUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752754018; x=1753358818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+nJTi9+q4kpfv+a+czXe7cETLVFWBjiMNVoEDBKpJo=;
        b=SzMC4HOaXWg/voy0WmkZKukz7geaC8za3pwZdkWmoP44aBJUGgst59llcRvicYAAqa
         VqKTghy9jbvvVOFZYX9Cnl61PLLYY/Te7CSmBVOjS4ysCVto/MQBiZ47sbmtLs0va7Po
         l2tJrOQFOqNKNvPBiw+rJY/Hmvn8jcXOBQPna9UIoIjllwFZnePB3NINaAmkUwC3QOyJ
         4IUOBud+jQDZHdaChJjhtv8WkfMJJSK7Uoxgtfc+mlblN5zhXDPenl3rEje/gtAoHKob
         LorKm22MM8ZKDmBXkKGjuIz3b/cH1kVWkinWPcA0PL1+DdRObKX7YdEhVxEhKK3pXR1I
         OpUA==
X-Forwarded-Encrypted: i=1; AJvYcCV20UxbMgC94IKKhu8E1grbGcq9OZaJslc2abptg1Z0cOn5m2mGCWT1Avb7JRSuo7BFeB2mTw+PNC5uz9vBzuu4ozqixA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP/tH/fQwrQ+8LdO9My2z3z9ddEc0RlURkG8Rt1VxLccrq8+7P
	N0o7kX30GTNrIGNOExoES4lDE1m6mXMk1mVRRr/YWTTj59Y7HsTvoXRC
X-Gm-Gg: ASbGnct8sA9jtcvJkiwxwAei2Y/IEU5gBUU5WCwjFGa5DZrq57puxQ5tIN4AV+jKT3t
	vln5dK4+YzNWh6MXUU2ERIZ3ISBxIgkBSeLtjhNDf2GXPYQGD26w7uUEJd3Bl0gES5/YQS5wj5/
	2ZtKYqj8/w9MBsvAXNO7D8UhLHUbHqdGb5vBQqUv6MMcD/3DQsc4umQuIuRJKdOT2OQh2XesA9O
	jUEss+bdzAUtQdkTjirVLL0KO5xZhLDdZpukrcO6rXL7NjdRuIZfR121lfXy9OC9tpeHhrnSyJQ
	drd2qmkDVCkKJSpJ50+n4oVljNDFmker2NsnMMaVy8C6ofAwLA28qAYny+idytMeg0gxgrTfFm8
	A22kXRbM+0pvojJ0B1WUwHE7+Vxnt6DQo4vbUvaMOvICU3M2YfTI=
X-Google-Smtp-Source: AGHT+IF4BBm7A1/lXjfX+5CFJckI70cd0JZq9N90Ne5ZdWVr/P6MXSKpPUknHKivgiR7OUlOkmQlow==
X-Received: by 2002:a17:903:15ce:b0:23d:fa76:5c3b with SMTP id d9443c01a7336-23e256d7899mr89095575ad.22.1752754017576;
        Thu, 17 Jul 2025 05:06:57 -0700 (PDT)
Received: from localhost (61-221-35-49.hinet-ip.hinet.net. [61.221.35.49])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4285fcasm139991255ad.5.2025.07.17.05.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 05:06:56 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	bigeasy@linutronix.de,
	andrealmeid@igalia.com,
	shuah@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Nai-Chen Cheng <bleach1827@gmail.com>
Subject: [PATCH] selftest/futex: fix format-security warnings in futex_priv_hash
Date: Thu, 17 Jul 2025 20:06:06 +0800
Message-ID: <20250717120606.45115-1-bleach1827@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix format-security warnings by using proper format strings when
passing message variables to ksft_exit_fail_msg(),
ksft_test_result_pass(), and ksft_test_result_skip() function.

This prevents potential security issues and eliminates compiler warnings
when building with -Wformat-security.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 .../selftests/futex/functional/futex_priv_hash.c       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index 24a92dc94eb8..19651087c4de 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -184,10 +184,10 @@ int main(int argc, char *argv[])
 	futex_slots1 = futex_hash_slots_get();
 	if (futex_slots1 <= 0) {
 		ksft_print_msg("Current hash buckets: %d\n", futex_slots1);
-		ksft_exit_fail_msg(test_msg_auto_create);
+		ksft_exit_fail_msg("%s", test_msg_auto_create);
 	}
 
-	ksft_test_result_pass(test_msg_auto_create);
+	ksft_test_result_pass("%s", test_msg_auto_create);
 
 	online_cpus = sysconf(_SC_NPROCESSORS_ONLN);
 	ret = pthread_barrier_init(&barrier_main, NULL, MAX_THREADS + 1);
@@ -212,11 +212,11 @@ int main(int argc, char *argv[])
 		if (futex_slotsn < 0 || futex_slots1 == futex_slotsn) {
 			ksft_print_msg("Expected increase of hash buckets but got: %d -> %d\n",
 				       futex_slots1, futex_slotsn);
-			ksft_exit_fail_msg(test_msg_auto_inc);
+			ksft_exit_fail_msg("%s", test_msg_auto_inc);
 		}
-		ksft_test_result_pass(test_msg_auto_inc);
+		ksft_test_result_pass("%s", test_msg_auto_inc);
 	} else {
-		ksft_test_result_skip(test_msg_auto_inc);
+		ksft_test_result_skip("%s", test_msg_auto_inc);
 	}
 	ret = pthread_mutex_unlock(&global_lock);
 
-- 
2.43.0

