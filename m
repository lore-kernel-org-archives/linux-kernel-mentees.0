Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0328B183CA7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722508698; cv=none; b=pOnRICOnAPY2bTldzjnx4EVkNqoh+kFp54IYLdLDtNxvJ+AGJ/Ap/3E7/LRWl+AbUiFsS17uZyAKn9VgaajhLaoF8t3+qs07cqO6ECBRrEuIGtAxKDmu7C3UxjvBfgW+TnLR6Y4yMGsD0/fjE9XDgFRDXgcQuAyXUOyGuuJ0LbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722508698; c=relaxed/simple;
	bh=Pcdd2OAiIWyuZMXeVvKxTdGurZRxlZ0vBhhCXkjzbhE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BRvpQw88J5XfCqtDObL6/2D2gI84cdZE+xn2lD2XKuHoRAGz9i0ow54l8gJ0NA623PexhPEfDzxIi1UPmQjDiEEfaqKh9czTEwEqpX6U+5HANHUlrY1EtQK+M/MUhyGZqVtwlxg6+ekzmQfHn2pA7cVCZdIj823oBjaxqvPw6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVm3kXju; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVm3kXju"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F9AB81EE0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 10:38:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tB2YH8KMzMnx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Aug 2024 10:38:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=simeddon@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0DA1081EE5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA1081EE5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DVm3kXju
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0DA1081EE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  1 Aug 2024 10:38:15 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2cf213128a1so4430060a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 01 Aug 2024 03:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722508695; x=1723113495; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:commitdate:authordate:author:mime-version
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OddAGnogMzwyUywxt75MAgs7i5xQVWsmf4N9UvPIx4=;
        b=DVm3kXjuK7ZRBqRNilGDVwSW159vK9ooUqfYgyfyq/h3XCL/9jUObAI4h2LlJBTnvJ
         RZ1cqcFmzcieqdxNsDL0GkM/ikbfXqOesSQVYYisfU0FabRfjjfKgXcJJlHn07EguIH8
         CHCCSez9rT90xvA5oZQYwej+fBxo59gHFWBOv9y17ZJgTHqRApctX2eYp8gQGsX0TcMA
         qmzKFUq47vyTojrwsxxJCm+99qIQROh2Vau11b3Jynb6HwCUrdAe/uG2S9il/YcYvR1S
         MshxOD2EdPN7ktrvzxDZ8PBay4f75rU851a/1hAY3w5zb/OfivOnKlYzljWwnytzS2mz
         BZjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722508695; x=1723113495;
        h=content-transfer-encoding:commitdate:authordate:author:mime-version
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OddAGnogMzwyUywxt75MAgs7i5xQVWsmf4N9UvPIx4=;
        b=keJbTICoxGYcDoMUjDoVxPh7+cnp9HMzxajEtLgbAhS2Fgs96aHsRznK8f7xAmVrJp
         MbAI2nzPCrVWkSu8os5vWD047FoRaW1MiOSHsfMCjHFv1v51+5wa5d3hdtomFbSIxtBy
         xDWxFMTCTv4G7LvBHPnRBMMwDmmnHGap/20cwIthD9tru0lHew6e7EVt+k8WQN5bsOC9
         2DMpUwAho9VkD0H3scY7CL5+QgqXnOlSpFaxZgR3G2gPnNjDX1kT1kCG6bkGsMIKGSCH
         tWaUjuhhgyVd/cSQrUmjKiRHbnJRbfP+HYp6+c2A7LRzdz7ehMayUQrJOdr4ovEPxxTC
         rQyw==
X-Forwarded-Encrypted: i=1; AJvYcCVSE4SeQRnB+NAOR6w4ibbtvCIY5a18970hfK/zr5SoEjEQ0DeyxZwJSu33HrGqJJSt8qyau0vwXOIrU5cqNkWQbc3D7F+9IEBW3qt4E8b1euQdbLD711Fwp2pILiIW
X-Gm-Message-State: AOJu0YynfQBVEwKz8N+cjP00Cgs5PYX2Jk/G54cEXvP0Jkev/G7mEGMy
	0H8++1yWzT2IxaKXLRuu+ktKz+/xzavSEjpYKPDwydetyoAnr+YT
X-Google-Smtp-Source: AGHT+IFBI0DHScbC6amgBlVxn2J2zKkK3OutMUhQqP09Suo5Mh50hQluUVwU+3AmXk5ocswYWrT2SA==
X-Received: by 2002:a17:90b:380d:b0:2cd:27be:8218 with SMTP id 98e67ed59e1d1-2cfe774a1e7mr2420917a91.8.1722508695210;
        Thu, 01 Aug 2024 03:38:15 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4add69sm2895495a91.47.2024.08.01.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 03:38:14 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: =corbet@lwn.net
Cc: =linux-doc@vger.kernel.org,
	apparmor@lists.ubuntu.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH v2 1/1] Docs: Update LSM/apparmor.rst
Date: Thu,  1 Aug 2024 15:53:57 +0530
Message-Id: <20240801102356.93591-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
AuthorDate: Fri Jul 26 23:43:49 2024 +0530
CommitDate: Thu Aug 1 15:35:52 2024 +0530
Content-Transfer-Encoding: 8bit

Docs: Update LSM/apparmor.rst

After the deprecation of CONFIG_DEFAULT_SECURITY, it is no longer used
to enable and configuring AppArmor.
Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is not
used either. Instead, the CONFIG_LSM parameter manages the order and
selection of LSMs.

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
V1 -> V2: Removed historical information and addressed review comments
 
 Documentation/admin-guide/LSM/apparmor.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
index 6cf81bbd7ce8..47939ee89d74 100644
--- a/Documentation/admin-guide/LSM/apparmor.rst
+++ b/Documentation/admin-guide/LSM/apparmor.rst
@@ -18,8 +18,11 @@ set ``CONFIG_SECURITY_APPARMOR=y``
 
 If AppArmor should be selected as the default security module then set::
 
-   CONFIG_DEFAULT_SECURITY="apparmor"
-   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
+   CONFIG_DEFAULT_SECURITY_APPARMOR=y
+
+The CONFIG_LSM parameter manages the order and selection of LSMs.
+Specify apparmor as the first "major" module (e.g. AppArmor, SELinux, Smack)
+in the list.
 
 Build the kernel
 
-- 
2.39.2

