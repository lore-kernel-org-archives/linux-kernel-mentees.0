Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA530539C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKFU3rX7"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6280A408D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:36:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6280A408D3
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HKFU3rX7
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zKVBEztGMzxV
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed, 29 Nov 2023 03:36:28 +0000 (UTC)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B19614088F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 29 Nov 2023 03:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B19614088F
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5cd0af4a7d3so65093577b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 19:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701228987; x=1701833787; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qhpsd/CJqEzY2wViCgUIbvNNXzGivZKIEmu3PQkzhVE=;
        b=HKFU3rX7ayccr4X5tn8HaZD3oP85eqQ9kdGCCMBf0qnKo6YHBq8Ie5rc6obiwQ7n2b
         mx/CHfnGCSiWXeOAJe5AB7sQSRsRaBmeZM7x/FyBRDm5ycR0ns36+1WY8K1jJ1Z2RUy3
         Q5MuiveZazLN2rNGW2FzvExf7A9NqO425zQZd6qKMhfYkY5sYHwIrdrMXrwm/wcdx0Ro
         2d5bMWhBcn/e9KTD9kUA3ZS7f5M4oyV05PyBJDSKPGDMuPMKI8b+Z9rqVqfey6FCIDyG
         3ZjBLB/yxfuCqLBIdTU+dg0O/p4wjnbHHfWxEdOehLfAz/5bHgWQB2qkA4MzF8kTB5HB
         KwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701228987; x=1701833787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhpsd/CJqEzY2wViCgUIbvNNXzGivZKIEmu3PQkzhVE=;
        b=cIsoD4lP2WkrKg92OKMBzI2TQH17H7gshN6PGEPCFDL44eoLwNMSGULqcJQGl16Euq
         E39Fqc7RIhdztUH+nNjytlTKK5P4HFb1DdPf7LKDv4V1ik3xaXDWU1Fn8tkisEKkDysr
         1BzsfxunhMiArauPyuLY/kblgMwNT/47qVdlzyB9qgEk/jik6yvpmVz7ezPkYnQlqalY
         J0+IrOZupQyG4ThaEghFPpKeArspsY0Z4OpPrAPFFJwyNRXJ4cxVScLn+MXu4tZCEh2z
         MH2/zjB85hD1JA+aKVUKwgj7iRZrLzp7DKAfX3elVo++UJI1klj8ldRa8KRVwGT3S2G+
         NPzA==
X-Gm-Message-State: AOJu0YwM421Iy+d7MLxge7sBDBGpcAZ1YiFMFhkhBGZ6RrBBx9NttOqZ
	oC/NDlequ9UC10SjR4/ysHY=
X-Google-Smtp-Source: AGHT+IEYDxU9JuPKASBFJDFF8v4y5UuoZ6eVXG8K+0j41N8DcXcmVAbDc+BthCLyChsaWyTYWMk5pg==
X-Received: by 2002:a0d:c983:0:b0:5c9:86c:216c with SMTP id l125-20020a0dc983000000b005c9086c216cmr17462276ywd.46.1701228987546;
        Tue, 28 Nov 2023 19:36:27 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id a24-20020a0ca998000000b00677a12f11bcsm5726238qvb.24.2023.11.28.19.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 19:36:27 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] selftests:x86: Fix Format String Warnings in lam.c
Date: Tue, 28 Nov 2023 21:36:15 -0600
Message-Id: <20231129033615.5083-1-angquan21@gmail.com>
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

