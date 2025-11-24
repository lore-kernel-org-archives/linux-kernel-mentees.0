Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273352C15B5
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 24 Nov 2025 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764006798; cv=none; b=KnhdUNmA1FQgQDuzrHGfxnRPxoGfYGCBQ95bfFmodnpsFgfFtyFjzPclwIGCnth7wt1tfjWgXBHE8iNh3HAadbYJ3X18vmoAa0Pb7/s+E4F8Ax+eMA/ATbvTGjmf/nBP0uP6yznfIQIgqXoQMhU/MpuW6ru9Hniqkt9KdN7sBio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764006798; c=relaxed/simple;
	bh=bBWF8rPKKMglK7OceS8v1RN30lLKUQ1GD0/J7LhaqAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0FtChDPVDBFavMDDyf2VJI/ZLVuOQcs6aQrnslFY5ic6N0hT+ZOcoKYFjLV/l+SQ9O72O9xznj519u1nFAfoQWvuLCa0Ig1NNoXsozPU1Ls8++dN7f/I+E0LJrutW/2atDPqZGdxSfTsEQnPACUqx6FXfQBE3Hxs+7t9mYD3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUFkJ8LN; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUFkJ8LN"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88043139c35so45943266d6.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 24 Nov 2025 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764006795; x=1764611595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LURuhpVUuY1JHDBVH0tH7eUgzbVsxd/8tIMD/zbq7mI=;
        b=HUFkJ8LNGezzHm+h88hSqE5S6GbRnH7++wERBUy+cUN++4QGNzmGWgtmipLHJFwlW7
         bNEqybuGlUlkDYDpGNeicoWMv0jWjPVbAQvlnNjSJXY/749p+feHTIDp4eYioZ7c1Jr+
         N3pZD34ZVKiZKnfP/f7ATDxGjl7wCD5arJkWWEwWvnePxAFVIKH3EG1CB9kGbWlvZTIG
         8PO7yUf9MZv8GcAjM8PjF1GrZ/skdmRPAA98LBpnjKtvq9h83GCNHGwoNoYVVQ31OVjj
         2IowGRm6vlXpgpYEuiF3baUfud0801Vs2ncmMksOxh7mPm6Ch0ATwwEFqU7R/S+Z9vPZ
         pwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764006795; x=1764611595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LURuhpVUuY1JHDBVH0tH7eUgzbVsxd/8tIMD/zbq7mI=;
        b=Yw4jBBzQqMJKOWYXbbhtMmRV5fcTOKWV2wSDa5ulJzPItybt3XpXUkEwCs5NmbtGPD
         rlOsmNdheo1Hc/PafelRKo3xIkkhc44NPo+mHjuMg9usGFkmrsH52SbMPcP6e3pcLcJP
         K47mWRiLFultyHYZn2W6I2MHu0Gas7H/edBtgnihrgWDleFh2FtT3CbpNsrQ0DeCjRWB
         qUdiZ/plAsuN51aCD6kqHhlcb9CVRsYwYh/UmBxYAl/FebI6ImO1xLjtc1ntL1+puQEf
         taH2YxxIcswBMsYSNOdYAwSZmz3IP/NOQlP+Lwj9STQjlHbbCLvRhXpjvN5MH4sn7vWc
         iGUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMR7KoyL0b0ak6jEIbtNrbMxdyrCbHi7tkOvDehVt4U5uhcyIgYzkJ1sGOr/Z7cRXj5JbXLX3mo+pNaq7LTae3c+Rg9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzwAdItmcRle0SbdMH++DGPzpaOH/Q5+ycnc4SMVDPE/IKGJKys
	qZaqr+pO43yFXKDf8hvZIebteIb6VG7t8EwKpGA6WLHjBtX7XJayc98Q
X-Gm-Gg: ASbGncv6lQ+7HCwcUVRIV3MeqnUPy3Vt3K2leSgVo0v/HAnVpcmVwBo10tYMkG0Vk9D
	Y8lPb8gTWfXI7YTNOIcfIE7FjnZ3af5HIgEFeXsNbpOIgC0dh6LHVVJl0twMpfEqDchvd5yL23Q
	HCJhUfhTxvjeAasape5le6SBJ+uY6OiphbG6A5fSZvaQaRNVoIQg3umfolye9Iaq58iHNzpVfk6
	lf57YoloHxQECLs7bUBNh+go/V1SHn1MDmS3grwFYd4Xrj4gVQ/olikHgTpXGP9XJKF89/1vKFW
	fq/4j7vMxdH3Gd0aULGOVvgL2gk/DMJMH1dEVmv/Uj5GV9EGI/uvfW1JleQ7TPC0umvkoxUeg1D
	/SvBrXu5iSLws9WW8D7FPYDtFXMt1bxyONyAjDaTFeRTZ4lUI2T1EG5ir06hk6xVcBvNVyBu7dS
	BmAS+eiE/lGQYHi8rB+EZtV9HxoS1/DeNpZdsPLTvdUQ==
X-Google-Smtp-Source: AGHT+IGZatrd1Mjg+Nhia8Dfmz1nAgU6r7HISTxMbZWQ2yO30LFfqsql/fK1HY1Zg7Pq9Sx9BsZTdw==
X-Received: by 2002:a05:6214:21cc:b0:880:4695:4626 with SMTP id 6a1803df08f44-8847c4c7bc1mr171890916d6.15.1764006794854;
        Mon, 24 Nov 2025 09:53:14 -0800 (PST)
