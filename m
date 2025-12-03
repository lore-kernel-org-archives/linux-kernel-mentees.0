Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724BA1EF36C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 19:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764791076; cv=none; b=SVdOl8qaKUMZzEpf/9lcBs7COO3eRy54oZ6gpSIUy2Z8AKOoWC47h/E/UcDuoX39qE9Hw5wDTpoFwCKEgetH+zEEUt1sqvHAsxgzvducvJtZ75Wi8xOmiPSRkboE1h1N+UEoOZccG/j2fxtZhBMOtrW2JFo2Tz+6QjPOA28AdjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764791076; c=relaxed/simple;
	bh=LjjtwkWMaFoJN6HBxX4d87lEuwQRiyVIvSp0prkQ3Kg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fhOpw2t+v/3zrwzxrTuoVnJPBuumFnWNm7WkjgT1vIyNPNsOhlmIWQgYRjSsveaF5h1JJDCI8YmkY7zmk+T7iLQVWYvxg148WtruvJUja6+JcG87cOCf/dng65N1T7YlFRBn5VsXKLZacd7CCFwTeLlJYJ3BjR0fZE0kxEb1tBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cAHuZIYP; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cAHuZIYP"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18207402EF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 19:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_IOnsvG9NSJ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Dec 2025 19:44:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 656D140042
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 656D140042
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cAHuZIYP
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 656D140042
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Dec 2025 19:44:33 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso103471b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 03 Dec 2025 11:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764791073; x=1765395873; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r6JDi8kUcg7AJg49gUFuPpvzfdqLFexCrglDxdNAMAw=;
        b=cAHuZIYPp24jc9Kh3AjHqvjRu3IHScPf3uC4fNBlGZmakHYDtWEfrDMlIDRIMKi8od
         v/w9NZAA6my/I+i9Z1CCLh8UCg11ehobnwjULtxGDSGwHKUQqv9VSxM8qpGiYwjgqZ68
         Mp8NbS2FJlDq69bEiTjTjZmN+Gw7AqBPgqSepoQoa4aBGYI4ZrmnyAsZ7sdyv41Oc/81
         eHYl1K+3AZPFfLeTmVUwAj10kuksCo65qvvxjd4/7FcXmhOJUjk6bcYopLIbRNRjM8x3
         KVhhdc0yL6TilHLVMfAptqeqAedQ05H7xxPE9W8+wY3QilL4AKkODniMB064OTFtveGa
         DlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764791073; x=1765395873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r6JDi8kUcg7AJg49gUFuPpvzfdqLFexCrglDxdNAMAw=;
        b=YM4R41shufJ30p5yYd2GY/fEK1JHSjekQlxB01FeVAaMlXarZEoSs6BEONeqkSpy4p
         jH5JGDqEL9OLZ+8+K95ladVbcaPEpAFdiAO+kqjh2zYY+mjW8IpdbgHYTvH3wwvphs//
         VJRDerzKyLgWaJiVOBy16zl+Mpl13p0QGFevZJqAvCKQmmR2E3aKlcOrSAgAnbFtLHPr
         sjtS2ZBQ5O0nI88dxNVXlX2AfAxYmYcekirr9FjwHEQBSLxZeZIuehb88z/m2FVHK9RL
         7WzplsdKYCJTdRiTCjrE9pjGpJQUxaSxvLt17nfomtwAnzSg4pnXFEpfww2MY6yZC3cg
         A2Vw==
X-Gm-Message-State: AOJu0YzSYAMi+kfjHNcb3duXe/97gY/mBxjDyyBO8sVh5j2BwEB210ZH
	1y1FGK5NeQ3cFLsZFxojTAb3VI1VKWpjSZE/n36pnlm+rg4txyN8N9iitpxIsjkl
X-Gm-Gg: ASbGncu4Cs/FD7Hsoyn+Xew6um1L2DssZBDAaxvIz2+Z0/xiIN8h5a/8wQ0OEegOdJU
	siFO5aQ4bvKCGnlnk0kxDMT5eCT0UVnoUuuPUh0o6q3PmIK6dQuj4XtcII8qAgWdb1SmJlEzEoj
	MNSlVzAPfaJl6XNXN6uYcPOCxdkgX0S0Dt5EHVOuNo0NWkRMv6uvG1O5j1XDHdavqaq1Y4BkexK
	Ec5xbZ022XQiHhgPhLvP2qX4fb0P1ytYxxR69GkCYouMUijPP8EQ6szI2gmoHkdlHwmxJpEwo6C
	o30EL7bwgyyBDy8/jjJB2i7nMKXvkd8kh1L8oEIu/mw7c35qpYNSon4Zxmg0qwtTfHpq9RuiB95
	jYTx9MbrhNrPNM4vHLCLCGFTJcecjE9gTYAgaeM+g2/qQWKu42r+XYfyUe6nK6Cfv1cmmsYTqHd
	/OG04P4SkFqF5Ip2upRzJeee/u9uZGQRI=
X-Google-Smtp-Source: AGHT+IEqwOyZ0efP8rxY8KnJXL/eMVL85joUKOrk9i/n5G4c5lEjXYhelXUcCWTp4ZDDJ/Lj8UtO+g==
X-Received: by 2002:a05:6a00:2e20:b0:7ad:e4c5:2d5f with SMTP id d2e1a72fcca58-7e009830ba8mr4358496b3a.3.1764791072747;
        Wed, 03 Dec 2025 11:44:32 -0800 (PST)
Received: from soham-laptop.. ([2409:40c2:116e:6f1c:ab6e:2f5d:e763:cc6c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f175d95sm20973611b3a.45.2025.12.03.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:44:32 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Breno Leitao <leitao@debian.org>,
	Song Shuai <songshuaishuai@tinylab.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: kexec_image: Fix dead link to boot-image-header.rst
Date: Thu,  4 Dec 2025 01:13:52 +0530
Message-Id: <20251203194355.63265-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the reference to 'boot-image-header.rst', which was moved to
'Documentation/arch/riscv/' in commit 'ed843ae947f8' 
("docs: move riscv under arch").

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
No functional changes.

 arch/riscv/kernel/kexec_image.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/kexec_image.c b/arch/riscv/kernel/kexec_image.c
index 8f2eb900910b..51dc89259f16 100644
--- a/arch/riscv/kernel/kexec_image.c
+++ b/arch/riscv/kernel/kexec_image.c
@@ -22,7 +22,7 @@ static int image_probe(const char *kernel_buf, unsigned long kernel_len)
 	if (!h || kernel_len < sizeof(*h))
 		return -EINVAL;
 
-	/* According to Documentation/riscv/boot-image-header.rst,
+	/* According to Documentation/arch/riscv/boot-image-header.rst,
 	 * use "magic2" field to check when version >= 0.2.
 	 */
 
-- 
2.34.1

