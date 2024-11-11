Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41671A2C32
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Nov 2024 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731344009; cv=none; b=fOuZ0lz8aq3GjNwnu0gu5gJgkwjrXKelB5dy5SMiTC9fngwVGMKG6PlYU/TD0mmVfONnFHQWRmaSZfFDSaoOqLK6iA03AWgthOGPS8/o0B6sWLOI+M7RzBu1lId3DsRafexvhaTKF9qKOgH1MGJoIGnA/p4TESCoMTgfhLElzGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731344009; c=relaxed/simple;
	bh=7jB/VlRFjzf4Ba1mF3gK2PSxXXZWjrnSx7YLjrpKSQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bvvOQ7sm4Reair6MzFAShzPh/mKaHTji8ucby7ePt5uZduU66+oz8Lz6tvXvPL0wgDG3hEuGMKsJ8fRnK+3ZebQq5u/uPZAO1MyyBiqgg+iS7WT56BFSuvEWZ6ZUgWK6SrpxmbQQK/Ajq2fApPUj5B8L7T2CB2ohez5PTWjQUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9VdBymr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9VdBymr"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c8b557f91so50656175ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Nov 2024 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731344007; x=1731948807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zp+nbh/dZKfux7FpHpW59JPT00IgC82bEOR9JMylv+k=;
        b=B9VdBymrad5OphLTYuTS/lxrV4kefevVD1pG9GsdZJYVQuGEflL8Ohus9EQhnNfhan
         moywAN3eBoG5bmKf3lMu5P9BSGBz+4J1vECY4csS94tXr41NYHzhq0XgtMDoW8QTVQGR
         PzC5kJaLcU54l0F+0HnDBj5WdBZMsA7PCK8vfHXyO4AyyZt+nh1+jQFiOSBaq/4PrRve
         eVCXxo0NesDgC9DI0THbco4GOlJPGx0mt6Zg/KQdwAIF55tENl6BukCVsYaiv/82rwxJ
         BR2da0nQRJOnuP02ySoju1sY7KXhC6roUSFA2pALdpxePy8jn9eEgyDgevga9al01k/1
         m1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731344007; x=1731948807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp+nbh/dZKfux7FpHpW59JPT00IgC82bEOR9JMylv+k=;
        b=EbbF3od9qmzsev68S1LvqU7J2+3gRPgorgYI6WaBqKOIBYMl+TtNA8stfm1993agmT
         ei14dUtemVIW/mSaALvnzaxTiVhB/tq1Bc3Q5ySwI8MTMWOMxlJd2OE1IdA61XZAKHhQ
         yp07rycB+AVVAimK+mntmBcrsK+LasBBFdyUk15h+umcqngj7v1jyMelqkzRMPs1ljL8
         9F7uR/rM49W2rke5HKvE8xp7uttqfkCEJonvLv4kv9XecgobExLDvEMygrXYbW3XmDiU
         8rgZDAIXgdAWCsy3iZ1Y2zkwrnZ+CuHqpB3liFXNP+NgHKuzpXePvWbCqggJ+LHeJKm0
         HofQ==
X-Forwarded-Encrypted: i=1; AJvYcCX09QNSVAq0L51U0DJNVLRZrNqPeRH2r8g9VRCTg65fY3Mfab3Q2WzggQ07UFzR6yTDDQzRxF5DaAikxlzS15Sw9WJhKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA/s//PW8bw1wpwzo7ssCQByX6vvGmsLLkF+IOkmiEia0jJMFa
	ab7/P2oduF8s9zmOuHs3x4cDy0PAUlOsYbFJNUtAeMHekY86MoDY
X-Google-Smtp-Source: AGHT+IHXISfj9AJxeg33E7YdEoBMj42RHz9afc6u3daioNxNqg+xQD+UBy59Q/iDkkJ+0C2kRQrlew==
X-Received: by 2002:a17:902:eccf:b0:20c:8abc:733a with SMTP id d9443c01a7336-21183daceb8mr208915355ad.53.1731344006976;
        Mon, 11 Nov 2024 08:53:26 -0800 (PST)
Received: from localhost.localdomain ([2409:40c1:5f:8acf:5c94:d8c3:91ab:c98b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd154asm8809116a91.40.2024.11.11.08.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 08:53:26 -0800 (PST)
From: Amit Vadhavana <av2082000@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	sfr@canb.auug.org.au,
	saravanak@google.com,
	ricardo@marliere.net
Cc: skhan@linuxfoundation.org,
	av2082000@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: core: fw_devlink: Fix excess parameter description in docstring
Date: Mon, 11 Nov 2024 22:22:53 +0530
Message-Id: <20241111165253.16672-1-av2082000@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the parameter name 'con' with 'con_handle' in the docstring of
__fw_devlink_relax_cycles() to resolve the kernel-doc warning about an
excess parameter description.

Address the following warning:
./drivers/base/core.c:1994: warning: Excess function parameter 'con' description in '__fw_devlink_relax_cycles'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241107223528.3781323e@canb.auug.org.au/
Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 78b2c0eacb26..94865c9d8adc 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1971,7 +1971,7 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
 
 /**
  * __fw_devlink_relax_cycles - Relax and mark dependency cycles.
- * @con: Potential consumer device.
+ * @con_handle: Potential consumer device fwnode.
  * @sup_handle: Potential supplier's fwnode.
  *
  * Needs to be called with fwnode_lock and device link lock held.
-- 
2.25.1

