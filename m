Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3820A5DD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 07:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752738864; cv=none; b=D9tVbf0IWiSY/L3N441S2b4HVOd8sZiZXKIXiTLH7Ie5IA3tm3J6ulU5DUhaozj+hLcRixFDpj6q+N5KtJdvMta56oMLk4ViZYWzd3ibwti+cXRjsox1XU1boFKq+o6Y35C3/c5wCkK/L8mtdfqTmrAjwuc39pTOuC2bzB1oUBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752738864; c=relaxed/simple;
	bh=Mr5Jrrif2blxbp0pFWnAiJpqAUi24j5k2fidkp1ygp8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U4sd5J8TJLg6ctb3p0iGlnmEXDKXi6dQHQI3OzdSyRFIZHUpQ9JHIlkK3kSat2G7JDN3OkPAaalUgUoaMsvZ1W3gP65Yd5ZqljdeNX6C+VKNIhBAoFWrg5KEEQ4X4QUiiAJUKu9RMVXxicJC5ZjvwjKpezb0qjIOQNp5n64atfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHZbpFDC; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHZbpFDC"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB98483B3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 07:54:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQVcWtJll-Zu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Jul 2025 07:54:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=ignacio.pena87@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7E3A981115
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E3A981115
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UHZbpFDC
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7E3A981115
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 07:54:21 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-41b309ce799so528276b6e.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 17 Jul 2025 00:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752738860; x=1753343660; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TwYCoazGTNPxs8TsV5gPxD6Z8cXTD04TwCs5F7djA4c=;
        b=UHZbpFDC2xYEDo+4u6uP3+UxEf5US+rnYvQruThd652hmP3qvOh3FG7fEm2VWYprUv
         D3nSAMXKGYDEWeNfGYTB+SHTPifExvYCNXFgVW2t4Wxrn8B8eW+5jA5cFeW8UfmF4ScG
         KIrlhWasVD+9J5QKDdza1yIa8fOujRj/I02UujaJ2NjZCouEhPaJZmUAirlVadGmJupJ
         JAj627Wz/uGAZ778X4HdmcRNsyIErHJJqcZpC8tlM9rGzRg55Yf5D9yYH5BOs0ue7dWh
         H/cHKNvEhNoXSNZyDztL6YiRbH+80JafWTsugJBHy9i0zXfgLQ6KxKvJUWc0ZbDTZXdu
         I+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752738860; x=1753343660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TwYCoazGTNPxs8TsV5gPxD6Z8cXTD04TwCs5F7djA4c=;
        b=h1HWESPqKDbFttRqTmRgxcXUCmrgYwyN32KnjQ4ZX7+7HPc6JE90jvU6KhW4VvrZDF
         AZS4PU4JYGie0DlWzzYk8qk/Jpq5FWd9LgFrE8/Ecbdrxd/8qwpkXMGDWWVx7HiY7BC8
         R989arm7LIEi0RJCIOMeF8nmws04Ykd0n+wsj5xPb44a1oG+KXieHGmXGvyJMONsoDUP
         VzeHb9sZ+dM7PHbMpf3EEF59J6g8oql1yDyFQY5nipegqSMtTdMOLFKxrrikayxfSHfz
         LXmEfCPrKWfCE2XujN71Mfyjr48gtb+AFS3Z0CPjuB5z6inWc1V+N6tM6Ys/Hu6PDAXf
         WivQ==
X-Gm-Message-State: AOJu0Ywqqc0lJlB6OuU8wtFbqvzoUur6WrlqOd1v64KLGoWUikVkY+9Y
	gJd01jrXeqmWbRdLaAC7OH4SmAJ4q4y2B8+XSb5CLE0MMJNFGvOG7kLKIWv2xY82
X-Gm-Gg: ASbGnct3TyTaaNV5uQWofEz1pZUXr2AxDK79rP/soPBBIBWD/jE8lnnpcDPcJeigXJG
	lTf+l2vExct9S6E6IO7oO2yKmYZgC7xw5uwDdvwXUQagSlx67/l6kV0s41adUuwCwlIMbXrMHWl
	f3jLeP4ttCUqywG+KkJ4L1zofWVt8cwqcy1ZRs8A3vcHaDbWU5/Z0Hn+nGZBWnHWX7MMgr5EM8R
	CQkJlBGxiPwwClJn94cvuKs81IHbueF/YL05BvfQxyVUWqJOCBceXc9guEa4RKAXB2d7fh97tKp
	2LnRFIWzcMiMLDfIJhHBAq6X+yBKH5IGP/7aYMffAtY4XLT6b1GbAJMrTckGq+22u12XFKIk3b4
	f4zMIHXkJM42ioDhZqaEiocdaHgy7tVmcwoLiuSi0N+ZCGsRM/sRm
X-Google-Smtp-Source: AGHT+IHQXZNP84meeP7mKZ6eYUW5r2yWB42HP+o7mB3VTS+I6FH4Dupgp9XN64up6YORa6ZNQHLZhA==
X-Received: by 2002:a05:6808:8510:b0:40b:3530:9d30 with SMTP id 5614622812f47-41d038e19f7mr4077048b6e.9.1752738860028;
        Thu, 17 Jul 2025 00:54:20 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41418c0ae9bsm3281969b6e.6.2025.07.17.00.54.19
        for <linux-kernel-mentees@lists.linuxfoundation.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 00:54:19 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [ANNOUNCE] kernel-patch-validator - Tool to validate patches before submission
Date: Thu, 17 Jul 2025 03:54:17 -0400
Message-Id: <20250717075417.8597-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi everyone,

After getting patches rejected multiple times for common mistakes, I built
a tool to validate patches before submission. It catches issues that
frequently lead to rejections.

Features:
- 21+ automated checks based on real maintainer feedback
- Validates format, DCO, changelog placement, dates
- Integrated checkpatch.pl with enhanced reporting
- Tools to find first contributions (find-bugs.sh)
- Patch series validation

Available at: https://github.com/ipenas-cl/kernel-patch-validator

Quick usage:
$ git format-patch -1
$ validate-patch.sh 0001-your-patch.patch

Example issues it catches:
- Future dates (2025 bug from wrong system clock)
- Missing changelog in v2+ patches after --- marker  
- Multiple logical changes in one patch
- Wrong Signed-off-by format

The tool includes additional scripts:
- find-bugs.sh: Finds spelling errors, checkpatch issues
- test-patch.sh: Safe testing workflow
- contribution-checklist.sh: Readiness assessment

Each check is based on actual rejection feedback. Hope this helps other
newcomers avoid the same mistakes.

Feedback and contributions welcome!

Thanks,
Ignacio Peña
