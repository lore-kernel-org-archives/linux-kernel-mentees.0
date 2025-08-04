Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E371FF1A1
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  4 Aug 2025 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754331005; cv=none; b=eh8+Qkvyn700XYWRMZSApcTYT+8bdZ9FvDhu/7RQWPrMybLzQHSyr6rnZSVjWyUpqlQnQGqpjBTQbTDBMb+mKENGw7cJ8cSvv5+jrs3UF5BzPVKAKNGa0YzQIIWnffCqeLNWKIpyVmmvkqY5SSsp7hj+LcKNzeuppSpgoTCgaDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754331005; c=relaxed/simple;
	bh=8tUVEOHCd6vgZOjmZ6wGCyZD35jdxuSt3593rFQJiRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JB2O/so/ayWUls/lIew6165kDX/VpF0tKkb9uHnXMIH9/Tgmo54BoTcyqXZQgp91/l6YOsenD/ulpevF+XVMtMc5g7EDp7kZbtIAwdmu0N8EEh4cTTHPwkAo50sd0Zy4RfKS/QPKS2QC65BDoIm6QA3+RemsmULuk4eykG39KOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtjrqWMC; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtjrqWMC"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-31ec95ad016so3814021a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 04 Aug 2025 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754331003; x=1754935803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=WtjrqWMC3tNtoOS+86/0VMLA5sfi8NgFZ2gTDmrxW+CLgtC4+0cVKeS1HKCwb01/FE
         rnFwBs5Re4We8NGpYtspTX3Qwu5I27Nms0XDZG0ERa/1zjzUV1ZFyZz7O4y0Zt4jq1LV
         kxT/iuY6ear+GFdOe+BoXIoQYYjcr/2lkKx/m8gd2koTR9FQIxvu77Dw0BcHxeexgnX0
         XqrgIDEzV8l8owATamQ4/zSummSdMEe6GJ346xAQ46YRzCxJlIKY1vJ4z/wHqZOSZscy
         NAoCZOFhJJWCl+aJrlU/Fe99p00KDnN+YoucnGV68Fu6YbHeEATiAoLUhl8N8E5aMqZV
         8CLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754331003; x=1754935803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=uSLG8gfY1ySdfnBvTm7g012r6geF7jQ62toutr1hqkNNQZe0TiWFgnIfqqJ/7aBi+r
         FJGsTVc6Y35qMVTiDaWwhPCe3J3JZnxtQzd+4G4JO5AZ6i31+4OKE9luteWUPad/wvo5
         ZuYT/leAvp6P17dG4r3hSUznODsdMT5RJ3iiDdKO0Vvn0Lfwnz5HlSnYbLX2tn6rb4Kb
         t4SAQolTnrTPOAoGybWXZHNKj1Nrshw8FjF7vbc4SGo7qhmfs2tso2jG08i4n4LTafjc
         AMe2MZKvRLA/nu51dPZkfQsLG/YKO4tay0Vzjd07ARUE1OMbVxpawpK+0dSq6f3ZSnLH
         0cJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+miRKQ104kawRTjsMZL5XDlrLvXIvHC2WHOazg6cS5dk6xh88tDYxPlR2lN7o8xrjELudIezfLmCHvXEVlcusTUDzkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfWlNkQ/T8zLOqwYu91oiz5Cm1ZhW6qm2qdPpotCx0RbxFenai
	YWvxURtUNVvJcuDhFnm5mWqPTKWK979soYiFf/RgP4ckgdw0ukiUmoqi
X-Gm-Gg: ASbGncuuU4o/EODx/7JRiRo+pwpq9aUoV31ZdAv9bKORelTqwPZPAcZ3fJXPjTME1Dv
	Ui/TDy00+8J7fBHOZ+K8eWpYmG3qq5dHN6Yb0fZB0eIPd1dS3zn4fpSfOlwfYdPMFk0AFNxh1pc
	WddqmpgVhOekVUFfg53tLGgsNRb2NLAMfNX0NMuG5oeqddHpP9WbS40V8zA6FUDM0NbSuWLCoyp
	Mvh2aS8AxjqQxCd1b1ndmBBVFlDybkxMFXk24/jXMCdBijDnbLjRrEz7U7I45RMedAaRHcozm4W
	7By/DN7L71lIfc33dtPtbe63fAIZqdGducWvRGVP8lqlU02VWSTRior7sEbtvqcCc7eb8ti/4o8
	YKJow4T/sLXJjfq41qXFGEbjZpnF9klk=
X-Google-Smtp-Source: AGHT+IFutXw1L/XOjScRsdDSpV+r6eKI63rbxdFUQe76zmXPfvquCWiV+zd8b3fzU48UPDGnuelkQQ==
X-Received: by 2002:a17:90b:4397:b0:31f:346:c670 with SMTP id 98e67ed59e1d1-321162cd915mr11001796a91.30.1754331002791;
        Mon, 04 Aug 2025 11:10:02 -0700 (PDT)
Received: from archlinux ([205.254.163.109])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422bb09d1dsm9508864a12.58.2025.08.04.11.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 11:10:02 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v3 RESEND] checkpatch: suppress strscpy warnings for userspace tools
Date: Mon,  4 Aug 2025 23:38:25 +0530
Message-ID: <20250804180825.15055-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl script currently warns against the use of strcpy,
strlcpy, and strncpy, recommending strscpy as a safer alternative.
However, these warnings are also triggered for code under tools/ and
scripts/, which are userspace utilities where strscpy is not available.
This patch suppresses these warnings for files in tools/ and scripts/.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---

Changes since v1:
- Create is_userspace function to check if the file is in userspace
  directories

Changes since v2:
- Change regex pattern to match top level directories only

 scripts/checkpatch.pl | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e722dd6fa8ef..fe580b0810f9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2636,6 +2636,11 @@ sub exclude_global_initialisers {
 		$realfile =~ m@/bpf/.*\.bpf\.c$@;
 }
 
+sub is_userspace {
+    my ($realfile) = @_;
+    return ($realfile =~ m@^tools/@ || $realfile =~ m@^scripts/@);
+}
+
 sub process {
 	my $filename = shift;
 
@@ -7018,21 +7023,20 @@ sub process {
 #				}
 #			}
 #		}
-
 # strcpy uses that should likely be strscpy
-		if ($line =~ /\bstrcpy\s*\(/) {
+		if ($line =~ /\bstrcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRCPY",
 			     "Prefer strscpy over strcpy - see: https://github.com/KSPP/linux/issues/88\n" . $herecurr);
 		}
 
 # strlcpy uses that should likely be strscpy
-		if ($line =~ /\bstrlcpy\s*\(/) {
+		if ($line =~ /\bstrlcpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRLCPY",
 			     "Prefer strscpy over strlcpy - see: https://github.com/KSPP/linux/issues/89\n" . $herecurr);
 		}
 
 # strncpy uses that should likely be strscpy or strscpy_pad
-		if ($line =~ /\bstrncpy\s*\(/) {
+		if ($line =~ /\bstrncpy\s*\(/ && !is_userspace($realfile)) {
 			WARN("STRNCPY",
 			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
 		}
-- 
2.50.1

