Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5FD24BCF7
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 16:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203314; cv=none; b=HE6ZP0r2hEjmbomjscCKw9e25KYJXJcnGK6ioyr1vmbO5suRfhWc/uxIGfliByA/lUVU9KOVIB9yPlDhUh5VBkmgkUdZNGDbk8vgrhqMA73r1M/nBPTbL837dqEupZCkXwkqd4k6LgPwEPXgc8pskaO1HCPVy2zPAnu6/qgQOaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203314; c=relaxed/simple;
	bh=d04mA6lPd0CGIRyghuiCWsFhyE+RnY8D1tZKu88Lkr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qU1qjJo/ggcwyfPCJtOBfpm1K7Q478GD932ujU2ZMEDgNKdQ01vKlV97kIpUbO2b4zUv3aJ2xWXDMEkoBjKotT7yNBQHz5SMvX9U9cDh7volomG4IChP09RjgiVrqkOPVzTGOsK0n3U5k7XhZZRPWx5+OSExj6/ndhc6I1diIyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9UMYye1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9UMYye1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f50895565so46935275ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 10 Feb 2025 08:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739203312; x=1739808112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mAb94V99Y9qFdn7g0fbo+3BKlPjASY28rXSeC7/ya+k=;
        b=P9UMYye1itE5G5rIipJAHRtqftZIdmKV4T+qXg5QaiqT56tfU80d0lsS+B7E/P8FrB
         gkfe3lMqgTM5vFMZ585J2atu1Wre2HsZaAoP839F/4glqsEpZ+Utc/+uYj5qrv32TfaL
         Fkx/EenHfgzeZrrLG3dNNwkbWIum/Exz5hB4mNKvG3WKLnbFCdFKYSBeZURoql+l8BgB
         LLJKKP6r1Au3RIx2US/Mv+BqAgYvFu0/JzZRelHWiBbdTTLiodRcVR/BcowQsBbdq41B
         +xKktVHeRnSONpOMJAi26REWeONK+fzLxouh8+H7XEhGr+Ys602UZ+k6Jq0fS+TLj3Y2
         gacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739203312; x=1739808112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAb94V99Y9qFdn7g0fbo+3BKlPjASY28rXSeC7/ya+k=;
        b=GXQ6eS4efTYl+jnW2nVoJCA/dd4i4MNFQ9V0VvFqhEGk5+gcIinwv37I0BpcCVN79W
         GFhReXJ3U5wy8IbA5EddqV7FjfHgY3XyfHPz+QKYFXQdGIBQ+XiiNAqpLHV59OoSAxvy
         Sa7Qei0+jGWHoufJnK2Sc9/2JGYDwGSMe7l1AriIHlba9vEAyUIMS7af57kqszHB9uHE
         A23n1VbVvEaKlJSkauBKYVNUUPPAAYpVtqHVosvA6W67gjZd4MeA9FIgNoX3Qv9p7gyo
         ON7cpFuJWB/UX3wQ/HwcIcMNgFrQqrn5k0Vwp7Pqc+VSYmWuBvfaI7gGvTqpOU00LD6m
         TKEA==
X-Forwarded-Encrypted: i=1; AJvYcCWoIeTH+0v3x1RL89K0X6bbK0csZ08bCayRTKajXWli4Sl74HvO/R6ucx/hrgOq2X3OWJaMudp4tL6AxeHMvf6nl5B6+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YynLNvK5V4D0J22sC1FBgazNfhJw06ZYhfrzJHFTVeIbovRtxob
	6Mq9UHe/m21mts2bklLz5dy1Oibsu3tZVnB9TzvFAueSRdgCKUCp
X-Gm-Gg: ASbGncsR8K30T78C3mJhRG87EhhSZhe3m79/KODqUAaHs/6yCAK1J/2AevylQaDIH6M
	AI0wr2Fmczyx3nXXvNeeRlKMtrkrA4B2jAPFLs0O33l0y2Mzy7y81zZhZy9F1Xo2KehGzCmnFyO
	XdZOivVGM0gYGxK59M0nlRM4V7JMRjHsQUs/8VW/1R7IT5pb9FntBS2vLuhyr5cMor2lg/Y9XQY
	1O1GLIvMWutR/NVRbqS20xDCKsVbE93BzI09p0wWj8rfoMGguKvCXhcYM4iZBjY81VWwgrPwxbk
	ycX81EXHEBMd/rYl61kh0EY=
X-Google-Smtp-Source: AGHT+IHNkp+rEp9mHSOGY+8yQobNqm11WwyMA64Pwjfj9ER+mP9o2/g6xc0Ppw8iqqadRsvrdcMKnQ==
X-Received: by 2002:a05:6a00:f8f:b0:730:7d3f:8c70 with SMTP id d2e1a72fcca58-73217f951e2mr204190b3a.21.1739203311941;
        Mon, 10 Feb 2025 08:01:51 -0800 (PST)
Received: from linuxmint.. ([14.139.69.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730962210f3sm1464566b3a.179.2025.02.10.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:01:51 -0800 (PST)
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
To: rostedt@goodmis.org
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] selftests/ftrace: add 'poll' binary to gitignore
Date: Mon, 10 Feb 2025 21:31:34 +0530
Message-ID: <20250210160138.4745-1-bharadwaj.raju777@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When building this test, a binary file 'poll' is
generated and should be gitignore'd.

Signed-off-by: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
---
 tools/testing/selftests/ftrace/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/ftrace/.gitignore b/tools/testing/selftests/ftrace/.gitignore
index 2659417cb2c7..4d7fcb828850 100644
--- a/tools/testing/selftests/ftrace/.gitignore
+++ b/tools/testing/selftests/ftrace/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 logs
+poll
-- 
2.43.0

