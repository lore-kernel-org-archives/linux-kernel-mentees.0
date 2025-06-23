Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2987624EA85
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 18:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703685; cv=none; b=sFzwoLkqexwVNU6JR0mSEAN0eQHIomEutOwuy9T0/7qmMdZkAWm48NLN4+NoWv0//e3kG+lhshRHlCkfJjucZ4FdeEkBVk+7e31npPq/cTwnHhf8nA86R0wfSmzjptzIpB+uJDtZefxw249gEWj8WGozBlmwrmYxa9s+X3WJXZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703685; c=relaxed/simple;
	bh=xjO1fMe22Jaq4EfwiQGsg+pOSrk3eS2XnMdZUXlcSYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q7UN12/xCkeVjwL/lB+/d3a9Q5AuQ4j+v2Xjwtjh31atvMhfpVFmP5+TlhOBt/fJo69ty4fOtKyoRyeiPzdwSIktiQ/025pKCOrj5s406wlKGIOlpF6+msUyw5EAeVtKZTB5xcohx3aobBY10DWi32ZxNee2uRJ5kqS6a77eWng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrE+gApv; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrE+gApv"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74924255af4so2007523b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 23 Jun 2025 11:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750703683; x=1751308483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zV1oDEAS/vgPXZB0E98XPXxtO6/7/BkH9zWvruYfUv0=;
        b=OrE+gApvIvaEGqA/6P4AhhqEw0lyiA1McA12I1DTy3E6j0V4l+YSt5Y1Cbjb6VHlaX
         qMnb4uOG3yudKlqXIt/F5WbmATpLYgF4H9P0zi/sU0ab/rVAc4C0KfLO2adYtPAaPU0q
         tLKgx+e2UZ6tFTnzYeHVMCNBjPNmAZysdPn1EsCpM7q3TbaP8gO04fO1ze0v34DJlsQb
         Q/fh55IIIUQ7eW3q7/WzeDMESHrEOtK4UJ0P7dc8+7RVp8/sJ7AV92hyRoy4KMek0tnL
         wTNALcE3N2l/3zvAwjfCL7rCuRyz6egO3AOHcqSs58tbD1yo5tuw5dR79jjYRf13KgPs
         x3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703683; x=1751308483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zV1oDEAS/vgPXZB0E98XPXxtO6/7/BkH9zWvruYfUv0=;
        b=lzJnHVBt/bIIj+YKh8pFGxAKigZgmockOTtYn2tS50hu9XoKcGpfcpVsJJwwccrCLr
         CwzvsmhPdiEADLTv6/SXCxP9v1tncfz3H8FVEatIFSgHxstXURxBZUEfBwV4dWpT6/g8
         OJ8h6HjljL0h0pf4Mn5rMpcg92bxcetBCsQcH5cNPqOBD8cPI6x4LsffE6c453Om0UOj
         mcmoT3TyR8O7oHKI1gK/19ZYkPr10wIvPFkHVNKBvCr846DOoZT5etAkOX/8xP1gW6HH
         deWVBqy/QSE0PoEKvLfXPLRDkVuJf+WouTXTQ8tl1uv/6HML98NuScsjLg2XuJ8V+qyc
         96fw==
X-Forwarded-Encrypted: i=1; AJvYcCUeyIB5FFkn9FmEGbcAelMPAZuKMnuQGDtuVOpCk0P3GI2T4x0tsK78vUzzRxMAaS03KRUYArmBNmwubJHBOELYC5n+sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCno9QQxA9rnrXMLLSIF6KtJe5gYPCn1J7RFtFQLV+WWtyqRnD
	QFLCk5aCl+LzrxxzCuM17LHMA7H8zQOIoxEB0OhF5QFxNrdUSt+Lc7C1
X-Gm-Gg: ASbGncuB3IBR5rvWuaKCJvFjJtn0MCtgw/kUY4CjUAOocODTNkbNUBsF4GRnD8iJY5L
	8IbPTcIdI5Tz9hNBbrqE14oqY7TRA/STXevEiPe4K3UC0SGObeDw1blFkgzjB5pVbp6As05nYYC
	RemBFKiiH/7rUHuUTGFA0xq3+2rLFVqwG8atBjNQ1r0lplb8j+vURFIsTIQ+CnRFt33sfzeZYGQ
	ohPWsceMLNQrE4xBfH86Kq8Wdfeb0N3C05V2ehHEABw7YmpnCWIaouaxgz0wzNz+Ft1FNIML/8B
	l/zOLgRF4ZT/BO7E5EKvC9uHOk8CzobHjYCYZhp1+47lvmfWcDVq6d9+RLXcgbEo
X-Google-Smtp-Source: AGHT+IH+8Rz4nyS+SsDsXTf8cDsY/zbLgN/bbs3ip/7BUvQfo0uOZ2R0DjFgXe5hfXV7s+zZSmM7rQ==
X-Received: by 2002:a05:6a00:2e99:b0:742:b3a6:db16 with SMTP id d2e1a72fcca58-7490d67f737mr18775964b3a.20.1750703683359;
        Mon, 23 Jun 2025 11:34:43 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:c8bc:68c3:c88e:7a72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a49f3a8sm9119603b3a.62.2025.06.23.11.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 11:34:43 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: shuah@kernel.org
Cc: oleg@redhat.com,
	ldv@strace.io,
	akpm@linux-foundation.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH] selftests: ptrace: add set_syscall_info to .gitignore
Date: Mon, 23 Jun 2025 11:34:06 -0700
Message-ID: <20250623183405.133434-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the set_syscall_info test binary to .gitignore to avoid tracking
build artifacts in the ptrace selftests directory.

Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 tools/testing/selftests/ptrace/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
index b7dde152e75a..f6be8efd57ea 100644
--- a/tools/testing/selftests/ptrace/.gitignore
+++ b/tools/testing/selftests/ptrace/.gitignore
@@ -3,3 +3,4 @@ get_syscall_info
 get_set_sud
 peeksiginfo
 vmaccess
+set_syscall_info
-- 
2.43.0

