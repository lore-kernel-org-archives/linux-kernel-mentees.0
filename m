Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CC22E0418
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682858; cv=none; b=qio24zb8cMCWLhMX4HE0n99Fa0iY/1MnDnKNuSwAvkk7gtecjag/HoenyZr50FQHo5qkpLfjDyL4+4zqWE1xJb6qVQgKcnjbmrP4euL1M8RlhtUFqRsrbvK6wbFHKvlDyEWa06lrbAMTQBNqH2IgZeMm84RgVaqPB1F2KEgSHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682858; c=relaxed/simple;
	bh=xMPa+8Qn4mu18QhDnLh2TBRIN1AH7lNj6illVJiSw0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D5kYzm5ZN93d4RU6gwJPI5tq1b//w+m5H0skpbqlYMypLH1F5EO0ktRiujadZJeBXIj3n4lKEw/XtymSQkHSCEjb8p5U4sFY833t0qE0GYKG+92uB8hOMvhSwotEXwotGJ349xOFVOXFJqzDxm7/IVzU5Di4zoJPeQbaiw1vzIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S78HYTth; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S78HYTth"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F101E4073F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 09:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnEw0flh1bV1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 09:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4E07E40613
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E07E40613
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=S78HYTth
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4E07E40613
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 09:40:55 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-afcb731ca8eso983018566b.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 02:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755682853; x=1756287653; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iaU4VZUJUriIOWDjZuxPqvHN376Nc6Yxil/qOWrIx5I=;
        b=S78HYTthnhrbgtidxmcxBiM7T0SFtLzw4Kw6ae8Zu/raXfMVS1IckWtnhr9LFjzBgE
         224M0RyF4W+Ru8Ugs1AAY85f/yE5RWWC/X5+WQAnctMsmtsb8gZrjxfJuqFXENurOvyG
         3txVQHsmjyv7aLgAtotexKxf2IKJbESjxRDjcwBZfeYtUnpj3ZIhezytzw59CqUEM1Je
         UlRGj0fDELfZmORjJ0hL1Jzd/t5EezRjoqsMcZL2EaPUtO4ol/Tz4n5JHdR1RBK0K9qR
         bsSzQUaC6CY3x/pQquQ6Vcus+BXZwVLn148GGe6aGOMrb8gAIpgwvzZdUPqV5yf36yNn
         gFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682853; x=1756287653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaU4VZUJUriIOWDjZuxPqvHN376Nc6Yxil/qOWrIx5I=;
        b=BhHk2mKPbR+ALD6kORHApM17MKvXoT01t4d11Oe+YhGwzgwzx+yMrlStTH8+A56mPu
         psNlZgirHLJ1UyB7naLuK88vnkVAmFUFOk0Zu6zOZRyi6vEjaeJbQNKeQGHAfDudCB6C
         QDVoLQoVBAr938J29p0MbE4jzCOmYatBf96w5OBL749+YdGDqy164HEbU/5hGfxqVp8O
         w2Bvtx9oQOHXnbCPB/ngf5JwFI7XGz0v00ToXr52BIMUm2LKwo5YQE+AySvHFz/f/cQP
         aVYcbXRuvuAhVpU/sBvy1ncCk/OkwRzLf9TABMwGKallvtczWmWlFLRvW/SxjGKxuQpV
         vPkA==
X-Gm-Message-State: AOJu0Yw3haDTGmIQg8c7xHwWra8Hj163iuXZC+gO7JjdRm7oLZJVhM2k
	lIUewoV7U3yn/P7XE19gPsa9LWQGE3WZIoQhjg9BoTVvntEl3hoeAhm/
X-Gm-Gg: ASbGncuucFaICB6CupX9J6CGwdKYWCIJPXjGqVfpDNTRL7Jc7TpcqaQ1/2eHRUYlWy8
	Y/D/4D19mSNJhFAAdBAdP952M44zunlJU3flXy1LW5yfODVfDQyHygro1kAAKl1n8ChzQhqUFqd
	q1EJsbDc3oXW5+eSCHyo9HWl6FRmfVivokvmWVOpzZdLcb/9t6stcySK04oaHiZYx4Uv4oHcn9Y
	ACxvRjJG2D741Qb7bHBVyuNnBK116o+2F+RX6ONkn/Qass0avJt2dHq8XEo4wEpzZp+C5kx9mLa
	8qhFidaHcWK76ORdsvN+tC97Zet31rpdpS0DnjSt95FzIaDigih4Dje3GW36OqX82NALQ1oUjav
	JVA910tqq1V//gA8+eflb5ArPQcBUNZ4Ak2xlnSeLlvb8B1q/v34FNtXW3k/vx6s3m7GvKNfrz8
	FJkr8=
X-Google-Smtp-Source: AGHT+IF+jHeg1blhzus397KbMO6fpg4RfqSldoscVcwuKg6PL2oN6QYbuUXPW8t4wlcCO5RFZ0LvkA==
X-Received: by 2002:a17:907:1c91:b0:af9:6e4a:3b2c with SMTP id a640c23a62f3a-afdf0200d09mr189014966b.43.1755682853046;
        Wed, 20 Aug 2025 02:40:53 -0700 (PDT)
Received: from localhost.localdomain (user-46-112-72-61.play-internet.pl. [46.112.72.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded315e39sm147081466b.48.2025.08.20.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:40:52 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] selftests/ftrace: fix spelling mistake
Date: Wed, 20 Aug 2025 11:40:48 +0200
Message-Id: <20250820094048.140823-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake in return string.

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 .../selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc b/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc
index aee22289536b..d2a7da7bc87d 100644
--- a/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc
+++ b/tools/testing/selftests/ftrace/test.d/ftrace/func_traceonoff_triggers.tc
@@ -102,7 +102,7 @@ clear_trace
 
 cnt=`cnt_trace`
 if [ $cnt -ne 0 ]; then
-    fail "Tracing is still happeing"
+    fail "Tracing is still happening"
 fi
 
 echo "!$func:traceoff" >> set_ftrace_filter
-- 
2.39.5

