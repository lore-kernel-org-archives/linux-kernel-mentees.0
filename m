Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B9D3002D3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505601; cv=none; b=nFiXQnc7r1AObMW5tssNMaPw+o0XN3sbyYWpN3MoGGsy7K2E5/7V14gwDlrenC6jF6jVdriPE1TiqbKsn8+Wyt63QDGLqlP+agr5xpmoLtEjhzFtr4uFFHjFw85uSv4f1Jm19kLWyQBbFKIqZaIgD+iiBgIK7lTINL7wX1H6WAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505601; c=relaxed/simple;
	bh=q9XmPtxYoNCiv3K0EgnE3nHKnKasSXwGEQhC1RJGYec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sQklEkOLMm+B/MmPp42zIpIgiA+OwHxbRecS03DTdTdyzVJsNDe0JTvz0oRn9I3aESNQJUmOw53Fih6vebR/XMznEJPcxHbfEtRFy+ReYXyYqFioAMftGw7b8JA04Zpc+bisH6oLitCQSMuT0AxVdjqY+iQ0OsszVDPfppaon/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC9p3gEU; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC9p3gEU"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0615401FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 08:26:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oJkvZDoj7j2P for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Aug 2025 08:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DE23A40106
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE23A40106
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iC9p3gEU
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DE23A40106
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 08:26:36 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afcb7abfc5cso664300666b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755505595; x=1756110395; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R63hEpdlyxLtZoIyRwRrYtyjfFsvSRKLt6/waz/xGi4=;
        b=iC9p3gEU53GOYP8IdfGAu1dhbjJWC8j/VdnO5zQQczvbgaOb+VTY9Dtyii3bcy8wKp
         PjuojACOpynHeBvNgo6bj2hWQ4pVfEeChHRkSvLaymOA1rzyFGG5/UDI4HcDmjquFUNT
         VkslP9AVQWQI0U1HboPuz3+CUa7S7ps67roVgZkb0s4pg107/rbYvC1JEK+M0nQI5n8D
         Xn6UbkaEVHrRSY/LEfO8I/2hBpOVch/9XDcZTnPw7wErBHu4aYRARLdDQlVp2SQarhcO
         usnZFi6+3O0DSZ/qL4oy74PXnduYAPcXszBQ7cgt09BKq5z9scNXi6fOHVQ6f6VmKpSV
         Oj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505595; x=1756110395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63hEpdlyxLtZoIyRwRrYtyjfFsvSRKLt6/waz/xGi4=;
        b=jHytpF65I7dI4fFq4cXS9GEb1yVHAcoyV+E9209FVHbsWkfHfD05kCpXOp4Ru1gwqn
         UEsoKk1wCiEXZdzy1uuut61Oo8rt3NgsR76Z5Ry4jXvPET21vl+RXnB4eK3vuT1zxVkz
         MyPUIeky60SyiEthnaNJmhLs/UpyLsGcwIxW7dQqu2j9X7KkiGNPttDHUJZZi9B9Lg5U
         OoeRn/gyBVAisCPf+s73i0xahbqBNT/01ZzEitoNOIg8eB0wIuxOudZHqAynT4yk6oCm
         cdoFfVfLmRrrbpB8tlDQbXL0rMR6yHHnrok4uIIXTp7N8Uck5C2+GsfSrHu/BFrJA7z0
         DnXA==
X-Forwarded-Encrypted: i=1; AJvYcCUoSfHM3wK3cxyT/kS76Cn4n+drX9AIaZCx5G/9OyKOkGh49cGUV80WxQ+qrknrbNt2s0RXncwMC5VthLWyH+uDjHz17g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyfRMpwRE0a49i9qPuM4tVVZ+00eZVYKgPzNvur6PRuFnkAVUBk
	xlZzedYxsPPvk0H1eCJBDQw585DoJjWVpIYwhpfW9MSGboUXJIEIApE5
X-Gm-Gg: ASbGncul9Bl45ipOPkvaFc8IsfsvFKfA17PjJ2vZgFMTxfOANU8efb6/bUVDYf9VITa
	hR7E46E/KEPM80I+lU7m4IrRIbuSHsKaFeQYNo3E+LXbd9FhGnlrEZKXg7wI1B7cn7JHtZ5POXg
	AI1UoN26SG3dlXGTZiOfA3Lld3gpLJ8ZPUNswgFDCfgM4FquE9B/7FYhd9uz90n+8a4+1G5p9uQ
	uKXLrrokHq4SJ5o4FsgAoR0nOaZjcvwOi3pVkO2WV4etzFXy3CUGq8rLfct3GzXcoakMpZZW3Iy
	7Cggga9z9eFYFgf+raJ0U1jc5Qx0a7TP9mvh6yP1qvBWQ3YbGqdb1BbnXg9oAbm9I0s4HFJwmyr
	W0KWfuFWnTT0e01tgL7aARlQCo8xWd/hoC1/APEPwjuzz
X-Google-Smtp-Source: AGHT+IGStfQvfwvOB/b0pz73T+eWq282Wn28ouUOdCrNbFJNktNYTA0i2GXaeD25QK4tcfNsq2+/5w==
X-Received: by 2002:a17:907:1b05:b0:af9:71c2:9f7 with SMTP id a640c23a62f3a-afcdc251330mr983455866b.2.1755505594520;
        Mon, 18 Aug 2025 01:26:34 -0700 (PDT)
Received: from linuxlab.zamel.local ([178.216.139.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53d6csm746010466b.6.2025.08.18.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:26:34 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] kernel-parameters.rst: fix document warnings v2
Date: Mon, 18 Aug 2025 10:26:30 +0200
Message-Id: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Fixed missing definite article "states that the parameter" as suggested.


Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 445248787e77..7bf8cc7df6b5 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
 There are also arch-specific kernel-parameters not documented here.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
-a trailing = on the name of any parameter states that parameter will
+a trailing = on the name of any parameter states that the parameter will
 be entered as an environment variable, whereas its absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.
-- 
2.39.5

