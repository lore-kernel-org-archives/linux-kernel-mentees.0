Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB562F068F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029853; cv=none; b=rec9Ekpj0RfA9LfeEsp84o18LvdJYZdcz/EbnLXz35QfBNXcUgneK6jCYP4w2vzxxgP1qFDcPcSHJ1e5L0KxGZ+4dwkmBqHw6smKSbFfnFH3GiwGTM9IIxXT1rAZUobfeHcToB/UPao8Fc566YXKl9DK8p8KpxW1IZiOL9dUgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029853; c=relaxed/simple;
	bh=abdUk1eVG2MWeMiVvg3GA6vdlUr2x3/LEGnaf65+VCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qMsxhpArP79Wz+YxLX8thA6WjerlC5CdYiXnabz8eLHlOLQcVslFjD3/TK4FiiPsJe7MIzAKRxSt5Ary1xw+EZRg2QSacZ/7CQB03reun63nABOYDm/YjPq7Yv5HtmyeikHuE79K5FiMT9od09ZGPklRqbqWgXaoAMzVjMizxwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+50zWs4; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+50zWs4"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6A28606CA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:17:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vli0K3hss-Cv for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 20:17:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2174660690
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2174660690
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k+50zWs4
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2174660690
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 20:17:30 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76c3607d960so6331168b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 13:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029850; x=1755634650; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lqgQFVPvnKB2es+1oANPG8DBWM8TFCT1pPF5iWRaFY=;
        b=k+50zWs4mXC34nsMWS6mYAIKRFI9ghBOnF72+lmNe2qtBLwS8nJuFvJl3OT+xYyEql
         PGhHGBDJjudlWZUHubL3sKN/mPsPZF0yxybW8JuyJYsVzIIQAkjb/Z61OmZPcTmsCELa
         Lz6lNmrXS5FAaYLS5c6gXHsJn2ttZTKAxci+AC4TtqgDrTSP48TDcVhtwBFvjJgJlfLz
         YIujtVftgV1fLHKbHIdem/8Ou/D8AlaKXMip1Nqt9/YynLCcNccNT9OlPnLtexim2IoW
         yguBAjqOBRsk08eJ7maQ7UXRWkkRFnuGO8GpCqQPAPsBFytS/xVk5VVh3QhaK/AJmRU3
         YNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029850; x=1755634650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lqgQFVPvnKB2es+1oANPG8DBWM8TFCT1pPF5iWRaFY=;
        b=aIt/c7KdGLwR8BFoYQv9XdT10MEscDUWx97OllfSVFnVsYZOCxXzrQ4GiRkbDlELZf
         sWM84Wun/9Wt1QqN8JF/28Ga6xYHAbAhfjs4GuvMatEMZG4hSwK/uZYid3KnpOWL+eKM
         ssudBuOK6DzxwadfB9AlE9o6JL5pgTUXOidlNjvBBnDaylap0BTGm6rNJliyNLANfKnZ
         Mf/l+oqbQ1qkefW7C8pbsX8CLt7+Jv+xdQVjAlpu563mDE2wlj3UZvZ6cp3n4EqBiiWZ
         t7o7lxUgzI0/ymfLVJ10GIBj+3EaYSJSerlU5uQLmw0+puuw2WfoOuU5LExX/IfBKBUX
         +ENQ==
X-Gm-Message-State: AOJu0YyeFSplUYs4AUZkPW5KmPtA1UNfB1t4kkPi60ujLm8QtDI7m4O0
	wMFGMJzkyfo7miagdCUiNbsmxfwXBwHsMrjBZNr8hs8CTx8H6DBbCSy2
X-Gm-Gg: ASbGncvSYUCJom4FbReKO2PGi0J43uBN1mfcGQvYoV6nZZjSPwxjWqY2Um1o/j+4zxf
	K8VNfU3MZ4VVYXheSPhVogu8vwQdLZNZ+ER7KPmcuSKlmCwdLR1NQdMIEJwQvvOld82dPzQ3xS/
	tIpwrni/dY04Oo8ieVG5JIlpw0wV05rQvG5L1sohhWZiV/id5ft+PtfwdzzcvK4ItiDy15JzFhG
	JMS8j96rsIaIkSmE41n3I/5FO8ChwBlhPkeLZAQxfr2zGPq5wrtn1SxbZb4/fCAVDEojVh5dt0Y
	26MWbYOEeg8s7d83dNxI7CNBLtvdw82ZWlO3A6XNpS+i/GZsK0T9qkR3YPqBlyM4o8+WZfecwos
	OVCcuLdT65EP21M5rMMnbSZc9SWt+IW8=
X-Google-Smtp-Source: AGHT+IEUG2yfkfG8FO5ZYuepyy8+eJ/D0rBc0tUSXxLKM+VvLkRdz1nWe9WBE2EaHy7Gy1CWzkir0Q==
X-Received: by 2002:a05:6a00:1142:b0:76b:caa2:5bd8 with SMTP id d2e1a72fcca58-76e20f9de63mr630941b3a.13.1755029850208;
        Tue, 12 Aug 2025 13:17:30 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bcce8f48fsm30198046b3a.40.2025.08.12.13.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:17:29 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2 1/9] docs: f2fs: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 01:45:15 +0530
Message-Id: <20250812201523.69221-2-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typos

- deivces -> devices
- substracting -> subtracting

in `Documentation/ABI/testing/sysfs-fs-f2fs`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..5f53938d07c3 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -822,8 +822,8 @@ What:		/sys/fs/f2fs/<disk>/gc_valid_thresh_ratio
 Date:		September 2024
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	It controls the valid block ratio threshold not to trigger excessive GC
-		for zoned deivces. The initial value of it is 95(%). F2FS will stop the
-		background GC thread from intiating GC for sections having valid blocks
+		for zoned devices. The initial value of it is 95(%). F2FS will stop the
+		background GC thread from initiating GC for sections having valid blocks
 		exceeding the ratio.
 
 What:		/sys/fs/f2fs/<disk>/max_read_extent_count
@@ -847,7 +847,7 @@ Description:	For several zoned storage devices, vendors will provide extra space
 		filesystem level GC. To do that, we can reserve the space using
 		reserved_blocks. However, it is not enough, since this extra space should
 		not be shown to users. So, with this new sysfs node, we can hide the space
-		by substracting reserved_blocks from total bytes.
+		by subtracting reserved_blocks from total bytes.
 
 What:		/sys/fs/f2fs/<disk>/encoding_flags
 Date:		April 2025
-- 
2.34.1

