Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9947E107
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 28 May 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748409822; cv=none; b=az/AM7IP/ieSX8tuVcJ44YTTgSjWi9Q3imf5FmOT7iBnHuv+km69SVCaqMwI0I3uPQ2LQ5/q5LYFWWP2Oi/eEFViBERGj4RTKpKBR9xDbKKfGTYaOcGlvnDsv469tAmfIlbWglvQLnp9W37nBZpki+ZDLHi9dgdIewJyw6tlQxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748409822; c=relaxed/simple;
	bh=OMnGfda8KClSL9GGHmUONx3gMKPVl27s+0O8Uijwykg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOzGONAflsc/6Fz0sjBn++GcSVC5TFvs2z67UcRZvvIx8Iys86lqZudvsZTUQIWBWbjuE0ZflgOXuyNIG68qnhy6DwrFAdk9qiyHuYM715h6WXO78GxIXRg+kuGIS+xpT+U9mY4vn+IvFW362IAPCE/GdlWRVSoGlvWY/lfd7ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=N6BBJEk+; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="N6BBJEk+"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so83694339f.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 22:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1748409820; x=1749014620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wenxtdrBK9XwmMmiCLqhXCe+oFW2gyHDArCJgDTJFDY=;
        b=N6BBJEk+FNkJKkHqwMJhc5c37gjmpiTDsQaNT9sJVH7kcj+BgkF8h1e8DLR3ZwEEN1
         z2WsyQ3R51wGNLiir585LTEt5bSeHpzel1YJZvEPm3XzbKBfPPgYtITwYbWrT6AFDi23
         mDN5ODLUgNaPUG4JWgPVcYgbn0vAIhtR9oFMpFYVHpydvs24IS+pzZWDrKtB8gMn0v84
         R1iTbVEMEmGR7nWeTFCDknMF3reSDtC1v9Tqkssk6XJ9y98Xlj1xzrUROdG6UQBz+39t
         ra7mfaP4AAa0LTsL4DDlOKt0h+Br8UbX/mBwufq82yFhe1QEq5pDPhojr+kkXg/p/wfm
         m8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748409820; x=1749014620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wenxtdrBK9XwmMmiCLqhXCe+oFW2gyHDArCJgDTJFDY=;
        b=atkqj0Sm2IHOsqPDnp8fAASA7FOLHB0Rv8HTCYsVv6nI/Ccmy3OkVqzpjlLYE7MI0t
         FjfEymfyoVH8qdmXo8SlT/TjIPnisRguIcmcQiPTogRB34+/AVJqLiX1trb/W3lTweWs
         Dajya7yQc1rZZYwaI6Nndfha9pKv9qZskgQJSk4I38eqKcGyD/Ym3Nta2Rpf33ZvlQyc
         l3eHbynxijnsldbSzA4oKlzmL/rzib0IemNx/uGU+vxHGFfSxXht+2iDlHGMhhAAN347
         bNs4DjmkIcae6AJFboWslHMyPuD01Dx+3iUTWgzg6XiGJM354V2h2WgmLOcj+aOqxusb
         9Lmg==
X-Forwarded-Encrypted: i=1; AJvYcCVhNkmX9wAV2D2raOZ8ISvhDyAcIvM0lkLJd0CpWekNz7JVCppX+1if+mdFPhvD5CDBet5+AdLx2GjgvYSnYNrA9ig/vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYbholQESSt6u4dxOu/1gw2JOtPo11pTmoRFsvG7De+rWPFDw9
	I5RMky9kT2AweVnPPwFYsXgdEnUX80niuWJ+Maby66khghB4CFB0xdKz8RZ1ygCl+m5JuvIIJTq
	H2uFY6w3/OIKU
X-Gm-Gg: ASbGncte9wOuJnZA53cgeRuX5NPt9K5ZZjHqPqhSqlMxGTJqeLRIo4JhIUgUKLzzr09
	y4oI6WqBONS7Lf/HPfqm8ZTCzk2DaeITRlNKMwSK8vngWk7Xiqk83zBgzZUgEm1/R6ItOFAvMcj
	+qaNU4GzetkQASAIgcmADYrMPcc7eiqFP3wno3SjMcENApRx/2ZOsIqH/yvfWnPI6yed22howOm
	6RiwDaIzjd1gm2r6VsAwr9aD8yn8mzToB70bhPLJdc1+f6EULVCrgr7y7VRDP4VZM/qUTURQXtc
	w53TgWHBd5/DOWFjXhOfmKndXL7CQh3sSVj2Jh9jEkXoy1TZMpYBz8vaAWtsmUMq+tuV8TmeuIU
	i5Vci0w0=
X-Google-Smtp-Source: AGHT+IEg/+dDIFunsDgQZav8rM0OV0IRgirnDBMEGzWGxkPG5lDOpWmkE4qjIJg31NM/Oy281AN8XA==
X-Received: by 2002:a05:6e02:2482:b0:3d3:db70:b585 with SMTP id e9e14a558f8ab-3dc9b72443emr180381485ab.21.1748409819889;
        Tue, 27 May 2025 22:23:39 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fdbd5c2e27sm73730173.135.2025.05.27.22.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 22:23:39 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3] kselftest: x86: Improve MOV SS test result message
Date: Tue, 27 May 2025 23:21:05 -0600
Message-ID: <20250528052105.2657582-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make test result message more descriptive and grammatically correct.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
No changes in v3. I'm resending this patch to adjust patch format
suggestions made by Shuah.

 tools/testing/selftests/x86/mov_ss_trap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/mov_ss_trap.c b/tools/testing/selftests/x86/mov_ss_trap.c
index f22cb6b382f9..d80033c0d7eb 100644
--- a/tools/testing/selftests/x86/mov_ss_trap.c
+++ b/tools/testing/selftests/x86/mov_ss_trap.c
@@ -269,6 +269,6 @@ int main()
 			);
 	}
 
-	printf("[OK]\tI aten't dead\n");
+	printf("[OK]\tkernel handled MOV SS without crashing test\n");
 	return 0;
 }
-- 
2.49.0