Received: from rpthibeault-XPS-13-9305.. ([23.233.177.113])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e58ded0sm103284776d6.48.2025.11.24.09.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:53:14 -0800 (PST)
From: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
To: cem@kernel.org
Cc: chandanbabu@kernel.org,
	djwong@kernel.org,
	bfoster@redhat.com,
	david@fromorbit.com,
	hch@infradead.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com,
	Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
Subject: [PATCH v5] xfs: validate log record version against superblock log version
Date: Mon, 24 Nov 2025 12:47:00 -0500
Message-ID: <20251124174658.59275-3-rpthibeault@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aR67xfAFjuVdbgqq@infradead.org>
References: <aR67xfAFjuVdbgqq@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot creates a fuzzed record where xfs_has_logv2() but the
xlog_rec_header h_version != XLOG_VERSION_2. This causes a
KASAN: slab-out-of-bounds read in xlog_do_recovery_pass() ->
xlog_recover_process() -> xlog_cksum().

Fix by adding a check to xlog_valid_rec_header() to abort journal
recovery if the xlog_rec_header h_version does not match the super
block log version.

A file system with a version 2 log will only ever set
XLOG_VERSION_2 in its headers (and v1 will only ever set V_1), so if
there is any mismatch, either the journal or the superblock has been
corrupted and therefore we abort processing with a -EFSCORRUPTED error
immediately.

Also, refactor the structure of the validity checks for better
readability. At the default error level (LOW), XFS_IS_CORRUPT() emits
the condition that failed, the file and line number it is
located at, then dumps the stack. This gives us everything we need
to know about the failure if we do a single validity check per
XFS_IS_CORRUPT().

Reported-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=9f6d080dece587cfdd4c
Tested-by: syzbot+9f6d080dece587cfdd4c@syzkaller.appspotmail.com
Fixes: 45cf976008dd ("xfs: fix log recovery buffer allocation for the legacy h_size fixup")
Signed-off-by: Raphael Pinsonneault-Thibeault <rpthibeault@gmail.com>
---
Changelog
v1 -> v2: 
- reject the mount for h_size > XLOG_HEADER_CYCLE_SIZE && !XLOG_VERSION_2
v2 -> v3: 
- abort journal recovery if the xlog_rec_header h_version does not 
match the super block log version
v3 -> v4: 
- refactor for readability
v4 -> v5:
- stop pretending h_version is a bitmap, remove check using
XLOG_VERSION_OKBITS

 fs/xfs/xfs_log_recover.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/fs/xfs/xfs_log_recover.c b/fs/xfs/xfs_log_recover.c
index e6ed9e09c027..2ed94be010d0 100644
--- a/fs/xfs/xfs_log_recover.c
+++ b/fs/xfs/xfs_log_recover.c
@@ -2950,18 +2950,23 @@ xlog_valid_rec_header(
 	xfs_daddr_t		blkno,
 	int			bufsize)
 {
+	struct xfs_mount	*mp = log->l_mp;
+	u32			h_version = be32_to_cpu(rhead->h_version);
 	int			hlen;
 
-	if (XFS_IS_CORRUPT(log->l_mp,
+	if (XFS_IS_CORRUPT(mp,
 			   rhead->h_magicno != cpu_to_be32(XLOG_HEADER_MAGIC_NUM)))
 		return -EFSCORRUPTED;
-	if (XFS_IS_CORRUPT(log->l_mp,
-			   (!rhead->h_version ||
-			   (be32_to_cpu(rhead->h_version) &
-			    (~XLOG_VERSION_OKBITS))))) {
-		xfs_warn(log->l_mp, "%s: unrecognised log version (%d).",
-			__func__, be32_to_cpu(rhead->h_version));
-		return -EFSCORRUPTED;
+
+	/*
+	 * The log version must match the superblock
+	 */
+	if (xfs_has_logv2(mp)) {
+		if (XFS_IS_CORRUPT(mp, h_version != XLOG_VERSION_2))
+			return -EFSCORRUPTED;
+	} else {
+		if (XFS_IS_CORRUPT(mp, h_version != XLOG_VERSION_1))
+			return -EFSCORRUPTED;
 	}
 
 	/*
@@ -2969,12 +2974,12 @@ xlog_valid_rec_header(
 	 * and h_len must not be greater than LR buffer size.
 	 */
 	hlen = be32_to_cpu(rhead->h_len);
-	if (XFS_IS_CORRUPT(log->l_mp, hlen <= 0 || hlen > bufsize))
+	if (XFS_IS_CORRUPT(mp, hlen <= 0 || hlen > bufsize))
 		return -EFSCORRUPTED;
 
-	if (XFS_IS_CORRUPT(log->l_mp,
-			   blkno > log->l_logBBsize || blkno > INT_MAX))
+	if (XFS_IS_CORRUPT(mp, blkno > log->l_logBBsize || blkno > INT_MAX))
 		return -EFSCORRUPTED;
+
 	return 0;
 }
 
-- 
2.43.0

