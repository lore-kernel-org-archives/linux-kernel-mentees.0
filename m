Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78238BF9C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780239228; cv=none; b=h03ZEMNxZKny09pMy5sI/rVL6NgZMZwV7s0x/sLwc7za/ftRoAtmjLtrNR+JCZFR61RuqCkUVqKEdqBkwwuMUGQztOhQC4CCrFt6HaoPmg++mld12fG/plCOaScFp0pYcBVPrWQcL8WLOLGA6aCpXlfY1AXM8UzzNqZPaj47rb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780239228; c=relaxed/simple;
	bh=XK51geeL3+peWDyqzG1dtEA1t9N0Y1/v6t0z4dZe6eA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5NfFAip0PHAT8zhAeROc5twNParqQiUG12cB9CIq74oK0sN+HafqZVfpm8RPO1s4LFo/I8yvV7ajy1SfjHC9N+xpCmzG1h5BpFwzKgYY5Ed0w2lipF06MxosYjFVKmO3oxX0TRRm/WslF8o9+G0ItZQGVVqL96D1yqPek6MEq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwA1Yc8I; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwA1Yc8I"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBAFA84C61
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 14:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qWLMFcHAm5aR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 31 May 2026 14:53:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=hisamshar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08ECB84C5E
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08ECB84C5E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JwA1Yc8I
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 08ECB84C5E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 14:53:45 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49039a8851fso95480075e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 May 2026 07:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780239224; x=1780844024; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFQehZMTwDLdoBhXrsPY8v0PLCjeGjVTdtI7THwMy3A=;
        b=JwA1Yc8IqaC8nC26eTaIaYuJNl4tpni2F8ytjMRU0bJbbeRWFuBJT98xr4qmb59Wf/
         Cj9/TA+9WXSs1r35qLRh+vRjblcxPwGfRoqqGY4zqxXZoDsUoD0xU8iDveGeGjm0aDJY
         eO9bBom2OU8M0l4RM8YQWjl32i3zL6VLnb2NBn/qinMhvVFhFtsD+UAPaGUybMLc9ltK
         1fCYiijuFwn9GGJNKAad6bTC6SxW9Qm4wybMcCET+cqbTZcEZL6/DH/0WyM6YulELE5c
         Gk4PCs5kfnBy6odb37yMwTQ7IntIv5k/0Ks1VlZFPYeWVOOhiPOxNtlXRZ1eYCLt24mQ
         J3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780239224; x=1780844024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFQehZMTwDLdoBhXrsPY8v0PLCjeGjVTdtI7THwMy3A=;
        b=bdsfYEAUBphsMjxlRSkSSuOWWzbvGHqCTNCyMH+gEZkLwpsIggKGvottN5W4UEloeJ
         HTmuOAxgwEeBD3VpEQT+jPPnUKoDKZotgsmPiazEkdc8Ul/t/BJRTH4khC+IFlWqVqDc
         X7wpVJJF/pqvByMKqAuFWaPQFR6V3E2vlATDVRmDRHknyQEDyOc/IQddERvF6CKFlFTs
         YSWFUoRLvhPfxAUqSu7YeRQhPshISAPkHXjtZduIJLkHPrWxnuZXqsQw6t8ce/pMjXLI
         GDpWrtvdwxVsIDUsWEtQTbIHrLXV0GMfrVu3aJmv6mHnK1++3j1bkYEqBdwsmkC+z3nS
         O47g==
X-Forwarded-Encrypted: i=1; AFNElJ+tbotfIHUIm9dkZ/6woMvDkJ9PtoXRMDUtUadZZEII34Uhwpt8v6I8IYeAsnOHp728jwXgdAcdxPmOf8+mlSKXcl8Hdw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwQydWouhaM4pzZC/4WuN3koY0ec36moIqrc8PZawEkmSvQyrE4
	X+9gYrXe2kLvg4mRIv/cdwbVbmI3uipjAh+463U+TTyJfW3ousCYewB3
X-Gm-Gg: Acq92OGNfCCoRnnNXUUc51uEWIhMJApuAjRYl3TgjVMoIvMQ8BJYhzd3nqWOdWyfvoY
	2cZO3+eFS5y83cH5nkG6aCJqOjPrv6wMu5wYkBOeMjaxMtbrs77EGDHVbKMbAn/3m0xV/FWZfM6
	NcMGCSy1/JM/hK3IToy8nhpXX9ZwPLSLOYAN8+whT/PsxUhmWI1fGIve4QnDs7dtCgccCrFFxXx
	H6uO925/OcO/ooZ6Zr7/zIAOVsVqDiEfeA1MPChx7QSVLUlQJ+Q/aXMiQmFxO/9FAxP0TZTCtch
	1dM78I5GK9kGl7pM3n1ygtAl3/8S7i383HO2Jm38s+ukIhBb1jG1lOaiyzmAizAX1834HdEbhxQ
	jcQ44yz5fjJIe3KKNioQEMDmZSsDP9W0lnVQsJJ75PSm4Hm1b5OD0FowGrSGQvul8F1GA9NwfF7
	GgFT2XWUZ6nfd5+tLytgd+Bc4=
X-Received: by 2002:a05:600c:4f89:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-490a292ed68mr133428765e9.13.1780239223323;
        Sun, 31 May 2026 07:53:43 -0700 (PDT)
Received: from hisam ([39.40.47.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0ad269sm59217195e9.11.2026.05.31.07.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:53:42 -0700 (PDT)
From: Hisam Mehboob <hisamshar@gmail.com>
To: pbonzini@redhat.com
Cc: seanjc@google.com,
	shuah@kernel.org,
	me@brighamcampbell.com,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Hisam Mehboob <hisamshar@gmail.com>
Subject: [PATCH] tools/include/linux/types.h: add ulong typedef for musl compatibility
Date: Sun, 31 May 2026 19:49:36 +0500
Message-ID: <20260531144934.403888-3-hisamshar@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building KVM selftests with musl libc fails across multiple files
(e.g. memslot_perf_test.c, cpuid_test.c) with 'ulong' undeclared.

Under glibc, <semaphore.h> includes <sys/types.h>, which exposes ulong.
Under musl, <semaphore.h> includes only <features.h>, <bits/alltypes.h>
and <fcntl.h>, and does not include <sys/types.h>. As a result, ulong is
not visible through the current selftests include chain.

include/linux/types.h already defines both ulong and ullong in its sysv
aliases block. tools/include/linux/types.h mirrors ullong but omits
ulong. Add ulong alongside ullong to close the gap.

Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>
---
 tools/include/linux/types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/include/linux/types.h b/tools/include/linux/types.h
index d41f8a261bce..ccc90dd4baeb 100644
--- a/tools/include/linux/types.h
+++ b/tools/include/linux/types.h
@@ -42,6 +42,7 @@ typedef __s16 s16;
 typedef __u8  u8;
 typedef __s8  s8;
 
+typedef unsigned long		ulong;
 typedef unsigned long long	ullong;
 
 #ifdef __CHECKER__
-- 
2.51.0

