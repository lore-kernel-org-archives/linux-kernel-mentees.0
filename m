Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195FE3321C7
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765788633; cv=none; b=bGxgfySg64iOEqlrma7bwxdooJl15TWyDzhCDzmAcldPDtDuPW6wxstDxIgkj94uiXuzI9+SBnrvIikR3B0GDR1viRcecQz7fduGzKK2Xr6LEw1//qvn9HH0ifESnfssjL7iwChM+PJu+2sR75RM5njob/5IcnsOoFq4y+AlgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765788633; c=relaxed/simple;
	bh=UNJhjhBfdgMb0hckhX2MFxw95f5+0F9VDFTwddpYTEE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ugs0alBl4vAR2yp6KmTyY66+nBWsIatL1jg++gqr4f0Cx671Ud8sPklo3JVw0PC/sNoI64b/IO9RHnIew7/UHKFus5iOykv3QMdKwafFTt8wN0wkxdcoUdRmfeVaXoVala1kSKRECP4aUDH0fM5c0pADbIY3+l79KHOlYUoJWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kgL/mp9g; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kgL/mp9g"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso2430290b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 15 Dec 2025 00:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765788631; x=1766393431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4cLICT+Xfx3iSAb03bNjdxgJ5nQ9eDd3fe2nx7UuqzU=;
        b=kgL/mp9gbyiNALQ72bADY87wxshTjSk8B05VbBRDOIxaqrXITy4FaH7nfgVKVgnr/a
         6/N62mPHhVoSZ9orQFl3mcP5qeifdINUtupRlVZYn1NO891LM0b4iuZMVVNG/Co25fel
         xb/DFOTkQy0858/4nALP76UATN1A0YCZd0gj5fAYvnpmWMNGhIAij8tKrS3hZaT1hFYA
         3eM4vkNsUTz/axLwvlTNL4Yhy1GOF/sI2RDvClbaxvdeHZ0AiTTLQLw3RzKYoxAs3gJg
         GRIPTzFAuZcU8FnVg5VAxv+hKfjEPBqEeuuI/GI0YymL6k8KmY9+JhL4PeHm1g607H5T
         f5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765788631; x=1766393431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cLICT+Xfx3iSAb03bNjdxgJ5nQ9eDd3fe2nx7UuqzU=;
        b=aqCvQIZ3QroMoqxS7jO3QmKZMmB8mNOqTJCXGtJ1AUSpKwPPFqnJgKbdGYafDiiFPU
         6CcGDRZuxNdjtZsjfndSn3egI9PutCCxcpjsMzHXeLDXIFH+SDRU69fRxQrUkR4wj6/m
         wUExsF31OtFM4ES3U3h9MH94TPjPrKejJfnHa12KIwoHp6nTKsNzsvYPOVZZFdoUjQpy
         5B5hcwMC7RmZgTGDet9/ajAIW19XfoWdZr7eEf/iEdx4zH8kFbTgDvCiW6FfZi6yOsYi
         EXLTYgI6dNu5gYg3B6D/cTKaob5U0OWbYdnPOz0zvA8fi0kDgUayx5hSF0+c4tMrw+q8
         jKMg==
X-Forwarded-Encrypted: i=1; AJvYcCWu4Q+ZMELW5guSbkmTbvTcpVzm8kUwDATHp9RESvxnyg7DHiyw6N54/97ycWogJlDAJXeTbugHIgq7Q36+L2xKBp6L9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW+UMiiJQW13PcjhZGjgLT8QzwV0cQl8dNdYyNVFzbTJqHe909
	oCS+ZGkzFOV9Z232U3Eie7hYqMvM5ObrDN2borP7QL6XrlMdVZcm61KD
X-Gm-Gg: AY/fxX42hnO4DdSZ70bcnV2ziHbZsHJSFB2AasVP6doIz9WpwQCz9FX1HWLTVU9B4tA
	iVhGkJQKl2Ecnn7TnVI96MNbD6/fIk0vRxq//uIHp4oMIkzTxi/ZOc7n2E8UWIYFWwd1fqmvxcB
	QMtmL0Bin0zp/edBXtIa4PfA0SnGOha8loEumcuD+n70IDaMCyRLQ/40krnJJ+Omew7UaA6ViKb
	74OO4ZvkkzAhX0bl1e2BReiWKRPT9MblQhou+9v4+7IpqzYckz/LeZrdydtSJ/Ua/k/Re1tdEH2
	jSXB1DCy5U7R7ZlqwbqMoJ2/ZR/UCgUu6gw+mjkIU25IfKJfOwbdbK5hwR0ECZi+VCB+IS8YFE2
	GAnn62WySrGulounRzXZrJOSCMTWwmgTX6+P3sOkfs3yuXF1+F/7ySCUPSveYaTaLZrBvIRKKqW
	RjNpfnsnjhtijWItoiqkIF5TTLnw5Kfm+FBAY=
