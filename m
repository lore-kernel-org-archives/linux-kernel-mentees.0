Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8337FB67F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 12 Aug 2025 00:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754959870; cv=none; b=n0xoq8LjV9glIdeIE+PnMaokUZP+JoabvonyKx01cqDU61B6HcOvu7Ev2leepUA5rE+t1xp4WDVXEdBrjNtgm6yXve8Qz0vPbLTkSfYjIIaWRft9fsfO7f2MaZP/dJOIM39VSsudq4lmTn7KoXc5/w09HJ3KrW4+j4pUwemvigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754959870; c=relaxed/simple;
	bh=I+JJT/HEgzht8NH5PV02zwDfS1nSJ1CV2zFF8/WCNdc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBbcf4IWp97A/wQtNKXgew+pmeb+pWQ+7OMjC9oFyKh2jF8238EOHZ2QxzgoKXVCfnZXSaHe3vr+rEFZEzL4qTEbo1v1qskHdp6Z3CVZ1nVEP83gx3XVLu9bdNHZPQ05c1qcGyuFVMpRXImdt6C8Mcw2c4hcODAJv1We0r4gw0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPQ2vkp6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPQ2vkp6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2401b855980so36063105ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 17:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754959869; x=1755564669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLk7JyZeB5fZff0o7uyhPEE+hzUw7ew/nwGo79HGTQI=;
        b=gPQ2vkp6Ix8+uKORF6MlV0l/tPAHvBkDRlDitV/X/Vg3+Ps1019nu7kvKNUQhqs4/1
         BZ6Z+RTz4ZAO+Q4Cd3VPAsVyUqtP2SivR5DyzWphlcL8RXBiY28M6CoH+uzV520rshED
         uQNTkIcLo+8wNr4iujcs92NGudDa1JTfspHyXrizt1yP+kdqcF25nFNYWo/Vt1cEe5PU
         wpfiDki5kklWonzoirht5o4KpoEy2HjFsByFKArPmLgyMEHGyL6RTVUIzml/BSBnTQgQ
         ++7M7b7ekKP78h/dRMrSpDVOTpBBmUQdBEBFcuHP+o57MxdH8HkkCOm9y5qtlPylt80I
         r1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754959869; x=1755564669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLk7JyZeB5fZff0o7uyhPEE+hzUw7ew/nwGo79HGTQI=;
        b=LNECacF1jVp19EKd3LcRzPe5Cs4d2rR/xIEWkoizKlW6e5Gp/vmjT9ekM0N2ltDXti
         //+rxyJCaeuyxGbPHFuM9/RDUU9kTP0syLgz/Ka3U9ZQUC6mEmk8WwMI4wgOJxojvNnT
         1BzLFaT9RkUxnCIgaRqFetQwozBwvKSrKqGbYRUq97vdpvcK5GMYtgI1+1ob7iCRS1bQ
         vH2bqDKqsF5UwSartlGKoR2v/y2b7ehbxZTSIddKEtdPgBOjG8ak1JDvGBRIViPCk/6W
         mDTVL4qHsFAED+/S00gOQkXynoFinv513Mtk2bID9HMgdQ9GXJwpBEESRg+X64iOmoBD
         Bxtg==
X-Forwarded-Encrypted: i=1; AJvYcCVFHHH0TO9zgRjYufotkkfE3ehxm4qtst5zjLReMxghRgCwEJdFlPQ+5upL3759KqhGrMO6qS0Hx90+41yg3L2YR1xf0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxB56NlWsWwEok7Y1KktBxNOSo3i2QMIBzN31bSLqavFuHDelkr
	HgrE0h7NxG6RkUp7dlQMn6cNc2J4aaxpvwwgh/4v5j+VzNGoPpLpPBLB
X-Gm-Gg: ASbGnctBB6a/IkUoIIgEarJWAZysQ16qasvkb1rjOYmys3cFuQjm4Lb0YlGOM5gkZlN
	iRuAzY2HA9A93CL5evfyKaaOLH9UHGRxaa+bUpbjR0YugEaD5ISQ5DwMVEUb0jfAbxowliL492H
	pQsarMyjtK0rxQPA77IQHeU3u3LPDqwqmvabp3PsYA40tMMDBUKfQNEmHUfiNfwFR30OvVD+SVe
	Uy/Q2YD2gmU2v8q3IycwX46J7MIeypjuXcgyS4RSbyzvt2eS43LZJIbo2YIjsXfdjFN16a4WbtZ
	eBNF0pwXLfz9NQ2tJG5WTSd6kHwpMau7mDN/aSWW72hmZnXDATFdw/42JY8Ti4UpuYSXHM0gDg3
	WCzkZ6PIL57Q7lbM6kKOxhCrqIJIDcrI=
X-Google-Smtp-Source: AGHT+IFeQ4dRsxAoCsTYUm6+5cX6P5ashl71urTJ+obxYkrmQdDrTJ4Ig2f2oLTBbk3S9YSOm6D0xA==
X-Received: by 2002:a17:902:ce88:b0:240:4d19:8797 with SMTP id d9443c01a7336-242fc23f4e4mr24656975ad.22.1754959868729;
        Mon, 11 Aug 2025 17:51:08 -0700 (PDT)
Received: from localhost ([159.117.70.219])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-241d1f0e945sm283785035ad.56.2025.08.11.17.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 17:51:08 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Nai-Chen Cheng <bleach1827@gmail.com>
Subject: [PATCH v2] selftests/futex: fix format-security warnings in futex_priv_hash
Date: Tue, 12 Aug 2025 08:50:48 +0800
Message-ID: <20250812005048.59892-1-bleach1827@gmail.com>
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

Changes in v2:
- Fix typo in subject: "selftest" -> "selftests"
- Retested compilation and functionality
- Link to v1: https://lore.kernel.org/all/20250717120606.45115-1-bleach1827@gmail.com/

---
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

