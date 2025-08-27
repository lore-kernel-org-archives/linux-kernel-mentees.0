Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7C830CD9F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 10:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292255; cv=none; b=gu90UZLLR6mteW9lM/KcirGjzP4wzRBhOn2OAva2UiDOTiwQ/7OBqMWDV88xrBtmacCAAKP3JZLTrZeTze45bLl0dMFTb4SHkCDqKTjETVA74ih9gWgefYkeJJfLpDPrm9l+iQwSlk9wlH4OYYkoLjc6Kwwl7SrBxpHaoQvQ2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292255; c=relaxed/simple;
	bh=0ZpmIIN0uu5nMw2RHk2QulZtCu0yMzmZ0nU8Is5Q9z0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UEB5z0xQTQGM2/HlU7FtFNqXiAOuL9OwyALNymmpGQghLIzn1hA2Ui4tBCS/HLbjx2taZxmovHNeEo78HfAVfzDLK3G7wnzMuvYvdXYaQqrbStAECjDprogZgGcSBVIyLtnayRdMxHRMW1BoWQPMBTnATmrTg/E/1AY5REK7nV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6TaUMkU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6TaUMkU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E03781210
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 10:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hvAFpboWj_3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Aug 2025 10:57:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D1E8D811B9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E8D811B9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M6TaUMkU
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D1E8D811B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 10:57:32 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7720f23123dso146381b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 27 Aug 2025 03:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756292252; x=1756897052; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2EpUNUryTNGX6oXQWNBchEosjC3dsxwJWjqftVi2/I=;
        b=M6TaUMkUzVe3Ru92lDHlOf/+EcxtD+STc0H6F7+W6BTNkuyys7oPFc6u3ZtQiIbrlA
         63HBboT9uf3ON0IRl+EU33isFx4ln609tW6Avw5Ens9QmEJM3oVmno8RgSsXrjUC+eBg
         2fvSlW2z98LOiqvtx0coPTR0jcdT9HDmMSjrtVpDi6LvJCujn2/pJHAEWY+1rwpmi8+O
         /ChFsPJjo6ugfPTPWkqfv1g6jF4t930von1O7ZlhzS4dVedCoX0rrXOGlLmEJUTCUhJk
         Vrym8foCegif5W681RbY/srPf+pK4/oeZoeGZKjfKTF7XRVmFRxZzY1o/7rW1+h8CqWF
         BLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292252; x=1756897052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2EpUNUryTNGX6oXQWNBchEosjC3dsxwJWjqftVi2/I=;
        b=B4gs7REvn1mjhLw1LICkDKBcAlT0Izq9HByD0nojNVrRX/t8KGMtLw5iKuBp+Qq4zt
         e30143Uwm6hAafy0d0HKWNHkBbiDSogtHQJkoZMQc0XA/hGYx/HW6nl3gdOC+cZr7BSU
         LhAdLCUJ5AydAJhv+er4BvvXaGxZHQ6uu3vlXj1fCchJUNrVOK+S3BI5tdXJUHMSs/qH
         sNez355wArLJzejti0DsScCCHkamBayOub0NMMHlfIrT/UhBkF14uYHA7kduI/acv6fl
         jOXqvJdwwARjx93XJbhCCbcx5B+WEv+gSW9Z8qbacK5iX5DyrCne0eA8TJuw5GIqQhmC
         Vmug==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZjVm++HI3Z6JWlpxF2TuMqJO67IjVH015dsJRWbZJWVCyWtNrETXnrfjw9rdo1YxVrm/BA5i/0DwAnzSfB6x8YUHeA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwY5hN3IWsaxzWznV7qRu03DYadWbTcbXmEMLKaagCCPItL3u/B
	6SedpfRAxZipB32xQdd/Zvq9rL+IUNFRq+uxZxI14yHu+5sxOKJyyQRQ
X-Gm-Gg: ASbGncvYvLcq9lABUgpMUx2nGCRayOXQU2PeTLNowtM44ld5RCtYvDIpa3dS10xWvm9
	MC1lt2dzwqWxpXH5uu+zfjYOpNIaMG9E6dELmtHQncjQX4wbBK+z1s8QkwL+KXO72DyvRpDNM74
	MSQYDg/SlGIWVD3yd80e3B/STdv2nZyWOoUkp/9HFZdhfIwWvXpeoJV0xZaOFxnk4K57602U1IE
	voHKaj3CQAP7OsFuirAkhqyNCgSZsWWHnPbJozOmXXIaS60fY+4lSUsyKfdZ8wjoAP2btf739yF
	djk4OgxlsYdo3NpRXdBwR/4GpXI3C2T/RvxBC4Tp4Plz5vo/EKPcurMJ7yHQ4Fyoka1++R2xpDu
	UJtLLpzV7cAgIueU/I/tkA2bp5nnuSSejzIVEzA==
X-Google-Smtp-Source: AGHT+IFKSW5R5mt5f2yEqDcsOKOhySbivHHOjFqhMtMCcpw9s1O1H1GZwsOhvMfu5vBPWSHS4aXAlw==
X-Received: by 2002:a17:902:d2d1:b0:240:48f4:40f7 with SMTP id d9443c01a7336-2462ef423e2mr265865735ad.39.1756292251960;
        Wed, 27 Aug 2025 03:57:31 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.137.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-248b6a16ae3sm4277095ad.137.2025.08.27.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:57:31 -0700 (PDT)
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
Date: Wed, 27 Aug 2025 16:26:39 +0530
Message-Id: <20250827105639.19156-1-bhanuseshukumar@gmail.com>
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
     v1: https://lore.kernel.org/all/20250821154103.115110-1-bhanuseshukumar@gmail.com/      
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

