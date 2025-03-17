Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023915B54A
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Mar 2025 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742238133; cv=none; b=n9nl0ngL0s9tcTHVyXI4HqtOkOAQNWha9ef62ly5fg49G6BjXEQhBnbKi00WwCgmd3BHo8sbWSG/hTHm2pIoDVXi3lGZi/bUwme7kYaHjGWfNlPcMbbT0rje+oUfFwsZuMwcV1gNjiv0BltfOse/OV/XyReciAH5brmSUTs30bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742238133; c=relaxed/simple;
	bh=Hvttu3ONsKCVI+zX+/ec6G/+a20ZSKSWdAO/LAA+zDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jI6qOW/5BEC31YPqyd0j4arh23lU5RHkwSwEx1K+8RlJDA/wRruCQjIV6IsEJyX6iofy2/umnK4wD+R+cAzJLhL3E7D6QhVYETlb1taW7xEhHfG9OiA3LWUom1eQDQy1+HO2yFkVyAd1xIYiPp+kNx+l6ziJ/3plzwdQe4vC/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1ZZyY++; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1ZZyY++"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff80290debso3740000a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Mar 2025 12:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742238131; x=1742842931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gVCXkbbka6K+VZe0MGxgjrGWBkeWob34kqWL102MXy4=;
        b=F1ZZyY++f8LyehODdyqtGaxIYKpV5Eye41SlH/tzlI7E8gZFPKkFgbFNLGaYHZEnoe
         6zKF9tymOhPj/vWecxpjbPb/y/DYuPjb5jqkxg/UsZUryhsW51/ZhqnM2VxKG+bblorz
         u9RR15T2WDrWsdseLpR/R4p5OkLYZch7qY7DCERbBsPPKd2Ybg7mR9TmNtC1HkFzsq7r
         fOPWtEBkqb7mWsl7Z6KaqnGErElCDXDb6ffF7QI9G/vF2Mubyq3zy8Fe3I1KlERxmCKF
         xAAsZq7BMfL/r5zrPdOX3vNkmmJLUeKc9DxHW/kejWVOqKtWysNIbcwsxwASC++Vw7Fj
         G14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742238131; x=1742842931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gVCXkbbka6K+VZe0MGxgjrGWBkeWob34kqWL102MXy4=;
        b=FtqtaT2Vmj3yMT/8y7zJvpDgLwzKCJNPKR0VIw0DcnYsBvbxW2wAtTVl+rkV3oaeeD
         91YLuMKfIgVg/8KmbMuzj/25AiIS+qQfpzX5cCJWItlrvuM2trksRjC47FB6VxgHBtj8
         nXXoJr8FsE0rxGAtxjx7Hyy7DlcyiYozT0tWn4IYpscWLFklQFrCyfoE+6yytV+1IMB8
         98fK2DCQOYRimU6ZQ4CyE4BKLaN9l2Yn60BxEWuI47wNIaWRkha4Uj8ochogohluFnlp
         Cps4axluatLSEpUIkGt4ZyajrEbxGiwKI84OSwsAGHESIaXellmBk+Q61MOXTyuKdw+E
         bn3A==
X-Forwarded-Encrypted: i=1; AJvYcCWccWxqsL9BoqcgKjqXtYyMOHO8yHVqT1CbmKF0Nf9qBZC2hQCE98wpQe8DMVQ4OFK3pR6ApLtsHEusqaxNiPPXq3ny3w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4SY33lcnA8+Arnpm5Uv9U7Wzo8aSy+6ZwbHj3HvujG6lIWlee
	KJ78KN7pTeWl3oljj9UhzOri6SAzvZsACUGrdaXzZB+CoZvVwZhn
X-Gm-Gg: ASbGncthSYErH+64Co235ShEH4djW063VtHz5KCaxWrPDkyLamT0D5bfouVelAgt4/U
	BxyRBM+xAXtho6V4TZz3jsWOfduFleK23Hw5690R2+RuNrOYiJgDrgkh7UN8+GNOL7zFGWxvudg
	qZvDXvh70HGobqm++uD22O6VQ8yrMmb8o/gpqgC6Ked/4b2YqU7J4EodV79UcBWoEXkpVaHPK7+
	ZQ02OlOZbCYlquVU8xPfmU7dBopxEHGXiyAQO+bpkSkfXV04eW9IDu66byKlR6ukI/PBUJ0ykx6
	gNOp0vO1lGG3rOb4ZjK2QvFFyZiABOVWVUTf2bldmmGG+PMXzmj8z2vma21XAGd73w==
X-Google-Smtp-Source: AGHT+IGwW94/c+nWHi2B2aO2rPj0vPspA7nN6VmmEbHkP3+uGtj1SqduHMk+oLRnKzvqVpsyVbzStg==
X-Received: by 2002:a17:90b:1f90:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-30151c5df91mr14364174a91.6.1742238130859;
        Mon, 17 Mar 2025 12:02:10 -0700 (PDT)
Received: from localhost.localdomain ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301535196e5sm6473747a91.16.2025.03.17.12.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 12:02:10 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-rtc@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] rtc: fix use of uninit struct in rtc_read_alarm_internal
Date: Tue, 18 Mar 2025 00:03:43 +0530
Message-ID: <20250317183349.346399-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The trace call invokes rtc_tm_to_time64 on a
potentially uninitialized alarm->time. Move the
trace call to the path where we do successfully
initialize and read that struct.

This fixes a KMSAN warning.

Fixes: 29a1f599c0cc ("rtc: Add tracepoints for RTC system")

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 drivers/rtc/interface.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
index aaf76406cd7d..82ba33bf478b 100644
--- a/drivers/rtc/interface.c
+++ b/drivers/rtc/interface.c
@@ -201,11 +201,12 @@ static int rtc_read_alarm_internal(struct rtc_device *rtc,
 		alarm->time.tm_yday = -1;
 		alarm->time.tm_isdst = -1;
 		err = rtc->ops->read_alarm(rtc->dev.parent, alarm);
+		if (!err)
+			trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
 	}
 
 	mutex_unlock(&rtc->ops_lock);
 
-	trace_rtc_read_alarm(rtc_tm_to_time64(&alarm->time), err);
 	return err;
 }
 
-- 
2.48.1

