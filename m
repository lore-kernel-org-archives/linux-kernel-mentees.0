Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19333526B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0qTYtmG"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3433A4093C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3433A4093C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0qTYtmG
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHU9TJsPA_NE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 22:46:25 +0000 (UTC)
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7BAC84091B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BAC84091B
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-67a2443658aso17797996d6.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 14:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701211584; x=1701816384; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhpsd/CJqEzY2wViCgUIbvNNXzGivZKIEmu3PQkzhVE=;
        b=V0qTYtmG0iJRYGoeSxHJm+tiSw7rV+jr1yEeW975zCZSYIbJcpirU7TfMN3Ari9pYq
         s0k/xa8HstMY6Prx/qNl5vBKxVqVVslq3lDNt7RK9MmGYWEXiu+tUJ/HZWYbtbbtmqSs
         zJvuXZ8j0c20NEOUte5qzqedNpxj12EumDqIXynyOKJuzASiWWFexRlQPp1a0Kcowemg
         fmT2KT8kDiTsAO1qPtA0G+DzLvlhP9Q+ADKpMHHbepIAH0yD48JkVquiNpeNu3P2Aqob
         +QQFU5r8ACZCeMkFr+tI/g+H3TXnS5MFwagKJaTLEfOtR/1/9HmO/c0N3E4Nm1zMyhSl
         KxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211584; x=1701816384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhpsd/CJqEzY2wViCgUIbvNNXzGivZKIEmu3PQkzhVE=;
        b=QPMZzEFFn53ZvukVzAjNNmq1Rqk1RKLcZFfhoKGkHpVV1YE6X/iPzEQnzBLcYGdTze
         2kVmyPg/saO39Rg0RPCBKZhcS3mHs2l4xy4G+fdMGRii6QeiarVrLErTrFnujeQBOMPC
         gb+p1ey5rPJRRHhQ3wrv5byFsuCwGG56fZ4W9htCLvgTJdasXtOe5u1lmNvQxpzJYroN
         8GM035XbYAkTXBFmqLCgHIyKcnsgtox6tlLgwzhB4kMydC1Dsl12f5f9h7WvrZdWuBHf
         7y2/bhYAcY4vQKK6G8lTHlw2FPncJCsktWCliwm5WalysmyrXzdFnL1Fk7u/5Ns5GZjP
         +JgQ==
X-Gm-Message-State: AOJu0YxIDtA9qMb/cNku9rSsG7cfo8CrrXt/jfRpajshCAyoDYLb4GSC
	paYjrgSC6IL6RZ83yMzuPbQ=
X-Google-Smtp-Source: AGHT+IE6pRwhOTqRhINFN2eazXP7q4ErDCKPBsRwJZFUkJDiwFErGp8qdvqAseNy6DBU+RYnFDa6hQ==
X-Received: by 2002:a05:6214:806:b0:67a:590a:18f6 with SMTP id df6-20020a056214080600b0067a590a18f6mr3626618qvb.51.1701211584122;
        Tue, 28 Nov 2023 14:46:24 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id em15-20020ad44f8f000000b0067a543e6379sm1336565qvb.75.2023.11.28.14.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:46:23 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] Fix Format String Warnings in lam.c
Date: Tue, 28 Nov 2023 16:46:07 -0600
Message-Id: <20231128224607.71334-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

This commit addresses compiler warnings in lam.c related to the usage
of non-literal format strings without format arguments in the
'run_test' function.

Warnings fixed:
- Resolved warnings indicating that 'ksft_test_result_skip' and
'ksft_test_result' were called with 't->msg' as a format string without
accompanying format arguments.

Changes made:
- Modified the calls to 'ksft_test_result_skip' and 'ksft_test_result'
to explicitly include a format specifier ("%s") for 't->msg'.
- This ensures that the string is safely treated as a format argument,
adhering to safer coding practices and resolving the compiler warnings.

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/x86/lam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/x86/lam.c b/tools/testing/selftests/x86/lam.c
index 8f9b06d9c..215b8150b 100644
--- a/tools/testing/selftests/x86/lam.c
+++ b/tools/testing/selftests/x86/lam.c
@@ -817,7 +817,7 @@ static void run_test(struct testcases *test, int count)
 
 		/* return 3 is not support LA57, the case should be skipped */
 		if (ret == 3) {
-			ksft_test_result_skip(t->msg);
+			ksft_test_result_skip("%s", t->msg);
 			continue;
 		}
 
@@ -826,7 +826,7 @@ static void run_test(struct testcases *test, int count)
 		else
 			ret = !(t->expected);
 
-		ksft_test_result(ret, t->msg);
+		ksft_test_result(ret, "%s", t->msg);
 	}
 }
 
-- 
2.39.2

