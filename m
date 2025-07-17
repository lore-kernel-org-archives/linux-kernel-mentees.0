Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA3219A67
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752735492; cv=none; b=Ez7t550nihVFZfRGNRfRa6PqcNt/JLmTSnAL1TB/BIAp3X5Tkfo38H28jWVni2UjY5Q5aHpHfovTH5lPTlOomM+/U0SbWy6O6mVutwWk7aGZXMFnrgdDp2ihpl2IdIpAhZC+lnQ+KZwySs4yO9SsdbB2CAlUqcw3qW/fE5mBYG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752735492; c=relaxed/simple;
	bh=Q+ZY9xjBuqQxqenQY7jqiguWkAzHexyUMMWNBcg78x8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNbQjixwKdvi30c+BWbW64DFK6qEUKbjLIREalx+nYUEDecyS/InP0nanZWiSAPLRwwGXpLlnUioiNhAOv8AhqBdK8qXdnD0y4rQ6+39I+GYcc+fo9OCE9ZCoVxzrddLVf4yCAUyo/nmo4+PDkjSu6uGr6OQy0ZPvv6fjMi1+5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=Y+iN2R0U; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="Y+iN2R0U"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74b54cead6cso465643b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 16 Jul 2025 23:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752735491; x=1753340291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRMZHukFq/Fz1BxRKYe9su1Usquvr1NXauedg+WKKBk=;
        b=Y+iN2R0Uhq5sXEzl/tiJmLFbg1YEh6c5DU/jiS+PmiCfN0L2Y6Z8M1pOXFsgJyrV0e
         khWb4IEwHtZD85YY+yGFDtz5onEmjS7y8GMOasHpCh6bQRSXVdpb3iQLGZqOPAepYJgz
         3ipJJm7Qto6sa/h6w73PfqUGRobwdsIgYQMe8ZbAsbskQahOddKlw4VceKGRo1KKEtNu
         gWNZfRku5oZ7b6ph52LTz5J6WlCOKyacE2FNXwOUabBDyITHFCiV67eHx0BOuCZiaqPr
         Uek9HUFu7D05B0Nx0vSDi4MBWQv0q9hp0sODMmMGBFzErqy48KrrTyeOTUYliNlg3HmD
         84fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752735491; x=1753340291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRMZHukFq/Fz1BxRKYe9su1Usquvr1NXauedg+WKKBk=;
        b=d8jwlq/W4CyicmPTwiDu0tBY52Hg4lzzXeofp7s3XasArvJzyg0GaHrPYJgwe/gaJ7
         OzHthibgBDtO1hCMGdEnmLOfnP/KkzyxT/MLWnpcdtIQM6dvYJMILT4SjeciXcKPI77r
         sC2jLX4d8c4RxdMbqcTg+1OdKGH56+K/9OAqRFlk2H/gimECp5O7YqVTdXzVy8Iro2Z9
         RwEYxZ+k7HOie10eoFrACA18vUCG0//bOlZEofkIQnvV8/Kgx2z1bDhKhKWhb6V6Pn5P
         BLbq7kgaGccNKhs8Mua1tleGlLSVMYo6j2Bv8A1gVGuFlo4lKgfnzOa3dn+yel9wKTF8
         ac6A==
X-Forwarded-Encrypted: i=1; AJvYcCWcOVVKeNBQ9oUyn5TYFN3mFhWjsmrrIR6GLWLFDlmxleYxcUFFo+jvrF6O30muEldTkM0brzvrowQloD/m+Lyl7z0Bqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSXfnVUkeGZ00lyCSutfqkU8UlrcS+wUSNbShn5nsgensE1IiC
	xq+jDdnYJoOjPoyGYklXHIwX026xAjGtlfjhCclYqRpUkAA1GPG7wv0XWB/U2kKpurk=
X-Gm-Gg: ASbGncvym+VYSYfbuwpLWgDMwS1MYS06e7RYdkc4Y8IY7jzAgPK2BQ7PCv12I4Z1I/g
	P2G4bQDrY27GCctI2atczU2pUZjTlhw1CF7+JmQ6p6gehRIpzM5YOECBlqtouGkyzt4oRK96b7A
	tGFu5r1wOOsVfyeKodFpS7dJZYA8C4kgQPKNCSE+tUhTA9R9f6ferfeTgOl7ArLE5GEoJr9FqHh
	tkldF4S0GMFhO/Zm6uQAuL3/9QIhyilHveGD2AGmAZ34bqInhmxsot+jkMzrBPUvkX/AU6Ip2uo
	XJjXVtD1GnMMHmkrbmmS8gYToLJJT1OnogqOYe/KJE5wC2016TIJsGKifn3uV98zyNuyQMVzz/p
	K2/ccTutKu8nJAUNIvDE+ln2BuGP7igX87CraZz/p8o5IcXc9X1M7xQ==
X-Google-Smtp-Source: AGHT+IEliMbgtuTCQXNVVOMflDMHgY0pux0knysFK+gpotQ655Tfx39EtFZBf6v78DQtGzuRTvmzQw==
X-Received: by 2002:a05:6a00:170d:b0:748:2eb7:8cc7 with SMTP id d2e1a72fcca58-75724677639mr7982430b3a.21.1752735490724;
        Wed, 16 Jul 2025 23:58:10 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4bc51sm15157293b3a.116.2025.07.16.23.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 23:58:10 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: dianders@chromium.org,
	tejasvipin76@gmail.com,
	diogo.ivo@tecnico.ulisboa.pt,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 1/4] drm: Create mipi_dsi_dual macro
Date: Thu, 17 Jul 2025 00:57:53 -0600
Message-ID: <20250717065757.246122-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250717065757.246122-1-me@brighamcampbell.com>
References: <20250717065757.246122-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Create mipi_dsi_dual macro for panels which are driven by two parallel
serial interfaces. This allows for the reduction of code duplication in
drivers for these panels.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

In case it's not obvious, the indirection between mipi_dsi_dual and
_mipi_dsi_dual is meant to allow for the expansion of _func in the case
that _func is also a macro.

 include/drm/drm_mipi_dsi.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 369b0d8830c3..32da8861f9de 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -431,6 +431,30 @@ void mipi_dsi_dcs_set_tear_off_multi(struct mipi_dsi_multi_context *ctx);
 		mipi_dsi_dcs_write_buffer_multi(ctx, d, ARRAY_SIZE(d)); \
 	} while (0)
 
+/**
+ * mipi_dsi_dual - send the same MIPI DSI command to two interfaces
+ *
+ * This macro will send the specified MIPI DSI command twice, once per each of
+ * the two interfaces supplied. This is useful for reducing duplication of code
+ * in panel drivers which use two parallel serial interfaces.
+ *
+ * @_func: MIPI DSI function or macro to pass context and arguments into
+ * @_dsi1: First DSI interface to act as recipient of the MIPI DSI command
+ * @_dsi2: Second DSI interface to act as recipient of the MIPI DSI command
+ * @_ctx: Context for multiple DSI transactions
+ * @...: Arguments to pass to MIPI DSI function or macro
+ */
+#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) 		 \
+	_mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
+
+#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
+	do {					       \
+		(_ctx)->dsi = (_dsi1);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+		(_ctx)->dsi = (_dsi2);		       \
+		_func((_ctx), ##__VA_ARGS__);	       \
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.49.0

