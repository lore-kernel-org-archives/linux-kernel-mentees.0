Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D4A53A7
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 02:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755657038; cv=none; b=fwMU4KWjR/Iiq7fph7MZn8lGIhKTWYYbb/pYszZKtR/a4EoKKc9pJmCyLwYxhMzxnwrzBqCStd3pxijFP7WGglI8du6RdtdA1Q8RkY7oKEN0ilE1ntIK/7lCja7WJCs5ylTC0zoHHVC2CfyBQO1ZRvjeOpS8OV6vgCcNvftMMZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755657038; c=relaxed/simple;
	bh=dnPR+j+/0vH+fSk8M+SdilglPAKMc5DUN83yjz++SlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rbxr/e049R5i7ynydSYbqM2gHA3RCpiFjzzKDr1NgMo2Pire0967WxVhAKiVE2mbJm9D+0KRkUTub6kMVmcoLvZNYtrelFJg9sQ9onLxsE/BlGB4qtm6upQkD0z4DoPN/PjgsjYUnIZ7D4QI9d+m9F8AV4MgInyXR6nPpaBrGGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGL7fD+n; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGL7fD+n"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4756244423so965896a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 19 Aug 2025 19:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755657037; x=1756261837; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBLspprFztDG6+Qc7Fdl3/57LW5xmP9NJiJ32and0f0=;
        b=hGL7fD+n1arBP0KsjLQUoDKsKQDr8etlJPWzkCG8KGgWihpVhVAiZl6oHFQ3hCc25u
         YR0SQJjVqNEpLJ5MgegIEjFhzR2gA9DUQwCkTXdf/WcSXP8AzXr1olQQmEV094ByMlfG
         aU1xR/UY3i/JdHq6POTEhAo1A5mijlGMxecmMeYEu0tWnNd7gmDeKnWlbUB43VzRmNBy
         QyY9vRI2dHTL7LRFkaVHHsJ++tQClDjvKBAX78amDhKTRbgrRcCMMFJic9pFRmZm6cHv
         K6acqsdycJ2NCyMIkKSWukZsgaTfJFZiWgNmSS3Y/2cdCpWWG67D1yAIebtgdwYWMwfX
         NKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755657037; x=1756261837;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WBLspprFztDG6+Qc7Fdl3/57LW5xmP9NJiJ32and0f0=;
        b=ZIRnka1dNYOGoLQJaDn/FDM/mmFCHqG4djoenk7STSXHmU0zPx75bHuWLxeYp4AIqQ
         u7DUNJpdHVPd3FJ8WTZw/9xe0g5nzGdXlyJ/oNIjwjhjJUWtd96le3uWDR+OR8ysVF5F
         tu3URKCeCXtrF3VpOzRMvXPm/mAuPHZ1ondWh+FdIMLhAnScbyo3r3CLEBAGNK+PPVCJ
         JU4szY8qprIdM2rdVNqAO/hyBLESzEesYMBnQG+bBRUvRt5yqL5n/4h0XFPhYYJqpYOy
         iIwAzhY1R0X/yR+25PS34iQMiqDFPFK5j4He2vPGJ5BrCY57DmlnkP9QUZGa8eDuKXVA
         dJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCWWHPG1rx8mRTgXs412C5P6bTY+1bGNuc88CP01KVtJfk0OduGFol41hZfFPZ5wALJBHZK9861JJNBA58o98NcXvARGYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyguqRR71MjTF0iPYlnStgF6CxlAOzJmKfFWvN+T59nVeNQp8DG
	5invv3P+UwSE/vhDmysyx0dNRYmwY3zFJlWrf3669s59HwnP1Gz30bOA
X-Gm-Gg: ASbGncsFZSKrb0IkukcnhUUIugn+iAhyuVfd0EGEOzIKJcIsA6aA9gQORvhePrJ1P6a
	/xEbKYk2kZQU1nC+borf0OIK7Lp9lFcKAc7FBupHZSmoMLwQjnCKSwsoU10G9piN6OpXmMjnT1q
	NfgSS82YIeOB5tdNN+WEFFBcILi5xb/xVwz7yg1cQvEi9SWr8XofRypaxsgz+Aq0FSv1kwlMyjX
	+6xGH2SzcuTWHN5xU52XeZW9sNykSjkqooZbZzF0VFGaTjQQKS0V4caPqrMY32ZdYhBlkCqwtuH
	VkrdcUnnyxcoPQ9BGu/vjauV7UoCyje9+LZ6dJJZN8B/uc9k31+jpY0aidWNaMr0XbQm2hJL3vO
	s9oivgf3zkwSjeAipv36D
X-Google-Smtp-Source: AGHT+IGLN6/IE/ONxayhxMru/n5hlswUbEMiZ+nUf3HnpdaEUno4s7c46v0prUlmyY7rIbErGmDIYQ==
X-Received: by 2002:a17:902:e74a:b0:240:96a:b812 with SMTP id d9443c01a7336-245ef1728ddmr16515215ad.24.1755657036687;
        Tue, 19 Aug 2025 19:30:36 -0700 (PDT)
Received: from localhost ([159.117.70.219])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-245ed514ec6sm10616305ad.136.2025.08.19.19.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 19:30:36 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Wed, 20 Aug 2025 10:30:31 +0800
Subject: [PATCH] drm/display: remove dead code in
 drm_edp_backlight_probe_state
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-drm-dp-helper-logically-dead-code-2-v1-1-34421f4a7442@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEYzpWgC/x3NQQrCMBBG4auUWTsQo4HoVcRFzPy2A7EJExCl9
 O4Gl9/mvY06TNHpOm1keGvXug4cDxPlJa0zWGWYvPPBRe9Y7MXSeEFpMC511pxK+bIgCecqYM9
 nH3MMJ8HjEmiUmuGpn//ldt/3H6bCSpR1AAAA
X-Change-ID: 20250820-drm-dp-helper-logically-dead-code-2-428c853deb95
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755657032; l=1205;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=dnPR+j+/0vH+fSk8M+SdilglPAKMc5DUN83yjz++SlY=;
 b=sSnGAQmYvuBlMPlBySv7ODjuBt6ADkJzz4dI6N5kWwoGXBf2MRiq6DHDh8HSSqloPQoJsporV
 KXBaR0fekm1BPmnuY9u9HoZE25em87dxI1rfV2XgoiXI65mtKmJhra/
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

In the error path where ret < 0, the ternary operator "ret < 0 ? ret :
-EIO" will always evaluate to ret since ret is guaranteed to be
negative. Simplify by directly returning ret.

Found by Coverity(CID 1649044).

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167d13636e194c4aab44ee8979aa11..654d466183d5ccdefcb4029dc4efc199f3b7b6ff 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4227,7 +4227,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);

---
base-commit: b19a97d57c15643494ac8bfaaa35e3ee472d41da
change-id: 20250820-drm-dp-helper-logically-dead-code-2-428c853deb95

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

