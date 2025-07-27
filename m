Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6402221D5B5
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753634684; cv=none; b=qoovBTElN+qz4Qf0iFgi5vneFReWrPqbCOCUs7vBPA5gbbBBNlCn5LQ0AfbwJSFY80BanD9Wx2a3tIAujr4ibQ0yV6qx9xoCtxyIsRiCF9lf9ijY5wIA34E0PBMdOHmd3rAmOmpZasSgsNpmnawagJT3G7k+nGNsXJla5Mjvv2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753634684; c=relaxed/simple;
	bh=aky/KLnG+W93c3bsyO6G0smfD+Xe1O+Cyczp3AKHLD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nTKyz21/MvU+IKwq01AmqwLP3i1iIC9CpX+v0zjbB/aAe8M5vXRzggCQVJQpPoP5qs2w3ej/wD00qvIlYvGKwBoSo6rGW3IXBs8YbGxQ7T75i/aJpq90MmeEejCcDFxC+CMBSnD0KyToDAkKKa2TAyZPOBeQGdtPCTqPUQ0ppdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPAdRCE+; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPAdRCE+"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3137c20213cso3433965a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 27 Jul 2025 09:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753634683; x=1754239483; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kV1RESAXwwVRenoKtubuHGOUDKpGE0S2kgTUEl6ZcyA=;
        b=DPAdRCE+8AM9v5FnuKhHfymOwNFPDqpcGoi1FrxAhopbQoa9t7Fnba3Y9I5j58sZKz
         +CyM0WMKugYhlxhh/OkjhbB4kUqPRWMcUg8JoaGsjL0+oz1oe0yrXPJEJjrWHwlni9r3
         OUT6dm+U1c8WhF+JPggB3h+vbXJOYSvfkP16RDKOGE6bDuGTS4DoZH04Zdd4t0nUe7Cy
         3DCccyDyrC4acUxftTJB3eqmk4SfRckDQaJDjce7Sligb2UxD0hiPik9tl9NpC2rfKf/
         saoKTcsuQDfyK/LWqwDNbeIxNmIReWKMn5UD49DKQHNUXAkZ6V/B62LtWUq1aEOWYI5W
         uBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753634683; x=1754239483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kV1RESAXwwVRenoKtubuHGOUDKpGE0S2kgTUEl6ZcyA=;
        b=lpfLlRXQfa56qC5XoE4bPtUWnWPYtO/JKdN2dnH6HHOHm264LCXeGK2iCzV2xuZMgq
         kBJvAIdRUuvQLQg8W1DMzaVu2DyMFf0hKFl5c2GXmgNs3/u+GMGm8JtWU7Rf9a1rLYTJ
         XZfHA6R6GRWEVx6YoeY6ajQ7fWEXNUbPIeWC7UlQIdkDqkW4YRRopyjRGvxDnJC242c6
         XgSec2PNsvRaRgCIpW305Q/ttJdp4JM/S9hx9ZG/IFE6i6nKidfciDXJU+ELB3Pfddgr
         ibc8d89BW5elXd2MeB2gof7nG9IFWe7nWM/oms6n0dHdBTuC2446hPxnPRPTZkc5dW/g
         7aWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeUlXGc+OcTM7hizQ18uwRhK9k9TmRR3KQrgKwViki/TTItX1s9uoWgvKxb0k7mFw4DpDWUT0uNK3DfCINqpPtXG+OeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMxdxiK71Ye7H2NE9knaDET1J3GH+bj3/ErbehAUTKzLeUt67/
	pBR02D9qhRCCiKcJBE/cK6UiQS/dvLtzJw5SMTeAFOzYTGbs8tsWEzqj
X-Gm-Gg: ASbGncs/85FV0yl1m6iEtJmzhijGMCPwIaG32WnclYthwYOz8iMRb7JTWLa0wK7lp88
	NPBFuNnMun0q80j4VC+f/Srqg9ao3zHtT+huMzLBl3qzZJBY3VFYnAE+HenCmAYUMXtwNYWovxv
	2mvgG6MF7UZaJF0o22mrpnRXE2v3pbwYgs+WXBm+dswPG78JFNjyNkYcGXd/zvn2dwv640TGfo2
	pqEy/w2Cnf3PXPFx18GDd0erL1I/phHKLS+sdZlelCmDwLnmiRBuJhPpamp79InmwS6kk2uMWmM
	TmuTDU12J8b1LE67/GgZdm4KKe4qkCy6Qw1OPGXAqtHCt5vBxjjlLTQkbWYYi15A3lMURfVXFpU
	oThhkIYEWOV8hmVxU+G3zF38PJqpn8tnmTnej8fIEXQ==
X-Google-Smtp-Source: AGHT+IGUG0ghBNZsPR0rorkBHAJ8wPLWZmy2ouoqQKwI9pxz+BMioHuHTTCL9habl7Hw0C7IuoGoTg==
X-Received: by 2002:a17:90b:5249:b0:310:cea4:e3b9 with SMTP id 98e67ed59e1d1-31e77a45975mr9993425a91.34.1753634682428;
        Sun, 27 Jul 2025 09:44:42 -0700 (PDT)
Received: from archlinux ([205.254.163.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ef50e2946sm254948a91.21.2025.07.27.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:44:42 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
Date: Sun, 27 Jul 2025 22:14:33 +0530
Message-ID: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking and can lead to buffer overflows if
the input string exceeds the destination buffer size. This patch replaces
it with strncpy(), and null terminates the input string.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
---
 scripts/kconfig/lxdialog/inputbox.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 3c6e24b20f5b..5e4a131724f2 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -39,8 +39,10 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 
 	if (!init)
 		instr[0] = '\0';
-	else
-		strcpy(instr, init);
+	else {
+		strncpy(instr, init, sizeof(dialog_input_result) - 1);
+		instr[sizeof(dialog_input_result) - 1] = '\0';
+	}
 
 do_resize:
 	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGHT_MIN))
-- 
2.50.1

