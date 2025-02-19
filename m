Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107BB1A314B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739934308; cv=none; b=HdmboR+J11c0r7ucZdHl0R3Q0TYLsZFPvU4NYzIGOelA8pQEcYxXY/LBWSpjkaAMnRpsxVluLrPRC2/WL1I72QwQhkwZHxmS7G9NPiCnwu6qS/Xl5/crALKv3M+NkiPhBeuopgE+XUGNUUUZNVE+b+G3e9ns+RkGfHHViqQTgKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739934308; c=relaxed/simple;
	bh=xqhXmRmGt10WILRVRFX0nFpaOglQ51zq5WCAt+bSjhs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ilRz+oSPlFN7Zkr4SduxOGrNUIAQW3PFflZahcdCqP5Ro9RvI8bqw47CJBtCCJk/v59CryGDw7pTSCAA8tPnC0cO6FDMrMt81NZ6V2n3RZaya8PkbRgIQwQRT38U/iOah5G2CbGyzJx7dXtgmF8edTFvVQt5axmdAd7jwj2FU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGx3mQmg; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGx3mQmg"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B2B340C4E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 03:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nDn7STgnlTfD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Feb 2025 03:05:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=sumyahoque2012@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6AF9040C26
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AF9040C26
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YGx3mQmg
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6AF9040C26
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 19 Feb 2025 03:05:05 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-221050f3f00so72270315ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 18 Feb 2025 19:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739934304; x=1740539104; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WP6ht26zVx1Wk1KNOxJ+ObaR5Ff/xn1pNGU7t1suOmA=;
        b=YGx3mQmgwXCn0GcbtRkm6qWMiWQ9SwLoZuFrulD/P65nM0BFIR+299asJ138bn62Q3
         /MKCebwZN4kPQHTVHk/zbQTSyowpgSVhY3Crvj154cxsLfL6qdKV57PCuKUUjhNRdar2
         20NaMgkqhYjIXBs5fW9/9Zxc5vGPaCcuNwI85Gsy413eaRacgK1XyYFYevLiocWzMrua
         WM39DQx6ejaPkK+T7HT8lcV2eRDKh47RU79E2tCUYn+bTbyAaMS1LXdM6BTzwhtLdlEH
         ErFWQLu6BHTNZsI+ZihWwpNfdnZdPgOn6nO7RFfK/vtZA1Uq9Ocm0/VKCTVUIvJ2061e
         poAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739934304; x=1740539104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WP6ht26zVx1Wk1KNOxJ+ObaR5Ff/xn1pNGU7t1suOmA=;
        b=IaETVS8DqIRzaVDCU20N1tEi2ah/RSzTPYt9pv201lq82sFULqUTJ2ORj5o00nSpKF
         5xQLoPqFk8pFnRQOXCDmcS6BaLrCuyl47O3etjTj2exJgLawRiHDLfJ30oQNicmunOQ8
         Y0BPINWKcOXIqn5YmHdVKEFXyLeS2urJ19PZDaNh3GHOoB+B9i21zi0tZzChUkycSo/V
         Nse2Y0IfyJGjqvQ6mHddpDMqhtM5yz410vn4TR4tPITjqVDzSdFstZYoCoihZTVBy/GK
         KSZdZt3fHqJnA0TgV6ao5ta3fa0xM1pN4L48xCcNBtQ+J1Z+hfKIwYiIyrSLjtvxVhpI
         ksYw==
X-Forwarded-Encrypted: i=1; AJvYcCWO60WDa2buPk/P6UQ5xvW0aZwGUg+2yJPLPHY47NuDSgkjUytdeMm1c3r9jZfEDO4uZX1q6L/qAIGkOuBIu0E8qmu9/w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzHPMa/iNGdVFoH0KHTUmJd83i/TBZvFN4Ix/CD5yT3bJ1rH6FA
	NRU76qV8xGd6jJT2X1smlanwDV+4K0s4KMOnXnaoids576EXx92G
X-Gm-Gg: ASbGnctZnrPgLgEINjGZbohAaJW0gr+XqHeBVCbLR5ILCtWFq7fn+s5v7HrkfRgh1qO
	zHKn43qzD+PXrrx2aFTmgEo+cBiGlFVfn4pft2IWpIkyqdRntjAohYPNJuMrLkpa11V/tm5FLFt
	zQYZhKqRYUNVVlsoe2g8TWpUhpOhdyUH/JQWKTPjH5l+Uao1fH/bGWw3EejPzCpniY1XeeC6rgF
	0k/+enwnYKcuNZV2yKSI4aIzrzFCsOjXS05ftXvG7r91rNM5nDCBVdAbYEvgHMXEteIidJXnDWm
	y8D5f97LLF0lsXANrbBnxb/KU+V8T2HR3U41RuSN4WnBu+eJtm1uaKops1pexdqcjmYgiJgxeg=
	=
X-Google-Smtp-Source: AGHT+IFZiOAQJB8BaTDOEtDlzQBo8iYTkzBhRlEHPrbyWC5TMjZeIu0sOTh7QRiax5maNSNHhbXl8Q==
X-Received: by 2002:a05:6a21:7888:b0:1ea:ddd1:2fcf with SMTP id adf61e73a8af0-1ee8cb1ddf0mr27931861637.4.1739934303922;
        Tue, 18 Feb 2025 19:05:03 -0800 (PST)
Received: from node0.suho-242436.threadtune-pg0.utah.cloudlab.us ([128.110.217.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb5a52af2esm9960126a12.54.2025.02.18.19.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 19:05:03 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: sumyahoque2012@gmail.com,
	skhan@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	linux-fsdevel@vger.kernel.org,
	kees@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] selftests:sysctl:Fix minor grammers in sysctl test
Date: Wed, 19 Feb 2025 03:04:51 +0000
Message-Id: <20250219030451.39782-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello everyone,
Some minor grammer issues that I have fixed:
1. echo "If an error every occurs -->  echo "If an error occurs, every execution
2. Example uses --> Example Usage 

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 tools/testing/selftests/sysctl/sysctl.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/sysctl/sysctl.sh b/tools/testing/selftests/sysctl/sysctl.sh
index 84472b436c07..a4d76147ed8a 100755
--- a/tools/testing/selftests/sysctl/sysctl.sh
+++ b/tools/testing/selftests/sysctl/sysctl.sh
@@ -891,11 +891,11 @@ usage()
 	echo "    -l      List all test ID list"
 	echo " -h|--help  Help"
 	echo
-	echo "If an error every occurs execution will immediately terminate."
+	echo "If an error occurs, every execution will immediately terminate."
 	echo "If you are adding a new test try using -w <test-ID> first to"
 	echo "make sure the test passes a series of tests."
 	echo
-	echo Example uses:
+	echo Example usage:
 	echo
 	echo "$TEST_NAME.sh            -- executes all tests"
 	echo "$TEST_NAME.sh -t 0002    -- Executes test ID 0002 number of times is recomended"
-- 
2.34.1

