Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC9F2BE622
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758301028; cv=none; b=CZA2aQGJccpHLZNxWPYnRG81CfVQ7NUs/2e08dSemGsyBbXpt2GvfKfZra/3E/kvvs4NNlqRVHZxGg524us/B074alKrrJFuecm1WV53nIe/UQrOaPzdXx/qQE/xJIrt9N2YfdmAF2wn5VujuyGca7bZiLFLmCQ1qUmUl/GcwaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758301028; c=relaxed/simple;
	bh=7XTOh57VEkTeSyA7TZkjr8pxdTNTa0H6p/lmmQoFBJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IdrVqJRvzdQcV9HTgELMlexwTkLB1/vuF1DwaGphVnFvidkB83NBYd4aRHSzSA5HO6gQWgOuKMyaTsyPWGNtjAyzf3url4K6x6B/QoxWgseyJ01Q3nqQp0MrL9PrLgXba8WBTloEELSz3vxPBuRbUG+puB80Oot0FChbuEYiqy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxwGN1bX; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxwGN1bX"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C37C040D2D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 16:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCDiWwa1Bo-X for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Sep 2025 16:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=vivekyadav1207731111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 059C1408F9
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 059C1408F9
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bxwGN1bX
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 059C1408F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 16:57:05 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24458272c00so25890275ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 19 Sep 2025 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758301025; x=1758905825; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TftbRKt7nat2IQL5KZaz5H5oFD7jsz+Ow/tM+X9VXHU=;
        b=bxwGN1bXbtk4GR3mW39ZECpaSfAB5sbfcmNW3771hwVRMXVauRRivZmjIQS4CSZKTa
         CCs1+vbtInkdvVMoDke3mLAiNj6SIgsvo3MjqzhPJLiona6c3cOphhD2qYQauWTOx64A
         aUCQR9WjQoQVxgsM5qsfyTgmazYDSlYiRitT9wFpOVnz/Xx6aZs/dL+qnKIIflOorjcy
         lJmGq0hfMvszisLLkRNILoyvWI/VMtETuFlOsHGaEwe2vDNUMglfAM4SopJ4fzyueIKk
         Tc6X4UHwokyEvX+jtbjg1zufVj1cZ30EhqRIE4l+YdT+xeFlp8vc5QMpdt9bf1wgJTDs
         bmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758301025; x=1758905825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TftbRKt7nat2IQL5KZaz5H5oFD7jsz+Ow/tM+X9VXHU=;
        b=tf68xO13qZTd8dWx2qlBr4VrOerZ6bZj4AtuHK36N2whmBCmkcMTy06p8T79CFiRvD
         pbO224ZPF8SUazc1U/HvuIVKTgjM1tC733uKya888dVYS7vkF8xXOvdGDLp0M9Yyf+Qu
         Xc39tqMTeC0ZSlUS2MnTABjy4v5lV2o/AX9G4ljSNRkJr9QR8U4r0uDAQ42ZVdJ+2MpB
         /Z1daxYquzQ7TOIcYaHqZ/uLHIRm49vH5uR4ntNXLPmrdxdHX0Y135ggCR5yibWSnKxt
         LQL9gL+vGKnrVPcA5mzgYVRkh4STVjBrU8D/Jw3nPUx7+lPq0BQBlXHFCKL9RI6o4P/y
         595w==
X-Forwarded-Encrypted: i=1; AJvYcCUkPdaE7Ced4siGZ+U315jSj/E4KbcMPuK+MnLfZnqbQ/jzb4K7TpmYqAC5salKHftPyAkQI/465tJa1e7l+A2B3XgrEQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxHnecBP22Ycmy7JsTuifUZK68e1WvCIzLVM9x1hfdpgYgfVoay
	NGZ4n3efzRCJtiFRaZgtbMGm1thyvwv+zGIXRMxpBpfzTVJpYPd0JDou
