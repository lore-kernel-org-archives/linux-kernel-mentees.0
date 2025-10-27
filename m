Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED012D5A19
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761543139; cv=none; b=aksuhVVgJ54Zj4FnSZkWDnOWvq/S6SJyPleFKmZQI8Lszf3cRvykBkfdEnKTRij2fUl4TdKto6LTGyLOE5Nq0EqnQ+2rm1+gh3ymRPQYoU7r8VVpKPy+SOaLt0wJ1lZA1tff0xdMqkGMRUInsIXJiF+iA7l8gx1/9mG00/uzPMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761543139; c=relaxed/simple;
	bh=BiZQZWYzCEbU/wZ9q9vihxV/NEjhA6GMCF121pXKmzA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gijrM1LYwKIXJZS1Aj1Cpj9G13RWoLmB+XPVLWej1GglE5qcaxKWLRmlLm8oXbt5O9nxFBzf4/rOAGhROIXsul3M2gK0J62K7XIEU11PL9fKrCMDln5o8DmR/kif6wvRXeJV2kyPJZ7iSASisZ/k6dkKBv0hu8bCFweRgpxcPDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEpOSZrz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEpOSZrz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 215F541314
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzqHb744rUgm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Oct 2025 05:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1043; helo=mail-pj1-x1043.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C482412F0
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C482412F0
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VEpOSZrz
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5C482412F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 27 Oct 2025 05:32:16 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-339c9bf3492so5003658a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 26 Oct 2025 22:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761543135; x=1762147935; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvaWnuts0+GAzN1C4s4frRI39aWzTgLO69HpFB7yOYY=;
        b=VEpOSZrzIgNjuNPvBOkSc1lacFm4sRYOtWsBCB3aGEocQcG0izJelQOmmEZh0mFgJ3
         GeDeh1p4OECZ2ON6/ib/rqN9SYEpehBgqvPKt+Vy6iak1V7jOx81i3oGyOfVaNujYsjh
         3OQnXgwvt5y89OMQbfu7tu5KrvlBTbCRDXYNAuXWDQyQvO2CVqotJb+ydV811Hdq8cVp
         mYx7SCZ53gnXXH/W6cs75N63GFfJQf7x/4TPCq1cfAt/0EC3H1ptV2Lk8d+3ySH3/tau
         9PtZzg39+dZlo69oRrCX6OCVdDRAcl7RLMnKLyDDbplo4xHZdcIWyco35Hw4LlsfkbNO
         huyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761543135; x=1762147935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvaWnuts0+GAzN1C4s4frRI39aWzTgLO69HpFB7yOYY=;
        b=SqdwrM7/nXKJcQBC4kiPbRLh1KmE2Y7cwS/LyTUwW7+PFZVCZVt4Mbq0r3kr/Il8MI
         v34EGsQ5RussKPyVpFT8keHS7JmS4BzB/SVympT694mTayuhwdaA8T1RrCf9oSoVmTi1
         0aVygRbuVyJmQXv8RcQLBIVLI0p0wMskgsdINPh/lHtvzB9HzbL+bdhoMqmgktvXYe9E
         TH2z5joQ2s7l5QACn5CGHMzMyDd1TsLLLxpE6IsQcd4ai2krkKF8tpBXLvsCsJaEN8Mx
         ae6mhfJ+XZcjNjAHWjOGNA+rdydDqsuc5gPJuIyCy2AZlp/pLzqBKq2kskyHnskksIci
         +Sww==
X-Forwarded-Encrypted: i=1; AJvYcCU/3+76ukOHFOdPFHxzIRgjoYwmcyzHN+Ass/TLCd1FxgIQXPPfVzNvzZgIdApVeH1u/4D6+lrYVj9YR8zdn8SufsLJTw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yxqs2b12KWVd1rWDcoQhtqDMIWImOsHoCYj3nhVWP8Bd/xGyft3
	Gj9ZaN/VRtCtRBcGkGauKspoTMdbLNTzZJxXjvkCducwGlbRWjtdKum8
