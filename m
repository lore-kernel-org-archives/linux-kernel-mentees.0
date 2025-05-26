Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08021547C9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 18:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748285064; cv=none; b=czdgBe7WaG355Po57d8pmQRPkly9AxlMVZ8QVCDxYhgCwPxRBlQV42opLEKJ5OJTWLEuslC46/M9hDK/3f/ZQP2fg+2lOYb7DVCCCaLbWZ352zXYNNhpKhVGP6n2MDE5tRRk9kymYnRcBmLqzoP0JW0NXPeBOgBKWQ60Qyg0LXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748285064; c=relaxed/simple;
	bh=F0nXqeztZjLXSCez38dqnwS/rbBaPXXvjEwZG3KufIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CuTZnQ5Eaatrxzomerg5Q+zUYLUTZEV5o2SnmizKL98VBaxB8jbLjRSQWUgJg6/TNMyDJbRx3OR3EhgqouxzLmRfs5MHJy6nP1hIwJKLeNqz0nTA5BfF+lYwfgAk7oUzFZ5nsPTqojj+7tARCsb+Ac35Y219PFvp67O4c/B2F3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd7Uu3ns; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd7Uu3ns"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ac853894so2670073f8f.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 26 May 2025 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748285061; x=1748889861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hMCJtECyYLnVFjpZvyBd+ub3nNwjuB4xZOaytzPNUxg=;
        b=Yd7Uu3nsBNDSZtis4ZmTOgTLaij0rIkdU8wixkKmE4/h4cFkqPEJB74SZqWvRmw/Mu
         +nsazMFd+YAhYZNZIJPk7Pf5v+GVNGIVaCi5qo9RWMehKFAVfUAUvqUUvLFZ4JP5n/Gw
         NSGxW4GunpDf4kmpXXFxA/r6yGbnjZbNzYWXzLcnSKlIG+/ExOF/6KX/QXMGlLY9zSek
         dEuBUWPXPog/gcQc1hxql8e1KUqCXK85XkSv3ct0PpeNBILK7Z+axlrJC9FNehstQf0l
         5j6H743970F8H1WZEZFFr91xIl4zyFEgH2Vu31SpSUNjgJUtWkscydaUMZBcTZ0pQAlX
         AvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748285061; x=1748889861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMCJtECyYLnVFjpZvyBd+ub3nNwjuB4xZOaytzPNUxg=;
        b=ho2Tpxd83nxlzDhQKy0T0k1xzgxQuUHAff7j5wYuqoJZreU/39FzP/5QshCLszLkOW
         HXxnq/Sf9dBC8sw+e3WLFXwo7pLDVE1CaGuCLA+WbVTHn5XT4vj2MPVU3ArBGFddQDh4
         /EEl66L6brJl8pXTfYZXopwP+U/F6jDppOqmAHyfb89wIQfpZa/CdH9WJ3/QwETXN9ET
         rptPYLLNDX+Qgw2Mjs6rz4A7OxgYw3rw8XlkbcvSD4eChqxuhS5GH+hxIdVUwiv5swbZ
         rfCz3d9H+YT4x92sayQ8zE21vqyPE/3trROuk/CWByrjzLiUjXUh6Avn37RhUOOIn9AA
         dbJg==
X-Forwarded-Encrypted: i=1; AJvYcCWbvWpsBXIp6dp1c3nuoGLj9jL6763ucUKZ/KbVEyHgVRENQK1sec2CC3ISF1lhi7S1q+PoFaaX1tUrob+RMjo9M9Qr9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxG6tygQ1zaKUR//kGqOQxtRyMtNT/BGyLjCrFyuax4Jxuwdja1
	yVznlBhScOFkcg04vMkoTYgd2de0B/H/qEfrTbU62oxs0qjK1dFhXKwi
X-Gm-Gg: ASbGncvpjZRAIWPy/Ujuqc/qFMcLlaYrL5ZYK9eR5petEjNgagudwPhYsiw2TucB90a
	OK3CWunO79BUk5ISxokcCEnnN7Q1qDXeInS+c1nx9funE9Ti/+qWBaeKzaePZUkwC7ml1tDDHHt
	UwzpEaeptEQXakRdpz0WhRC338IVDG5qNeuR3nyim1M+sewhAhEJG3R3S1Qt7cnONeNzl7zLRSG
	47VX0N5lBNcERCebHBsPep3a5vtUpaf26Sw94ar33quAf2jlKmreRSZ3Jmw9tDdc1gCsatGHiPW
	4zQSNrvk2ghQj54PVZNyyJddvKo8wdEkUP6rDm0+UVjuvl+QI+T2E6Q3Sl2VmQHKC2YnrXZ8tEi
	kkA==
X-Google-Smtp-Source: AGHT+IGTZSfVQ6dWElB0XLcV+e9gDpFNN4ZT+p1+bxpoMl8MrW/ZmACvkZFbP6thwQgK6HZ2PAqRXg==
X-Received: by 2002:a05:6000:2503:b0:3a4:d048:124d with SMTP id ffacd0b85a97d-3a4d04812ddmr7668024f8f.26.1748285060991;
        Mon, 26 May 2025 11:44:20 -0700 (PDT)
Received: from localhost.localdomain ([154.183.23.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm36455664f8f.55.2025.05.26.11.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:44:20 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: linux-doc@vger.kernel.org
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	corbet@lwn.net,
	masahiroy@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: escape literal asterisk to fix reST emphasis warning
Date: Mon, 26 May 2025 21:43:59 +0300
Message-ID: <20250526184401.33417-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Escaped a literal '*' character in symbol-namespaces.rst to prevent
a Docutils warning about unmatched emphasis markers during documentation build.

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---

Hello, this is probably too trivial to have its own patch, but I found
it while building today's tag, so I thought I would send a patch.

---
 Documentation/core-api/symbol-namespaces.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index f7cfa7b73e97..008b34fe6629 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -87,7 +87,7 @@ modules to access this symbol. Simple tail-globs are supported.

 For example:

-  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
+  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-\*")

 will limit usage of this symbol to modules whoes name matches the given
 patterns.
--
2.47.2

