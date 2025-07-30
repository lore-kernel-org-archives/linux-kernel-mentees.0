Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBDD21C17D
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753906745; cv=none; b=qyWnScBGh9T7Ss8za6q44qK9u4GSVR8USCgltsachMnZC3QYqDr0pmINVEyK1dGkXTw2faI4dTeZXva1MLPKwZwfVpZ0eFq4/SIlkzZOafKgYDPX7yty7x2CVyzFavNoLJoDEezfL0XZahEWzBrzfLe3NJI9Bv7SVu8YRFGvtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753906745; c=relaxed/simple;
	bh=aB7CBF9ndAPvB+Xnx16s4jRkTWA4duLFe047G2Mi1b8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fDtcn7KcBAsplqoOGruXh2GYahyfwN3fdQJ6Eu3N2wKv5cKPjGduB6aEoqPiqInOX8BbWN/ftBRUNYla91vXJuFdro1kh1NLnF2/IINd3lLOiPQxxwTUVhfSBq2qfssZ8O6/ZxFZ4ucy7x9y6DI4DH7ZLudYtF+JZW3iMhRAtI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSj2g+X+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSj2g+X+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748d982e97cso190321b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 13:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753906743; x=1754511543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AlO42ltRQH4KQlJYhZ6wjecii6JSbxSUwJocNSNqQQo=;
        b=iSj2g+X+QKYbRj16PuB2lsam5gvEU0NHGtdMxMAonN6oqOy/O9nX8B/x6Z149CP005
         AQNXxLt096tfmLrMuYoXH44CWqkpFnaBDh/h5DkZAepNxfXCSM+YinpKI6JG7uSJAGrk
         enSR6oiCei1m7dJbIJQ1Yr3XkeeMBQD4DLwThFNPUA/9Kk2ib1YZYOrJwnL5X/+Hant6
         cbYfWSQyUyVBmrJvwZj1SFXWE2Q5Wk/hBIpPb58xAXwSMyT0A9JsazW4kNjeVESg7n/w
         q1E7WM8DfOyZuccanKO7F+IDVjDmzWjtrCWBV5SrEiRN/Jy/HqI/dGC9K1udxQ2iCXII
         0gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753906743; x=1754511543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AlO42ltRQH4KQlJYhZ6wjecii6JSbxSUwJocNSNqQQo=;
        b=sH+eU4eOzskNJf9yAqA/EesywGgFwDtN+SY6tYUm7PqNlAG0tZz5UbD6iY8KLOp+/6
         rzBT+QELXuFs0LMPQwvUR6+HoC2NMXMyZpMcpaY0q1MMqaUjWWa2cBOutxSIZjPNZvmT
         wlPgIEsLADvEk0RunklUh2uIcRo9Gad3DM6ReiMaJdPdrrG3tV+lOm23SQHkEGvAfP80
         IYfY8EgnHnJDzDrig7Z89DSCiXR+wbl3tpkbTVHwenilEizrlyE4fINXdNuGybESHfBB
         vUubWJIuT9L00JrWgEvhgNBHeFWL3+zZ48GVvNy+ayyVLs9BEF4G0dw63eyqjATk/mbQ
         6LQw==
X-Forwarded-Encrypted: i=1; AJvYcCWn22OJEwuqa+3EBxaHpILJU2EnW000lgcFkbBcO9KcBZYZmorj1p6bvT37fFy3+8K6JVS3b9j/rIBO1ehehEtqT/w5/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSeylRfyTnWrQjZsorhjQfgNSZGovzptxdcV+TAwgZ5a8xdIA8
	AHYlmLp8N05XDIWKZn5/HcifTjO2NC+F8rg8jCH36djpus16bxXFsZ30
X-Gm-Gg: ASbGnctq17x24z070xvmW5zFDd0Ek2esQCRsUHXZBQJqAk6BIYsCHdKSVYudbIx2EVC
	85pQPNsg4pcx8gGmcCrL6GXooBYx0R+MLZmCwHqImFDjQlwPZIaLmNWBjj5N+YFD3n8Vs3ngkn4
	NK0Sz2Clu+8T9uH//0nhaJbucTBkS1UetV7ogRNA7C7QfvRSZI1wfDwRuDzgpL7igXvm57Ts3IV
	ZTKUr/3Bi2OjODATjbx1ac9jb76FDxAlLMNb/7jkjrPv0K/F5jn0vnHlPa3x6D/xjJNohRGrOTL
	j+HHZOR9It2Szirb1UnY//5ZFkCzivE46ekbjNcG9ilqq9zIqAqaKi6xorMNjaHA6O5gZlgVoVP
	G3N8fs2QBKiptui0Vp4w/SLjuvDfGhDC6o4urc3u3
X-Google-Smtp-Source: AGHT+IHBG5gx5IHA8gfp0MfSUg4wj7EQYZ7A9K2oxxf6n/sZ+QJuN2mQffF7BmQWYJnYW6g8lKCcfQ==
X-Received: by 2002:a17:902:e848:b0:240:3915:99d6 with SMTP id d9443c01a7336-24096b236bamr65250465ad.33.1753906743191;
        Wed, 30 Jul 2025 13:19:03 -0700 (PDT)
Received: from crl-3.node2.local ([125.63.65.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24009b8661fsm85484925ad.126.2025.07.30.13.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 13:19:02 -0700 (PDT)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: skhan@linuxfoundation.org,
	linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] fs: document 'name' parameter for name_contains_dotdot()
Date: Wed, 30 Jul 2025 20:18:53 +0000
Message-Id: <20250730201853.8436-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc for name_contains_dotdot() was missing the @name
parameter description, leading to a warning during make htmldocs.

Add the missing documentation to resolve this warning.

Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 include/linux/fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 2ec4807d4ea8..d7d311b99438 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3279,7 +3279,7 @@ static inline bool is_dot_dotdot(const char *name, size_t len)
 
 /**
  * name_contains_dotdot - check if a file name contains ".." path components
- *
+ * @name: File path string to check
  * Search for ".." surrounded by either '/' or start/end of string.
  */
 static inline bool name_contains_dotdot(const char *name)
-- 
2.34.1

