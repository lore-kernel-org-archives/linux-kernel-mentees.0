Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30912C234B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762001808; cv=none; b=AXwgXeM7iv3pBqe3JpeiBJJMbFkqxKyNxMbdAxm8NGufeVlqK9+UnFVNnVJyDra6X6dhDzK7/moqC4oQ5qO8py8JEKkPm7cLud+XrL2OY1TCHb2IXtH9TkwdsZImHv4ojHHVA0K4tRz979pYi6N6z2crCI1YN4WoVSk/J8LCPag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762001808; c=relaxed/simple;
	bh=bY9blcWwS6sUmcL8NElBTzi1r0kjFCooMSoEK5zz8Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jc581zp+zKKKYK4OBt6NanM1D0BVLt75CYOoGSEXAvNwQFl6wwPQ2yCAxqAYzH5LOiqT5Ed5aQb1IGZVjiXr35Qdx6FRKSavC6ULmlAt3PB0ZGjaaEubRPrFG5H5b4KXTAllI7Wu0t+Ix12CZmFuyM6h3dGKgc2+ulw+TtEhvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+OQtO+M; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+OQtO+M"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D9854145E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2QvsovKWhkz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Nov 2025 12:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=zlatistiv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E3D541447
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E3D541447
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=m+OQtO+M
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5E3D541447
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  1 Nov 2025 12:56:45 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso25162045e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 01 Nov 2025 05:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762001803; x=1762606603; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGVmb1DJ+yAOnx5AlPbC58cKdV6J05JG0r5lqYgWdxk=;
        b=m+OQtO+MZadL6BlYoqnCq0UbFs6TJwm3IIDCXLqMAT3oZeLsiA73W2lM87vC8PJEyZ
         M1ZNf3yC/m1tUVpkJ2/Qx0yWPQv3T6NxJtEwxBwovTe/S8tXOtoEd/5t/eoyKQguyFZR
         lqLLeh8K6hRtEEwM0xKKx6pGUHSbFnc6k/niF5ASqP7L8bwZRTEDogtWtfvThv8D1p9q
         t7WmqcAEyddkVPb6tpuiRcFn6xRWHL5czZLR3zY1ZMjgzmzqEw+krliuLwVhzfwkGt+J
         aingkI+LxkOLGfcMXcK2sLD16kE2RTLpnFNc/SWu6tRqaO5y6y8puUz41Q36aeLVsw8Q
         yuPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762001803; x=1762606603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGVmb1DJ+yAOnx5AlPbC58cKdV6J05JG0r5lqYgWdxk=;
        b=dWK9IW5rzBH1YObTJ17fPsCYrz1JU/P90u3ZlyCMDlUJ0QwswwVEbF8c35St3aFbtl
         BrVQkMCY8VQXwz2OYxvb1QY+IwOmnK69xP0GVDmC+ccP4GU4xfUPr64d2r+9Hx753gsM
         +vVdrvMStKZkjDdpyhdVsQvYrUFylVXBOUBvmPpZ5MrWcTjs57f3xOQ7VTw4GIH/by6G
         jB14S+AfzGfqi3ReoePijWHvPsT9Cnr/MJCBtEafh6uhEgihSvC9RxWubtn36AYETNdu
         ZRDOzpS/6bQO+ZIXB8T+g483abIgBjijpkYGI/SCCAuAOrMcrf2YPB0VnJHwjmgjW94F
         pUSg==
X-Forwarded-Encrypted: i=1; AJvYcCUxo22JeSueS7lm8ltYkjtxyaMQw6QmiJprEOtaxA+VbunN+ockc5CX6bjjV8qAFZeJ1Ro/fECdhTiE8ASicWmsWLdYSg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyOARqLqATRrNUgIl0FH/tL3dvwOtUtF6p1KuaMRrJarLyAkBKx
	AIMYC+1oapWdO+24ldFuemoTpFtmW+VhGmQpxf4KSlLO/Fl2bClbfdYk
X-Gm-Gg: ASbGnct8NgBGiFNVP0dQteLaHfezl5OI9+cABKWV1zKRHroy3yziQajxArdJIkvdp2h
	eA5NsCGPXndfidTFIjjGIIB1QNg/u+kJ9RTwsGEFXEbklQi0lNCXhpfLm6oBFZ43TieokWccUWp
	Rcss111AHpffxY3UzpQPj38d3RSFvjjezA3BSKTEwVujkPI1S8SpIwwxGb2Vl3fh2mgSCz6EDU8
	k+Eg993LexPwmZnUcif6fL2TxnAb3ojjSm6twvokKl3NSt/sY4ZP1GjOtbs9MoEcV9u2gHPzhhD
	W0U+zYTmfrglYOO2BQLs0qL1PuYbzpEFDR1FS6fhnNZBLX+eKI7U9o+4pfJA4sWNGqNs+EQuT97
	uaq0KeM4QQEyN3qqqCOtdZ8amPfw0dFFZ1McuMwlYgajuuP7snB/42iCGrppiLDN5w12CcCNb5+
	TKn+xXEt7Vn5AnwOteDTORPw==
X-Google-Smtp-Source: AGHT+IF67+MB9gNMQj44RfGkbRUyMVSRr8JGv/Vb3x0BucDfXENO6/yD2+Bv+4xEmQGnVJYrNs47/g==
X-Received: by 2002:a05:600c:444b:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-477308b7d81mr67818705e9.19.1762001802876;
        Sat, 01 Nov 2025 05:56:42 -0700 (PDT)
Received: from localhost.localdomain ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f2b5asm8827647f8f.40.2025.11.01.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 05:56:42 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v2 0/2] f2fs: Add sanity checks before unlinking and loading inodes
Date: Sat,  1 Nov 2025 14:56:14 +0200
Message-ID: <cover.1761993022.git.zlatistiv@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is provoked by syzbot warnings caused by corrupted directory
inode with i_nlink == 1 that passes the initial sanity check which will
only mark the filesystem as corrupted in case i_nlink == 0.

Tests:
- fio/fsmark parallel create/unlink on VM with f2fs root filesystem.
- syzbot

Changelog:
Changes from v1:
- Rename exit label in f2fs_unlink().
- Add sanity check in sanity_check_inode() and remove it from f2fs_iget().
  as suggested by Chao Yu in order to detect on-disk corruption early.
https://lore.kernel.org/linux-f2fs-devel/d4b7c03c-6554-4407-b823-aecfcdf7dc3f@kernel.org/T/#t

Nikola Z. Ivanov (2):
  f2fs: Rename f2fs_unlink exit label
  f2fs: Add sanity checks before unlinking and loading  inodes

 fs/f2fs/inode.c | 10 ++++++++++
 fs/f2fs/namei.c | 27 +++++++++++++++++----------
 2 files changed, 27 insertions(+), 10 deletions(-)

-- 
2.51.0

