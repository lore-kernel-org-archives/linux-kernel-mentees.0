Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7450F33554C
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 18:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762971650; cv=none; b=PMk4RHN07kSwn/hWY46EneXcfk1m8+nhPKG0UjEU6xXkH6sd7WJaYCiHMfLP1RuA0cydiOloXQ9WYpG2MkCIhVJxz/lnkTQF5Ziche/ku0rkT5eUpWxUQlvVvF0Qc7xTM1/78V2HBUfvrWs+GWx7yjMLqs3ng4Vaz9pEzHAdgVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762971650; c=relaxed/simple;
	bh=UWTVi+79biUDXYVbP1Zfv1jqXnj1FUi+MQ3m7OOq1IY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kw5H1T3KGfcXRfmi8KlFOx1giz+Dtx2hRYGSHUeZ0IjjA387QlaxeJ+ATutOhxoJUvcQVhi4qWLpJhE6DiorXnC/51/OJuZFt4nXwpFDFoDU2X/QIpAHYhOZkyA1VgD+0F7RonGA64ibARUI+X4ItYwRjppvJL+88DRmDj3HTF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UT3C7tUt; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UT3C7tUt"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4edb7c8232aso14559531cf.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 12 Nov 2025 10:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762971646; x=1763576446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bm1UHN2KZxJ0B3W03H3cTsYhakxCO69X9Qr+GtDJfPk=;
        b=UT3C7tUt0OeyWGBL+Zcs200dHl8cprnqYKqD6eCc+kDWQ6GgygIMRc4uct3eWeHFmm
         1OIYzgD0IsvwfawxpTFh3pK494aYwUOXJIPSTDy3Wn+Mzcar4XS4GsJuTN5ctAfrD8uU
         LLc5UtY9aBYYBPJ+xEWpkPvylwTjJJHSu9tLrE1phVO9EvNo/GbYkIbblanZRj42jXGE
         RCEqCcwrtmDuKZWdeeBj1LP+4G4BY2pH8FRvbB8YTTzwOHIUVfxpPUe4ODrjKKWFNnAF
         OlgAaM5rBxbK38jFyrFek9uWeMCnh5RHepsNlFQL/qTfY7JvoqiUONZPg+pI9QsWNeP1
         94rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762971646; x=1763576446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bm1UHN2KZxJ0B3W03H3cTsYhakxCO69X9Qr+GtDJfPk=;
        b=KLl/tkuEwBBKGxbtYG8irhq5butqdigzdw3++AZ6WfUm5kFOVh+NwoQjCsyxlJZau9
         fxSX8B8aDhSdZSg9Zwu30og/UUmj+adoD5OgfC5F17bxwFoB8kUfqXyJnOulDVzl0PhJ
         RyjmJNdY7NNlXYfFCalyb0xjdfZOQT01S/B7VIdNuGNp5FRksy5BwfI2TM5C7+31UPX5
         5adlvWyuODQp0vjD6NI77qYh2zkXECCrCir2wJ7DhbPHXGk//q135AXOJs1RDLG5FZkJ
         pIXqWGOI7OyzgBaV9O0Ojx82ZcQHc8JXcdQK8Lw3l/pSY5AArY8VM7YDRt+Cn3dzq2md
         WW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGYtDhtLwcBxIPshtGIL73kQMwcA7E7UlkN8iBYEb5KKWjc53miPXM87R7Glsf4gJIEbXMXZWI7/DqUhnbeNrIQzEC9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3So0pZngfeJicQNQihpivRbfa2PM62G0OoClrLNYVmNhfSe9k
	5AXw0hAZtR0+uFFLcXem6VyKaK8fATGvu0ZTznscajl1X/jTxddL8Gi5