X-Gm-Gg: ASbGnct0b1/j7B8Srm88ms2+abjgG5w9X1zxhYzrNgulVdKZsdagKQRozTbB8v/NnWl
	6DKbPcHd4sGE5mPvN14AIqwRlyjZ9PK4doy+pEWfJxfNgc+iDJdCC027pH5ck9GOQiK2VbbsrXB
	0SJfFnD5l5FIUNNBcyvcXxEVGOYlpoZJsup5ezIktiS9ENFJMivQsmqKI+WV19ijQ1iIgpAMCKD
	8HUY530jF3y+V/EI2eMUGuUHOw6eATYsxO1yVStTdSupLgwIwPlSutBbQUmGA8yIpT3nVnrBS87
	gwIRVQdothySFrUkLMO9ENHXvmNlgFVCX8WqhXsoXWSZrQI9aLLeeDuw2g8OIke8cSJKJ0qoz6V
	m+3WiuNwluTPi9qQUDOPehf/7RWn/B+O+nNaXQJoQFWdbrC3Kd65Tb7ziiOwKWGUS+MLWSMgy9f
	Z/EvkWMXbg8pP7j3/oY+U=
X-Google-Smtp-Source: AGHT+IGFxkBGGf3onfO8Chr2ltK6y4LuXfk+2qofYqflJam8vbY4kH2nypV/mGTAj8xXg0sXgRUULQ==
X-Received: by 2002:a17:903:1746:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290caf85146mr423652875ad.30.1761543135506;
        Sun, 26 Oct 2025 22:32:15 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e41125sm67120155ad.94.2025.10.26.22.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 22:32:15 -0700 (PDT)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Xing <kernelxing@tencent.com>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
Subject: [PATCH v2] selftest: net: fix variable sized type issue not at the end of a struct
Date: Mon, 27 Oct 2025 11:01:56 +0530
Message-ID: <20251027053156.34368-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some network selftests defined variable-sized types variable at the middle
of struct causing -Wgnu-variable-sized-type-not-at-end warning.

warning:
timestamping.c:285:18: warning: field 'cm' with variable sized type 
'struct cmsghdr' not at the end of a struct or class is a GNU 
extension [-Wgnu-variable-sized-type-not-at-end]
  285 |                 struct cmsghdr cm;
      |                                ^

ipsec.c:835:5: warning: field 'u' with variable sized type 'union 
(unnamed union at ipsec.c:831:3)' not at the end of a struct or class 
is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
  835 |                 } u;
      |                   ^

This patch move these field at the end of struct to fix these warnings.

Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---
Changelog:
v2: https://lore.kernel.org/linux-kselftest/20251027050856.30270-1-ankitkhushwaha.linux@gmail.com/
- fixed typos in the commit msg.

---
 tools/testing/selftests/net/ipsec.c        | 2 +-
 tools/testing/selftests/net/timestamping.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/ipsec.c b/tools/testing/selftests/net/ipsec.c
index 0ccf484b1d9d..36083c8f884f 100644
--- a/tools/testing/selftests/net/ipsec.c
+++ b/tools/testing/selftests/net/ipsec.c
@@ -828,12 +828,12 @@ static int xfrm_state_pack_algo(struct nlmsghdr *nh, size_t req_sz,
 		struct xfrm_desc *desc)
 {
 	struct {
+		char buf[XFRM_ALGO_KEY_BUF_SIZE];
 		union {
 			struct xfrm_algo	alg;
 			struct xfrm_algo_aead	aead;
 			struct xfrm_algo_auth	auth;
 		} u;
-		char buf[XFRM_ALGO_KEY_BUF_SIZE];
 	} alg = {};
 	size_t alen, elen, clen, aelen;
 	unsigned short type;
diff --git a/tools/testing/selftests/net/timestamping.c b/tools/testing/selftests/net/timestamping.c
index 044bc0e9ed81..ad2be2143698 100644
--- a/tools/testing/selftests/net/timestamping.c
+++ b/tools/testing/selftests/net/timestamping.c
@@ -282,8 +282,8 @@ static void recvpacket(int sock, int recvmsg_flags,
 	struct iovec entry;
 	struct sockaddr_in from_addr;
 	struct {
-		struct cmsghdr cm;
 		char control[512];
+		struct cmsghdr cm;
 	} control;
 	int res;
 
-- 
2.51.0

