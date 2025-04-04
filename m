Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6ED1F3BA8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775141; cv=none; b=LofmIqr+mCoROBKq80sS+Pn5+Zndf34m0SBMM+sXdZBb6BDh8TWt5aUmnM6lkasoVC/SBNXrkolKeQrEpP24MPQ1x6Np9WeQqElm+W6lcRgzvpRcDer7yUK1q1efaEGl3uh50uJbyNiQnfAN7xF3AN/5Rj+cIgs6X6vr2uZk/yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775141; c=relaxed/simple;
	bh=wY7QFYszUZqAqrffU5tFA/55H4+x7FwsNaqOaEv5AQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVDY3JRCigJ9ofNfNrAJ3s8/vvA9BH+ntT2CyALdouwCQWk4dwxS9rP0+7FoyBoQzMy4+yxyuDNeFiBP2NrBWJOlu4CwY022ZmCqYumTm1MOzn32aG0N5m/O8cpkS2wzzEkfOuWS5ABU2qGwdE69+pLs2HudTmsd6EaEqn5yr4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSVxJp6h; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSVxJp6h"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 299C660B33
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTgOY9OMXIht for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Apr 2025 13:58:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=devaanshk840@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6325A60616
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6325A60616
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hSVxJp6h
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6325A60616
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  4 Apr 2025 13:58:58 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2295d78b433so20605775ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 04 Apr 2025 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743775137; x=1744379937; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i+22pb/5kX4VZbzUzM3FZvO9kkRimVVfJb44Id6IWBA=;
        b=hSVxJp6hiwpfEYEcs6R9ZWc+cpEWqR48qCjGBqxovkT5R1ZwipQln3ytq3bgk86X/h
         4113G4SEL2/nDqSNWi/+Gj898IxYv8hn48QA2d6yiUG7QxOU5wp3763/XxEuRWERNj6T
         Dlxc10LTr0QHlAZ4XXihw1SbH0E62sAqDHRrSCOv518qtEANc2KHMczjgd2nA3to7sYL
         niSMZPDZY77k2mZ2dO7o/RZiROZiqqrBs8J3YooZWVesiPFpkL3uqEjwu4JAvLcjJ3FI
         ypsMZx2YNxxlbWJEkZp4x/HqIWXww/dk8/lzskI5ZvQN6CP0FyHKmyxQMKUPidOmrNm4
         G5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775137; x=1744379937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i+22pb/5kX4VZbzUzM3FZvO9kkRimVVfJb44Id6IWBA=;
        b=S57cirFKX8f81eKx9rccztP5U6Yo83YpAkejYCQrrxAGu5h9Czt4cnqP4Ie3SCvAkq
         12aRjS9wwtNVNte7Y2JUsrp4721vmvPLgOdrN8HZybbIFR90CiS+z1Ugvqiaj2OkwmVV
         okBRvybqd+5xTNdauGhi0leVCQctMnh9Okz/sSixXKQvu17oV/qPSXOjz/EoWAnbQmFy
         GIADehVKhu45hJgTRVvUgRPIitdlfdGs1an7eHZwg8UisGtxZpOhIJCPxni9PiDW6D+J
         cmeDBvpw1swNGBXZF2J7+CDeV68zR0OTRfJfFbtD2ozO89WzNOFCU5S+yGXnf0SZBDk2
         GzvA==
X-Forwarded-Encrypted: i=1; AJvYcCX5YYzEFum6ffwCszAVZ4ys2SvtUt2NePBQp/NlC4dT0CHNoKGCd/wmF7z3siLidJ+LXOURSqxqWrk2ciLDY6PNsQJp2Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwmJmZGfch8fJixr11Ry3UQWz5BMdOcZW+iXuMwcxuF9AacvzVT
	nB4kPulUhuqLNNArXBvpZ7QHR52hIVCuBdf3QQVWtFGVxyBY8nD2
X-Gm-Gg: ASbGncuX3J96RofhfZhTM08ZtPoxXbLrgCuzfRW/i1QQbrjHC2PqAQ+x/ADX1IusQoI
	I7LmT9lVdfTdQlVgyLMZk2vSTL9RqlO0EEl/U6Pi42mGNymQgzyvqnNh80m8luPQVzG483pyM0O
	Mmm3tgixKzTe1a0iAZrbVOPLAagyAYMpZnXzCkeJbhLhHEjdfGuLigZXDa4OPmRCKUILodTFMKE
	ni05mWgkPSzSvNTsJ55Bcdl+XyC0pFFxEqlYQM2+BPLSsSNbiL8uJ+S6Mo2fNpWYd4lvlr+UL8X
	l1lG5sc4f2DFNkMtz5IjI/rsRPdviw33Htm5kDKw0Wxu
X-Google-Smtp-Source: AGHT+IE+VkMoP417Cvfg7Y9+D6iW+RnfAkURu6MIGusQ25BUD9Tb8oyyLz5nyG2gKp66aokvYXVQZQ==
X-Received: by 2002:a17:903:230f:b0:224:d72:920d with SMTP id d9443c01a7336-22a8a0a3622mr45507425ad.37.1743775136825;
        Fri, 04 Apr 2025 06:58:56 -0700 (PDT)
Received: from fedora.nitk.ac.in ([2a09:bac5:3d57:1a46::29e:13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c01cdsm32386895ad.99.2025.04.04.06.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 06:58:56 -0700 (PDT)
From: Devaansh Kumar <devaanshk840@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com
Cc: Devaansh Kumar <devaanshk840@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v3] tracing: Replace deprecated strncpy() with strscpy() for stack_trace_filter_buf
Date: Fri,  4 Apr 2025 19:28:48 +0530
Message-ID: <20250404135850.2695211-1-devaanshk840@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is deprecated for NUL-terminated destination buffers and must
be replaced by strscpy().

See issue: https://github.com/KSPP/linux/issues/90

Signed-off-by: Devaansh Kumar <devaanshk840@gmail.com>
---
 kernel/trace/trace_stack.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 5a48dba912ea..91ed2b76fa4c 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -543,8 +543,10 @@ static __init int enable_stacktrace(char *str)
 {
 	int len;
 
-	if ((len = str_has_prefix(str, "_filter=")))
-		strncpy(stack_trace_filter_buf, str + len, COMMAND_LINE_SIZE);
+	len = str_has_prefix(str, "_filter=");
+
+	if (len)
+		strscpy(stack_trace_filter_buf, str + len, sizeof(stack_trace_filter_buf));
 
 	stack_tracer_enabled = 1;
 	return 1;
-- 
2.47.1

