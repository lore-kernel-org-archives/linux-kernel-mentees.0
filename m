Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AF1262D0F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 17:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294343; cv=none; b=S0pEgS5+HSHFXuCuP+xlPes6f0QLqniPwU7DqqnQ0DG1R6s6zyJiFP45jEZo7mwgUxyBzL+QL8RLY30mtmBbH7KUV6KxYGt0H1/urYFRCgEePFawUeR/4ctR0hUW618/fwhIRcDIHEMYV89kcedBu9Js+huZdzjc9BfzotWjxUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294343; c=relaxed/simple;
	bh=46fylAvEHtnXMlyZUGGrL1coSoEAkjdGaGeULPheuaE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DhhfUVRAiWIcf8Vvky3YazGMNgKvTRbS7oH+EAWTRaB7cJol+PpC1GeH17K/3sgn4AZOI9Z2ad+m/gs6we7dFiwgWvXgikPCckYFGwZM2ovFBsL9quqO97WLrB9r+gGZDhPazhJJfkLABkTtpLMcnL8LI/wx6Ey98Tyuq2meWT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jddi7EGK; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jddi7EGK"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EA4B41219
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 17:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqkKa7QNd40s for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2025 17:18:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CBC6C411F7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBC6C411F7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jddi7EGK
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CBC6C411F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 17:18:58 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f53ad05a0so73567455ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 09:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739294338; x=1739899138; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvTs3sUoPdnFwabnWM6p9qo099kdAYJODbc1UEXBy8U=;
        b=Jddi7EGKCYEgAXXCs110jsJwWz6SjQFnd+/qvMIvRH90ikYHxECJfrK82/0OijfgFo
         zUjYFUTeQbwzF1yQZ9m6nt+x71TKFVX1pcDZLWCIvGy+zjMcNUJ9avFUnxn4wJNwqznU
         4zc4hMw+E+seJM/iJcMTq/MNhqpJ+TThsT/Y+FiQUWQtkoPJf7DA+mqqQYPVANJxtuxZ
         Py3ULMvQSI1S9RcRUGnDIfsRYwxL/tmeJ0finkp3WC/c+jnbpsnqv4r+3bdqX0p2UA6u
         BuRCaQK3JipMGfETHRSEwHGmi9OPr5QaIIdrmAWmJWC8bCNFQhOSun9/5sbSA+U3eVvS
         sjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294338; x=1739899138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvTs3sUoPdnFwabnWM6p9qo099kdAYJODbc1UEXBy8U=;
        b=DCDEB5Gw2ZE2v2jGZ/8Xd9LcDMstlHG0VmhF7le1XYptEhaw32YcYYSqn5Bth44z33
         o2IX8XqmpykIUbxW3/AMNQKddvt2N6e8Cwm0u8JtTbMcW3eHR8cxqnY6Y4RCtLJAqPj0
         doE4kKm+TAG1VgOnSPO5QNKXj3zPT/aZcqBPzCHBl079nxDqs+aQ8vFo+cmC9qd9zibH
         Z93rIp3EFAA1xmWyc2JLjDbq93fsyVS/YCAONbeW5hEFDxVlTYcJ1+kJPwDqPO99Ro+i
         +ZT63wAANZ8gexv7JDVRTvodUjcuDn+EfEOFgeu+WKOxQJPIneYbIezfUDc0llW7L8RH
         cqFw==
X-Forwarded-Encrypted: i=1; AJvYcCWvNCCHp2g/uSMBuh8Foh3UU7hvYmaBTZaAoTFMqxT4D0sVBEgzEmwjMCug8eQ1SZnaGaMSZIt8aLzJJ0EyJFxKuqOXmg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxMI8a1O6BLHS46Sle7FIF56tWfOZcjiEiS2jYYQvTrcgD7ECtc
	yga6Fv4jwZ0iBKOg6CIHD4eGF2mW1LveSKPJ41j45loOAqvIcJtw
X-Gm-Gg: ASbGncvr3YJo8ShE+lgO1IFNOLRbRLq91eT9Jmt6pjfnNWEiQ4ZK0SkvRSAGsop/WQr
	o5UDng9qibo4jOWKxftMJRPlVagjo6jAciZyJSP8OofhJI+VKELm7NlPtDKRTCkzZ5/megiYAjL
	NX5fhQEzjNFh45jxyNwb0aNJ/2iUaOR8PTEs3iJuvJBjplg0+EPWZ3rFTQixqcEQe8LcGRWqz9F
	YwyzJwvCbivz6yiqL40Oq9Ai166JtbGYYgcwkuROiclPzKFqu9iMPjck6jUrS3FKm5pk5Z5hdMg
	15vsVAsHnsnA0g==
X-Google-Smtp-Source: AGHT+IHGyEMJg6t4z4hfLWHpwGxDh0+tcPeAiBL2zQ2M1KTtye6HXBjLORl4c29q3fPTksaPmwVmBQ==
X-Received: by 2002:a05:6a00:1884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73217f8cb8amr7070819b3a.20.1739294337814;
        Tue, 11 Feb 2025 09:18:57 -0800 (PST)
Received: from fedora.nitk.ac.in ([2400:4f20:11:c00::100:3432])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308540cb30sm4802452b3a.115.2025.02.11.09.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:18:57 -0800 (PST)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: tj@kernel.org,
	void@manifault.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] sched_ext: selftests: Fix grammar in tests description
Date: Tue, 11 Feb 2025 22:48:48 +0530
Message-ID: <20250211171851.1518556-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed grammar for a few tests of sched_ext.

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 tools/testing/selftests/sched_ext/init_enable_count.c | 2 +-
 tools/testing/selftests/sched_ext/maybe_null.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sched_ext/init_enable_count.c b/tools/testing/selftests/sched_ext/init_enable_count.c
index 0f3eddc7a17a..eddf9e0e26e7 100644
--- a/tools/testing/selftests/sched_ext/init_enable_count.c
+++ b/tools/testing/selftests/sched_ext/init_enable_count.c
@@ -150,7 +150,7 @@ static enum scx_test_status run(void *ctx)
 
 struct scx_test init_enable_count = {
 	.name = "init_enable_count",
-	.description = "Verify we do the correct amount of counting of init, "
+	.description = "Verify we correctly count the occurrences of init, "
 		       "enable, etc callbacks.",
 	.run = run,
 };
diff --git a/tools/testing/selftests/sched_ext/maybe_null.c b/tools/testing/selftests/sched_ext/maybe_null.c
index 31cfafb0cf65..aacf0c58ca4f 100644
--- a/tools/testing/selftests/sched_ext/maybe_null.c
+++ b/tools/testing/selftests/sched_ext/maybe_null.c
@@ -43,7 +43,7 @@ static enum scx_test_status run(void *ctx)
 
 struct scx_test maybe_null = {
 	.name = "maybe_null",
-	.description = "Verify if PTR_MAYBE_NULL work for .dispatch",
+	.description = "Verify if PTR_MAYBE_NULL works for .dispatch",
 	.run = run,
 };
 REGISTER_SCX_TEST(&maybe_null)
-- 
2.47.1

