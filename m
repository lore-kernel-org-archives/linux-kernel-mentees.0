Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52091D63F6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064461; cv=none; b=av0puAD8gV99/K/MKgLcDqs6J2XDnyDRRn/ICkf2YYCynjfzcmWdtxMJTP05UggXX9vwQ4O+Xu2e9frAUBFG6MyqZXZXpNlcvZSZkdTG4T1kiTFBjHjtkgRPCxZeP9opJPVx5uT4TS8z3hAsJBEmBKsnpJ8Phe22urQxQYcr3RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064461; c=relaxed/simple;
	bh=9eaCaq5y9D1r80+Z5+qGqUat+koJb6OIj9wcd+uQEiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lj+Flnu8znBnDfoRNWeajjlR/Tj9ETAlvRQ7sqEHBuz+mvI+bby5PTGuJy5HqRQ3g7hEu4kFJmpBaPW/du31E2CDuiyLkUEB8A6uDAyTDEtCNEhHN44uh52LyqL5GHzhobyUhbhdMg/yw/KFcTegGjJ4k+PSAdAM0haCv1sH+F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jTkGnpqP; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jTkGnpqP"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B45660AD5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 15:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ST21G5hkE5Z0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2025 15:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B81A860815
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B81A860815
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jTkGnpqP
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B81A860815
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 15:14:19 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220c8f38febso22019375ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740064459; x=1740669259; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqQpBY4aFk+b5TA2ZFF7XiX758vlnpBYffrh3Zwz7wU=;
        b=jTkGnpqP605AKbenlPtg1YXIDf5LOVgB7y0Piu3slBYqZHi1xPU3pJV6H4jkaCvSEd
         tY44+LfPWLyDf0OC3NZ000gQJmUsheaeiWsTbbPIlhbHj4d6a564S44ItiOM5KkOXNyo
         w2EUoNc13p4JVPwDoveRcVR1Of2o51w4UuRti9xbTFMO2k8KxsmBkpvYV+Zx/I/b6k6R
         8/XMogVKwpi5oViCOJPs5WztT1PIKWgEMZnlRA2rPYnD/t8m3XH+xWLkJmnno8auixeQ
         wVgJy444aNg41SqRQNvyqsyySLmO3jYLvdanwJBSrIyrtXgvERUojAWruzVYxSwjdt2l
         dhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740064459; x=1740669259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqQpBY4aFk+b5TA2ZFF7XiX758vlnpBYffrh3Zwz7wU=;
        b=oeqHPwnyOnN7GEazQSJb2D6jgM/RUb457+0RT5ynT4g4QsqomZigZzqpK+NwsSmY6O
         EcGvaTkco977raWMta0uh4tp1NtKB7EDX/RbiU3xiDMMhEgPa2RR8phtZ/d0H/P/m4+W
         Cd20H1omQxsm6xVp7jkdiBEqnK4fI00KrDbExwbIqRdULEGZXpnlxPGZoYW8me2Sgkmr
         gMX2WQjQQ5BzGpJzFyXFbIg6t4DSoZ5p7zqHT9HTsOoFFyWjljPZtKOfNoiB6bQc81S9
         F4qAZ5XGvYJtw0/qN1gX852H1QNyNVVuL+wkySz2r1RMEoPejkWMKMRW0O6wuzMktLjx
         GPFg==
X-Forwarded-Encrypted: i=1; AJvYcCU3EbMQ0MGHxgjlchS6wxMhhGf2xa1RJxVQpWTSW/Hwwu6mYIQcdMxtk9+JH9eYz+UXVZiNXSY8Bx4/0uKL5vJjZ/mDww==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyXpR3ZlFajwm2VXyUStGOg+djLyS8l7cLHtgsxBT47DyaLhh6J
	SL8iq+vW0p0vtKcCMNrwbm4mTAQgl1BaIujHs7KUQi0VsIuQedpf
X-Gm-Gg: ASbGncvEm+g3n+2/7mYE+JU2VUGsjr+/U9QAAELMTlccQ4j6xm/Hi6Kd7e2Mip/oCC3
	XBId07IesvJEpvqDZtmp5edrkcHYUvBdjfIVSbCtpS17xOaNIwrcTtMfmcg2DxioXZl1k3dPkUo
	eY+R516edbXUm78BKIbe+DjEMygHAony1qZt3DA1ykVGZdZAVSk0SsuJEqwhBAx1kA5dtHYydBs
	19s2+S8N4DPO9MlYcFjHdyTQkfMBF45IblIeB0RC2eLBtIQN25SWYU9P8pP1Ob7vnZ5c5S4x4Gv
	d+109jNwqulvkB4a+R7BuiyWp4wczGW1cANuMjQ=
X-Google-Smtp-Source: AGHT+IEBhHNkErGPHvUIGRDjQRfvuODqABxRCX5C2SR4N1tK6tuSLh2jC3rHExY/Aml3jqmJl8PUuw==
X-Received: by 2002:a17:903:2f8e:b0:221:2f4:5446 with SMTP id d9443c01a7336-22190639e7cmr44995675ad.25.1740064458775;
        Thu, 20 Feb 2025 07:14:18 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5349389sm123310255ad.42.2025.02.20.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:14:18 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 1D910E7C4B5; Thu, 20 Feb 2025 20:44:15 +0530 (IST)
From: ritvikfoss@gmail.com
To: linux-kernel@vger.kernel.org,
	ricardo@marliere.net
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] scripts/checksyscalls.sh: Add usage message, fix -Wno-error
Date: Thu, 20 Feb 2025 20:44:14 +0530
Message-ID: <20250220151414.8003-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220105940.5241-1-ritvikfoss@gmail.com>
References: <20250220105940.5241-1-ritvikfoss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

Currently 'scripts/checksyscalls.sh' does not
provide guidance when executed without specifying
a compiler, instead it attempts to execute
'-Wno-error' parameter as a command,
resulting in 'Wno-error: Command not found' error.

This patch adds a usage message that is displayed
when no compiler is provided as parameter to
improve clarity.

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
Changes in v2:
    - Make the script posix compliant
    - Fixed formatting

Thanks for reviewing!

 scripts/checksyscalls.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 1e5d2eeb726d..96cba9f79249 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -10,6 +10,22 @@
 # checksyscalls.sh gcc gcc-options
 #
 
+usage() {
+cat << EOF
+Usage: $0 <compiler> [compiler-options]
+
+Example:
+  $0 gcc
+EOF
+
+exit 1
+}
+
+if [ $# -eq 0 ]; then
+	echo "Error: No compiler provided."
+	usage
+fi
+
 ignore_list() {
 cat << EOF
 #include <asm/types.h>
-- 
2.48.1

