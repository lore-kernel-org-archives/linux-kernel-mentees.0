Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638F8C0B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707787275; cv=none; b=qwTVYXxYDB8uRDgoH1YYVF1itaP0WS23V8lb45w/TgZmG9JubDZvKrChqxItLbp1fQIckmm9KkhlMfvGnn5wBL/9DZCic1ITQ9P9XaXoQwA+ucUkp0R2MKnZs6yAs32DlJv7/sSFjBizuR20u8qeLknx75BT8IlBpFPIJf2r2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707787275; c=relaxed/simple;
	bh=MLa4lf5uOURASMI9xTK+nE7rsYG01Lm5JO7kjMN3Hug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X19VOh7NeS1glI7iQiYDbBOlutsvePD/kLQfXSS31TeKKR87vbiKObB209jMh2EbDlAFAsDal1wOpMkbVRZqnXnDxuWWsYs3WCZoYKCNh+PFFxETK67itygjE3Lm0P+O/LBqyR/Xa97MRud8n2ZQ2oUTsos68TW2Qn+1YWVGyT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OG2VSf/q; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OG2VSf/q"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1F4860A42
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:21:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BRxhG0M8iit
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 13 Feb 2024 01:21:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=andrewjballance@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1415E608E7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1415E608E7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OG2VSf/q
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1415E608E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Feb 2024 01:21:12 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3c031a077d5so1857206b6e.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Feb 2024 17:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707787271; x=1708392071; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OIo9+CGA3o+sMvcBIMz3KkHVBSc3Wr6nRUoyuv+/nR8=;
        b=OG2VSf/qb70MtJcJ5Z7dfpWlB9d6WF7u0aaWcdF7u+Q2220d0RD+q0g1dhJBoCYrve
         lSTh1+z9FyoAWX5DbuFiRQs2N3BnZm60Pc6McFnh/a41XuMTPpaG4F2Lx0N9mpPpH6hE
         q/mnALqvjzYaD36KBH0c1qoujeB5VrG2inDSg2MbYieO9G0/Z3IqC1seSglYaqsxDeoZ
         OLEKPPUrAH61BA2zjcGwZGOkqhDbiDl49i81LJm62s0sgj3blPvSc/iOoU4YXJr12lpY
         XCgup6JdkjJSTW2A+DIX1i0ndPv2m4XAATslzEst+67uMRjJBK6wlQTwXESRgFf8B4oh
         sh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707787271; x=1708392071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OIo9+CGA3o+sMvcBIMz3KkHVBSc3Wr6nRUoyuv+/nR8=;
        b=ubUYyQHqzlWeGlojuhgr9+eAuu7pSTeLcF1waNJE+mTjCHcLBo5BrmV2sv6Bp4jP3V
         VhONCsfs0AUqUK1nPVekgMXHRRJ7kpndf1Lkb/7J+5k8x+6cVeJoutZseNfnyf5yvMa0
         7yBoYsO3UuhbeCnwcCWCEjybuslp07oitCeJ296fXa5tIw6Jkt4DuYDLiNgA+U9tGeB4
         uH8J2vPgswhZBqBelqEzTv+sjCnEVrmQEtdRzUj+dbyT8Irw5+p9dfikSc92L4y8vDjl
         ayTpFe+4D17ditb5sbLjWMPL/ZIl94AiWSiFbfpPQOjWGY/9w7QfKWfy8hdBrt5EbIVw
         piuA==
X-Forwarded-Encrypted: i=1; AJvYcCX6DlunrRHNU+Hx907OJjbFr5/3y6nHUVRjN4Yq0SH1T6xuxeIfBOJI4M0T+8WC6Ouf4k8LBMlrx3xYksGaNJTtuqIoIGoCSFNMSJyLGhIyKld8ZcVXeySIkBZQXbU7
X-Gm-Message-State: AOJu0YwSVXQNZKGrYx4HT7lYgRw1nWLL5Ol44M4TMWIM4k/xKZKZ3N4i
	ASpxiemoCx6koW27gVOsNNUR+Nvd36nMSy9dp3CjPij5wTr8EJn5
X-Google-Smtp-Source: AGHT+IGjp+ccfroJZ3LNYqvyf6Zlsgxk1ZaLug+4zFgnhDGKHley2D321KNOkNQyZiRxP83AMZcHrg==
X-Received: by 2002:a05:6808:10c4:b0:3c0:34d9:4d7a with SMTP id s4-20020a05680810c400b003c034d94d7amr6265831ois.18.1707787271258;
        Mon, 12 Feb 2024 17:21:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnosEBHMfhXLylxB4Sd2Ldd2A9Q8ewSUvpAgHc62FKI/C23e856L052Hw6hUbM3KAgZE6n9p1UWawNKbVUE3sQfRjeGKBGiXBCkGbohcOsXDQp6T1hAQ0PdbOGLG1pvF1dC9JkCbe6JjZaWbXeaQqcLti2l6Ofthy7oTKVIrUGbpQhGCvr+oaB1BcF2jP+IxyzJmc44YIYcVULUtimTKQXO3KLR1roFU+/cVxPl+689lIndzRTtZqW/Q7agREhmuDKCbVYMGrbdsiq4p1hEguZAis1OTJunv/+20VabCeCDHv5dQWaGJqHuHtMamai6zlKmpYNoj0f5X1o82JGVrP0hIroCIfaJoILcz8TFFQ0S1axztVuD222/fARm8P5OfAoXW8PKDb3YS6tk45Vq2vA6g==
Received: from my-computer.uh.edu ([129.7.0.170])
        by smtp.googlemail.com with ESMTPSA id k18-20020a0568080e9200b003bfe05691f3sm277684oil.9.2024.02.12.17.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 17:21:11 -0800 (PST)
From: Andrew Ballance <andrewjballance@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] gen_compile_commands: fix invalid escape sequence
Date: Mon, 12 Feb 2024 19:20:33 -0600
Message-ID: <20240213012035.750928-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

this fixes the error, "SyntaxWarning: invalid escape sequence '\#'"

the error can be recreated by running
    make CC=clang compile_commands.json

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 scripts/clang-tools/gen_compile_commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
index 5dea4479240b..93f64095fda9 100755
--- a/scripts/clang-tools/gen_compile_commands.py
+++ b/scripts/clang-tools/gen_compile_commands.py
@@ -170,7 +170,7 @@ def process_line(root_directory, command_prefix, file_path):
     # escape the pound sign '#', either as '\#' or '$(pound)' (depending on the
     # kernel version). The compile_commands.json file is not interepreted
     # by Make, so this code replaces the escaped version with '#'.
-    prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
+    prefix = command_prefix.replace('\\#', '#').replace('$(pound)', '#')
 
     # Return the canonical path, eliminating any symbolic links encountered in the path.
     abs_path = os.path.realpath(os.path.join(root_directory, file_path))
-- 
2.43.0

