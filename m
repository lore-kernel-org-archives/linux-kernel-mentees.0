Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6527D29B23B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 18:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690154; cv=none; b=SGFDqKPcwIvdfM78XpwdMB4mdsIDnIwZ8e9Nn173uakccqOeNnflSNBcp3RnAA0JPauENsphaWgf11jQ562F3lYa4GbnMuTc/gMrKRJ/SHN9YwCaTJq1+q80PjDoEa3+6G2+GMC0BDLlkMb4e+h55Y0QXJ7U1nVkQDtQLq3GU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690154; c=relaxed/simple;
	bh=0nl090ZOoinWZd1DwjTnbdyiFKG+e4UcxDg20wSOmbg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uzvvrfz1k/9yS3tcHg2CuxLRYjeMHjyY1EFqGHvS7sN4t6rNaY433VULV3okxzKqR37DPVjcgsSMDNVcXfpHEpmV3CK4bIrDHeuXYxlWLTtPVKMVGwOjZUfnUCT0tQjGOP8zfMcHVhmQTRozQai+MYBK/b/mcHY2gMkgvcBV34U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV3e/v+N; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV3e/v+N"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C87140D48
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 18:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LF4w1aclyk_P for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Jul 2025 18:22:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63ACC40A58
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63ACC40A58
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nV3e/v+N
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 63ACC40A58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 18:22:31 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-401c43671ecso128784b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 16 Jul 2025 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752690150; x=1753294950; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kviAVPIV6QiWJ6mSBU1RXU0icX9kGbvx4g3kYZu467c=;
        b=nV3e/v+NKKU1hDm2m/E1xx9FEM/LxP3ulriBINuNXzaWQBE5giFOathKFfhl234zoz
         X5mj15zuFberbb/VI4QLUbOF6Uwtho3jW/WDMTiibblTAmr5vegQ+f3P5AhprhWlNGPQ
         1dOxwIpMFWPtqcGphA6qt/jVx9QZVhcrw2wjiOgR+5SnRS2ehRS96GG2j2l2UT9hZ7vs
         TOZYLUR0TdcDmwOey0C67OkN0yA3/hUGNJm/7kRljGyH5UkkV75wF2yJiStn/TrxUi6b
         K8mlEFN32phqUZMvmzvSvFnF3OlaDVftwD0MZ/l/6oH0y3sxfM5DlRUjJzkzkCq1yV8F
         RoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752690150; x=1753294950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kviAVPIV6QiWJ6mSBU1RXU0icX9kGbvx4g3kYZu467c=;
        b=VWiLG15VQTu0obRQFKOcNYPCqe2dewSgnRG73H4D5sUmi7zzTqp5CvNw6IgPDSzeIM
         bR2jbe3vZBkiDwWhA3p26JGORlaprE9Sa7H9DqmP8MTwbgK5HJfucldVnC6XNcTg6uci
         ts88l371oBMFi7YG61bbyInURubcQR6U5aOjGpjCYfihkEHgJ6PF6BSp6ZCtzRyD0pRl
         /SBDobIgS+RnMDo3UUgelxABjpNE6EuLSLsp5sj290qLLkztl9dWx+6kKOLWHoD/BcSx
         x67Qe/kYAMNH9uvHR/DWNRPgvFJw5WllTwtLmRIjcif4vICEZhExP0mHznZagNQKxyN6
         tRGg==
X-Forwarded-Encrypted: i=1; AJvYcCWyg5QF9DN9OnI2LijOu+Y9Pwzshk3O2P66IuFWYLiP7IUfzLBLtkvgG2JvPAew6KLIu3yQ3amLFX/UgEc2s3qEkim0Ng==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YynIj3UFYlNCj2R+LDozZDgRiJpjBgPKl8/z9/hJxnUGdkvp9oZ
	jVAzt7CRwT31ITAU+J+NQnppa78ZwuOFhfn/rjUj//gauRT91fOnZsA3
