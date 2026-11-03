Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738849;
	b=iabxtuH2R8Xu4f2qk4JTqYd0AeqmEJxgGPBPnE2EKi/vOSYgTukkkqa9sJtZZvSmLAOM
	 DAlVTkp63iN9faA74zPz2+1DHR91yNQGDLTmliRf4YKBPQkW6Wl8zU7Z5pAlapp0ErjBz
	 gfz6vi8uFUQY3dwwNLcT2DGuPJszzwvDxL1tdRru3JoKIwva/ovMOCPxgAXnJiQmeLw9N
	 +PEmJz72J150St+tyZL5r7Hy4d3N13G2PIC0MMpoDKdhdvLn31M9AOqWeg5vraAFtBtRT
	 HvtShWmoGJhRMkYQUCtuKJdAE34q+9hzfs9cIlxBnq2xo9zqSD3/U/MzxetSyJClIrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
	b=GqCRbw6umCmCVNK/SkwsdPxFGHboO+wYypfu22iRufO+Ra/qSVlE5JMHJxHb8Cdywmtc
	 clrgN2MeMtwV7US21xoPGUsgh3Zjtv0eaoyRcu14AorOraK+kt8t1q5w3s4qn1NpIMZUF
	 QCPi8i0FjZEpl5quExr3iJyyqpiXaQ12cn1OSI4US0brOfmaBWJP8GsLhu4vsJUXfxUa0
	 qFhMFY21BQq5kTVl/ICUs1PXJAX2YgR+SDIUF4iW4k2KTx3XeGboeize7+mBGgeSoVscx
	 Ai0tF0cO4gHuaSTxLAsAGBgbLbL2radFAIe0oipA1qsBYoyTAUtm+NaKfrEV1ODkJuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2uVcv9x;
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9F5606A328
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  3 Nov 2026 20:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA9F5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t2uVcv9x
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5e948e56af3so1515877e0c.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 03 Nov 2026 12:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738848; x=1794343648; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
        b=t2uVcv9xXFPzGstkiBRcS2MC7cQoX44TRMHuZzWyjA+Q5nqdwZgjv2kGK70UpkVIxu
         MQ83f+ss3/8S9C0iGlsatXucprERSlLfEea2Of/zJ5D8puP4voWLeUK8VVGy0fG7GRqP
         Q+EIklzGrm83z2UpaBSn0XFtuop6mvckR5qVv5DFjU9lLGB6vKdpBeE/251Ecf6SFrgF
         4EeQzKVK1ASW/1fr/cTxFxmvA9Ded2aI95TOVEc5AZGu65Z46InoMm0TjEXBxB+1uIUk
         XfixWFcRcakK4FsonVF2iXUK0fr1Jj8cZfs7m6QpG5vT9ivpu49PfWcimlzsgCNxUrpG
         jGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738848; x=1794343648;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g/w0MVtXQhj8idCIpqV/0m1Lb366EccRtPJCicxmKT8=;
        b=aRMXutqvYiH6svBkOhO+r2E+Oepun/TNjrkv4qMpbGeSykWakgxSQyyvX5mzRXTXb9
         vIkqeiYLVAhY/oF7eQ2sOYLGKWKL5YPxybJOOvgTeyFC1q6d4rsBsZvlZh96UqD625N6
         nEpiM+g6DY70/tEsnnmWmt9Xz0v0qX0QbCW/C4lZMaEcfHP0A9766yqvU6aTlNKXvJq9
         prDbldl6Kb9w9l0PtyutRC2qm6dOzeUyLFSyQyFeu7Qr8P7Q6z3SVRG3cEKFI2rK7IXd
         fKqG6kLPMZ8dbsFD9+n2iHEkW+EBAPnLq+1xddoePUDAIWUrDMwHfJxB4JRSwQ5KQ4Ho
         +wDw==
X-Forwarded-Encrypted: i=1; AKwUvByiZDmbzBR461fRfxbTddiJynDYfB6FpChydytWSJLqvDzBz50XCylvONLQcZPruM/vTdlUbJ/6Gga5133STPEoNxQ9VQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/8vOVj+b7AWOwjsncz0IO90xMqo9YZIGlO8fAiG/IJxV79Rw77
	RSuOGvXBToDSR32BKbV8wqn0BPOUWJfX9Xd//DtdKdVIadO0zGaVQC4zr/tP
X-Gm-Gg: AYBFou0cYj+oLcZpSBdMlqLhDa4nVqKQrB5G6VmO6BXvIBNWPqvMIaFGzb3tLdXwBe9
	J/lxAQ9nHkvA5vBTXpSqHUKKuTWb7hzoMPa/W+m7wSQ3/8VjZgc6mmlv6V5Q/FdGrCzvIXKQCAN
	attYO3N161bXSlt98ljZCwoFQbT5FLEH8WXyVbhRJT2yQ19IAEFMjeWpIgjesRtzk1X5Dcp3zKq
	4tjnEtVX3Jeq599opzJzJrJFCRiFib1PuXdTNE2xQlIgLDsfAzHpYen7a+wgjeujbruyQEeAOoA
	ZUPTChZrRhiNGUVeiGVt2pMkxsIvGalNOMgRRMLPXh1xficbDJ4YZ9xVmWrsvyEBfGrxyCn0I0i
	/GBYHPeMY/9E7m9f4QEm0ac1oNYbWVv2uIRwek12u5h8lXknCVmLbw90Jku5X9LNGvA/vgh9QpP
	D4Zimy+RVqdx05omNgPfW0V+vy4ob8gir5HobO4EUtFIQXQM0ws5rvRAFkbqeZocyG3YNUWLSqC
	B9EJV9Tq/wok4kZtv9l34keVlXtRK2Qx3/0FOO0qfmsVw2c3SN6saSxfyv6K+dIs7uu+SQP4fUL
	DsmSparPOmDlkvwkmrGSeHqTffSUL8k2nMQx43ztYUOBRSOLb07eapMHcxj3KaMNss1imEEog+d
	YCZkg
X-Received: by 2002:a05:6122:3c54:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec68971961mr6087782e0c.15.1793738847860;
        Tue, 03 Nov 2026 12:47:27 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:27 -0800 (PST)
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
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Tue,  3 Nov 2026 17:46:53 -0300
Message-ID: <1deac1052da01f892b385f0061c24bfefd8d0594.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793735996.git.nico.antinori.7@gmail.com>
References: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
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
index 93abbb315065..ada64be352b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8285,6 +8285,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/tiny/ch1115-i2c.c
+
 DRM DRIVER FOR EBBG FT8719 PANEL
 M:	Joel Selvaraj <jo@jsfamily.in>
 S:	Maintained
--
2.47.3

