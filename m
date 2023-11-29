Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71FC4C9D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIbQLijA"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE15A417B9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE15A417B9
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kIbQLijA
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSLMp5x__a12
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 03:46:05 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 20EA64093C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20EA64093C
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-67a3e0fb11aso17826616d6.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 19:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701229564; x=1701834364; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50NgtX7SvQ7Ubnw7wnZdr9/ovViujYpH8S6F31BeVuI=;
        b=kIbQLijAWCB2V54JbgwCQcJz9c91a6xme26YMSYJVtgGAckj6rCBSXwdsbqEek5/KW
         pTPgqGgZpGvcycWaMKGs8vgrTVlOZsgiWD4Rf9Or/CucIw9Y0gEDgCKnIgdpciP6TDq2
         rxj235mai+7mkkYb27ny59fr9oTSDzsx5TODjT9hE3NjZc5gxryrQrm2cPKLPgxZjdcc
         LJmKtRGlled3kV1Pnle/htVPwcPDVVXxiieu7z9+oCjzKWvF3O+ss/PrUz5tto87pCCk
         mhrq+YVUUdfJVnh9YlRWigUywCBtgdobuO53p8ZdOlpW0zNFEobCkf7ghLIdbYLaW9uw
         XJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701229564; x=1701834364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50NgtX7SvQ7Ubnw7wnZdr9/ovViujYpH8S6F31BeVuI=;
        b=SmgL9oWCvX7uAeHvsVulZBhJ339ZYNnDv7LS4rad++G0bNQTONf8g+LNfvxXl9AYBE
         2b6EjReltOtNM5fkg3EC3lT39ZDbQ1mlqjbWV/XH9XK2Zd1eB2T5xZy2/aIyCuK8yTd8
         +PhfvMr407+983PGlMZlxxWWZ3EIhgMwRJlBGKy8xM/1PsZ5buUjtB3Nch6NpyRc+bze
         MliPL9lWQzm/1OiID6Q0QbHMExVSf2EpDBZvXiEKPPDSjMGlVyBaxpahnOdIbJM0SVWD
         WNELJFfy3FEMhoHuCUejwOFICju9Q3JVwsnfIQkbm+xwm1sLu1e776tkeb7SL84hNdcC
         1dVQ==
X-Gm-Message-State: AOJu0YxnVdpxN7Y+Wtc23DmUWILmr8IPtKxYC0iYzVHBoknavxxRENwc
	HSHfTAhcEGCYWzp+CMELo38=
X-Google-Smtp-Source: AGHT+IHFkdWY6z+ESxpeYzxOj8MBjfPGl3gnCqPYymnVMncuFnlo83TFW7xMNwnxW3JIhr5arYCmpQ==
X-Received: by 2002:a05:6214:892:b0:67a:3efb:df5f with SMTP id cz18-20020a056214089200b0067a3efbdf5fmr10622237qvb.0.1701229563907;
        Tue, 28 Nov 2023 19:46:03 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id fb11-20020ad44f0b000000b0067a1201f3cbsm4882805qvb.100.2023.11.28.19.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 19:46:03 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] selftests:proc: Resolve 'Unused Result' Warning from proc-empty-vm.c
Date: Tue, 28 Nov 2023 21:45:56 -0600
Message-Id: <20231129034556.5719-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

In tools/testing/selftests/proc/proc-empty->because the return value
of a write call was being ignored. This call was partof a conditional
debugging block (if (0) { ... }), which meant it would neveractually
execute.

This patch removes the unused debug write call. This cleanup resolves
the compi>warning about ignoring the result of write declared with
the warn_unused_resultattribute.

Removing this code also improves the clarity and maintainability of
the function, as it eliminates a non-functional block of code.

This is original warning: proc-empty-vm.c: In function
‘test_proc_pid_statm’ :proc-empty-vm.c:385:17:
warning: ignoring return value of ‘write’
declared with>385 |                 write(1, buf, rv);|

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index 5e7020630..d231e61e4 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -383,8 +383,10 @@ static int test_proc_pid_statm(pid_t pid)
 	assert(rv <= sizeof(buf));
 	if (0) {
 		ssize_t written = write(1, buf, rv);
+
 		if (written == -1) {
 			perror("write failed to /proc/${pid}");
+			return EXIT_FAILURE;
 		}
 	}
 
-- 
2.39.2

