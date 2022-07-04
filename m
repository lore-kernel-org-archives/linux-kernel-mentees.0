Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DABC43334
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  4 Jul 2022 16:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A540408A6;
	Mon,  4 Jul 2022 16:35:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A540408A6
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CO47x+R8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id irxtXbm-V1kL; Mon,  4 Jul 2022 16:35:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7D05640157;
	Mon,  4 Jul 2022 16:35:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D05640157
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 547F5C0032;
	Mon,  4 Jul 2022 16:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 851FAC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 16:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58B20415CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 16:35:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B20415CB
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=CO47x+R8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nudJvICxpN1Z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 16:35:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76B4E415C7
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 76B4E415C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  4 Jul 2022 16:35:52 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id n10so8998953plp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 04 Jul 2022 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AD8ixGZqjFTlOvCOe5PAX+9HYaFuEMKi02Io7Jcboxc=;
 b=CO47x+R8nIkHofzEqj9jWOupJ4v74bNGiFHPr/Q0/hR+xeJYGpemeTX337v8knXTgk
 n2hT1hJ0g4ViGLzfibuyDNf8pltl6Sd7oQLhfM7AqHqIq7ymQzXKeX9WqY+s0v02GeEa
 BnP11c9GW5fDa1AO3v8TZx819xSRJ+Jc7+E93kBUQ7PaVsviXAJTlZglNRFa+aa1WXL4
 A9GQYwh2jHnzCC5kKJVQcZbmoxsgrVqKDuKdUn0nWArTTEXTu1yOjFN0Sch1goZZAwDV
 12aYa4fWdOzqpvOi6dD1Bg/fjq+48pbzOhEx81r48pNSoJjETjBrDEfB5EaBG9ctGaK1
 Z88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AD8ixGZqjFTlOvCOe5PAX+9HYaFuEMKi02Io7Jcboxc=;
 b=1BTDe+EAJLzHaiBxynRICi1HeXQZpYFubBpExtFrKlxVIW5OkXW31TNzBgCDt9X5Hf
 tuf52sMNTWJon5cCmD6ylb0mr1bS0uUcvCQQaNg3XC3M7Q7pJeKGGm6eroK4f93FAIq5
 SXBEIbt6iX22FSiuDOdF8XDaCJlygRx/Zv8MeFgK+eu8cHeQ2TH1BdREjSRIE69Dq6Pc
 UMCsW2j51BW4zBAUTiFB53p3ZMw7h7KLu214eSTvf+riCy6DwKPzhP890PGD/ynPHQ7I
 nCRSj1RolmHoSWGBSE+dU6Ow+Pitc6AYTRSPvy4YVtyYDHpgfc02DKXEoswQf2e7kO+V
 Q5pQ==
X-Gm-Message-State: AJIora9XQkdBHCIqAqUYePwhRM+dvCSX8rje2Q8aLo/Ny22+zg/9+G9R
 LQCZbFe+H0wmVbuxfego9zs=
X-Google-Smtp-Source: AGRyM1vp6jxwjFO/ukE3G90lZHLBQly3vuRUIt+Vbcrbc7YWkdfq1bXMkO1ECjbiaAQ0619Bkz4Amw==
X-Received: by 2002:a17:90a:e98d:b0:1ef:7863:b7d2 with SMTP id
 v13-20020a17090ae98d00b001ef7863b7d2mr14717536pjy.101.1656952551715; 
 Mon, 04 Jul 2022 09:35:51 -0700 (PDT)
Received: from fedora.. ([103.230.148.187]) by smtp.gmail.com with ESMTPSA id
 m6-20020a635806000000b0040c9213a414sm20457775pgb.46.2022.07.04.09.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 09:35:51 -0700 (PDT)
From: Gautam Menghani <gautammenghani201@gmail.com>
To: pbonzini@redhat.com,
	shuah@kernel.org
Subject: [PATCH] selftests/kvm: Add error messages before skipping tests in
 vm_xsave_req_perm()
Date: Mon,  4 Jul 2022 22:05:38 +0530
Message-Id: <20220704163538.31165-1-gautammenghani201@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Cc: yang.zhong@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 peterx@redhat.com, wei.w.wang@intel.com, linux-kselftest@vger.kernel.org,
 Gautam Menghani <gautammenghani201@gmail.com>, dmatlack@google.com,
 guang.zeng@intel.com, vkuznets@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, jmattson@google.com
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add messages in the checks that are performed before making a request
with ARCH_REQ_XCOMP_GUEST_PERM.

Signed-off-by: Gautam Menghani <gautammenghani201@gmail.com>
---
 tools/testing/selftests/kvm/lib/x86_64/processor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86_64/processor.c b/tools/testing/selftests/kvm/lib/x86_64/processor.c
index ead7011ee8f6..c74e846661b7 100644
--- a/tools/testing/selftests/kvm/lib/x86_64/processor.c
+++ b/tools/testing/selftests/kvm/lib/x86_64/processor.c
@@ -643,11 +643,15 @@ void vm_xsave_req_perm(int bit)
 	if (rc == -1 && (errno == ENXIO || errno == EINVAL))
 		exit(KSFT_SKIP);
 	TEST_ASSERT(rc == 0, "KVM_GET_DEVICE_ATTR(0, KVM_X86_XCOMP_GUEST_SUPP) error: %ld", rc);
-	if (!(bitmask & (1ULL << bit)))
+	if (!(bitmask & (1ULL << bit))) {
+		print_skip("Userspace address of attr data is blank");
 		exit(KSFT_SKIP);
+	}
 
-	if (!is_xfd_supported())
+	if (!is_xfd_supported()) {
+		print_skip("XFD is not supported");
 		exit(KSFT_SKIP);
+	}
 
 	rc = syscall(SYS_arch_prctl, ARCH_REQ_XCOMP_GUEST_PERM, bit);
 
-- 
2.36.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
