Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD28184E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 18:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755281081; cv=none; b=rGEiCta1ZfliKWpRAYz9yba9XOsSO6DLkA4uUbztXbUNGycwPidl+4cDQVVFxSZkJQdxmWeb3VV8Y4Q4CZeuzzSrXJQFnsZqnkshYKKb0SDgKckub3a3I80kAFRq12i2XWpX4foR2hUNumFm+TfVixdn6kMIPLDpXEyqen4lLqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755281081; c=relaxed/simple;
	bh=8tUVEOHCd6vgZOjmZ6wGCyZD35jdxuSt3593rFQJiRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cOKLT7cSp12bCC+lhIihnoFxjQUh61Gem8yyUKBfFPZ2y+dLCHFfFWDKlL62I+iALT4Ejhl0iL7qyi+J6qyg7Bgix1gTRYZ8F5E1KG3qnp3e0+Q8sRUPILgSQ/l9etqXTMBo5JjJAlamVC9bAJQZL9TJgVD2Mm5sOaOSYJTWaPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YEI6IHX+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YEI6IHX+"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e44537dccso523631b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 15 Aug 2025 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755281079; x=1755885879; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=YEI6IHX+UVCtgSbbohSyMIeDPm/GZg6wOvDcpj04F5NwzBVHdHwm+J+BBEMPa3UEyI
         c9oR7VN4QvBiCUSLA87AivtDnWSJsKZ1oJAMbZyFCk/xwc/V/WskWmkd1jymwZN9tFab
         r/jd8UDoBVJWnAVtUVYLCJ4JM1IIMGF23yacK2AHw1syKfIC+YlmXpfsYxHIDuqkwvps
         d9d8cOnUFwuDuxvzS/rtT5pIdys0MBNZmF4yKaJTy+nkitG0uWOrYs+ur1ulHdA8+Qk1
         ZiytsoRhspq5yjUf50/HuNZf5tuz+8cfWTsFSNFCmdL69aZ4+XW8nY+Be/ZhhHEHBHe7
         FRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755281079; x=1755885879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjnd6OOtdW9yy47zlEw4IHguBzP7Muvi9jj9yhTRBOE=;
        b=M5Hx2U2XxwFpc6OeetKlXQLMyNG1DvZaFnzs9znO2EJUkpTXPh3iMzC9fE24zylozB
         myhjCF+wGU+f11BHWnRzlN3N5enqZkqd2ofLi4OMsxBkKQzmkhkNYitwozIljGhdy/AY
         plX5cd5VlVZF2XOtvKhp9f5F4/gwhaYjB6Gd8axJGSn6VzQdNb08D7PRWjFLhA6g4sxw
         1i73uSJXAgP/u9Y9wLEcLYtCHnKGO4/Czhz4Dsz/A++ay51KNM91Ei6B4u2j8n3WJ4lK
         r1p22iuJ9UhxBZ9qjZN+gA79jVy8+Qmt/uRyXS/wA6VLVaJRyq11DPBB9Tvx8bN/5wz2
         z23Q==
X-Forwarded-Encrypted: i=1; AJvYcCUpcb0FYAreqSNCy199z4BEyF5yGSfry75Fca8Irm5L67KMNztohAqbZMlzTZlGIhjAHpQ+PZLdlCDS3UdB4KRVBHGlHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz24/qFrLZVLFPKXepY2A1q189cDQl9l8msPNRRHKYLmtiLyHY
	92HKAPmKqX6xmcK1XXe2wVpVfNC3v+HOzVapjZNiHd4uUzflIXqMSU0/
X-Gm-Gg: ASbGncs/aUK4d/r2K8fXdKSOa98vXSLnqCAAg6U+C2uVm88ly7IgBB21AM9plULkIQR
	VW+6zE1cuiNdSrtTwuuG8OwaI0YDxpIVHlFdTZcnQhFmtujibiIQ+iM7bkqGspSdqAxISqSHTtF
	mk/89BoYsDeQKw5JQZevRboJYPWOf4S1d9wHHjcJl/0DgddpqJ4/bG5bL4qViBbMg71/GOMXShf
	vk6BW8anBjcchprU7NVPW6E6dE7IQLlCbdLdBw03ZFcggASCwm8AGeXBUL6KX0rm7dz6MHY3iuZ
	H9LblslVj1Vr8hRuaIYezVEKTO8/3g1+LkdKxwAXrvYHEbWqrRu6fqq9Uyy6nXuAM/K02RbF5Ha
	ec/GtD9F1rvZOWWoVw6pfOKJtTtDsQ5+4nIjkEMT9nN8=
X-Google-Smtp-Source: AGHT+IHdqRPTyIcttlXcxE7oZJD/Rxum8jhYUpDfRRXcp+yZKhKHRlr4U8LI87W+kih1ENq9zMjiOg==
X-Received: by 2002:a05:6a00:4fcf:b0:748:e1e4:71de with SMTP id d2e1a72fcca58-76e447dcb34mr3824537b3a.14.1755281078642;
        Fri, 15 Aug 2025 11:04:38 -0700 (PDT)
Received: from archlinux ([2401:4900:93f2:6a91:9b6f:8f9d:11b:d64a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e4526cde0sm1579049b3a.23.2025.08.15.11.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 11:04:38 -0700 (PDT)
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
Date: Fri, 15 Aug 2025 23:34:28 +0530
Message-ID: <20250815180428.37795-1-suchitkarunakaran@gmail.com>
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

