Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB1125DF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 00:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739579063; cv=none; b=cLRo6Fgl/SzM7969+rYA4bX1EUsuZ3/FoG7s4EEEu800hkjWLwGyeyzwqINjhWWSiw2WjRyFo3AbeyAEM5ryi2Gz6buwg4LO+IwFW4COHpdWIerRJV4dIcK5eFJ4VlENz6HjkAGEanLuFfexI6Gl3WbtdgSMnjP+TVdQOUlzaHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739579063; c=relaxed/simple;
	bh=AjyglJCWXCq6goJBQvJcmRlUYSdjpyO+9rjPr34OO0M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=hSuDdsbZM5NdI2j8cjJd/8vdz0b8uyptjxQ1/9IZG+93GK6/e5BVVIybcdRMc9TeZ+o/pOtfYaLNFPhBpyykP39hl9+0ObrEgCQSy8pC9iPv6L8V1lhr70D9H0tekGjQXuv13sExZkTKxMpxP409gycMMVMV3qIW3AyTK48YS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJ7xqkNt; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJ7xqkNt"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E92536FCB4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 00:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTVwtm5UTfjJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2025 00:24:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4177C6FCBC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4177C6FCBC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nJ7xqkNt
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4177C6FCBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 15 Feb 2025 00:24:20 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5fcad6dbc73so1321054eaf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 14 Feb 2025 16:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739579060; x=1740183860; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cFHjecYD0TumMHxPOXYPdCr2G4EtJJFdINrgiBMiOA8=;
        b=nJ7xqkNtAJlE2HCnJ7so21niPdX33/kPwh3wrU1wbeien38S4RLCKjGBFclT2XDQFd
         hSkLHX4Fq95TWSGAEfHW3JLhhwTZWZJYvfNG8Hbar1aRPDUyHf6p4tC9QTvfzh4/R5KS
         N6N7ffa4XaOlLJQBbcbyPXVo3RuCcdvqDqHCvyyOuYRu106HllKMuKtcLH30n8c2oJe8
         cbk9frnXfcyk4O8Hyh2NxDffdfWEwYuum5ZFyRO3Hjc8hAwpNFn9s+UYxfLvP+TPsH+8
         LdsvSoNP6fu5HdYdrpvNoyUdIVDOy1gpLR5kNJgq9s3vF+FG3Enk8xX5+LGnD6JG65ut
         n3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739579060; x=1740183860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFHjecYD0TumMHxPOXYPdCr2G4EtJJFdINrgiBMiOA8=;
        b=f2LrGQkg54AxbZOYVUN+k5u5Dx3F2U11/KJZZIGaqLI5f6tj0puM135sijiltUeD0D
         hcNGrB4nPJklFroaFuwDA/WtRfzecIUkzK8733C6RmAAahB+ieHJMd9SIkyHz4IPTThq
         PKkh742K5R25JwndWxrhluiKETeoDjsCOLkhVTtwwf9qZMf7pIdjiMxWM1pQQxfjREaq
         QlQ0QCvLMNtJLSPYi/cW/XmKgWQteK1riFIEqhVW/20svfPrGYndXY7hvoTJaE8Ati6f
         utyYM/Tjb1nd7Z6ZWpuC1yLjvme5yDR04otgTLy0BvzGBQuqxWCMEgJdZCVsCnBNLIGB
         fYKA==
X-Forwarded-Encrypted: i=1; AJvYcCVLy8TJ59VmnaMga0H9oapsz9BWsyh7gfA1GbLsfaZlqNxWoA6Rix/LOyJxHKZysisU2CEi/G49ONaWIcf+ytw+UT4nYA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yx0EV6rqMLxmgTN+L2D4/0roXEUN5pWxZ6g7U6XjqP0AOnqVXfN
	PNb+wujnG7SbjNqtlgwEvLQVBf3bujh59nxSew3L6Bfkfn+pJ2fb
X-Gm-Gg: ASbGncsLVhSpZBGXBIy5Lan1jvIIIhwW4nJT98KdbT7Msii5KAoqmefGsq2LmY2SP5a
	M1fVwzwV4pBx3/pNBYE2zp8LQOy1qj2AHBZr8SAb+axd7kRH0z2mSIKC3Le5YGr1RDfjyupPK1E
	96vc0GeT0+IQWZScBO5/fug1KVMWG9f8Fjl69ke9HDeQy04b2aNMwb0zL2uhjLuatfgIAxobmdy
	G4YnlnNJUqjPJBADn24hM9J9WJ6WVa+gq/M8UEgThXFkJbZARFXYy3OulKW5fvwHIqK6ah3DvJz
	4rhw
X-Google-Smtp-Source: AGHT+IH89pZHBlD3ryiV+QjKjWQhmf7QDm1o2329s9oeb0v5UWJQlau6GOPaW3E5sQMrsiAwntAaSg==
X-Received: by 2002:a05:6870:9b0c:b0:2bc:7797:aa95 with SMTP id 586e51a60fabf-2bc99b46631mr624011fac.20.1739579060048;
        Fri, 14 Feb 2025 16:24:20 -0800 (PST)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b95a7b5495sm2140018fac.36.2025.02.14.16.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:24:19 -0800 (PST)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kselftest@vger.kernel.org,
	martineau@kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] selftests: mptcp: connect: Use more formal wording in error message
Date: Fri, 14 Feb 2025 21:23:30 -0300
Message-ID: <20250215002415.1465504-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update error message in mptcp_connect.sh to use a more formal and
consistent wording. The phrase "not able to" was replaced with "Unable to"
for better clarity.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 tools/testing/selftests/net/mptcp/mptcp_connect.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.sh b/tools/testing/selftests/net/mptcp/mptcp_connect.sh
index 5e3c56253274..bdc9c22af6be 100755
--- a/tools/testing/selftests/net/mptcp/mptcp_connect.sh
+++ b/tools/testing/selftests/net/mptcp/mptcp_connect.sh
@@ -261,8 +261,8 @@ check_mptcp_disabled()
 
 	# mainly to cover more code
 	if ! ip netns exec ${disabled_ns} sysctl net.mptcp >/dev/null; then
-		mptcp_lib_pr_fail "not able to list net.mptcp sysctl knobs"
-		mptcp_lib_result_fail "not able to list net.mptcp sysctl knobs"
+		mptcp_lib_pr_fail "Unable to list net.mptcp sysctl knobs"
+		mptcp_lib_result_fail "Unable to list net.mptcp sysctl knobs"
 		ret=${KSFT_FAIL}
 		return 1
 	fi
-- 
2.48.1

