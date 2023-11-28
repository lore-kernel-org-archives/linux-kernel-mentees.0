Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7655A42A8E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlPuau6H"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C53C60BF8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C53C60BF8
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TlPuau6H
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SdsXuAJKoLkD
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 21:29:45 +0000 (UTC)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CDFE960BD8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 21:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDFE960BD8
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-58d54612d9cso2003893eaf.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 13:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701206984; x=1701811784; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=50NgtX7SvQ7Ubnw7wnZdr9/ovViujYpH8S6F31BeVuI=;
        b=TlPuau6HiSV2V27MTLu7lEmYcqXZ3JYJwggYOf1du2lYSCsHMqA6TfcEOB5G4x1bJc
         yjjB+sFbtNSbSgNViNmQM//o6RX/wxtvcWsW7IohvBGlIKQDOXDoR70NMrUS2EeSpHbr
         JeVst6Pc2z6p9unat0YSJqd8+Q7oPmj1kIjOz7eLmXvH2YbEy0OUmoC26kzEThojHGfR
         WwICJ5qON5Tlow6i9rAN2junVwCmxAXAT5TcuVOUlJFBBNlTQuZYo98txskOmd0hveoa
         JGzoNo8iHFv2CbWkMExSb9UTWHB4hhpmiMV7cgFoj7gKXjsQ+zoxVycUigGLGhs66N9w
         WD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701206984; x=1701811784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50NgtX7SvQ7Ubnw7wnZdr9/ovViujYpH8S6F31BeVuI=;
        b=go5SJ5BJLiTjrO69rVxTeyGoB0ADACpUJtVfu18sCxNfSU/OiX2A7j7nDUK6Krr05n
         84/K/SM99onN5DJOM/fGTy2mXC7+Iv+jeSkrxc+bb69QgEBl+qt1zBvbTR6J9QgiDx7y
         I5QA/1Fvw/DzOLrPJlHF6JqNNp3exAO9nfKtcwJL6rhPqxfedJkNa/SfObTh5gke15/Z
         bxuMa0uaX8OGzulAKhXTilVpiIEyWKoDfwjd1vvPw61D/uMQhcAcKAToCl0xgcROrws2
         4ASWQmZAB14TxoATGSqclvLEpEWCsrt2EtQNP3xUSsMTethlU0zOw2Xj8JRi2csOJTCa
         1n/g==
X-Gm-Message-State: AOJu0Yy461pe0Sx3Qih54TnZJNIdQmZyQzf1bb47TVAUdURZX9dLn+v8
	EJeZ9HukFVq8V931giTWybQ=
X-Google-Smtp-Source: AGHT+IGoswHYUfxHCB9J9zdO0iBkdDHzl9EW8tcmrjnfJTMp+HEs56LooAoxnz1sJN9WJ+Oji2aJaw==
X-Received: by 2002:a05:6358:106:b0:16e:13c:ba48 with SMTP id f6-20020a056358010600b0016e013cba48mr16308704rwa.0.1701206983758;
        Tue, 28 Nov 2023 13:29:43 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id t2-20020ac87602000000b00421c272bcbasm4880712qtq.11.2023.11.28.13.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:29:43 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] Resolve 'Unused Result' Warning from proc-empty-vm.c
Date: Tue, 28 Nov 2023 15:29:27 -0600
Message-Id: <20231128212927.59313-1-angquan21@gmail.com>
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

