Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696641;
	b=aO4UltOxIJKStFaVQqCfvOOROA5bP2tOe6obGwiboLeDwRMo+TXm48Xw9A3FnGz/YJzc
	 UaNgYlZt2H9CAS06dSaEMECic0DkmSKZxS1o6tciMNAwf5ONcKfV0ce2e+JGgSEITXhip
	 EggbuF/KW/xSWK0TTg9uZm1ZDEuH/YJnwVQHiaXaJeeL5a5Ff0v/w9ajAl/f9WKRQPeuN
	 ze5hL+KKe7Q2eSi8RQUGZxK75YxfkFT5K0trGzK5LmF1uSJrrRwxnHef2k8VTSSOSrvEP
	 +O2Qnjakx84L0NgHIXjp4j/wSpGeZvjLYHR0bNpy5n05CD0Md4gLt58ZV3RZe+D4vpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+fzTSQ4IC4vfCdf4lnBWrMCmW+A1sJUKi7Yho2wo30c=;
	b=iC67BJCWGY37UyTzMgdt8K8c2tnsl0sA1t9CCdlyRU3evXDvSXhluBejAuD1oHlVsOT4
	 nW+x8X85QTeIQpUULs+HR7lS0QnnxQzp9PyYK6J0Oxmv7NL5kwrXYssmwaKn8VdSzvMLM
	 YjLEackLQ6R2FPbkFXLd/lHy5Dy/KC7Ty/K1XpqK9U6rCGuHjT9rqMd9TREHKLjo7++gF
	 CPmtXqjkMaFqcmYwfT1JUi5oP3Bx/B4mfVsBiwKe9rBveb9UkDJRvBzZ7aqJtOoKcJv9g
	 kJn2aI47K0Fdt2L5tJl5CAISkF+V6ttoEvNbyQhH1wLa6XWAE1fckEmgZyAVChIah8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idl7evIw;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A54606A31C
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Nov 2026 12:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46A54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=idl7evIw
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a14so69267405e9.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 26 Nov 2026 04:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795696640; x=1796301440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+fzTSQ4IC4vfCdf4lnBWrMCmW+A1sJUKi7Yho2wo30c=;
        b=idl7evIwkaWPPxclTboptc6nxCjlcZNnRqmsVlgBbk5G3mYCmolWTPEl9LegECZtEP
         p+X9gZIW4hXw+fAVhsaliS7SddOfHVCQqvdtID5MQvY58YoaoOtrjp4ldwBZ+BzCKtMi
         TqiFiqjnNsXNnzICgQ3CWjJ/kvaxwsXJ8prSLEn7Hnb0rqjrvdtXReIfuQkmabIwzs6l
         MyDCIpCYhqu+GYARhzad9sDaZraIcskyg+Fakd4W9TDf8+m6QJNnGMr5+HuSRJjc374b
         eRjW5XqehrN+5JLDs8xuF3ZGr+3ccLA6E1FMZIlXFWCcMQuxUnvxwUSfkOekIcjS54+q
         hNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795696640; x=1796301440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fzTSQ4IC4vfCdf4lnBWrMCmW+A1sJUKi7Yho2wo30c=;
        b=ATar/S1OR6rLZHifeXCpxPPwroeoK3SrbOzUr/sq9tCqfFSOH/9oR+z/k5mvx/4vN7
         yyE34s6NqaN5c3vJVu+iJb5t+CWSmQKYgRf3sW62Q2ckm6e2inKFm2Va0woBxUStxjdT
         4p0bjZbuF1JkPBK5nyLao+tob7tjRUWeQLCi5JcKrISn61bYHCur2pdvsotXdCSdDB34
         Ic0zbEpfDdE57I36gglXctsjHNtE2Omx1lixgoVttPf5CGw0IghJ+Vtz+IltPXDjdmdi
         v1zH3sgudl4HvpjaDeIIGhBeAa8zhBOnkmKjXx3aGlrxusFQYKGdZGt8VjC3Nd77tM7I
         atzQ==
X-Gm-Message-State: APuU4Z/pYVdB2GOfqKtq9CFgJYynJ7Kj1cNXBns5JguNYFnbHPRVw0FJ
	U2cbxbX7FEJOmJe4j+nL/oZkJGjpN9DbSG9zabTrT4tb4lXBKqUEr/0=
