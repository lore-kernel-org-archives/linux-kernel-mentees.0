Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630BB22D7A1
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 09:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761470665; cv=none; b=bqhfYR+C4TQ/8FXurkVbq5TNtdcn22+Z1V4qWOYrJ6UUszuR1BYe1u367VBy4r3319otYZqfQY5rR2Gis//5ST1S9tPF7aW3rOJxLAGXktp7mg8kWTnA44tXVznsGKAVIPoKoHMaHjEOAthqGMkKzH0Xb927Tqu2ur68PNfz6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761470665; c=relaxed/simple;
	bh=Wsp8cxVy22klAhiDGv9P8tZ3IPZ7LUZzLpg3S21IfDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZnLjrPW+rP5+WN7ZOvFG7nJ2cyTBeUpB8Uw/2MC4/zI+rkcDmn1NR2VBIMNfVIvarq51D7cRY0IkJ+4szbGiteRc9tZImHxv07Ev6DiFjDrADXzC8xhX4iYy37EyQT1vm3jDSzxJqK/aF3PXpEDfeYqILp8yv3aAKnxbfFDYWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hS+Y1P8n; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hS+Y1P8n"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso3394287b3a.0
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 02:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761470664; x=1762075464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdMa6HWGVI8flyxHcsiTS5cMCkPtytHGgTVFhKdr0DY=;
        b=hS+Y1P8nOh9sgFd6oDKw/YdG59cktgqrWb8WDJBx/gxhL5b0iAz0rffbp93ZbHf7ys
         a7pQ9ZMurI0YORGWmZeadlz8qjesoDo6+zHGUjUqZ6w1UNxQRFwIvsQLvhp84K+k2Gln
         JoelPMfPG4DTY9gaLgTwqJQA+Y/eKNUBaTq5BroTXLod4hUxsofIEfxz0m6GGMjbJtAy
         MPuWbXNyqqV3wrsPyDSM4HhgttPhdmVGk7g97Y7+uoXFQ6LITuDp3z9XTDqCto8xcd7i
         uYbvDIxnLUKNZcZmuRaeYYWBsVUFQyZzP+KXVi653BDsq7vUzZZwyl6IkVUj1n6QbX6a
         3ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761470664; x=1762075464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdMa6HWGVI8flyxHcsiTS5cMCkPtytHGgTVFhKdr0DY=;
        b=sJo58CZjvep36Yvdv+AcD5MIVn337WJu4MrcajOBuZ5ryiD1r/K6RxwNtWjEqDEFfP
         JLJpMm+AtxfD/UiDf4Kgnzy1FdO4+spCFk+3JXIo5TcpnLCEu51hGYAFNwF9hOFV6j/A
         lL5+ey/pjFFDErz0z/e/Sp5Kja0dRKw0n+b2leNZ0O1rTpO4VQJh6B1wcot2aY+9uab9
         KQEXsm1pkrExbALYWHX5hEI6zK58Ov4jG2bD5QsKP88gsJ/te0zRlyf8N2ouNssHmwjr
         QjdbwTFpC1EhL+IlN8WdtDCH+33ff5PkmrPUyd+SiOmtHHWDl6mm3QiXHKwdrUaFRv9m
         zx4w==
X-Forwarded-Encrypted: i=1; AJvYcCUT7avcpfewqIuClhgFey+cWS4I3mn0+mc12JWqqD8X5wqtV5OQch4huxbqWoZQbz9TiKlrLoFdTD5eB85SBHsJ0K4w/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqL7V0mtufrHeLskohnuelz7ab7H0VVSU0/qTFKzflFuwHV60m
	ULzcFw1yAaiOKHFAG2MPGTgoCL33wGwve1JjK++SkDPh/LnpF2lr0qsc
X-Gm-Gg: ASbGnct2FuQS+EKgIp5Gw5YXM79fdFzFUh4Hk3Cayo3nRRIoxocnCav0P2xUnbwfN46
	AKf9ONg1nBYs2RSSKZOp/34XXeVm1MJ0YupzKLPiybaDvsJgEDJyhp64gZQXe5jN9ZndRV1XTrw
	I4k4hE5vwBCum0jIIdtKHyGygRofuKTwyOt/2K398xk5gLe1pzs7Kj0yF5sU8JtKNdBo9EYd8BZ
	DK/wq6lt9TapEhgw6O2s/YKz/wABK4QqLCqMyjHkwqagLB7cHJ4ii2TJfpNjoRNsYE8ebMjem7F
	NQ7vti/96XSHgzzNOF3lyRbyff+0X/obnTYqi7yIo3Uy77mEnJ7tfDpw9hoDtsBCiur0nbeER2k
	edI3qS8aoj+Noe3k6CykAP4s9Fe1QGbNgYSm1aBKL4dr9SYb1t9wrtgMB+VjitBoXPhlpXAe/pk
	EtD7jLWbbGD6brxDAI3nI=
X-Google-Smtp-Source: AGHT+IGvbZctqDawrbvVj/YWwiaibKLUONAPApFbeuXnBVOb80OZCjV/x8ZAeq0wItW2If52JQqywA==
X-Received: by 2002:a05:6a20:12cf:b0:334:a681:389c with SMTP id adf61e73a8af0-33de967f61dmr10026226637.15.1761470663538;
        Sun, 26 Oct 2025 02:24:23 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bfaa1sm4063316a12.7.2025.10.26.02.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 02:24:23 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	david.hunter.linux@gmail.com,
	xandfury@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH v2] selftests: tty: add tty_tiocsti_test to .gitignore
Date: Sun, 26 Oct 2025 14:52:32 +0530
Message-ID: <20251026092341.2896-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025102633-dandruff-clang-e91d@gregkh>
References: <2025102633-dandruff-clang-e91d@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the tty selftests generates the tty_tiocsti_test binary, which
appears as untracked file in git. As mentioned in the kselftest
documentation, all the generated objects must be placed inside
.gitignore. This prevents the generated objects from accidentally
getting staged and keeps the working tree clean.

Add the tty_tiocsti_test binary to .gitignore to avoid accidentally
staging the build artifact and maintain a clean working tree.

Link: https://docs.kernel.org/dev-tools/kselftest.html#contributing-new-tests-details

Suggested-by: David Hunter <david.hunter.linux@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
- Improve the commit wording and explain clearly why this change is needed.

 tools/testing/selftests/tty/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/tty/.gitignore b/tools/testing/selftests/tty/.gitignore
index fe70462a4aad..2453685d2493 100644
--- a/tools/testing/selftests/tty/.gitignore
+++ b/tools/testing/selftests/tty/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
+tty_tiocsti_test
 tty_tstamp_update
-- 
2.43.0

