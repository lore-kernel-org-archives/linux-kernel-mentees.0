Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184E31C700F
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739914282; cv=none; b=dZ/rFKzuCz5/c//07vFCBTA5aXpUs8meAqvJvrm4QIntQVe5pcxJZmFEzpuvxHuMfdi6Sw8WEMs4KMtRkXkRixPil31sQqgnK2c5xYfS+zrmCSdJOEkj09JcG3ReKs115Irrwx0nn2lE/jx50zD179QquxWE3nbyghA8ZbqNSvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739914282; c=relaxed/simple;
	bh=Yud/s6ORIg/J/giXovwRTeCSvY4JVN67geWGps1KYVg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sWpE3z6p+YEZQjrKbX9FTq5bxLQs5aSkyQhtdhowr912NbH5tmc0+Hoejwk7bkItos6vdRKgjFOI8s9EwQ1gEnS73qjfpOmal1iPRmIB/vwCaPhYN7wuY5wdWQ+5O7ky6+qp4Ug0CE0ORyHAbzVF+6VVk3oJ1CVjfiDjm9M4cpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWuEyMo/; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWuEyMo/"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-221050f3f00so68513795ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Feb 2025 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739914280; x=1740519080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rP+96HuaKMpCU/L7D9t3sUZu/nD4Dx+ijfnfPQ8f6ug=;
        b=gWuEyMo/op3I8bxVPCnOUiAq+lmYGxo4HMDz4p8Xtt79nmtiksmbhtaqaxkE9w8BjX
         xDTfnfwl7h2VhrZPQuxZmQNRKwKyY35UNluF4rlzM5Y6kzRorY38/Vhgqxupp9FNr2l+
         pCBSBgm9SWVXrorkHH8DbSpFyBdO5zEQ8FG/8Xx4RuMZqTZgmoxz6XWf9MGTGSgYvMQ2
         5RdhARMJ+NVm5x43sLtJwRMlz5Cg9BekEctQ/kKsNCZivmd/ncSUE9I5hEVe8JoQZ/V3
         c69EOXt7yRdq5IKoljpWUe/yP967oDSYIBfOagLt5J2oaIXAEJZV0RQAy5xvhGNUlxR6
         JDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739914280; x=1740519080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rP+96HuaKMpCU/L7D9t3sUZu/nD4Dx+ijfnfPQ8f6ug=;
        b=sFZW8izjjUKk8XRnNqAkYYZVvAAOwDB8bSH/qEtDfdcLpOoH7MitFKFtO6o9pegtvi
         Ydx2g7yDqC/2WC3bDwI1ce4KjioR/orewhJPkKphJrC6wuGgb/vmw0oVPIzHg7zU+jzH
         iCWs/yaJJyaQ6F2/W3STZ26QPYJojqHUxcG27MlcT05TOeUjYf57ANqwGdp2xEwfeAFc
         HHW1KK0Xqz1plfJvNxa330fKQeorA2uo79k0r8O+V+7j8Rwpr0erBvnXWH+P1kWB+xRv
         fjGImWhg06bPwwBB2/ft8Cjvi8IS9GLDLEBScY3fVgcwCfQPWzXoD7xxS1Qw23t7+0qC
         MCDw==
X-Gm-Message-State: AOJu0Yx7w+NyNMvTeOjwYz0FoOTxZpkrqIkvI4+0NCPq7tW7wdhpjTXz
	fKCMFiuEIz2Wk/feVt+dQmHVMt/8Fpu7nsQU5bZG3Yvp/z8AJQdtvSuLjXDqMFM=
X-Gm-Gg: ASbGncuIkmqBIVHsNjvSmTGbuwSLvPf3In7VQmg0k669p4AHagW2K/jO2uCshsw2w7d
	ouPOCikYWxjWgpbrcAWwcpizZvVZl4yVzv5lDquWiAaRte0WuuH61279XeLesmFzupXxcsZZ0jF
	945FA+SVWZ20yO/h3/pPpg0IYwvqDP2sh4wpmWikfRFPonwJ1ouE/enAiDFnNW6lBAJOmjl9Sgf
	CpqjCmvNZyk7HDoNM4iBARMk4a2JkSdtSGuQyqnDmPIiIooa9BDTbo1K868u04CnhelDbzA+B9g
	vau09uijG2NZ9TjHF6TLVQZaZL/HycQUFQVLAtLWjU4KKOTIfooxk0zxDPNQ/I/smlv3pBp3SQ=
	=
X-Google-Smtp-Source: AGHT+IFCSXyrADrgyHdUmI8KsbcmXkcneofMLx2Nu1Z95lFa8KGKNOu6LCrP+RxhPWTUvcli17JHnA==
X-Received: by 2002:a17:902:e5d0:b0:220:c94b:83a7 with SMTP id d9443c01a7336-2210405cc72mr207634765ad.29.1739914280248;
        Tue, 18 Feb 2025 13:31:20 -0800 (PST)
Received: from node0.suho-242436.threadtune-pg0.utah.cloudlab.us ([128.110.217.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366b24sm93845095ad.97.2025.02.18.13.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 13:31:19 -0800 (PST)
From: Sumya Hoque <sumyahoque2012@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumya Hoque <sumyahoque2012@gmail.com>
Subject: [PATCH] Documentation:FS:Fix minor typos in filesystems/f2fs.rst
Date: Tue, 18 Feb 2025 21:30:56 +0000
Message-Id: <20250218213057.557707-1-sumyahoque2012@gmail.com>
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