X-Gm-Gg: ASbGncvLOcEA7Q1AKil1b866ChcI9xB6vQ8tzwITLuCvM64S0eTvI9QZWbw56q9RTQK
	9QQLcbdmbbOnSOf2XnQe6gUrl83E1hlUzlqUCfMv9aPSKJWjucadKJrymyOU6sJ0FYIXTK0FuJH
	Q1uVZVpneN8AGGwr13iZy62BBL0oXJ8M1oKKUJn3w1qwDPUbBJYw+RfeEauIBPKgAsj080qItLt
	Bo2FxMfAbPgobqvPzr/OWNUuQkUeQTOJeO7XRHVmHmgSSvq2t1oGgJPYzO6ESbMr3wQYV0VpG+c
	RLQPS8Nh9SxOolzyJNnFCvEhBpmclzYn3TNDvkh0WBrr94XSJIRYV6+64zj3OtdpPXoIUDMi0uc
	ekqU1ERqfQIPxG/EFTFNaO1GM+/eUfgDjN7Pp2dfBLp8KKznNrGw2FE1tNYhXmBLE3zyn5FxBg8
	pHEXPa2aG/JrrJqCdGNlU7
X-Google-Smtp-Source: AGHT+IEuXqC6cY8OV3bFmpAtTGXgz+fn2i6JPBVrYLRDN+Z4yHegy+UVfSzEKFMHist/CiPMcek+nw==
X-Received: by 2002:a05:622a:1ba3:b0:4ec:f073:4239 with SMTP id d75a77b69052e-4eddbc6a4f9mr52756321cf.6.1762971646334;
        Wed, 12 Nov 2025 10:20:46 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda5659cd2sm92260921cf.15.2025.11.12.10.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 10:20:45 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: cem@kernel.org,
	djwong@kernel.org,
	chandanbabu@kernel.org,
	bfoster@redhat.com
Cc: linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH] xfs: reject log records with v2 size but v1 header version to avoid OOB
Date: Wed, 12 Nov 2025 13:18:18 -0500
Message-ID: <20251112181817.2027616-2-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aRSng1I6l1f7l7EB@infradead.org>
References: <aRSng1I6l1f7l7EB@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In xlog_do_recovery_pass(),
commit 45cf976008dd ("xfs: fix log recovery buffer allocation for the
legacy h_size fixup")
added a fix to take the corrected h_size (from the xfsprogs bug
workaround) into consideration for the log recovery buffer calculation.
Without it, we would still allocate the buffer based on the incorrect
on-disk size.

However, in a scenario similar to 45cf976008dd, syzbot creates a fuzzed
record where xfs_has_logv2() but the xlog_rec_header h_version !=
XLOG_VERSION_2. Meaning, we skip the log recover buffer calculation
fix and allocate the buffer based on the incorrect on-disk size. Hence,
a KASAN: slab-out-of-bounds read in xlog_do_recovery_pass() ->
xlog_recover_process() -> xlog_cksum().

Fix by rejecting the record header for
h_size > XLOG_HEADER_CYCLE_SIZE && !XLOG_VERSION_2
since the larger h_size cannot work for v1 logs, and the log stripe unit
adjustment is only a v2 feature.

Reported-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9f6d080dece587cfdd4c
Tested-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Fixes: 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
changelog
v1 -> v2: 
- reject the mount for h_size > XLOG_HEADER_CYCLE_SIZE && !XLOG_VERSION_2
- update commit subject and message

 fs/xfs/xfs_log_recover.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/xfs/xfs_log_recover.c b/fs/xfs/xfs_log_recover.c
index e6ed9e09c027..99a903e01869 100644
--- a/fs/xfs/xfs_log_recover.c
+++ b/fs/xfs/xfs_log_recover.c
@@ -3064,8 +3064,12 @@ xlog_do_recovery_pass(
 		 * still allocate the buffer based on the incorrect on-disk
 		 * size.
 		 */
-		if (h_size > XLOG_HEADER_CYCLE_SIZE &&
-		    (rhead->h_version & cpu_to_be32(XLOG_VERSION_2))) {
+		if (h_size > XLOG_HEADER_CYCLE_SIZE) {
+			if (!(rhead->h_version & cpu_to_be32(XLOG_VERSION_2))) {
+				error = -EFSCORRUPTED;
+				goto bread_err1;
+			}
+
 			hblks = DIV_ROUND_UP(h_size, XLOG_HEADER_CYCLE_SIZE);
 			if (hblks > 1) {
 				kvfree(hbp);
-- 
2.43.0

