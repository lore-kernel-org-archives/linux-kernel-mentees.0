Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82241F0E37
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927614; cv=none; b=MfFwjEeoPMzPVd8v9HwiX20V9/PFDnVqQVNxSrDpYLPTu3XT+l1g958t++szT+CVEcdU1LiGhAzzK7M2rgahf/sjDoa8ES6W2Ec1hTHkHlYvTL0Qi/qYCIhz6twi9PKcX7IT70tmnsKTBuCMgpItqGsYUwOFgg+QSGwoFKOkuFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927614; c=relaxed/simple;
	bh=dyw0wQTRbXjxi+0VWV/JMJdHvbVqiKc1LJw7c+OmfAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=noDAVU+AbQlHNiSPsInOCQde4mc1PuH5n+2UXxc57ZBzgOzh6q0m+1vG9HVxTkDBzDhmZtm+HQG5ngb8nURHFzWb6lMnCPheapIky3ZHmcTiT5ZL6UZVWHEg+6Qc6XTo4sBnUQJDktf41+EeVLeMlVVIREVJlL5Tk6rM0d6m0Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dBKmJzWb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dBKmJzWb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313a188174fso3672511a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 14 Jun 2025 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749927612; x=1750532412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00PmhWqs3GR4JJ/AcsoM8Cgv6mtpTVTNbyQtFPJciNU=;
        b=dBKmJzWbG3TjZuW6Mpogh3m+ChxdeCNPXuyZqEBktLVuhqARlObCDMAshogXflLlJl
         GUyheukwmuIgMqM8mzmavJPS/uX5wp6/RDKhDcqhVJnTGRnWXnLQFN4yjo3C1rDHspKK
         W/U6Nwj7lbg0NNm136UPu2n5xmay/tzIgPrlw0V+h72pBIcG/rrCsb+tRsqYvvqm2kSS
         XFSEijHDRRt7Yu3k6dzo1FvaIigwqYrsZbyLdST3fGuXNbF3iWgZDu1gyToyRq6UbNWq
         +FTyMuK9E9Zm9ExQWZpSq8RUa3M9KoqLiam9yvSptWy7m8dAokf2SMfah5weNl8FAApG
         0HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749927612; x=1750532412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00PmhWqs3GR4JJ/AcsoM8Cgv6mtpTVTNbyQtFPJciNU=;
        b=LLvMT6oKhA/8HuIK2BlJ1ryqCMxjiIMBthxPtWvmeVRBGzQ6hAyb+h84m639rm6wme
         026dd31YN93BGAflXP4ICDaVZqhFQ8MXKtfEOVJbuo4PIz5Jp6V9r20Uz04lk4Ewl2l4
         zgKaI2ey8w87aWsJ/epra9UEewfKqCY3SgN6vnl2VWj4ggsd1v/YVDVR02QbR73OL3Pn
         A/Qn+IqBwgZX4xcKAUSyFGFTBG15JAsL2B/Uoj9uJ6kT8Tx6BBpcehCYmRujeFv3oLrZ
         BoAgzt5FVTEQvzBcbqvDz/C1oJPwFXHxrzJvrBjHBbJJvkLL0LeuOcdbmXYAWorKzCy1
         zu4A==
X-Forwarded-Encrypted: i=1; AJvYcCWO3CGvBzSKuGNBosGbY2LEzOpOKzm9z99D0BpFPDvjn8+6ZO2/PIiYaqbPXKPLTWTgw+5T4RhjgpemiIKajdMRLqFf8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmsUTPvTwgeNbkedDklrpviqRCkN8P7u4SyIOCBEuqf9LamCse
	/21gNjqKbgpAkyDmXTjhyA7GHKB86tYcbKUt8Szr8m8XkPE0YHcLStDl
X-Gm-Gg: ASbGncsySose1iEpgdld3cM+iIvz2YMhCurLjqp3cAS6FIRQlH+2mklzJsP3eL0Y6Ft
	HbX0SqriLF1xFa5z0lf4IfmqxvVSGfq9xs1gU3bPXFKWgbLAUMWAJz4rEioIoJzvq+J/+6Lc4M3
	LEqn/2FLbuyWJVOwIMlO34YrK6Ki+OyMKo+z/m9ePriaszfIb71E3ueGAshvdw//nZbHaZw7uNa
	Wk/SHPO3G9r5go6tlk0Eh41i3FctMEGyHARyZRInVyuyn97TwRO0QaRxSziappAFUzNAlnvkvqZ
	MWSjiDFbbAgmOxYFQAOU6BB/KXiQGi8ulNfF1dKi4aO2d4ghjNmvqim3hAj8fF+8b/yyaDAKpDr
	3HrxE/QHGGRVn6tEraOM=
X-Google-Smtp-Source: AGHT+IGMc1Tc/8jLJ/4AwpFgVCHjKd5rypH8VsIzJvSnR0TgQFtjv6rIwGGpuu4mWH25Z4bdJGbyBQ==
X-Received: by 2002:a17:90b:4e90:b0:30e:3737:7c87 with SMTP id 98e67ed59e1d1-313f1bfebf6mr5605657a91.5.1749927611957;
        Sat, 14 Jun 2025 12:00:11 -0700 (PDT)
Received: from localhost.localdomain ([223.230.56.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1bcbc9bsm5457987a91.9.2025.06.14.12.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 12:00:11 -0700 (PDT)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: kent.overstreet@linux.dev
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Subject: [PATCH] bcachefs: don't return early from __btree_err for bad or incompatible node read errors
Date: Sun, 15 Jun 2025 00:27:40 +0530
Message-ID: <20250614185743.657564-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After cd3cdb1ef706 ("Single err message for btree node reads"),
all errors caused __btree_err to return BCH_ERR_fsck_fix no matter what
the actual error type was if the recovery pass was scanning for btree
nodes. This lead to the code continuing despite things like bad node
formats when they earlier would have caused a jump to fsck_err, because
btree_err only jumps when the return from __btree_err does not match
fsck_fix. Ultimately this lead to undefined behavior by attempting to
unpack a key based on an invalid format.

Make errors of type BCH_ERR_btree_node_read_err_bad_node (only if
__bch2_topology_error) or BCH_ERR_btree_node_read_err_incompatible go
through the full __btree_err function instead of returning fsck_fix even
when we are in that recovery phase.

Reported-by: syzbot+cfd994b9cdf00446fd54@syzkaller.appspotmail.com
Fixes: cd3cdb1ef706 ("bcachefs: Single err message for btree node reads")
Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 fs/bcachefs/btree_io.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/bcachefs/btree_io.c b/fs/bcachefs/btree_io.c
index d8f3c4c65e90..e010ae94f1e1 100644
--- a/fs/bcachefs/btree_io.c
+++ b/fs/bcachefs/btree_io.c
@@ -556,7 +556,10 @@ static int __btree_err(int ret,
 		       struct printbuf *err_msg,
 		       const char *fmt, ...)
 {
-	if (c->recovery.curr_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes)
+	if (c->recovery.curr_pass == BCH_RECOVERY_PASS_scan_for_btree_nodes &&
+	    !(ret == -BCH_ERR_btree_node_read_err_bad_node &&
+	      __bch2_topology_error(c, err_msg)) &&
+	    ret != -BCH_ERR_btree_node_read_err_incompatible)
 		return bch_err_throw(c, fsck_fix);
 
 	bool have_retry = false;
-- 
2.49.0

