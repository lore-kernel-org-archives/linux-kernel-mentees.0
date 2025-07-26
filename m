Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31078F4C
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753552534; cv=none; b=q7WdqxvTRNb0REMXJtAw5T03YGEeO+KjtKebeGXF+ykwYOTl0mUTjrwolMXFuTKtAlJePS4gHs/a9SI0GxQscAzdgTfNKDnWpkNzVUrocJptcw7G+lFR5UXdvcfRBoXMLL1NvllDY2XohTKWPUWr55tkLIH70v+Vle0o5r5Ccbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753552534; c=relaxed/simple;
	bh=J7tOKQm6KsbYvCR3Hdcgq3HJjA2YL0PvUJvCbeT5bRc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DQ4lXQep4fsPXj1Gdn5wiAYlrJMFHZWQwL3RZ9wTyZKCgHaYB8HpSDHV7OXHHYd3GGtOYtrI3UOl+X1cHUUCTzfWQg+MssLBZstIDygyszqhGO1V8G5tjyAkSMzPNT/w4L/sU4dd4ws4UAdvf1eu0qCMGV+zMQGv+zh05D4IHVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCwzbsNM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCwzbsNM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-747e41d5469so3428020b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 26 Jul 2025 10:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753552532; x=1754157332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5W++au39rEBJxX2Q4rDpMomnaH1q1xWRqIVRKBNu/qM=;
        b=bCwzbsNMgpfparlXEg8T2zfMskfU8cLlf+pcwPEI8VRmC31m8jr+n7PKcn1dXVi6Ld
         oM5fPaGRGIah8gik0T32BpP3vktq7tdT62Zl6HTXf4UVKP5IeDfQooeG5/x0fditw5vG
         aQwQlFX7NYAByAI910HDMynriF+JGqbOBU0wbOMbOY+vML6rY88hapRfbhZxXk4Ec3n2
         YD4xQhoXKTdfy6i4tm74Q62APlzJp2ssr4GDaiFVDlNr0/vtqk7chB4Pmb+u2uOEMlV3
         yYXIF8d/cxsCjO15nY1F8Js80GSAzfvmURkUh9gl7nX3898pv1JqZZgPMmLcHErm9d2L
         pTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753552532; x=1754157332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W++au39rEBJxX2Q4rDpMomnaH1q1xWRqIVRKBNu/qM=;
        b=MqoO+KNBOy/MJRDv43uiQQAvgpn7ukqQ6db7eoyDXl27JgdCac2IOri348MNmeHODK
         4FG+o9RozMwhgofxvvqecu8pQt5snVfL+JB90fOaCPGVHuHtgNx2EmLeRd/GD6iOPeeS
         D6zMGXOs7MKh3xHcOxJPimvOyCSxYGDpREyitxQA3+N9srtSzOCQtJbnemoB3fqQEmhZ
         aMLVmA0H29Eun2hRVCe7WKnqQQjnAPPjd6v5GpSPIdYKh/Dr9w8gX7PUXTzCAsfpsgPu
         Q91Vj2srpchhUVd9tiFf5vVExo1KirWKu1climzrrt1FuvPmg4DfDzqOMWmzWy9KORTj
         3yxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUmv+O6KRGn8b7Vy+Mhqsn33klBlaoY13x6umPLhtfSJ/jUa3xIrNblmywBC090FSxuvkb+Mn+bxu0zQETiUEWXQmPhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeIHf4u/kipfJhbAn96epmyZBCKzuW2ZUrucA+ZpV98lgd1slz
	ddaIwrUVthG/iaWzemoKUZ0AsevhNm2Jp6rSC3XJa1zrzS0VB95rp34I
X-Gm-Gg: ASbGncsmq4Q6x9GORvXvfwWiuj+2VtgmktAqD766fuHpNZtZpTpkEHWTlUe/VGrY6K1
	ZkbpfmvTZHDzzAqBb7YOA+i7qpCpMc6Lhpxh1H+4Gd6XGAb1FhjDZYNfDeiuEIBaEiOeQ2EAGiQ
	AOsoWyjuWUjvEY0LiHaY4jMxj8ZO31eW2nW+vDJ2QRuGtowS2tPXPbK1+FvBr6bKXTSEQQPT1kf
	/waJTU8dLQ+4Rpi8WxTCbq2iml0eADjkWUAwXxZXhle91/TpzeDm3PA7fiqLaVBHNAqkWP0j1cJ
	SEuTUhoixu0eBojnbP/8ISf+sYYmctkHgVSlY7Px8WO+aaeqpTATv28po6H1DKy5As8oyXYxoea
	5msfrpZSIhW9kI6GGDP9Cldlxr0SDng==
X-Google-Smtp-Source: AGHT+IGxlNYFc38S9eyRpImqOcQtnsmU476IB/ko2ETz+ypFrU/cqJ7CZ1/p3sY9pKlfg1fkHfAKrw==
X-Received: by 2002:a05:6a00:3e01:b0:754:7376:548f with SMTP id d2e1a72fcca58-76337de94ebmr9720110b3a.23.1753552532040;
        Sat, 26 Jul 2025 10:55:32 -0700 (PDT)
Received: from archlinux ([205.254.163.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-766cf6c19dcsm167180b3a.68.2025.07.26.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 10:55:31 -0700 (PDT)
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
To: masahiroy@kernel.org,
	nicolas.schier@linux.dev,
	linux-kbuild@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Suchit Karunakaran <suchitkarunakaran@gmail.com>
Subject: [PATCH v2] kconfig/lxdialog: replace strcpy() with strlcpy() in inputbox.c
Date: Sat, 26 Jul 2025 23:25:24 +0530
Message-ID: <20250726175524.146459-1-suchitkarunakaran@gmail.com>
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
it with strlcpy(), which ensures the input is always NULL-terminated,
prevents overflows, following kernel coding guidelines.

Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>

Changes since v1:
- Replace strscpy with strlcpy

---
 scripts/kconfig/lxdialog/inputbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/inputbox.c b/scripts/kconfig/lxdialog/inputbox.c
index 3c6e24b20f5b..ca778e270346 100644
--- a/scripts/kconfig/lxdialog/inputbox.c
+++ b/scripts/kconfig/lxdialog/inputbox.c
@@ -40,7 +40,7 @@ int dialog_inputbox(const char *title, const char *prompt, int height, int width
 	if (!init)
 		instr[0] = '\0';
 	else
-		strcpy(instr, init);
+		strlcpy(instr, init, MAX_LEN + 1);
 
 do_resize:
 	if (getmaxy(stdscr) <= (height - INPUTBOX_HEIGHT_MIN))
-- 
2.50.1