X-Gm-Gg: ASbGncvthRcohxQ0VBwSF2fJ3OrraVxfZ1hiQsprmO46InDuNRvaOhSJWGOHoxo9xNj
	pPGCHSD+HVha0ZiKDO1SV2wUNY+qxZ5iXnWOeFcWln6BmXXV08GEXlWYSMsQQ4Kqt3PaI9uDmnR
	vwU0pKorfxJHX7Dlp0go31/0FS6hlB1WcTxDweA0oeubAItpPNARPGWMnT20BXnVjntkeml3J57
	w/xAI+yJoXSsdXY/w/ToC4RhOvTQmliUaCUJwNcHzTAmajW3UKLMqzX4xXJr0ZhGJwuRXrZo+m+
	Fe7/wWFN+vJEieX8bOwdSsYFy4NTc/r/CORtSWoKEzK0KAyPaCDGMILyqjkpKewfTrMOuKROZgW
	g31bZm/utfG/C+YArltmTo/p39PzWK2rqM259xA==
X-Google-Smtp-Source: AGHT+IEHnI+5JqY5oh2wVE/p0uaWi8W8+LTXmEU/n3gNihFpXyfo6AaBIua2NXrGXkPTkpR3pNPw4g==
X-Received: by 2002:a17:903:b48:b0:24b:bbf2:4791 with SMTP id d9443c01a7336-269ba511bd3mr57822435ad.39.1758301025146;
        Fri, 19 Sep 2025 09:57:05 -0700 (PDT)
Received: from mentee25.. ([2405:201:d003:7033:afa3:5713:fe33:4b7a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698033ff66sm58550555ad.133.2025.09.19.09.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 09:57:04 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: joe@perches.com,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Cc: Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH v2] cpuidle: sysfs: Use sysfs_emit/sysfs_emit_at instead of sprintf/scnprintf
Date: Fri, 19 Sep 2025 22:26:57 +0530
Message-ID: <20250919165657.233349-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAJZ5v0gTtTZt7oE0vME0qRo8nZ=KX3DwF46PhyUVe7e85uZaNA@mail.gmail.com>
References: <CAJZ5v0gTtTZt7oE0vME0qRo8nZ=KX3DwF46PhyUVe7e85uZaNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

The ->show() callbacks in sysfs should use sysfs_emit() or
sysfs_emit_at() when formatting values for user space. These helpers
are the recommended way to ensure correct buffer handling and
consistency across the kernel.

See Documentation/filesystems/sysfs.rst for details.

No functional change intended.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 drivers/cpuidle/sysfs.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/cpuidle/sysfs.c b/drivers/cpuidle/sysfs.c
index d6f5da61cb7d..61de64817604 100644
--- a/drivers/cpuidle/sysfs.c
+++ b/drivers/cpuidle/sysfs.c
@@ -27,14 +27,14 @@ static ssize_t show_available_governors(struct device *dev,
 
 	mutex_lock(&cpuidle_lock);
 	list_for_each_entry(tmp, &cpuidle_governors, governor_list) {
-		if (i >= (ssize_t) (PAGE_SIZE - (CPUIDLE_NAME_LEN + 2)))
+		if (i >= (ssize_t)(PAGE_SIZE - (CPUIDLE_NAME_LEN + 2)))
 			goto out;
 
-		i += scnprintf(&buf[i], CPUIDLE_NAME_LEN + 1, "%s ", tmp->name);
+		i += sysfs_emit_at(buf, i, "%.*s ", CPUIDLE_NAME_LEN, tmp->name);
 	}
 
 out:
-	i+= sprintf(&buf[i], "\n");
+	i += sysfs_emit_at(buf, i, "\n");
 	mutex_unlock(&cpuidle_lock);
 	return i;
 }
@@ -49,9 +49,9 @@ static ssize_t show_current_driver(struct device *dev,
 	spin_lock(&cpuidle_driver_lock);
 	drv = cpuidle_get_driver();
 	if (drv)
-		ret = sprintf(buf, "%s\n", drv->name);
+		ret = sysfs_emit(buf, "%s\n", drv->name);
 	else
-		ret = sprintf(buf, "none\n");
+		ret = sysfs_emit(buf, "none\n");
 	spin_unlock(&cpuidle_driver_lock);
 
 	return ret;
@@ -65,9 +65,9 @@ static ssize_t show_current_governor(struct device *dev,
 
 	mutex_lock(&cpuidle_lock);
 	if (cpuidle_curr_governor)
-		ret = sprintf(buf, "%s\n", cpuidle_curr_governor->name);
+		ret = sysfs_emit(buf, "%s\n", cpuidle_curr_governor->name);
 	else
-		ret = sprintf(buf, "none\n");
+		ret = sysfs_emit(buf, "none\n");
 	mutex_unlock(&cpuidle_lock);
 
 	return ret;
@@ -230,7 +230,7 @@ static struct cpuidle_state_attr attr_##_name = __ATTR(_name, 0644, show, store)
 static ssize_t show_state_##_name(struct cpuidle_state *state, \
 			 struct cpuidle_state_usage *state_usage, char *buf) \
 { \
-	return sprintf(buf, "%u\n", state->_name);\
+	return sysfs_emit(buf, "%u\n", state->_name);\
 }
 
 #define define_show_state_ull_function(_name) \
@@ -238,7 +238,7 @@ static ssize_t show_state_##_name(struct cpuidle_state *state, \
 				  struct cpuidle_state_usage *state_usage, \
 				  char *buf)				\
 { \
-	return sprintf(buf, "%llu\n", state_usage->_name);\
+	return sysfs_emit(buf, "%llu\n", state_usage->_name);\
 }
 
 #define define_show_state_str_function(_name) \
@@ -247,8 +247,8 @@ static ssize_t show_state_##_name(struct cpuidle_state *state, \
 				  char *buf)				\
 { \
 	if (state->_name[0] == '\0')\
-		return sprintf(buf, "<null>\n");\
-	return sprintf(buf, "%s\n", state->_name);\
+		return sysfs_emit(buf, "<null>\n");\
+	return sysfs_emit(buf, "%s\n", state->_name);\
 }
 
 #define define_show_state_time_function(_name) \