X-Google-Smtp-Source: AGHT+IHkiONbozf9pjfNVTzEsjplZ/PllBupKMp54qcU+ah02z/Rx4CDnQ/3DyFEalYJchKrsKO91w==
X-Received: by 2002:a05:6a00:4510:b0:7e8:43f5:bd44 with SMTP id d2e1a72fcca58-7f6696a3da1mr9612737b3a.48.1765788631390;
        Mon, 15 Dec 2025 00:50:31 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.180.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c4e9d9e3sm11976334b3a.45.2025.12.15.00.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 00:50:30 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: ming.lei@redhat.com,
	skhan@linuxfoundation.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH] kselftest/kublk: include message in _Static_assert for C11 compatibility
Date: Mon, 15 Dec 2025 14:20:22 +0530
Message-ID: <20251215085022.7642-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add descriptive message in the _Static_assert to comply with the C11
standard requirement to prevent compiler from throwing out error. The
compiler throws an error when _Static_assert is used without a message as
that is a C23 extension.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

[] Testing:
The diff between before and after of running the kselftest test of the
module shows no regression on system with x86 architecture

Let me know if any more testing is needed to be done


[] Error log:
~/Desktop/kernel-dev/linux-v1/tools/testing/selftests/ublk$ make LLVM=1 W=1
  CC       kublk
In file included from kublk.c:6:
./kublk.h:220:43: error: '_Static_assert' with no message is a C23 extension [-Werror,-Wc23-extensions]
  220 |         _Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
      |                                                  ^
      |                                                  , ""
1 error generated.
In file included from null.c:3:
./kublk.h:220:43: error: '_Static_assert' with no message is a C23 extension [-Werror,-Wc23-extensions]
  220 |         _Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
      |                                                  ^
      |                                                  , ""
1 error generated.
In file included from file_backed.c:3:
./kublk.h:220:43: error: '_Static_assert' with no message is a C23 extension [-Werror,-Wc23-extensions]
  220 |         _Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
      |                                                  ^
      |                                                  , ""
1 error generated.
In file included from common.c:3:
./kublk.h:220:43: error: '_Static_assert' with no message is a C23 extension [-Werror,-Wc23-extensions]
  220 |         _Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
      |                                                  ^
      |                                                  , ""
1 error generated.
In file included from stripe.c:3:
./kublk.h:220:43: error: '_Static_assert' with no message is a C23 extension [-Werror,-Wc23-extensions]
  220 |         _Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
      |                                                  ^
      |                                                  , ""
1 error generated.
In file included from fault_inject.c:11:
./kublk.h:220:43: error: '_Static_assert' with no message is a C23 extension [-Werror,-Wc23-extensions]
  220 |         _Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
      |                                                  ^
      |                                                  , ""
1 error generated.
make: *** [../lib.mk:225: /home/clint/Desktop/kernel-dev/linux-v1/tools/testing/selftests/ublk/kublk] Error 1




 tools/testing/selftests/ublk/kublk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ublk/kublk.h b/tools/testing/selftests/ublk/kublk.h
index fe42705c6..e5eb5f762 100644
--- a/tools/testing/selftests/ublk/kublk.h
+++ b/tools/testing/selftests/ublk/kublk.h
@@ -217,7 +217,7 @@ static inline __u64 build_user_data(unsigned tag, unsigned op,
 		unsigned tgt_data, unsigned q_id, unsigned is_target_io)
 {
 	/* we only have 7 bits to encode q_id */
-	_Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7);
+	_Static_assert(UBLK_MAX_QUEUES_SHIFT <= 7, "UBLK_MAX_QUEUES_SHIFT must be <= 7");
 	assert(!(tag >> 16) && !(op >> 8) && !(tgt_data >> 16) && !(q_id >> 7));
 
 	return tag | (op << 16) | (tgt_data << 24) |
-- 
2.43.0

