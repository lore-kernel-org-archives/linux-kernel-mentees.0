Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06872286297
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739914353; cv=none; b=LgrqOUGmsQ5DXBVKibT/cAdSc1o7Sno+Y3VDPUOSWo8yzcuXnZ3NoA2EthBD0SfMI9OkWMrhajEY13wQN5/uHnXwPfhtxKiElu1AC/ksWg9+zGC84k3CnzJTmIvb5xzuOI4lFcxIPOyUou7lbqgLyikqG+hjAak8owPIXkzPGQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739914353; c=relaxed/simple;
	bh=Yud/s6ORIg/J/giXovwRTeCSvY4JVN67geWGps1KYVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c0Bcf/7Erk7tnSbDPjqCxLvFXtZc6eC8dji03PWqTB9hGnDcWbUhEz0SDB/2Vxy1y452M3VuS9AaqY+enPemm+C9+8XOYIoToMXi4Xh7a2nufpBgdP4LBXhB+xW+YVCOaPyojMNd4rQYpBZK09WzhQYDO5kWFxRh9eaL7z3KWWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBkP3brs; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBkP3brs"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2211cd4463cso55751305ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 13:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739914351; x=1740519151; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP+96HuaKMpCU/L7D9t3sUZu/nD4Dx+ijfnfPQ8f6ug=;
        b=LBkP3brsfZ0tu1NECrOZSm5wxJXfoCLE9s9jUNegYqF+jPw/khEyFwyr6TUuD3ZnWJ
         QKshAHUAGrmq3XeXyNK3Q5CeoAFt2p1U+L+3O6X6iZ8O/bWFfvoIhX803zAKdzmafycn
         U+M5vmbyrWNZoMAJMP6i0RIzR5zoeepe7wlHpVMwythqnt+Vn/rp+k030tkvee6XX4Jr
         il+XlYletYC+x9VPYjeno0RXQFARm+gk9dNSocSleNPW5afSsXJr9axEu1eN5m/Gglwp
         qZdDIb/0LeLFPm2IsWc7XdrAYicnkdEteoe17aDjSVcuXBQYKk7LtjReNWE/oW4TD10O
         vZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739914351; x=1740519151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP+96HuaKMpCU/L7D9t3sUZu/nD4Dx+ijfnfPQ8f6ug=;
        b=d2NYcXa0SaLxe1pTnj0cktMlmcE+bThY8IYkM0YMu3hBSjahWS9fEjBcR0UMHNWbVs
         BYoBD9MqM/vn9pj5CVyrG5t4EoxfHHPHf5gBejX+415lZGTyNKAdREYoC+rQLQadYldp
         dyn/ZoqLK5gvFXD7VQXQNot5IrTTFbSKswTQX9kSaTMM/p2Hd4eaFPjGfZ1MevDig/Iv
         rWNbzNSFyaYZrnDeaweWktkxaJIrf7CIUBdi8+/lzo8Q4Jva9ddGU0Cy0iaAWFuRnKnC
         YNAyJROoU8wUsXBmdZXVpPWDVomU9z66qT6UHZmayqmAbRqEkD1POsCcSOqFfTQkVRSn
         00Zw==
X-Gm-Message-State: AOJu0YyWte8c8QJJtyoqpOEFTxykvxyBlh+AXzRulYH5l1KmoPn9lftJ
	aFxnV0R6hUhKz+SFea0tV/l6INs5sdpf5htAyrR2DoNcmmcqZb6RcCb+5K7SWI8=
X-Gm-Gg: ASbGnctHkk4XxcYmd45rVYq5xIAMuli5lRBCtfPyF2EMlHTvSV/b2cUiJW9B9hT027W
	vVPlnZ+sYVC0Ml/FmB77OLa9hqWodc2LN/uTI0lLNaE3yup3MJXuKLMmmf0Db+n1nwyKMYlEPgj
	feUVi4rsHjze6NvssiaKXKPOyigfiud7I8fZlb+yDeXGFonY7ndCB8EMKFU4X48/Niw+wGHBUWD
	Kblch5gs/8D5U0P+uHo/imz/aCFYnKNoNZWFBKxw3J9ki8ByydCXuMwidONN3r78qsy2qqb8CiQ
	eOSS62Iu0cNX0XUemzbuoC/ixvOdSyHJ3UYeq67E2NqsXfsMNlSTjpgnuTUA+Y/gU44aOERwyA=
	=
X-Google-Smtp-Source: AGHT+IGeMfvmJ6kCHrogO3THSVeh3+InxseRwcxEXN5FLIKTjpev2jYorVyjybFWU3EnC3+KCSrjOg==
X-Received: by 2002:a17:902:ec89:b0:215:6b4c:89fa with SMTP id d9443c01a7336-221040137ffmr190696445ad.8.1739914350648;
        Tue, 18 Feb 2025 13:32:30 -0800 (PST)
Received: from node0.suho-242436.threadtune-pg0.utah.cloudlab.us ([128.110.217.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556c704sm94448845ad.164.2025.02.18.13.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:32:29 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Documentation:FS:Fix minor typos in filesystems/f2fs.rst
Date: Tue, 18 Feb 2025 21:32:21 +0000
Message-Id: <20250218213221.557744-1-sumyahoque2012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
Here is a minor fix in Kernel Documents:
filesystems/f2fs.rst : comp_extention --> comp_extension

Signed-off-by: Sumya Hoque <sumyahoque2012@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index fb7d2ee022bc..412b0949143b 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -310,7 +310,7 @@ nocompress_extension=%s	 Support adding specified extension, so that f2fs can di
 			 nocompress extension will be treated as special cases and will not be compressed.
 			 Don't allow use '*' to specifie all file in nocompress extension.
 			 After add nocompress_extension, the priority should be:
-			 dir_flag < comp_extention,nocompress_extension < comp_file_flag,no_comp_file_flag.
+			 dir_flag < comp_extension,nocompress_extension < comp_file_flag,no_comp_file_flag.
 			 See more in compression sections.
 
 compress_chksum		 Support verifying chksum of raw data in compressed cluster.
-- 
2.34.1