X-Gm-Gg: AZFdTZcanmXClXEoOXQREt6pZkBHEKlTiAmDHgLMSBHcMhQ3xf/72GzmENAnexgGMKe
	jc09gM/zvMG21AB4gizGCd4YPF1xUZ6yi4ppChgklcll12Bp00ImZmxqlKIKgwt4zxvABsycusv
	hoE/zxd3LrXz2b2InPIR5rk/5Vn7REKDYvzKfngGBZLLL54FHq0AAGHoIp8m6Km1o3BT4vlSy8r
	pQW6EG1ZCwDEwB8pa1X6BLmxh+tmj4qNsUgW/nGFp4CVmy0aGQd5yFMJIw0RSXt+k8TbQjIvhV0
	f4n5GssLoTr92E1QLOfwXs8ZHcth1fmHIleR5DoVhIDFjTn2ULJe7F+IR2Fh45bVMxHA/2YYOsp
	HSvvMYgTnb0SvafJcEoTipTrs3xtwWU6bkQPOdrYiMHGyIR5yTYRCRRelxQGu9BtexcjJ6r8PpC
	8UzQyKv4rp2oaN1IkdmYNVQemI5kUhhhyyg6ImGGIz+fzrBdO3/BlH7dJwBG/kWSUrrDU+ErfAN
	q87NV3FbqTlZKiI5ClTca/kNpfIWqC280z8rOQTFPWdioxwtWTux8h6pAem3NuIr/gZPJWzOtqn
	YvKQGEh+MQ83zk1OO9GiiXZ490VbAtPDDZR46dKszzEewoMHtz9dvifjl4LsOZ802kDApDvDQg9
	DHjnqTwoiLh29qi7mGlUPqaGzYshVDBdaidul8+u0La4bvfOX7yaLgkYLHRC4F9wGf31l5lDjV5
	XgsA8lxWXLh+pMc339WUNVkeZVguz6uaP+PSRIJZyAhBaVUN+FTWc8v9uFI5br1z8GiMuxAyKsa
	/ae
X-Received: by 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr412564745e9.20.1795696639507;
        Thu, 26 Nov 2026 04:37:19 -0800 (PST)
Received: from archtop.localdomain (92-242-248-48.broadband.mtnet.hr. [92.242.248.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm586455245e9.10.2026.11.26.04.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:37:19 -0800 (PST)
From: Jakov Novak <jakovnovak30@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	=?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] drm/connector: fix kernel-doc string in drm_hdmi_vrr_cap
Date: Thu, 26 Nov 2026 13:35:44 +0100
Message-ID: <20261126123544.16968-1-jakovnovak30@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building the documentation currently with make htmldocs gives the
following errors:

WARNING: ./include/drm/drm_connector.h:293 struct member 'cnmvrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 struct member 'cinema_vrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcinema_vrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cinema_vrr', 'cnmvrr')
WARNING: ./include/drm/drm_connector.h:293 struct member 'cnmvrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 struct member 'cinema_vrr' not described in 'drm_hdmi_vrr_cap'
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcnmvrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cnmvrr', 'cinema_vrr')
WARNING: ./include/drm/drm_connector.h:293 Excess struct member 'mcinema_vrr' description in 'drm_hdmi_vrr_cap' (did you mean one of: 'cinema_vrr', 'cnmvrr')

This is because the two member variables names have changed to cinema_vrr
and cnmvrr. Change the kernel-doc strings to the new names.

Fixes: 014da1db5e64 ("drm/edid: parse HDMI 2.1 gaming (ALLM/VRR) capabilities from HF-VSDB")
Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 include/drm/drm_connector.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 2ee7c59329aa..bcdb402a7ede 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -265,10 +265,10 @@ struct drm_hdmi_vrr_cap {
 	/** @fva: flag for Fast VActive (Quick Frame Transport) support */
 	bool fva;
 
-	/** @mcnmvrr: flag for Negative M VRR support */
+	/** @cnmvrr: flag for Negative M VRR support */
 	bool cnmvrr;
 
-	/** @mcinema_vrr: flag for Cinema VRR support */
+	/** @cinema_vrr: flag for Cinema VRR support */
 	bool cinema_vrr;
 
 	/** @mdelta: flag for limited frame-to-frame compensation support */
-- 
2.56.1

