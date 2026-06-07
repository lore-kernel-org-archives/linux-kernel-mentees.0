Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605CC2356BE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  7 Jun 2026 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780826269; cv=none; b=p2KzoxPBzQ362wYHip1Sg0Qo6oVPGTd+bLGFpFCMf3scUOYo9TD87NQUYZEc+lr/5eVxR9ZAJnDX9i+0OqNdS1dC4Rc/ZmI/yecQOqJLPYja48pyDpJEGsMGsvqepeJAnXA1vq+PS8Gqj+vJrF9qJjDNeZI+qsY+URB5TKOXBkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780826269; c=relaxed/simple;
	bh=/AJLl7TAW4jnfScW7lJQ1Ius0LjgiyPDlDG8ytEvnAg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I1aTyxVzCBwJFjoVzW+aIe2HXyVXysC0RlQEjSHernESdvSfNvopERfy4uJwjtfpblCrVzvH8mgEW4AfLRJ2dJH9Z2ipV+AVJOT9fV4zFBaHBpFthOCiwx75d+2Aw4Zhvd5CUs2sIi0pgqYFC3evB4Zo9+lj+f99o0ydstlO2mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqVFzD9l; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqVFzD9l"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B2D7849EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  7 Jun 2026 09:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe8zdpoM1UDo for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 Jun 2026 09:57:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=hank20010209@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7DE0684968
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DE0684968
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DqVFzD9l
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7DE0684968
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  7 Jun 2026 09:57:47 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf1cda2b17so24167225ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 07 Jun 2026 02:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780826266; x=1781431066; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyyh/F5nRQCXN7Ux6s+nTV9a5ThuYqK6lhUEffWvYyY=;
        b=DqVFzD9lwKe+yOL2/FvfSssqwzxm9/quds8KyP0aiP3dxoYOu7z6fZ+z11aU8T4F9t
         3EYi2SZE2eCc60n8rwdFM8VeXiDNlnT3sEPUwSfeBuGywtueUmNWUd1PNLTn1lMR0Eu0
         5W8Idd1exvfoLqrl4ayzxBwOQ45CMnJcWtVEP/MYWLtQ0ndc8j9r+1OYDqd3eJwiNyvM
         1B7Ia2unbZwiujVUwTWgzPMV/CioAKsE4a9utrGp07Oop9qMnAS92cCD9ssYV89AEm3y
         WZyDj8CsRa5QiFCV8YumXSOmLhU20EiLwdWENgASOH/q2EKmWkotN4xP4jjSjfA4PqGq
         GQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780826266; x=1781431066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyyh/F5nRQCXN7Ux6s+nTV9a5ThuYqK6lhUEffWvYyY=;
        b=aCMH/+7TJdoTxxlex6aAHIF+2PddAML7+77DQJxnguojRKPOb7ZeHB1CYPWuu4FjfD
         yqi3SNYof5RLOTA8raQO3vdqBYfOtYec1tv59So6TWKd371lGUJGzV4jONs/uLB4BC9L
         2K1ydqBkGNT1amlD8jTu3qjdM+AeyWlfAs/iuU0QrObC1S1jGVD+veT9IAYDMLQE957z
         aidnK4LFy7E5u5oRR+SZJUGUjdPASwJ9++BgMMYbzJV1oIy9inkQLguDItfFJrExRNKl
         Gf2tPCVdTrjATgpY7sBmsS8gcxrhYPZv/k61xc6cEwyOxdRezb9bcsXIAoWIdWH9LcvP
         gX7A==
X-Forwarded-Encrypted: i=1; AFNElJ+uZi+WkpRGq78aNbgLlXk6coYcOv6sK3qLg5SF/zNy10+E1nwKpvbsgvAE1QMLC7Imod3gvc3Q6fBw52icxD6oxwZaEg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzeQsAw2DXCDtJJxki5bLDu34ckQfOb4pnVr6BU8ec2wnjiUyCy
	qWgQpAs/rmUL6k2RynHDo4E8Os6m92w28JTGYMK4ckls2xk8MjgBzZcd
X-Gm-Gg: Acq92OHSibURnZ07MSn8nkuYYEw7ovvhLgQbC8EQQa8okGKV0Vg8zVmFCD0wyZ5GDgK
	uutLJJD//Z8CALzWPdlewzsIe6AIlQ0B9VAp9EYkZiUDO3tBjt06CW1+i9ql3D1CAhbZFxzrcl1
	ZppKU6ODiacnI/YcD9yKXi/EGYKt61GzR2Fo32G7P28aLPrkANP9Kro7QjwH9JSKi6Tl9TWTwm+
	qjylb1SpTVrYT0IZGItrUDg7B95etas27US4gWAKbjNYWFf3b670yJKHenW8ouaKqNpI6OIcWHv
	lo/nLCeNbQ4BMEK3bNCj5XNRuWU9UmstHHwAie/reTeKYO5hnijsVGSdiL5YM02bwKDzkvnB7qa
	yVPzhQ8vtObjzEJ4ThS6Iw/M4me9l1X4S1mVUy3lMvtHlzwZB5TqtEvfB8tMDvcULoW5KerFxwH
	4WXxISsitCImV9bDL2OCXZb7IuKQ==
X-Received: by 2002:a17:903:3b8c:b0:2bf:361e:3edc with SMTP id d9443c01a7336-2c1ec3f61a1mr90984805ad.2.1780826266430;
        Sun, 07 Jun 2026 02:57:46 -0700 (PDT)
Received: from apt ([140.123.97.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1663981basm143188635ad.67.2026.06.07.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 02:57:46 -0700 (PDT)
From: Cheng-Han Wu <hank20010209@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Cheng-Han Wu <hank20010209@gmail.com>
Subject: [PATCH] selftests/zram: fix kernel_gte() for POSIX sh
Date: Sun,  7 Jun 2026 17:57:32 +0800
Message-ID: <20260607095732.71823-1-hank20010209@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fc4eb486a59d ("selftests/zram: Skip max_comp_streams
interface on newer kernel") added kernel_gte() to zram_lib.sh.
The function uses the bash-specific [[ ... ]] conditional, but
zram selftests source this file while running under /bin/sh.

On systems where /bin/sh is dash, such as Debian, the following
test fails:

  dash -c '
  kernel_major=6; kernel_minor=1; major=6; minor=0
  if [ $kernel_major -gt $major ]; then
      echo ok
  elif [[ $kernel_major -eq $major && $kernel_minor -ge $minor ]]; then
      echo ok
  fi'

with:

  dash: 5: [[: not found

Use separate POSIX test expressions joined by && instead.

Fixes: fc4eb486a59d ("selftests/zram: Skip max_comp_streams interface on newer kernel")
Signed-off-by: Cheng-Han Wu <hank20010209@gmail.com>
---
 tools/testing/selftests/zram/zram_lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/zram/zram_lib.sh b/tools/testing/selftests/zram/zram_lib.sh
index 21ec1966de76..0d44d83888f9 100755
--- a/tools/testing/selftests/zram/zram_lib.sh
+++ b/tools/testing/selftests/zram/zram_lib.sh
@@ -37,7 +37,7 @@ kernel_gte()
 
 	if [ $kernel_major -gt $major ]; then
 		return 0
-	elif [[ $kernel_major -eq $major && $kernel_minor -ge $minor ]]; then
+	elif [ $kernel_major -eq $major ] && [ $kernel_minor -ge $minor ]; then
 		return 0
 	fi
 
-- 
2.52.0

