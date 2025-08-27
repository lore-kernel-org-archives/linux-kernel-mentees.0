Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0A634AAFC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 10:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292106; cv=none; b=IJTpASj6iAFWdzjknhZKH4ddFREVk35MJCfwrB0M4s9qq14QiKjXoSabwChCvI7NXnuyaEX6UvZcgQvF/kSiMGOzvpGjpHafzIZplEWi6+EXcC03ezuX1G8+zt2KXRC9a/0epnOwG9Z/aX9slODqeYayGk61j69oQg3Cks5yca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292106; c=relaxed/simple;
	bh=brtTeOq7t9D29DOEYbCG+995QksqWJLkIz1HRzKOgFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WhtBYa8XZo83ElM+cT7pMuiz2XDyfFzb9V/jMckB+jUb8wYcZ0zStn2J6qMqq0B22po5lv6ZZr/DJzG9QJ6chXfV6saZlnfcVBZh3foBw/vtHXZasBQTgngx14ER82TUdXcIf4XEP7VMieeOyl72gBqcvMK1pGjCK1r58JQSt98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YClEtKTk; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YClEtKTk"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F0240AD2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 10:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAHxNvICLA-f for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Aug 2025 10:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84F2440AC8
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F2440AC8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YClEtKTk
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 84F2440AC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 10:55:04 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-24458272c00so78680175ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756292104; x=1756896904; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KDBhuoyCHEkjgWaDPbp519QDqLxjbIBjIvhNBom08HM=;
        b=YClEtKTkKQZtkd/FoHWXljrhdwpLlhKbTH23eIG+MFqbkSqxkNlEPoUqZFZEoNUybb
         DQLFSF0GKeKN4vKWk9E7uLYgazHCYSuFBVHIrYseqFuKmjsoHv3gDOsg7OOEUuELHQEM
         t8BqeS55GhYmpWtf0eza5ZZddwAnNXZu9KA7ut9K30nxFqYsqplRgyp5N+s4f+kjPppO
         Be8SKOuOP3vL9gDBCx1A3Ue0Zxln1pHkaXT87q1buEACNrC72IPe9JTdFbKLMMSb/HVm
         9bo7I+Gy+FZoDZu1Dc0L4s6qzMkhayuIrCocFIMUSODTeeE04qEeoCplJfBgraphdWAM
         lVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292104; x=1756896904;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDBhuoyCHEkjgWaDPbp519QDqLxjbIBjIvhNBom08HM=;
        b=nN9vlDJoc5m6RAjsC3q3l/L3gDRrd4tFGsPMtNe/zLuXNFblC30TtF+yCf+Octuaqu
         +VGZY6PXJGrKmXK0x6QVbcZnENPTYFxUndECe6krCttufNm87RTZoNd8TuHKi2bXy0YO
         hP09ESt0u3h8xpV1xgsi0ZQZA3t+QbkAnd/VfLtvArzWWM6ShoQC1y4CBpo0OM652RX/
         4pXivpn+1RtixBmZKwUv6Ad2KGOiWPpSggkSXRweMUckAe90mCKWzsUiqM/QjimkUj/u
         Mo/t0Jidp8qrX1RscH1qcVkOD4RWNf6LBDdWFZ28cJ7uZ2aQjFdgkX+YPhM8kdpDOCwg
         jQow==
X-Forwarded-Encrypted: i=1; AJvYcCWL45FSHEhU2/FqehXI6fWlav1Ijgahzcc9lSnTx27CebFVzTKZyzPg5Jwk0tqBxsE58Hzce9R4V6FTn+Z6imvxkNwOXQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzDIFR+RrkaxTaW72mVb5r7O38s7MemSm3IjjjssXp9WcOue2vi
	dhJWSsRDgJBUmL0qShiDmIRvqXtYlqBysV2dPK8nmFEyfeq5W8B5sBEa
X-Gm-Gg: ASbGncvgVfavv+Z3+AxqG2Xz62kZhrx/LtTYmvHx2UaHT3k8lGvm3XdtOPv8db4ql7X
	vmJMUKkUF7SLPbptWzcpnM6iNLekt1uMJjrcMKvgif4OXmA/1aKVFsetxlX7GfHIVMc91HpAb2w
	2c32pgT7JJUMfrU1wYuzN8TrijI8UTSwmgXHlG8h7oYIYFI75kNrqP/7skiayNxmT5R/WhgwDDo
	Q93rxEjtaVP6OKoiYv59H6ZzVa2hKr7RuhV44tyYETQbqcs0kiZ+txBOsykkX/wsOVbyjQ38A+T
	uFS/bewUHm0AVWahYcmYBytJsGRCTcEKvIX0lr3G/wxXoqvrMY/ZGGUEA/3sowN3mLa6jo9QS/p
	4kbhAoUvOtLcRhqHq4Lbctj168bYm+7737V3pRP5zefg6/Dmo
X-Google-Smtp-Source: AGHT+IEhirihpN1QSJ58xrmifvBkFp/Oy5ttrOOp4jBR4YeWiJAGvBREB33nGZkv2OirbOnMcYZQZw==
X-Received: by 2002:a17:902:dad1:b0:242:befb:b04e with SMTP id d9443c01a7336-2462ee9cbfcmr253453335ad.25.1756292103508;
        Wed, 27 Aug 2025 03:55:03 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.137.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668779f6csm119573885ad.26.2025.08.27.03.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:03 -0700 (PDT)
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	shuah@kernel.org
Cc: peterz@infradead.org,
	dvhart@infradead.org,
	dave@stgolabs.net,
	andrealmeid@igalia.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	bigeasy@linutronix.de,
	colin.i.king@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH v2] selftests: futex; Fix spelling in test messages
Date: Wed, 27 Aug 2025 16:24:12 +0530
Message-Id: <20250827105412.19113-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    Correct few spelling mistakes in selftest output messages to improve
    readability

Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>
---
 This fix is part of kselftest pre-requisite task for kernel mentorship fall 2025.

 --changes in v2 to v1
     grammar fix : instead -> instead of 
 tools/testing/selftests/futex/functional/futex_priv_hash.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
index aea001ac4946..8a5735391f2e 100644
--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -132,7 +132,7 @@ static void usage(char *prog)
 {
 	printf("Usage: %s\n", prog);
 	printf("  -c    Use color\n");
-	printf("  -g    Test global hash instead intead local immutable \n");
+	printf("  -g    Test global hash instead of local immutable \n");
 	printf("  -h    Display this help message\n");
 	printf("  -v L  Verbosity level: %d=QUIET %d=CRITICAL %d=INFO\n",
 	       VQUIET, VCRITICAL, VINFO);
@@ -267,7 +267,7 @@ int main(int argc, char *argv[])
 	join_max_threads();
 
 	ret = futex_hash_slots_get();
-	ksft_test_result(ret == 2, "No more auto-resize after manaul setting, got %d\n",
+	ksft_test_result(ret == 2, "No more auto-resize after manual setting, got %d\n",
 			 ret);
 
 	futex_hash_slots_set_must_fail(1 << 29);
-- 
2.34.1

