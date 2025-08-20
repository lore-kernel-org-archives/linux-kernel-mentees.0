Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEAB28466A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 05:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755667252; cv=none; b=fJfK1VAmEq2l7Wvsn3KKxWVqaJhXI8qyZzIQ+S/zCKqFZnTZhgNGXzEcnYFzxcI9r0gDRwnhmFp1hMHi6DtMKHexzsk+BxCI5Mu7U4bNH0XUvH5JCV71xbweMOKw1c1gAfKq+qFqHC4zue5wO9KiNE7bLgP7JdqRKgwJGLpXWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755667252; c=relaxed/simple;
	bh=e7sGOYXv4pBHEJEh84R+NEKRrUcl59Rnj2qZC5guILs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lXR92tURdtfE5GINzU/WW+hOayuxjav5INZBzeHnpxZCCTPGdF+RTloEPRyx24J7BS0HdbYtG/hMem6YrTJnnw943sU6yg214xVYt8VRKTlx+QN4a60Dr+F3NaWGpz1hyVelkenCO6yBERjgzcW/uyJJXP5c9ZoQWdEkmqI9qdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAerXV2l; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAerXV2l"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D146E8237A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 05:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSrB-TDv6DBr for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Aug 2025 05:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 140C5824BD
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 140C5824BD
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eAerXV2l
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 140C5824BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 20 Aug 2025 05:20:49 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad4f0so8199747a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 22:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755667248; x=1756272048; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o323kJRY5rGGcUtY2fkwlyKrvR96I0AXwLWEB+2JTS4=;
        b=eAerXV2lLe+9FFyODP42dmiscxC/0ElDPaQaufBRqlwjxxVWI43MuluEGOMue9+9Wa
         s4YKqzutpBuZXdIZX/+z4iSwbrOfWFNyASKferCPVw0ubwDdn25yJxan0g6wX1nrINWX
         j4jlQ2943uaTOyP4mxp2bZwtwI2qXI3RE2iZScDUHrbb8QxXvlV8pIJ44nfjDE+pvpL4
         v6fp8UeFgT0CdAAUfQERTpZE6LmMg7VXbsiT5QPJUd/tAbnUK90GM8p+SidYGIQFimMe
         iNLnj5hFjBsRN6F2lMYoqqSa40iLe0B4S4ihFMopE66liHKeOh031oSGZY1uicnbyid0
         ecbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755667248; x=1756272048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o323kJRY5rGGcUtY2fkwlyKrvR96I0AXwLWEB+2JTS4=;
        b=sa555RUzCb1y9N/clNpJXQnbaZu+CL1VQhqi6zPzIsNu2jzOuwMZIolNHF81zWsM96
         EFedxUwd3ssAzSI0+nYW+3Rx5aB0PVesdchMx3qyy4zPX63mjSOM8804fhxELMIIU6/j
         HaxP97aANU9EEaPcepyO4rZ9wyRuGZ0hLJvNZv6G22mLaqMjDvuHfxxcnHxae7V1lgRN
         LaR8Fu98lUGTRQoAQbxpnhXqkPcah6aUjCAGdJd5zVjQPKWeQcG05tUL+gO+BMYArH6y
         AmI51TBfrrut5ukLwcDE748SpQTJmtSedd/SGxklU0OZOoHH2WCsSYRBUBIwFlx8Jf4G
         N5tA==
X-Gm-Message-State: AOJu0YyB/01wIy/Qrz274bFXDL14eREX+5TxaibmOdPJa3BfiZj7WHft
	4M9spAI3mRITe/kkF+Mt0atdljdOpXCRa5XWubRWCQV0vXzDZrE/l56r
X-Gm-Gg: ASbGncvJT1MJeh93u5JcdqUqJpDhTwC7qKFVTaXyh0FnVN9j9ofSBzdmUz3mIpBz7Xp
	zowq/FPn81BBTkGLXe588oBk2A2jymH/TbsyYhddYmvHCKHILDigamVeyvowmggj2C3CLzV+cf5
	4NzMKawK8wZ7h1X48L/g4zbyC9KtAl9XtXlXzWspCBG7iDx51QAYbEhqkhR+SdBu8hCHsPiZcI2
	YnPKd5kJhChgt5FjgPEZV0zktiwHE2znPFLc3fM2eKI4o29tu8JgmH10vmmmwKa5SnCGyZZ2jvt
	I5tOcULzwqn/rnjwYJ+hsJLpcXGXeWF0OLNF/2XqGddLexmKSNfG3aia4HU3rshvloN73/4c4FT
	RZwyngE9M/oVj+W1ao53gPacsTOIGF/duXYDr1nHDFzPXYyWu5HKqTR2wmvM/meXIAA==
X-Google-Smtp-Source: AGHT+IE8hW86398A6QfrTbp+PmyKyKF50B5zls28U5WgglVUukHsdsOBPXPzXd5fnCYPaY9NQg9tvg==
X-Received: by 2002:a05:6402:5247:b0:615:6482:7498 with SMTP id 4fb4d7f45d1cf-61a9786a5cbmr1403779a12.31.1755667247727;
        Tue, 19 Aug 2025 22:20:47 -0700 (PDT)
Received: from linuxlab.zamel.local ([178.216.139.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a758c0e6fsm2927655a12.57.2025.08.19.22.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 22:20:47 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: skhan@linuxfoundation.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] selftests/ftrace: Split worlds in return string
Date: Wed, 20 Aug 2025 07:20:44 +0200
Message-Id: <20250820052044.130115-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split concatenated words in return string.

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc b/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
index 9933ed24f901..47fd615a4542 100644
--- a/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
+++ b/tools/testing/selftests/ftrace/test.d/event/event-no-pid.tc
@@ -110,7 +110,7 @@ fi
 
 cnt=`count_pid $child`
 if [ $cnt -ne 0 ]; then
-    fail "Child of filtered out taskhas events"
+    fail "Child of filtered out task has events"
 fi
 
 cnt=`count_no_pid $mypid`
-- 
2.39.5

