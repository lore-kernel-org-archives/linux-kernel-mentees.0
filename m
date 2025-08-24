Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5719023507E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756016082; cv=none; b=owm55LNj0WjvdB5okJJdhUgplRcLDagZs8zvLzAocPSsX0CyxA9jArZSp5NISxgbnNNAByl/NoHVrYGnHE146WkxonSfIKDoL01/u6FaGIkiGs5y5JSvjsPh2l8IN6lsok9vvEit7rcpmibY2e7Og96f+6YAO9n/hLxlvfYGZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756016082; c=relaxed/simple;
	bh=iXytLOLYAKvzIwUQtsY54Ja3wuEAECemSWFhG4fC/+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CUJpqMH/5ZhxS5Ix9JKdppJUaaXlJuBycTKEpgJSaA2L88h8BtVmajoLC6/6h+dKDqIGc5XHWcGEnKvgFTCgQi6+sIwBUEdocdl1g1l8SXmZn8wwC3F1PuIFW5VZKwuPMj8wngJDrGN/MrcpwvOolr09kd/DDFvCP80krzWclCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acyo4Fu1; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acyo4Fu1"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F15C7614A4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6pbVT-Zun0V for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Aug 2025 06:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6AD4F6147D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AD4F6147D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=acyo4Fu1
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6AD4F6147D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 24 Aug 2025 06:14:40 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-77057266cb8so138195b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Aug 2025 23:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756016080; x=1756620880; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=;
        b=acyo4Fu19iwF3Y2mnvl8Hny+9Nm6py8Jy/h9scmLv+8VzOWFR3culi328Xzc3XNN4z
         4TKZ5II0S4SIMODXoLSXgkR15B/Esk4BVLyYwQtXV+pw6wAKdAul+3u9s0Ng9F9U1kKV
         JqfsTg7XhGYiJSMClHnJGcg4V+5kxGXe0HyPKgAC05QCqSFGtgV5Zee7WEs+49MkDDDD
         0Zp0Qx1nOpBCkIK9JMhGtBFWqYRLVlRfh1hR4/v2aoFcsuMqLykrD6yBJ0/VYV/UCEB3
         m5uoJtOjRO/M3p+jT/u84dqJVMfAaRv/8jCZ2pLJpC49hyJHp9FKJcSMh6JTlCpOkKoi
         Amkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756016080; x=1756620880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+csAhnTSq9nTMN0IXXONt982/kXLZfoGgBRxeDy+8ek=;
        b=CJAwI1Jid6FSibyu1zjedfJtAK2A8i6I8NmZ8RPtrlFFZ4IkGQ3Eb0AZ/0pDYDak3u
         7XbhlyqihfcoH7UkRYJSpGHpWVbEe9tjb58ZQfcEzj38BEgXRVONsB32y6qKQsNcd8vX
         CMS7i20Y2kxlXp1K5kaws9H7iJ06432i+ccnQnLwoOC/m+1xfi8oBCIbVkYjWLI63BZX
         Q0I95pAe0a+LY/j5YDQ/R+Qc1itB6fDCwpdFkPytHg1WNGl/NU01xp+Gf03meKMDXJdH
         VGmPxnzIMhNEpwBTQW6Q+QmilpUvfJwWKkl7KhdC8DlL9wj0S6UL3S/yc9QkD9Wwic+0
         L6Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUs9IdWq04PlvIDg5EPZtwshgh/nur3h1lFxOnvWM2F+LJ4liv7qYOgkwWvRB/xFK57LMc29KOMXNL2HJm+2SXh5EOi7w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YysuHiHs4n9m2Tyif7wImKpgip5N9rN12q+EWlmKh0iprgRHtat
	xneFYs8Jom6N93jB5Mt4JiZesBishiveEaNGP5E2JwBJfAlSV8dK8uMMUB0Vag==
X-Gm-Gg: ASbGncv0rNHDs+WypcVckl0nNtDLkKpdFJDYBRlKSLNhP5Ttla/zJ03epAknQosyGUa
	ckT2So3H4q2YZZw+n/GMazV9O/fSgRSOyXDl+3fAH8spX2vKLzh6cR9VqMEMIwGnIEhwUIWK+Ah
	1IeTwEIaqCKj6BemYd04XJu5OLHLb1MvSpAfxvO25ByrxHcmPzk9x8JpB0iFyZf2kSP0dEr5Vuk
	IdFFwgiVJPGBnji6+T2KpXg3AOJ54CkdRJQFCSW0wKY6Z3KKaVflTD4As4E7qAHF+P8BWvIOJLK
	wcRQx0fdcQp3TVcfd3xcDFgn29i3+esRvSYtzYFz4D+T1iFuMinMxI/1qxFIazx00XymAHdppPg
	Lcdn8W2sYYEdAg+MktlKSKg3SGDRjd1//mQPg3Mq7pldnk3+BycKN
X-Google-Smtp-Source: AGHT+IFXF+ulYVYq6/WZYX4Wzz8c1l4qYzHfwG1UXARA/MN4QDWkAkOJ6QImUbM8o+W/8FDk4xQakQ==
X-Received: by 2002:a05:6a20:7494:b0:240:30c:276a with SMTP id adf61e73a8af0-24340d02389mr11990976637.39.1756016079641;
        Sat, 23 Aug 2025 23:14:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:ad1b:5a79:43f0:e247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770529149bdsm1654943b3a.98.2025.08.23.23.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 23:14:39 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: catalin.marinas@arm.com,
	will@kernel.org,
	shuah@kernel.org,
	corbet@lwn.net
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH 2/3] kselftest/arm64: Supress warning and improve readability
Date: Sat, 23 Aug 2025 23:14:01 -0700
Message-Id: <20250824061402.13432-3-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
References: <20250824061402.13432-1-vivekyadav1207731111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

The comment was correct, but `checkpatch` script flagged it with a warning
as shown in the output section. The comment is slightly modified
to improve readability, which also suppresses the warning.

```
[command]
	./script/checkpatch.pl --strict -f tools/testing/selftests/arm64/fp/fp-stress.c

[output]
	WARNING: Possible repeated word: 'on'
```

Fixes: 98102a2cb7860 : kselftest/arm64: Hold fp-stress children until they're all spawned.

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 tools/testing/selftests/arm64/fp/fp-stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index 74e23208b94c..3a0ae96cf909 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -105,8 +105,8 @@ static void child_start(struct child_data *child, const char *program)
 
 		/*
 		 * Read from the startup pipe, there should be no data
-		 * and we should block until it is closed.  We just
-		 * carry on on error since this isn't super critical.
+		 * and we should block until it is closed. We just
+		 * carry-on on error since this isn't super critical.
 		 */
 		ret = read(3, &i, sizeof(i));
 		if (ret < 0)
-- 
2.25.1