X-Gm-Gg: ASbGnctoWl7qkeoGyCM2TKfUHXouhXFf/Xw+QbJ1Y16h0Wd7nmncd2Mhm2zEkpDRtJx
	VLHTxKcrmlyggdxg5D/dL4gk6Tvamc19hlFN65f8x5Kt6SaJyuMxRuEWZ/H2DpiNA2IcM7H4KPP
	z3Gf2xyxrfunQD6P0eM/MNKfmUUF/gpqrSTu7V7NWhJDbTNkh2aV61CTxIfbl+9cXUsSeBzkQ6h
	YlvAfAn6oqikj2ve+wHo8GmOlMn2oz1Pb/r9baHT6XelBEirWKieyStYETr68e+n2lXOB2bQUEg
	NDfKpWNLCrEBOWctIC4Rg2jG22Btz1ZciC+wv/hFhpIstF29t3eIeObfBRcdG2tISLtA92MkMZr
	dYL8JIELY
X-Google-Smtp-Source: AGHT+IFx9+UvCZpBpSMindy2yzPwVLH4FcTuwv6wnARoO6WOcLt4gVPyFH4qADi0Hk7H9lfiXsliUg==
X-Received: by 2002:a05:6808:15a8:b0:408:fe75:419f with SMTP id 5614622812f47-41e28c748b2mr426539b6e.13.1752690150075;
        Wed, 16 Jul 2025 11:22:30 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1000])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-613d9f14472sm2317697eaf.29.2025.07.16.11.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:22:29 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: cem@kernel.org,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] xfs: Replace strncpy with strscpy
Date: Wed, 16 Jul 2025 15:20:37 -0300
Message-ID: <20250716182220.203631-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `strncpy` function is deprecated for NUL-terminated strings as
explained in the "strncpy() on NUL-terminated strings" section of
Documentation/process/deprecated.rst.

In `xrep_symlink_salvage_inline()`, the `target_buf` (which is `sc->buf`)
is intended to hold a NUL-terminated symlink path. The original code
used `strncpy(target_buf, ifp->if_data, nr)`, where `nr` is the maximum
number of bytes to copy. This approach is problematic because `strncpy()`
does not guarantee NUL-termination if the source string is truncated
exactly at `nr` bytes, which can lead to out-of-bounds read issues
if the buffer is later treated as a NUL-terminated string.
Evidence from `fs/xfs/scrub/symlink.c` (e.g., `strnlen(sc->buf,
XFS_SYMLINK_MAXLEN)`) confirms that `sc->buf` is indeed expected to be
NUL-terminated. Furthermore, `sc->buf` is allocated with
`kvzalloc(XFS_SYMLINK_MAXLEN + 1, ...)`, explicitly reserving space for
the NUL terminator.

`strscpy()` is the proper replacement because it guarantees NUL-termination
of the destination buffer, correctly handles the copy limit, and aligns
with current kernel string-copying best practices.
Other recommended functions like `strscpy_pad()`, `memcpy()`, or
`memcpy_and_pad()` were not used because:
- `strscpy_pad()` would unnecessarily zero-pad the entire buffer beyond the
  NUL terminator, which is not required as the function returns `nr` bytes.
- `memcpy()` and `memcpy_and_pad()` do not guarantee NUL-termination, which
  is critical given `target_buf` is used as a NUL-terminated string.

This change improves code safety and clarity by using a safer function for
string copying.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 fs/xfs/scrub/symlink_repair.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/scrub/symlink_repair.c b/fs/xfs/scrub/symlink_repair.c
index 953ce7be78dc..ce21c7f0ef54 100644
--- a/fs/xfs/scrub/symlink_repair.c
+++ b/fs/xfs/scrub/symlink_repair.c
@@ -185,7 +185,7 @@ xrep_symlink_salvage_inline(
 		return 0;
 
 	nr = min(XFS_SYMLINK_MAXLEN, xfs_inode_data_fork_size(ip));
-	strncpy(target_buf, ifp->if_data, nr);
+	strscpy(target_buf, ifp->if_data, XFS_SYMLINK_MAXLEN + 1);
 	return nr;
 }
 
-- 
2.50.0

