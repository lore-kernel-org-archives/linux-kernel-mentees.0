Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D602311C14
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 16:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758559478; cv=none; b=rgCEFDXuVRS7YMCcFecmDx0LN0VgxTbenKVJm+CU1nyo/O0k0NK7zIThuLlfH9yXveWm7TeyJ9iNCjtHgta6BPBYLUxrD5vuEMNQmfN4uptosrunr6ECTNtg1MnV8ji19g8LdIAXh6XTJazJ8MswSJLNf26n1VU//fqTLykRI6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758559478; c=relaxed/simple;
	bh=4X6/rYhYAaa/xGK/cCxDNg0XoRNHR8o2oZIpX/vwgNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jc5z7BKCh3ra/ObgIfrKpoHX7oroXpX+0kMaQ08guWaQBYmgV03kfMcOCErJW0slein5oapVi28tWGndLssNBx4EHbc56JTF6b8uDRTfiUPykMzGNOBd2mU0zLs5NfY856uQh0eg40Sduj6BCxYj4VUMgKdpPK5EMYxtVjrfKR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewSwZcMv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewSwZcMv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE2188121F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 16:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8kumVzF4Xmj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Sep 2025 16:44:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E24E68120A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E24E68120A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ewSwZcMv
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E24E68120A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 16:44:35 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b25d8ec787eso55507566b.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758559474; x=1759164274; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qVjEH1OrHc9W6t0k0tXjROXejrmvtmPSgsAnXcZ868=;
        b=ewSwZcMvUP/qhuGZ0pEJdB1nXhLqwGC2N2rH2+kMyylZdcq+piodVwWRPFRrtd0th+
         dyy7qbRZsjKOLqhChY3mGwBQclUF3+uBAeznlQuaRan02oWAQ2Cwr2tYAn4rJovkhcqh
         OwwTtvkaXYaTiRR7wNmo82i8CgVXfwnfqWPDVNp53IgqkhXd09MNm8S/KRRVi859Fx14
         Bw4LW3GnL08tutVuDDx/Wiw9NzjjtNn2aAgijcozURPfUC7WksKqJ9PjX0JKXy7916K6
         CSIZqbuc77fhQlAEc+NYe7fsM8dFU5fQkGR64+WGvXSBFJfZ7J0VAqwWZW5xdPbPnN3A
         cWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758559474; x=1759164274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qVjEH1OrHc9W6t0k0tXjROXejrmvtmPSgsAnXcZ868=;
        b=B1+kdNQ5HClgWWlkGfV7o2e1gLlO8xO/4cwmDKikmrnFBB3kn6b1EqV0cD/CI4rrdT
         +8BzPajudzlw+fVS0ZdTifpj167No+RxHiMJ4gfHRM0VfEAbkXh7iOYuLgb7ygHE8X5+
         WhrpTeJBMV8vqppee1rIqBzGXYKgqYFMVsN+erLPuS18O4d/Hb7l3Htc0jn9GykKqwBn
         oRZR/l1/ZPWG2r2UbIk11+zqpngU4c2Kd8fMUhlBp2sO7TDqkFneoDWAO3uHvjRL/79D
         6oskWz+XV7ZHIl05p3sHjNCje65//tZJzXKxAV1uU+M7guep83v9wOlwWoUvW9fp0MiE
         3ecw==
X-Forwarded-Encrypted: i=1; AJvYcCXfdw3iNzYWgK4rNh7i7r9BTqfpRAn5hqZB7iJqzbJ/FHuR2A9EZMeiddP01mUuKai/mrJawQcAAeL8JWTJsjhDLz2aRw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YybSohrZI6ortfcIf6YtG558MIpmrYgeuzE3KT6nPMQKDF0c4Qz
	2KxCIRM91LpmxPEJWIPeoZjrXJ+YMWVtQHH/swAp3qYSNeUZyjjCMzj2
X-Gm-Gg: ASbGncv3EMFKgmygTzHdYwjqB/kJZzWQklVt9VZmTiCOgmsnBOs9B0CI3ACTKv860Xi
	EJ9PQ/ArWpx0yN4inwnchcc+V1DwVYAMlhnZnvmwrAr+CWdmioJDxDlP5JFiXGNN+5jC5vWu65x
	0cxniyTzyi/TwWSQaE/LPqN6KY4wz9tjgp62+1kLKKZBTcOEOyKO7EpeXyeDHDUc+OuXxY25BoU
	JmN9HGz3csAOCEA7yhx3xItiD5YPe+k63/x8DMvTX2q9qqcWTsENwUaX80c1GtcEj+eddaexud7
	G8DZDV6MXxxEJQbmnMlWnl4A6EZiufahfUIw5gviULC9c9qykxD31AeJ4GRbJiSjCvqoxfeHxHW
	JlSF+rxAmFkXfleO/+xrRjogM5Jo=
X-Google-Smtp-Source: AGHT+IGIF21Xhnp4hpfIy7oA9V9TFGFTlwmwiLgfHOfK/D3mn2OP04oE6hrYlLRBvg7agjvzZJaJ8Q==
X-Received: by 2002:a17:906:1755:b0:b2b:c145:ab8a with SMTP id a640c23a62f3a-b2bc145b425mr204508766b.3.1758559473592;
        Mon, 22 Sep 2025 09:44:33 -0700 (PDT)
Received: from bhk ([165.50.125.136])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2d4309ab9asm216084566b.74.2025.09.22.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:44:33 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	mingo@kernel.org,
	tglx@linutronix.de,
	jfalempe@redhat.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] drm/gud: Use kmalloc_array() instead of kmalloc()
Date: Mon, 22 Sep 2025 18:43:59 +0100
Message-ID: <20250922174416.226203-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
calculation inside kmalloc is dynamic "width * height" and added
u_char as the size of each element.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..eeea0cb4c7aa 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	height = drm_rect_height(rect);
 	len = drm_format_info_min_pitch(format, 0, width) * height;
 
-	buf = kmalloc(width * height, GFP_KERNEL);
+	buf = kmalloc_array(width * height, sizeof(u_char), GFP_KERNEL);
 	if (!buf)
 		return 0;
 
-- 
2.51.0

