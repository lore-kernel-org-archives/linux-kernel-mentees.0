Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A846F492
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Jul 2026 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784720032; cv=none; b=KUGAw1gcF2ZCtIo/Nv/BVeSyM0IdHONFuBhL2rE5oizYl/ytHI98tRGIEDkX9Av76J8AH9i+qB0haf5jGocgRizFwNBlHgXj7CxblZkrsvOiGVk8flsmqkkFokVt/QTw2QWpujc7qMGI/1FTX3NNAYvc0bvCjAoG7rkSW1/s/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784720032; c=relaxed/simple;
	bh=oIxI/1XPvJPZk5zbJurUL6m4hoS7e6NIh0xspj6Nosc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXIKmwS3L3fm4MZdD0epS9sRwoLyDLTc0Ug5sx8SEQWvLA4dPygd/qyYlHPBYJ7P1spcCXJm5VgGSztyPNnseDgW4VDkhv6jPfUSp9KcQdYiucPesRfOBJxiFUc5nTeIBspI3rMpgUlWIsAzP7OGNIKWdTGkEAVzwZVBbUiUozY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n85PbkZm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n85PbkZm"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso5424379a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 22 Jul 2026 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784720031; x=1785324831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lxBwVWRrpNduEO0ca1Z4JijkhZ7cZaOkNn5k5o4dK5Y=;
        b=n85PbkZmUAVWAEL7IAOefvVJDAO/+WhPmlmbreyk2PMfnvO5cNtDwKzsWUU7VnyIOG
         A5Zcr1e73BQWszSZXVNejbZBmRFnaUdAhTRKEbM4yCsk4BtSPEB03EDcKoGvYstOcLpS
         DOfc4rQJpTgE//LdPA41dYvyZcP5bSD0J1/V6czppYmic5n2jJHSLvKwHw7ppvqyyj5d
         NdunQ09fX0qrcU/A/lQD0aLmBP2TwYW/v7MrNtsA7G642s2ZJ75tVnWW0lZ08pR25Qc5
         M7TRGrMcGB0x9S4km/40EwE7MrCbkd7jEBfgdsDFzTcoff1mc2eK366gXDGWuZOyvkfW
         s1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784720031; x=1785324831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxBwVWRrpNduEO0ca1Z4JijkhZ7cZaOkNn5k5o4dK5Y=;
        b=UCWhMymG0IB4vUB5az+fkd6EbLkAbWj+9xvp1KqHKagaJzxMxDPDlR4oeCsag2Mr72
         3T49dVmWYwJK2oLRolr5H7CMHCZOkAsV5ZYZ87QspcJ676xktNnThyx1XZXSYjSICV0p
         2aHFwiHYzefL9laKkoEzsAitOgcKNqRNEfSq52vlvBoTSPvPL80SPK57uR4M+tiE65k/
         FXgdmptlEYxKfU2HSyejwiVQSuBADBBjWC3o2xZFFMUYtnOgl6GLk3ipU190pyJMfEwd
         +Kv+NpeKFQ0TFO9W0h9RM5+CPxv7MCOlRfDO0BPg4VbfI29mNQxXc1UNhSr8q2s9yBlB
         +XMw==
X-Forwarded-Encrypted: i=1; AHgh+RqIR5Xe8DsKSooRM5C+22EFMgYUBe27svlZAqT26SbYMx/RFQM819WQtfH7acnQ2s9dFM+qx+UtZYHZ/UeY9P2IkrNGSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzojZuknD5a5ATzKsS0xBYG4BWRQWbalvPWh098TfEM9qdraqLA
	KCMaSVt49Fy4g4UlHnUIN6IQci48RXrS4VyElYWoWotqd7Cro8Cppf2R
X-Gm-Gg: AR+sD11Vy847AXZZylovdUgGhdnpHvQ3IFVKVXHI0hZnUshIo3TTfabl3wtUxODN0mO
	5au/CsqcxmFcvSv6Yr1TMRL1Wk5IX2fNPt5nifJYXqUZgpSPLFOxYNY75Fpz32yFnbItB1JDpCh
	lp0FrUcym1/+EhS6cV8fvdlAPeXLSZf1iSutzZbF/YoWgR4DMUtHBFm0ZPwZ5SMBjLw7vGj+4NK
	qw1e334IWa0ZfpU6U1yix2oPNxx0Tanx8c3C/F4uELtFSk4vXMtwoVF/NReNn3Ccal2Sykjz4cB
	pr3i8e00nq9R39TdCeIOBI9yVNERQ93rkVn8Wb1qkZuFjpb2Z4c7Fsh0Itw0ptD9+1bWbySU3uf
	jALq2OlCU7i/v2H2NM8Bcj7MZyo4aLE+2Rzw0DhU2ysWT6jd1IVoyECB2NJEDzXijfg9gpOKShz
	7QcCbv7QJ3xoqlfeyIUw==
X-Received: by 2002:a05:6a21:7008:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c3ad7a439fmr25423558637.22.1784720030853;
        Wed, 22 Jul 2026 04:33:50 -0700 (PDT)
Received: from apt.tailc82bd0.ts.net ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1c376esm980979a12.29.2026.07.22.04.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:33:50 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH 0/2] mm/damon/core: remove unused helper functions
Date: Wed, 22 Jul 2026 19:33:36 +0800
Message-ID: <20260722113338.302603-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both damon_targets_empty() and damon_nr_running_ctxs() have had no
in-tree users since commit 5ec4333b1967 ("mm/damon: remove DAMON
debugfs interface") removed their remaining callers.

Remove the unused declarations and definitions.

Tested with:
  make O=../linux-build-mm W=1 mm/damon

Cheng-Han Wu (2):
  mm/damon/core: remove unused damon_targets_empty()
  mm/damon/core: remove unused damon_nr_running_ctxs()

 include/linux/damon.h |  2 --
 mm/damon/core.c       | 19 -------------------
 2 files changed, 21 deletions(-)


base-commit: 5e0603ba185af6754422ad28b646798686b6caf6
-- 
2.52.0

