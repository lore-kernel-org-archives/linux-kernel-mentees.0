Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1F499F21
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  7 Sep 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784176; cv=none; b=ZGqZvwj2y60iBKwQmIOc0GQM525pAG8HzmLdVYlb5gaxHgEfAfDUsOJxBoj2qWZIdm+sUPmVCFJsMkAZvQrFkZBC1fWp9KssDd0ZrrCPgZkU0UUHfldrYcY3cbSjhpRbs0iIfT0kBP2MiWRwI5AEnIGDOQ8rfwWDRPkp/FgW500=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784176; c=relaxed/simple;
	bh=l7ug4HLSmucuV0BytQWrh1mjLjuj0w7Cau5Nxw9ih30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K0JDMNOIXCzVjBijNoQdy1eXjylQxLQ6iEN/56G45UB7+lqohK89jol9c9awVboKk8ErsRKtdlYTl3ISxPKTlfjR7z7vxSqm/iD2ew1fqnbS9PVWDAejz0bn0XxUoTIws3+qy0mPlKJQKxBUNJW1/DGGff8/9+eE3fuU3HD9Y0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=olKCqbsE; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="olKCqbsE"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-861145fc841so28236217b3.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 07 Sep 2026 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784169; x=1789388969; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mjYZ3k2SfS7QDSelwqxhC0sbri/VrXDhQqho6Hz/5E=;
        b=olKCqbsE43qHaqQlg8BmHq9c/zJV5lFDQfrWg6FIvyxznNxmYsXJo8O0HWdMTYO+yy
         SdzwJDIAgJsTeYT1XBbBt7wwq+0lqnYYa5uym5DR2ItAOneWXYedD+wUaoTjgqPYgJ1l
         fPRQ3+p1J6q97/rBW4UdJuPiGQG/lYyjRPU5CGRu9Y8nIuIYm6YmD2IUH7+ErDJnAFs2
         nuCK6OQSjxNVd5t6k770lbPvHp5mSQI+yaiL6Q4tNIt5KPy3h8BreeeicDe0mspue1Ve
         ksqCS9V5xVVWtYksmFD0j0BmOGb3bvxERB2x0LUfPmONuhpdwe+TiYqy7PMIjvSv/JGs
         4Gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784169; x=1789388969;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mjYZ3k2SfS7QDSelwqxhC0sbri/VrXDhQqho6Hz/5E=;
        b=cIbvO9a2Sqk9pmlYwyzabhqVpNvOWbfUl0XHcciFT6KZD/Y51zqDauicF0kOQwufPz
         00nQ875oPxPV162lJDliS4JCnGW5l9VjVhjyHxH4zyihgzFmii8CqUzMI19SVUpu6wNh
         qGmQEKWOTt7UvfWBa2PtsGjt5hht6DOQ7pFiqtEv6FcABmYcI+yb83sl+sqAhhtABJxK
         n2xkiOuN5hw+N66Z3RAGHqzmt1aNnWFkPdFdwa+LZsWUnNo0JHgiVfNr2FPHkUVlJlNK
         WLhLPd8tqlPcnNS66zghXyRqXi4iHQm3HQSAz0CC4XB/Kiuk1R7J+h5BLPsvisswVvFz
         n0XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMFhcTIn8NLjHtw2HVmxCcro8wiGjeSpQvFUHPCwSjvj7GzamecQZEyq/hp72kK8BLXgGH0QlM22p/L+jgx5VTB86Fzw==@lists.linux.dev
X-Gm-Message-State: AFuF++ngFV1bCmR/Fib+u002UeZEAAsCmhPMDpmbV6wfutQeF+JB5jQb
	/ZVoR5j+JRewNR870k9wV5Jgb7HZPowPfsJOmj19nbnvtkJSGXgSmXw=
X-Gm-Gg: AYBFou3iKt3BYoZK32WBi/0jS7Y4vKrtSq63qNGCy9GCYw4LyzjjW5jLHwZcu0EGJ9b
	O1hIqUrzUKvR7hjUGmfk+62/Bf3lnMw+UyBzs0LRSgxxaeghwy0CFeIGeWePYILr293Gx+YXpGS
	DpTVlIZ4pewIV8cNRZMDZBwNouvn8/SyLggWRCk38aGs9lUwjpRSbVjgCRcArgoBYy0XZGMu9Ee
	Tnrx7pT7QGyWLHwWQXa8rJmxtgWYm4DDbO+PZPj2VbghsSKHb1DFSPeJ7LkwzLVo6cp9t0/Ytw3
	8T1hBeWJ/Eu+myGwKEyiwP4EeDQ5pvOAsah3302bnHnTtFmcexwPLtQWPvnJBzjqfelGDSKAatL
	UfLqaAJD/b/8QdLVuPHk5xoJE/EQqailFQ/6JmtJG4BelxMgQjo4IggpcxNmImoWRFlh1o8jpSz
	+sI5HiHEGpULAAnGtS3w02oUGTg/IkyTPuZcd0ROEBsTp9hP7LIGPEzzalKc+C84hLNQsVGSBmB
	gGAiCOYN7KDjUSPHjYAigSfLvrmBpuJ/FM4fLU=
X-Received: by 2002:a05:690c:d8f:b0:7e9:4a7:9899 with SMTP id 00721157ae682-871261dc570mr103556167b3.11.1788784168867;
        Mon, 07 Sep 2026 05:29:28 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:28 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Mon,  7 Sep 2026 09:23:31 -0300
Message-ID: <b8ec70dfa6e4e711cc95df2a6046741223d67c92.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788711082.git.nico.antinori.7@gmail.com>
References: <cover.1788711082.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 054178b88dcb..0be510e16a8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8665,6 +8665,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3

