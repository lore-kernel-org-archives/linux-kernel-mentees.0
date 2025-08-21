Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB2128541A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755764413; cv=none; b=IrbxYWP/1qWqH8pTeaASDrJeR22K6ppD1lszyY8lf1d74gn/BrbRnJZofzMzWhbkgdcZwqUGKOnQOOkX/y4HJG6LYqctzdRzLOFGaXDUpnyK9mhIBmAg+7K9ErYesGQd4F7OjZeTNkK7nHiF6p7q0pk6Wwajwlze8XfcsGkZHdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755764413; c=relaxed/simple;
	bh=6MENWqVkYHicMICVfnmxJMVEP/jU0tYMGNb6mI3yHBI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Cns1lgb5oJAxqCdnQ6I6iHqJ8WhR6vQgvW8q0J8KA4pdVGq6HHBz37O4umSYIRF0hA00ZhzkUOrwJqGNNR6Ei/nh5WtF27EJjX90Oh8n+Q5daIECZwP4YpKB/O6Bn/wc8M+E44SZIIuLOZyOL20zELusZH0Y43YyXlE9qMJU1Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8Q89La4; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8Q89La4"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F0B24174B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-Avb1mYsc43 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Aug 2025 08:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 095BE416F5
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095BE416F5
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I8Q89La4
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 095BE416F5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 08:20:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-24456ce0b96so8057355ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 21 Aug 2025 01:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755764410; x=1756369210; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVdyfb1owiUrSj5mrUpAZzb1V0r+oMDnI+RfgrzmLmQ=;
        b=I8Q89La4Y+DjxWM8Djiv/C91wtZ+Lh6W4Q7Zl+euWUIKfg8ZofEsjkWWTJz9fW3cIj
         N9D34aS3V6ejjPICV+uJhZQx+t90ayJ0PLzHapsHV4jkd0UPRYHMVfftBpEeiF9a0Sv7
         rBFDf78rxiHC+892sEM6Bcf9KN6WsC2XUCTuiwAv8hD8PcqWqcb82GCFifyn/CSIYSqk
         6EEFh1ZrKH2uDRGc7KJsVan3DqiwNCB3dZxx6hL2Q+0/fw4Z98PyM8mTVZLS25CDMqbz
         LO+omqtu2zhGlDb4eMxrnHiovBVLAUxF0a54Im7cCGq8jI3KPu7YLaAYmoPEAhV/eBov
         Cbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755764410; x=1756369210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVdyfb1owiUrSj5mrUpAZzb1V0r+oMDnI+RfgrzmLmQ=;
        b=eu6y9iWI5MZf47DfXMrmFxiNaH7b6Ofcvarihif/zu99BYDNYQJI8XI5TxFDl1cY5l
         Oc6fHVo0jTo7PHbpkgYGrTXH3Yhyth4Rncxwm5AGKNZpQ1b/LMXH4AC9XPfhphdABdHW
         d1/WuQwjrnf+rRs5B9NW3UuBkAerIvTumq5qpLc5KBid/ARApX11Roo5HLnFC65fdTXw
         NNcnA4T3KN3ZvfeGpLWUgBme51EEKEuZsNhvKawhlbNvSMDQx6QKLIPP5ofDzPgpBpO3
         mMrrB0KbmdwX/masdJMAU0u2Evo5VXyTbhw4N/4jKFMv+hH7Xnrj8tBXM2amWMgOx2ua
         1pPw==
X-Forwarded-Encrypted: i=1; AJvYcCWSNoyJjM3wfAT0O0h5WyOTnPinvKXjPl3OJPo+2QYqnDfasyVXY68ZjEZLUxLOh30gkXbV1SlImwTzjmE9p1stkU0Ziw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxjqZHjq+0YeshodqlOzwou7ROlRjDCqkuoK1J6hahGtzzB2jd3
	tSP2tvyv78CGMDvQb4FISyeA5FaW2wh9DEbDjrMhNzA3Ht2a0+zXYs/7
X-Gm-Gg: ASbGnct2xYkDKM816Hp7yPUVbJjj31b14q+VhIj6qOY6aQdN349UuA5t2H0C9OgHwE/
	hRjb7ILnmJYgdeJFBbBenWrVWvUOpBfFsKs1mHcMfSfr9UAs7DaUNZi0iA/QR7BqXTyFJ3MgqH7
	RfdlxjxSGG011S1zvMSP3zutqITqUVKgVSZrYKRZZLMpQUK/oVoSt6X7pMCqPIBmupnC92wGRKM
	LKLV5abJBKlR02UHJDm92nf9Gp0d0FRf34rZUOjE/iu63rnpWrY8/wAiG/elR7i9iPprmznXt5z
	sucRvaKLLyWOOuNo6Sj4sbvho5D3B56BjgBWl0W1WQYW+poIXC0VkzC1Ik1yqrfoTf+By7xkMd+
	CIzHPpgQfZ9dF5QiXXwfaSRsbxppewBjfuDC9+3vvRcCJfV05tjD97b8=
X-Google-Smtp-Source: AGHT+IGKdPlIQ1dw7VT4HwkMn1t5FdLrHQzSs3zBpSEXsX9SbKEry0EQVRbHiJ09vLI6a1TtMRq0Pw==
X-Received: by 2002:a17:903:2448:b0:234:325:500b with SMTP id d9443c01a7336-246062d1978mr17963555ad.22.1755764410137;
        Thu, 21 Aug 2025 01:20:10 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed377de7sm48259875ad.62.2025.08.21.01.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:20:09 -0700 (PDT)
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
To: skhan@linuxfoundation.org,
	bhanuseshukumar@gmail.com,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] docs:Fixed typo. Specifically enabeld is changed to enabled
Date: Thu, 21 Aug 2025 13:50:01 +0530
Message-Id: <20250821082001.6082-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>
---
 drivers/devfreq/devfreq-event.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/devfreq-event.c b/drivers/devfreq/devfreq-event.c
index 70219099c604..020fe30ed5d9 100644
--- a/drivers/devfreq/devfreq-event.c
+++ b/drivers/devfreq/devfreq-event.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL_GPL(devfreq_event_disable_edev);
  * @edev	: the devfreq-event device
  *
  * Note that this function check whether devfreq-event dev is enabled or not.
- * If return true, the devfreq-event dev is enabeld. If return false, the
+ * If return true, the devfreq-event dev is enabled. If return false, the
  * devfreq-event dev is disabled.
  */
 bool devfreq_event_is_enabled(struct devfreq_event_dev *edev)
-- 
2.34.1

