Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BD41FAB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 04:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NK3GEJ7K"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A5254018F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 04:02:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A5254018F
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NK3GEJ7K
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01qfrclFq9JV
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 19 Nov 2023 04:02:29 +0000 (UTC)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EE82C40142
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 19 Nov 2023 04:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE82C40142
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso3041402276.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Nov 2023 20:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700366548; x=1700971348; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oZtE1sXq/6EOMIXLdRyz9i4gTsfOOa5vBqb4CxOsnD8=;
        b=NK3GEJ7K5zvEIk4BB4vRurTgvRZ4da60pY24+U5ODc7eiT/+IHnl1HpJIIu8lO7XSC
         L4uWSiFCP54kMusoL7zNeVv4Wy4NYBw9Wi4cxYVhwKdbU6zctKH2Ch2DXglMNbEpryJh
         O/n6nK34WG+r1F9aPJ8gxF+SzcEj0OkdnvLKUUHFTJZ1uC8bDeItKv7pn2vi00bktwPJ
         mBnnp5b9tiM+KqJg8gUdiBJQXKvIUNb9b/6oocnTQzVces3h84c8QP5oyXCUv9if1PbN
         X4I/gJ+t0ZB3UnMbIxT/xBFEPUwh3NvQXv2aIQmHfqhksZdhIH5pdRPNruM2pQ4A2R+Q
         bgWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700366548; x=1700971348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZtE1sXq/6EOMIXLdRyz9i4gTsfOOa5vBqb4CxOsnD8=;
        b=fzNXIbf/jZMI04F7I9dNMADdgVi0hcOe+DwQyVf9mL8MV8jurgLST77N55lQAiQd2j
         NkDd8EHd8IeGmXzjc7OvI6qbJNFO58U2jfhDriEj2AT/miObAA4S2uJc0uwpHugmWz2h
         FY6NNSBjVhy8UTULWntaj703xEfTWdU1nG9XuLRJF3wzOSs3mQe6TzAVjC5rk/ez7MQJ
         Bpdcs5/BRcnhEWryUqly8rT2I7X9bgIj+C5tcSGoF4zvVOvmH8bma/sly7TUZMbMMrvB
         lJFTPaI+M4Qu7SmiHwYo6bhM0V5I4oWiHfORnauSeWkI5979jQpUyo6Nkiw0tqmUvxBJ
         RXAw==
X-Gm-Message-State: AOJu0YyfN7PFR6LIu9XOjdRMZhZgds6PI0J8klk+qe4pkbVtk7qg3KOr
	ttI+2ixZzBEixGyim6twv2I=
X-Google-Smtp-Source: AGHT+IE/Ke/Uk0fxKu5KS7ehGDiXvlyE94ch6A2hvBPPzXjMdCuybzm14amvuoqAIYnK6sZ+c6K33w==
X-Received: by 2002:a25:ae0d:0:b0:da0:d0be:ef06 with SMTP id a13-20020a25ae0d000000b00da0d0beef06mr3332873ybj.51.1700366547794;
        Sat, 18 Nov 2023 20:02:27 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id el8-20020ad459c8000000b0065d105f6931sm1877264qvb.59.2023.11.18.20.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 20:02:27 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: linux-kselftest@vger.kernel.org
Cc: kvm@vger.kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	linux-kernel@vger.kernel.org,
	shuah@kernal.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH 1/2] [PATCH,breakpoints] selftests/breakpoints: Fix format specifier in ksft_print_msg in step_after_suspend_test.c
Date: Sat, 18 Nov 2023 22:02:09 -0600
Message-Id: <20231119040209.40900-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

In the function 'tools/testing/selftests/breakpoints/run_test' within step_after_suspend_test.c, the ksft_print_msg function call incorrectly used '$s' as a format specifier. This commit corrects this typo to use the proper '%s' format specifier, ensuring the error message from waitpid() is correctly displayed.

The issue manifested as a compilation warning (too many arguments for format [-Wformat-extra-args]), potentially obscuring actual runtime errors and complicating debugging processes.

This fix enhances the clarity of error messages during test failures and ensures compliance with standard C format string conventions.

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index 2cf6f10ab..b8703c499 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -89,7 +89,7 @@ int run_test(int cpu)
 
 	wpid = waitpid(pid, &status, __WALL);
 	if (wpid != pid) {
-		ksft_print_msg("waitpid() failed: $s\n", strerror(errno));
+		ksft_print_msg("waitpid() failed: %s\n", strerror(errno));
 		return KSFT_FAIL;
 	}
 	if (WIFEXITED(status)) {
-- 
2.39.2

