Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00618191484
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 01:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747101576; cv=none; b=pKc8n5ztupZtpf2wJ1T5QIbIehbYfhODRKnVbn9H6ZNZ4Dj/hH9jTkYR4Sk3slwIO260T1EJGCvbV27eOttnPn+NyXoNCA2G7H3GFVg4vMJIDh34O7/svtRwoyeTR/IFB6RIo4saMLu/u6zjSMhHqKzoRn3/55GKtAdcz3CdxeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747101576; c=relaxed/simple;
	bh=iNyCL/w53y7T44RfQQIdiVZ+BUUBfHa4qhvE+/XBP64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QdiH+CeW08+Lw5dTW/YBKZ6HHOFPdvhBXhmkwCo3puDQWRL/fYc+fSI6vnttJXodP8LVLENJzknSOR3CYumbQjtXkLsyq4V2fdedFJ+fc0nkJsxUGzPs4vk+lhE1A22hka2wRXliczcNhc7yV9FFgdOXCFUJaevwLxAG6NEnCuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DShyiMK9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DShyiMK9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b135d18eso2921252f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 12 May 2025 18:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747101573; x=1747706373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rW+qOLgETMD/qqdVxMuUpvTl8/uOvRufUvaI5H9m0mc=;
        b=DShyiMK9/Jo0Ob/AzX88tJ1ihH19Bq/wj0dSmyG5YVg+EeEtU9JIfJucIYVwUbbA1W
         +Nj2Iw0+PwJrJ6oPqEJqwv3UlGqJuqCf+rIWSTjirlLVLnYtGZkIuYH0HlK8ufiFsVUf
         a6j+9Pb5b88WlADSOkGBqHDQj3BCnoEQlCSw1OB3S745BzOYvTazBOFd3oZizDAajnbq
         E6BdDs69WB8uL8sarZr9JZD/SfgKi+WRT2Co6qDoqFcFA00tKbl8zpYRoEyM7EN5Vpe4
         1PTQoDS5O24PqgiiNqAO0UiyQNUvWs8peEqoWezIXFwT7LTzMzIGV3K4G8AupIcptrsd
         qxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747101573; x=1747706373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rW+qOLgETMD/qqdVxMuUpvTl8/uOvRufUvaI5H9m0mc=;
        b=w4egZJtPvwwO1Ybq+MrJf9WCW6ysCXJdPn2vYysN68BJsXPObTUjOFyYtMZrGZ1/1y
         svutMF7KYuljuDloK2hsA2rOgl0TzW1S2aj3tbgVnH/EwBnFWWDUHieSbZrDuXJgSnSF
         ZaUX+2J4eWUNe5s1ERmStLNdyClp1qLi9qlVY89BckSsxn2GWLvvWQLBLF1jwkYl2oDP
         guOeS/ddJv7cto1qOhXgLB6SxBaaaDCZyNXMYMrdOFxARxTswa+GQXLQJk12C8qFhT3V
         kePNncAh+Ah3erpyUJTYrFN9rlh+/+aZnifsvJI3O51pQO1VCDAZrkoF4IBSg4WVNX5V
         U7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSHoynwZCaSoVp7vc65wv0w1W1qj+csufg5EJRZDytry2twxdvASyhJ3QaMwu11SdJu4mbwaGntXJ5VCfj9wLFuPDDBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJIblTtn/0BoaSDmCVSqXL/ZVYhYt3mM0C0dTcIvOOiNELR7lA
	4FoS2Z21t9Ssnj3KeAMjSCidhEwfs2UxMQ2cWHQbr0SVye5h0/yq3g3sOw==
X-Gm-Gg: ASbGncvNXhhyKDkVFAs12TBMIv9gkIfiTiPE82B6PivqTBmmKXTAnsS52byxs8iABD3
	NjR2D0q/MczD9xJQLn5yB14I9t6+xFyzGji7ZKaQjAPthBw+pYndlr48+uFTe53HhwSBwmwkVYq
	zuFgiouP1viXzn677G4Ik0XO5E9XrSUnEyLP95mJPBQXeLqEqy8seZlidP7RiRJySkxkOHCsIXs
	uTMizZ+agTPpq7VFHHhkyAodA63PnYYdxRb3wBj+1WMUaSEGNqIlLhQ59ZchNaZxZxxa6Gd9wmV
	fDudUu9k4KzK6P40LBmYr/ZPIR6S1/NFX+gPtzAceBQI9LhgV9TjigfZ37KsnyHQFdUkS6Rijt6
	1Dg==
X-Google-Smtp-Source: AGHT+IHkiHYVqTo1Lgsh7pVE/CYDSoNqWuLHp5JoJLnUrbnEdRlTn0J3jvV3ew5K+xWQgz9TtB8/aQ==
X-Received: by 2002:a5d:64cd:0:b0:3a0:b5ec:f076 with SMTP id ffacd0b85a97d-3a1f643106amr13304447f8f.18.1747101573035;
        Mon, 12 May 2025 18:59:33 -0700 (PDT)
Received: from localhost.localdomain ([154.183.40.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58eb9dfsm14490551f8f.31.2025.05.12.18.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 18:59:31 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: bpf@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@kernel.org,
	andrii@kernel.org
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	tj@kernel.org,
	kernel-team@meta.com,
	memxor@gmail.com
Subject: [PATCH bpf-next] docs: bpf: fix bullet point formatting warning
Date: Tue, 13 May 2025 04:58:59 +0300
Message-ID: <20250513015901.475207-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix indentation for a bullet list item in bpf_iterators.rst.
According to reStructuredText rules, bullet list item bodies must be
consistently indented relative to the bullet. The indentation of the
first line after the bullet determines the alignment for the rest of
the item body.

Reported by smatch:
  /linux/Documentation/bpf/bpf_iterators.rst:55: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]

Fixes: 7220eabff8cb ("bpf, docs: document open-coded BPF iterators")
Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---
Hello, please let me know if you have any comments, thanks!

---
 Documentation/bpf/bpf_iterators.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/bpf/bpf_iterators.rst b/Documentation/bpf/bpf_iterators.rst
index 8f0a4a91b77a..189e3ec1c6c8 100644
--- a/Documentation/bpf/bpf_iterators.rst
+++ b/Documentation/bpf/bpf_iterators.rst
@@ -52,14 +52,14 @@ a pointer to this `struct bpf_iter_<type>` as the very first argument.

 Additionally:
   - Constructor, i.e., `bpf_iter_<type>_new()`, can have arbitrary extra
-  number of arguments. Return type is not enforced either.
+    number of arguments. Return type is not enforced either.
   - Next method, i.e., `bpf_iter_<type>_next()`, has to return a pointer
-  type and should have exactly one argument: `struct bpf_iter_<type> *`
-  (const/volatile/restrict and typedefs are ignored).
+    type and should have exactly one argument: `struct bpf_iter_<type> *`
+    (const/volatile/restrict and typedefs are ignored).
   - Destructor, i.e., `bpf_iter_<type>_destroy()`, should return void and
-  should have exactly one argument, similar to the next method.
+    should have exactly one argument, similar to the next method.
   - `struct bpf_iter_<type>` size is enforced to be positive and
-  a multiple of 8 bytes (to fit stack slots correctly).
+    a multiple of 8 bytes (to fit stack slots correctly).

 Such strictness and consistency allows to build generic helpers abstracting
 important, but boilerplate, details to be able to use open-coded iterators
--
2.47.2

