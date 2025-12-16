Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BA333DEE1
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Dec 2025 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765884695; cv=none; b=GlZhSfhnDS/fI+EynvHfmzjl9AYxNzRXynMmm5fHKTSRgxuNTQEIptDPwa37wd7iKvorDHnVHQuEeHgnCZXvmLujClxNq5AjX3AMOHYLnFkJIB2yVYWdVaVPwaw4CdgWs5l+zHFjKH9c7swTw6c+SrIOFCS6kX89Q8IwGffSItg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765884695; c=relaxed/simple;
	bh=ntbk0Qg64mB+eRdow45mqcltJofKTd87yIfqFj6CdOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cdKEfqQ6MCe2Kgd3I7V6+/KqAE6hDVRVHjpme5aV936iFyhZoFQw1Wt+Jn34xhcouHHwICsqHiMB/zMRL9MWqYTrq3+FbEiiHuD8rUWSH+rS6EchUhO0TUZ8AAJmXIf1u8JBv08wQWwUNXi78dwoy1LIB+hKFdsrTgwtp/6R0rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNmo9qe1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNmo9qe1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-29f30233d8aso44010575ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 16 Dec 2025 03:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765884693; x=1766489493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPjuXZ4/6Ll8iE3Rz28AaFI0svhctDC7vgBQffR8h0U=;
        b=RNmo9qe1gKtPlCv/90d+zWeTQq8kadYEQIW7WIHArSIT76nfnwGuGVGY7Gsh6fXrkM
         vu46CKjxwnC0RyOWcXVdDkcnT5+Y2UZPij+ImuIZX6NNkEWghyQsAHDP3na8xRlPbkEl
         e46swZfhDbz07CRUB+X5lBoDCtp1XUAo7n+Gei4sW609wLmQKhUfrzMxkHgt6lJuz3qZ
         MPSh5Y63rJ1/m4QZoqXfUys0rTDAFhHZf4cF1eeh5UJsjjKLCJ0On5a5iRfU093nMa8h
         0cIjqp63li991VJkUdn9KzboICokW3lxCYItJCWJFn2YJ0aGg7Ia9382hLmEn3oJDp9/
         W7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765884693; x=1766489493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPjuXZ4/6Ll8iE3Rz28AaFI0svhctDC7vgBQffR8h0U=;
        b=bsbH1rRVsdkI+ByNI0UJWJkWSlCrHVP4klXrDX6ZJn35sLpihdqsxjuzVRpzoEkwGi
         +d2XgW+n9FITyIEYXqR+7ScRXJKdqedEc0aA9ZvVbH8/0aarg3vTsQsqle4EBMP7ejSf
         3MPxZd1l5cu4H7OJjZbtBJADC/gkqHW86HFpWkBIcvfgUZh2kdUcWUp6wczNFJ0uTaXl
         3WQxKV1RNZKRMuP+5a6a9XRPeG1hx4K4xzGCMj21lqHQwv+30YsGQw/ya9GAxDLvrDwK
         fmGNeuecPC3WafQkUs0ZkWveUS850yVqUjmJu1N6j/5uZr20G0+Lb65O7qT7WRP+ckMm
         ipeg==
X-Forwarded-Encrypted: i=1; AJvYcCXI1eMS3Gjop/q5sI4BUlnHm7M8PAdDvwot8IAeAbqr+zOOo2tIDEJmqlDLDXKe2B7AGpy7yL/z7FQ+K5jooZqanKD3RA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWXj2lxVFkt77Im46ASDwsBjIf+aHkqY4BxJrRd8clOGozjbc5
	XTM/Md8DF9brmKFZif8cUO3GHRBvZez6cYOWzevduRvfNg8ax7Pl5CaX
X-Gm-Gg: AY/fxX6WfwOAcoieVRTMwQVZjlSttTkbl6IO5qdDCiVBoqdBHRJfgP9I1NxlXQAaQzD
	bdMDDxh20YgliVJkw7//L4WuHDZFGgZZO9jGvSmoikDIWA/1WOMVI9DPRUatebEjmNZaoy2h3fl
	akGH7C4oKo+gLFQ1/sXf0hwDWf9IaEYbnqSB41iNjLecTv29C5wnYRKfDbtx0WOvJYnBDzPKRVa
	I/UxBPH0yRxz0yG7I0oEPilSkK563HI3nlM5YG9t3b6KeBpJ7Hom2vcBrw5PKEb8MR/Vl3fzYNL
	db/a9Iyf0ON1SQ2hd07AUTiTsKBKqE8kKEXdhq7sAXYfEgAbobEZNrGpAfr3ZCT+2XasLsOzjS0
	zfLCAX1TBbEUR5rjbSx2XU4Bg6QAgnyQxWEcKSJoOsjAx+e1uifUmZwERxdO8YjRir4zjUpzO+E
	9KrwBUrDFSvOlQPhK177WXCzTBdWsVPegPlD0=
X-Google-Smtp-Source: AGHT+IErSHd7LCl7veNUggNMiOy8RjvXrn1zvEt+0F4+GSG9YkcBPanzUna8QSO4lmk0MrToIVu23w==
X-Received: by 2002:a17:903:3b87:b0:2a0:97be:61a5 with SMTP id d9443c01a7336-2a097be6581mr101276985ad.3.1765884692481;
        Tue, 16 Dec 2025 03:31:32 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.180.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f7f6900949sm8620678b3a.29.2025.12.16.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 03:31:32 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] kselftest/coredump: use __builtin_trap() instead of null pointer
Date: Tue, 16 Dec 2025 17:01:24 +0530
Message-ID: <20251216113124.4150-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use __builtin_trap() to truly crash the program instead of dereferencing
null pointer which may be optimized by the compiler preventing the crash
from occurring

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

[] Testing:
The diff between before and after of running the kselftest test of the
module shows no regression on system with x86 architecture

Let me know if any more testing is needed to be done


[] Error log:
~/Desktop/kernel-dev/linux-v1/tools/testing/selftests/coredump$ make LLVM=1 W=1
  CC       stackdump_test
coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
   59 |         i = *(int *)NULL;
      |             ^~~~~~~~~~~~
coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
1 warning generated.
  CC       coredump_socket_test
coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
   59 |         i = *(int *)NULL;
      |             ^~~~~~~~~~~~
coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
1 warning generated.
  CC       coredump_socket_protocol_test
coredump_test_helpers.c:59:6: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
   59 |         i = *(int *)NULL;
      |             ^~~~~~~~~~~~
coredump_test_helpers.c:59:6: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
1 warning generated.


 tools/testing/selftests/coredump/coredump_test_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/coredump/coredump_test_helpers.c b/tools/testing/selftests/coredump/coredump_test_helpers.c
index a6f6d5f2a..5c8adee63 100644
--- a/tools/testing/selftests/coredump/coredump_test_helpers.c
+++ b/tools/testing/selftests/coredump/coredump_test_helpers.c
@@ -56,7 +56,7 @@ void crashing_child(void)
 		pthread_create(&thread, NULL, do_nothing, NULL);
 
 	/* crash on purpose */
-	i = *(int *)NULL;
+	__builtin_trap();
 }
 
 int create_detached_tmpfs(void)
-- 
2.43.0

