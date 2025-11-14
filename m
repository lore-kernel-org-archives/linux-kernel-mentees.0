Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3134A32D0F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 15:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135599; cv=none; b=nM9ftoVelXqo//6Dpo3S6SeuOsV2S6KrJGvzDInyj2+ma1MH+RlEiEqFP+mqs4g5gYkKSRiUsg4FkJ7pvrPJ5KZnur1uipyhCW73buVHeYPiFK0hBJlnf74uK/yHaop/hpe5OFQJC4AR1xZIOEMLpeaJfvluRB6ewTurZOMV0/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135599; c=relaxed/simple;
	bh=8WRpsZt54Mswfz2xCcSPYYNBrsqaK3aNc9iH26/F+kU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s1flUI5AcnM/ywP1e3yUUWZ33Dz1tgNw78QfGfmz407A1C03XhR88PpII04QqmTKbJS5GG93pHPuA7LXxnh+3gjBbnHbYr2k9ILbVM59aiYfqcefZ8XlAomFgB2Rr1jMqpe/BECGHE94Cs2cqpPyAL6NWZqu6uGUov+XpJQQ274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY1eTfzi; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY1eTfzi"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AECED6111E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 15:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f146Eg8jEwg0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 14 Nov 2025 15:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9BAC261114
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BAC261114
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iY1eTfzi
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9BAC261114
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 15:53:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47714bb5c49so808635e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Nov 2025 07:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763135594; x=1763740394; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8KPdQqhauc0N5/k7s1UlzxI59hwfKTHWBoWJzJ2Gqo=;
        b=iY1eTfzi+FOTixL79KIdqZS4AzEekWieIYGsEIi/kBmYaGhf9I/iBm3Uw/8wo+gPRY
         jQpbd3YlTJlwpsUPSIJ4wEeMRwRTTVqDlFXPOKJR3IpAbkG9P73jSr9WcPsoLBviKGOZ
         qj/hrI0WW/gdtYWySk1j8O3kHmFHTNShGZl3OSgxHXfmzkd1dO7G2RGs//+xEf6XYhLn
         2+6EoejpJpLkuVnuI6gMAOuCLeUUl/QtviXzfTAG8u1eOusgSSN6g1ECpEHqfFZ30P9p
         0AjYaqbs8q7scsSne7sXaMIbaW/4uwqJ8li5YCFgKx4p+66T0Rz4jYwYNIjJHQ9EgqyW
         g2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763135594; x=1763740394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8KPdQqhauc0N5/k7s1UlzxI59hwfKTHWBoWJzJ2Gqo=;
        b=L1e9irNSxMBd3vLwA79Qdamnv1ub0brOHdyoHzsKXCv3F3GffJzM+kIYkeBKybU+Ng
         6kUHMzZjtrAyILMQ4XJ2HNsiVMTTrHD3zuxb8UAwTjQxOS4hXugITyfKPDDsYjq3w+Zq
         Tq2Uh6kR8fuTTRKRp8dTHp+AXe2tW40KpnajOOsZU1lPu6YokY5xnQBZylVPz1gAf0qy
         JkI0rO5trDJgAGWUYS086eCMt/XL8GmUy/mwSlaZvm4An0m0fVGQbhR+1lXBu/zMHNxm
         1LVgK9RchNmk1qBAPbBHMeXwpNl2CpV+USj0bq2eBpK5ye6QO0BF/oR7jQEo5b4pAcTo
         DZFg==
X-Forwarded-Encrypted: i=1; AJvYcCWOkg7ZNbl4D7E4fAdHu6wf0dbxk+MevjnLmqjLMjYfiD4xfMLolhbEbdwnrvOK4bECllE4h3OhNfR4gJMeqoU/IihkxQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzuQIu2Pux3j0ADpFp/XcxcmLEBNDkyv+XhXPiIiEhbpZA7Je7R
	pepAarZt9UJctuhY5mIeRq6MelgMAoYnXA5PPlaKvQoMbt17NhqCWACW
X-Gm-Gg: ASbGncue25//IBl+zUAmuImlnUggSYYcCcw8f91Q0Wko2XT0BpNjOHexEUCiHugPUHK
	MnKEkfZEcrGE2yuST+/MbzJzsgOz6dI7ktXd2Pd9aKPUnxR0xQbF8/H+io9ZTRcEQsxQz0Rk2Fd
	QAmar6fONKoPDdeC5TFLg0XwIsOiF9mGtrvq3QkvO9b1qMH++7E/BUDjyxqfAxjyRu9WIk2gfgh
	gJA1AIMuwRyo5LC5fvcSx8iLAw/Qp58fGoC46JuIwJOkvkX09B4n7ifKPfUvjPRVuuQphihDDc0
	cPbaoRV5/h84Ab4PoSN5biY3ckugdWcDSsJgttZqEJv9BM+qozzZ+46oje9qv54Ve4xMIBFP4b/
	p/aNq4vlPpCh4L3kf/c8sLgm3B5ZDh9OaWiSjGeVLpNKOBjARKFuTtXnLsVmmVWX1ybB+k7TawI
	RnNdEcXg==
X-Google-Smtp-Source: AGHT+IGT1RDAkilt8ulv0yMxWgpeZ6pkOqR1nVxwseskZoLEsxMf89IT/uT00v+JdAbcSlztK4/FBw==
X-Received: by 2002:a05:600c:4e8a:b0:477:555b:3411 with SMTP id 5b1f17b1804b1-477902367d2mr16058075e9.1.1763135594359;
        Fri, 14 Nov 2025 07:53:14 -0800 (PST)
Received: from bhk ([196.239.132.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47795751d08sm8972205e9.7.2025.11.14.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 07:53:13 -0800 (PST)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Cc: frank.li@vivo.com,
	glaubitz@physik.fu-berlin.de,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	slava@dubeyko.com,
	syzkaller-bugs@googlegroups.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] fs/super: fix memory leak of s_fs_info on setup_bdev_super failure
Date: Fri, 14 Nov 2025 17:52:27 +0100
Message-ID: <20251114165255.101361-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Failure in setup_bdev_super() triggers an error path where
fc->s_fs_info ownership has already been transferred to the superblock via
sget_fc() call in get_tree_bdev_flags() and calling put_fs_context() in
do_new_mount() to free the s_fs_info for the specific filesystem gets
passed in a NULL pointer.

Pass back the ownership of the s_fs_info pointer to the filesystem context
once the error path has been triggered to be cleaned up gracefully in
put_fs_context().

Fixes: cb50b348c71f ("convenience helpers: vfs_get_super() and sget_fc()")
Reported-by: syzbot+ad45f827c88778ff7df6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ad45f827c88778ff7df6
Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Note:This patch might need some more testing as I only did run selftests 
with no regression, check dmesg output for no regression, run reproducer 
with no bug.

fs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/super.c b/fs/super.c
index 5bab94fb7e03..8fadf97fcc42 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1690,6 +1690,11 @@ int get_tree_bdev_flags(struct fs_context *fc,
 		if (!error)
 			error = fill_super(s, fc);
 		if (error) {
+			/*
+			 * return s_fs_info ownership to fc to be cleaned up by put_fs_context()
+			 */
+			fc->s_fs_info = s->s_fs_info;
+			s->s_fs_info = NULL;
 			deactivate_locked_super(s);
 			return error;
 		}
-- 
2.51.2

