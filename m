Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E16481B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnlalIRp"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCDD041797
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:11:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCDD041797
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SnlalIRp
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vf_aXGPPQgkR
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 28 Nov 2023 22:11:35 +0000 (UTC)
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1C689417B0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 22:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C689417B0
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-77d67000b69so343288785a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 28 Nov 2023 14:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701209493; x=1701814293; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=smmd9kiR3daHT08sErSgxntxOfc7UlUmITupKqw2V0c=;
        b=SnlalIRpCUyhvfb/c5kaTigraAtB63yT9WVM3PQE+7eOhq/dmR69/Eb9i4QmBaaMXj
         PPIgjzmAqRYzK2VwK25zS+qUxeGiZaOLg4I2TlJNKKBTqHjr5uhPZBD16lgL0nczfY4N
         wyLC4p1USM/rF8q1WRr6QzO0dCg7UNMOOCikfZ3Z9vm1ZYjsBKae9JWJoKVMqhCF9c5/
         7Eau1c0QkNDchsTE4IOlX+M0MtdC+Ht2ovFoza+DJiIEq9pvvfpm3hla4X26eDtwVR2+
         sZfXattIuixovyZ2bNNyXxbafuTV2k2j3qohHGO2hHg66r6TndyGeSXG7pfLPhn2Qsd3
         bUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701209493; x=1701814293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smmd9kiR3daHT08sErSgxntxOfc7UlUmITupKqw2V0c=;
        b=aEU9FcUdITNBOMbk6uMKjbrw9e6x1IWNZYBm4X4x3UApoIUvjx0NDlwVZ+ic+nf42v
         sp+sRPwE8w9tdam/2TQRMrYjlQVZtQSBJOL8Ew2Vpczm8boxwEe1X2sMi2H0l5EfIs1d
         TlZ1blpuofSRX3TgXhYGWpE0/CSZukTQmA5hr/SIuFOvZnhDVJBBFTt/hiXvu+mI1tuN
         1pVX7/Sd1nAbw0oGey9fL9h2t8u7vs/ePQnKZSGp0mNIoCnsf3iM+tJEJLxZp4LEpLYo
         HInkLQEgS8yReu56Hp/iexFA2o5/k327pVq89Y3n7d9a6eiNUSrItOh/GAg93qGdCgNL
         Q4WA==
X-Gm-Message-State: AOJu0YyqI+jOVGKsXaA3ttDX552FblRxxIHoWeynHyQK/gN5FHCpnGbH
	bDIGYy7BQxtTeCdaqMNW7dg=
X-Google-Smtp-Source: AGHT+IHHqwVc8SvRXmif3h+061EREXCzwmz1UC8lMM25VJt2rpTg19U4o5b4qIr0XZad2Fj2jk4P1g==
X-Received: by 2002:a05:620a:8718:b0:77d:5c49:b4f3 with SMTP id px24-20020a05620a871800b0077d5c49b4f3mr15289011qkn.47.1701209493722;
        Tue, 28 Nov 2023 14:11:33 -0800 (PST)
Received: from angquan-linux.. ([72.36.119.4])
        by smtp.gmail.com with ESMTPSA id ea11-20020a05620a488b00b0077d93c7c785sm3144056qkb.119.2023.11.28.14.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 14:11:33 -0800 (PST)
From: angquan yu <angquan21@gmail.com>
X-Google-Original-From: angquan yu
To: skhan@linuxfoundation.org
Cc: shuah@kernel.org,
	seanjc@google.com,
	pbonzini@redhat.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	angquan yu <angquan21@gmail.com>
Subject: [PATCH] Resolve Macro Expansion Warning in nx_huge_pages_test.c
Date: Tue, 28 Nov 2023 16:11:05 -0600
Message-Id: <20231128221105.63093-1-angquan21@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: angquan yu <angquan21@gmail.com>

This commit fixes a compiler warning in the file
x86_64/nx_huge_pages_test.c, which was caused by improper
macro expansion of '__TEST_REQUIRE'.

Warning addressed:
- The warning was triggered by the expansion of the '__TEST_REQUIRE'
macro, indicating a potential issue in how the macro was being
used or expanded.

Changes made:
- Modified the usage of the '__TEST_REQUIRE' macro to ensure proper
expansion. This involved explicitly passing the expected magic token
(MAGIC_TOKEN) and a descriptive error message to the macro.
- The fix enhances clarity in the macro usage and ensures that
the compiler correctly interprets the intended logic, thereby
resolving the warning.

Signed-off-by: angquan yu <angquan21@gmail.com>
---
 tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c b/tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c
index 18ac5c195..323ede6b6 100644
--- a/tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c
+++ b/tools/testing/selftests/kvm/x86_64/nx_huge_pages_test.c
@@ -259,7 +259,8 @@ int main(int argc, char **argv)
 	__TEST_REQUIRE(token == MAGIC_TOKEN,
 		       "This test must be run with the magic token %d.\n"
 		       "This is done by nx_huge_pages_test.sh, which\n"
-		       "also handles environment setup for the test.");
+		       "also handles environment setup for the test.",
+			   MAGIC_TOKEN);
 
 	run_test(reclaim_period_ms, false, reboot_permissions);
 	run_test(reclaim_period_ms, true, reboot_permissions);
-- 
2.39.2