@@ -256,7 +256,7 @@ static ssize_t show_state_##_name(struct cpuidle_state *state, \
 				  struct cpuidle_state_usage *state_usage, \
 				  char *buf) \
 { \
-	return sprintf(buf, "%llu\n", ktime_to_us(state->_name##_ns)); \
+	return sysfs_emit(buf, "%llu\n", ktime_to_us(state->_name##_ns)); \
 }
 
 define_show_state_time_function(exit_latency)
@@ -273,14 +273,14 @@ static ssize_t show_state_time(struct cpuidle_state *state,
 			       struct cpuidle_state_usage *state_usage,
 			       char *buf)
 {
-	return sprintf(buf, "%llu\n", ktime_to_us(state_usage->time_ns));
+	return sysfs_emit(buf, "%llu\n", ktime_to_us(state_usage->time_ns));
 }
 
 static ssize_t show_state_disable(struct cpuidle_state *state,
 				  struct cpuidle_state_usage *state_usage,
 				  char *buf)
 {
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 		       state_usage->disable & CPUIDLE_STATE_DISABLED_BY_USER);
 }
 
@@ -310,7 +310,7 @@ static ssize_t show_state_default_status(struct cpuidle_state *state,
 					  struct cpuidle_state_usage *state_usage,
 					  char *buf)
 {
-	return sprintf(buf, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 		       state->flags & CPUIDLE_FLAG_OFF ? "disabled" : "enabled");
 }
 
@@ -358,7 +358,7 @@ static ssize_t show_state_s2idle_##_name(struct cpuidle_state *state, \
 					 struct cpuidle_state_usage *state_usage, \
 					 char *buf)				\
 { \
-	return sprintf(buf, "%llu\n", state_usage->s2idle_##_name);\
+	return sysfs_emit(buf, "%llu\n", state_usage->s2idle_##_name);\
 }
 
 define_show_state_s2idle_ull_function(usage);
@@ -550,7 +550,7 @@ static ssize_t show_driver_name(struct cpuidle_driver *drv, char *buf)
 	ssize_t ret;
 
 	spin_lock(&cpuidle_driver_lock);
-	ret = sprintf(buf, "%s\n", drv ? drv->name : "none");
+	ret = sysfs_emit(buf, "%s\n", drv ? drv->name : "none");
 	spin_unlock(&cpuidle_driver_lock);
 
 	return ret;
-- 
2.43.0

