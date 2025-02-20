Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355D81F0E58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740049187; cv=none; b=s15qUUzfu9rq44DolUMxvcwl49qhhPd5vcR6NlT+I8NcDEFKFnxgV4u8jaRhtqG8/DAeD5zmm5vYKZpeFXRInt95u1mNXkKHAN4qM292UJErfWeUqPKkfIjLkMdcJEMYwJQQHM+TwiYQ3gD1flgGFr6ZgoijVqW5qeK1n/CIcEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740049187; c=relaxed/simple;
	bh=Hq+lcScj3/h1iEKRxMa/1ZGnirQuXYtvzF7IQlJoFgc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cgVNNwW52ADVAVkn56NU/+f/NrbeJB15MeeNFkx0oIeK5jsQ3FUlJGw7QkeA4VaSlgd1bdxfmRUKOtt4WCgfGYdUVHhKMubKCo8KFxyeGcRHMfiYEsUdbe7d6GEVLBXPxlAEyVN0a7UtObiAX3qgtszt9ul6I9kEOJP/sRYoyjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D40Zje6h; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D40Zje6h"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2FD2611C8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 10:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WOrC-15Vz2Ys for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 20 Feb 2025 10:59:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1614B60A44
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1614B60A44
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D40Zje6h
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1614B60A44
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 10:59:44 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-219f8263ae0so15024235ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 20 Feb 2025 02:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740049184; x=1740653984; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3ZauSCmlWOF0R/ee8Rh65K75L8Y3Jklu1pUfuh4eWs=;
        b=D40Zje6h2aY20MB4evNhYvfLMezZGa3QVBt3mGuG7edDKp4Zi9v4yd5kWyl84vT8Dy
         XRK3cIW171nOjAiAXHg3sRmTE4edlJVZJqTcVW56XqrHnpJA3ptfTzrwijGPq4w2YXlW
         b5G88biQ5DfzsqGlUDVKpuyBIucU1wqyYpLrPFhiO5J5MoHzhmmU9CEGDQjrHRdwr5Th
         MSXwpp+ZUlaFAQPjTVhUFUSGs+Ty2Ycyh0FiKoNoDf/uuZ9jmi9TXUdSK4HShpo0F4sK
         qHXgG6UJyD9izYgLUtxi0dz8pNDSa8TaLUXBwiwhSHX1/j0F/yYQ3WcSdyNA+1SkG1TM
         G6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740049184; x=1740653984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3ZauSCmlWOF0R/ee8Rh65K75L8Y3Jklu1pUfuh4eWs=;
        b=vVToXOd0Z2kmdvZ0abpZZHSQ/bd7Mb5V7c1HXWIcsuADMHbLqRXgfm7tBF16vzSWVt
         UWsqQPHWVeJmTHu6s2T06uZfhhi/ZRKDkTQsRvkWvqAgEJ+BtGbwzIePtnHnHNDvAGTQ
         IOcPEempbgDEJXcwS3UOyRASJNSydexj6i8VEN9rbJ2oDV3nEhpajq/kJ/rgsmOundLR
         SB7Yijbq7v3R5s1a+knh4PY/34DawwG6mNAoWuISKXy+9Z29nigegNoK4EAv5L5w3A91
         y4GMdm1m29hrrPgF0UmqU5ynB0yjgI9DYuC8V2Y25orRvMlDK+xpvot/CbrtHgrajNwE
         lVsA==
X-Forwarded-Encrypted: i=1; AJvYcCXMCzzMTGSWGDfj0ny/ZuwJqkj8Ip4vwDjvS5aFhEe07fy/64VM61cpNkWggT3QXhIt1MMy4mJaytyoZwbGUGLoug/kpg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwjDGC4vglFAnR3M8tymCHkfKHeKHWYWgebRuv5OuUavO8LC/Af
	YT6ELtZn0HKTZGvnAQEx/mo491kXnKPC9D7zXOx8EJNsxd1ACiHH
X-Gm-Gg: ASbGncsQyJuUjgkzjXnZ5vheQUfcz2779x9iQ1obmy89IBAsWWSeA+G4C690m12Sisg
	9aUWZYH749Fj0gqIWwUQ1vDJqcU1FJcCwzPS3cJYbgju2fyttdIsExn5XLKlX+/oVd9Bl54eFdj
	JRLdDUZZfEMvjHSr2l9aGzPHAHakrFJow7a4ayjxuu4yyafYQRld1Zbbl7uNWg2mcaRpfiyt1rz
	Ml3Xyy1Fa+Okw4t0qjzJcPtuL4BBlOa4gCACZf07kCNc6zkON0RSbJiNPMmMgDPw9Dg2+sNLg/+
	n8CfI5nrUR+ddv1Lj8rpgceqvGBCe5IF2R1OH0Q=
X-Google-Smtp-Source: AGHT+IGlivqRo+sIkRA0kH0tZP+S0SF8DCOmSoVD+UaMbG/UIhhVAS6E8crmJQm6+2ygb16KbqoZ2A==
X-Received: by 2002:a05:6a00:92a8:b0:730:9424:ea3e with SMTP id d2e1a72fcca58-732617bfaadmr31555798b3a.11.1740049184173;
        Thu, 20 Feb 2025 02:59:44 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.37])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732752034e0sm8388021b3a.138.2025.02.20.02.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:59:43 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id 6EA78E7C4B5; Thu, 20 Feb 2025 16:29:40 +0530 (IST)
From: ritvikfoss@gmail.com
To: linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] scripts/checksyscalls.sh: Add usage message, fix -Wno-error
Date: Thu, 20 Feb 2025 16:29:40 +0530
Message-ID: <20250220105940.5241-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.48.1
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
 scripts/checksyscalls.sh | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index 1e5d2eeb726d..14c04227c96e 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -10,6 +10,21 @@
 # checksyscalls.sh gcc gcc-options
 #
 
+usage() {
+cat <<EOF
+Usage: $0 <compiler> [compiler-options]
+
+Example:
+  $0 gcc
+EOF
+exit 1
+}
+
+if [[ $# -eq 0 ]]; then
+	echo "Error: No compiler provided."
+	usage
+fi
+
 ignore_list() {
 cat << EOF
 #include <asm/types.h>
-- 
2.48.1

