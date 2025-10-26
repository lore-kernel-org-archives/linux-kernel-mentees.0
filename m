Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F171B42A80
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761463573; cv=none; b=Dik58LFKfbkuofVPor5nmWILgNaQhF4V1uikB8GprChPJOvEvx4OgXFpRUKCFm5IYWHTdK3VJBzUa2Z11uwAdQQQWdI8jpSzbcS2SfKt/n5akW63734zmbYPyGpmirkKTV57N2Tvi5X1/ysEwSb74lZrP0tst9OL40ChNgf9Yb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761463573; c=relaxed/simple;
	bh=Wsp8cxVy22klAhiDGv9P8tZ3IPZ7LUZzLpg3S21IfDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzLhOGNQYVisLiy8wIMB0OPkpXMfs3oU++56Y1nAQmcm7XvhcFTulRS2aFh0jf9XVcJ9+3DZ/ToNx25/n3xbtwLiRbwy+xwkp21TXVLaztu2BUxfJY8J6AZi8D/dsmAJ+5KwI89IxUGAN1TfRKzPJ5nExur7KrfIJwLBCewYPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DukfMrHd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DukfMrHd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eec33b737so51839865ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 26 Oct 2025 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761463571; x=1762068371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdMa6HWGVI8flyxHcsiTS5cMCkPtytHGgTVFhKdr0DY=;
        b=DukfMrHdBdimZ+ii+lJRPXffBXO83b+XLpjKazKczm66sLclvPqd3neVyId+CJQiiw
         YGKrksuaL3G2Nn4NkimLCVPDy3gf8w/YZsu1AuvOltxkk0qqxTev4w/9TIffFVKVoqpD
         ykAI+Tv9dy7J+esiCWJywcpDVmKA55POhljrI9xqlng0UTaEg9aaT7FSdzHvm6UFeDj1
         WJ1MVwLMevIfH4lnCLIKh2ym2JOrtq+vGU3J4+w/VQhLNeGsdt1cc/GTaJmB1FBLjhgr
         ddduEW75rxPb93skONcIEUwZCGdxHM+01too/NQGQIhRnqJT6/gaI2dd4qZgKjGKcnCP
         VnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761463571; x=1762068371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdMa6HWGVI8flyxHcsiTS5cMCkPtytHGgTVFhKdr0DY=;
        b=Fgo/+P/5GbJcKnwgqsrudFQ+qecYWEjsIJ5BfNioFTjkm/mVdMjYi1sfVAJRFuPgOk
         JAmWlwGbz1tOIZ9HgBybVEUlupBs/0WofeIGkjKKBIu3XDcExszUFRziz9enDliiKbvt
         Z6Sx4rj5TYwTE7aw/bSGNaEnJMwsyKwSTdKFe7yEAjQU4GooIIcS76m4FHBHgORDLyU6
         86rcmqF4ZBYoIyzJyIrPBUM26P+N1PFbvH/+RfNSNhVOgdJXsmGtS/obn519Z4g/OEVt
         luBkybtqtPWiOaVaOmN0zAMc2biXZwM1UYQJzWbynlCy/CjG9ea8LBJaN/K+92/afIj4
         2a6A==
X-Forwarded-Encrypted: i=1; AJvYcCUBKUW+rQ3A43WXSerbSELeuXWWnH0q2GpdFNa5aLA8svNhUKZUWKpMnIzeNmMA8ELZqhxmJIhKFPXIlHZvToAT3YdEpA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx58AurQj7OENt7/mTof1QIldehz0eGvFLlkxjQL3LOKgxCzJQg
	n4DnSY+d1DWzwObWHSnPyo5mOKazZwYVuC9HNvyORWX+PLqsYnNw8jL5
X-Gm-Gg: ASbGncvmuuE3/yPbcN63jw/F6b4rheZH9fM8I5q0Y3NfBsutO4xzfqpOtqBXVjhZlMZ
	iylMH6PQJQnL2KvyAeqF6Vh5tYq/4w/cEzDZqVASjchvO64nS1x4tCuNE2El3JlMsG8wzR2BHUi
	IBdNFPkbLyGfSTOK9oXewKVRxZLMFje7BIm/9EzvtbnLlb6zNMMIZmmdlQd3Yhr8PDxbf1biUuN
	9TBvg3RBLZ8IXr3ltGCDSxYvcsJr4/RVLjMcsQLQpBAHWh/+DaK2UkdGfBV1RiCuQcklqAUtTo3
	o1ccmvHGLe3eLsoVlBg3HJn3xD5ljShfo9obcTPbqs4lGIqNvdzM1cnZa75DAJN7vsz3z759umX
	UrqMXcya2kL+nLgO1+JnDc8OcBKnvs5IFQtihPVMSqgmzn+shmZMUdDkhbyNE+IPoM5KrhAwsn/
	EA6jGSOcSApemm5ePf5mVjEY7C5gTtA7PDcwxSAe9N
X-Google-Smtp-Source: AGHT+IE5U6eGzQVnJuOp2Y8MluTWBLNlPfwZGE50frkHscCUegOKsjhIR8XeTV7M1ymJACtKk/unFg==
X-Received: by 2002:a17:903:2441:b0:271:479d:3de3 with SMTP id d9443c01a7336-290c9c93d94mr423076345ad.12.1761463571105;
        Sun, 26 Oct 2025 00:26:11 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2903csm42817175ad.63.2025.10.26.00.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 00:26:10 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: shuah@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	khalid@kernel.org
Subject: [PATCH v2] selftests: tty: add tty_tiocsti_test to .gitignore
Date: Sun, 26 Oct 2025 12:55:46 +0530
Message-ID: <20251026072554.48786-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d1a483dd-5405-4e8b-8a38-816d49fffbc3@gmail.com>
References: <d1a483dd-5405-4e8b-8a38-816d49fffbc3@gmail.com>
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

