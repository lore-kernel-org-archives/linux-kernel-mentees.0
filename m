Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFACF221DB7
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  2 Jul 2025 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751439558; cv=none; b=jgOVYcVF/lEF6E4aCPqgbS2Mc+YCDd6xT76CCX9YL0/w/hx1+GvJ3w9ZaYWtEhtYc7F1OddX1aoIIzQPP1KQlHED7h88ZHXFgNdBa/4XAsuutOyer6PN7qFno3KSWvxVtI1jogOzK1AwcnlUtS5Ysw1VU7pnr+g4H9ShC1tRDKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751439558; c=relaxed/simple;
	bh=GkzTvSyEniyC3ZEHAImbsnkJbzyzm9ojEZbTBEvqDrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiusVM0i3ncHy8j039Tv+qEZlUE1tbgZMrPD0h+S7b1IyVIvoB8KJ47dykb0raWDQeKR3m3uPEKpLBkpq8OjQnBTawDR/x9uRPcdzdD0xet8U/ci8YAB9lLCf29EoT7iTa9X++FxehU5sWZDiiVGXg2Lb+lq4wQesq28zgf7RbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q54wJTob; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q54wJTob"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2353a2bc210so38181695ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 01 Jul 2025 23:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751439556; x=1752044356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iy+tjuaM2hP8c5rI51dRyXck9sDVRImbqSPT2GjU9Yk=;
        b=Q54wJTobFzRt5YNQxjb7vYaELmbdQY5n/WOaG9s8ZwkLBmOcsdl7lYr724iHdoXyxn
         cFSf1xib3q10vDacvDW0DjT0ffJXM9Se6VUMgMwQK5nAB41uWrmEoCbucB9qGCc9Hk2D
         N+s6qbVh4YZc9SjWtUMK8RKZPWXv5qpddz7asIdIhyX4cg4+DtDL9+4Flx+NdaXpfR9z
         7dBD1Lx8naZEdTwJohN8o7VIyAYp3xVQ9LN1gdnWVaWdoEyqOvurFvJjp3blhMi63Lj3
         dHnu81lFQmh+BDvosr9jJZOE6fFOYDBOcc1900/I2WXYmq6ZCIeuCh3MZaHcbg6j3/6s
         wTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751439556; x=1752044356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iy+tjuaM2hP8c5rI51dRyXck9sDVRImbqSPT2GjU9Yk=;
        b=GIkVHCbDAynkA/Iil5/i2YPdPxM+nMX1HJAo8nHyVL48TZkytREP2KiaVt/XZlQdpZ
         IFuTD1C7H2EEub42syzaE9NHsWQ7FnAPqeyy6yhpbnm4VCTEPU65W9bhCoyQRwMDuRGH
         kHq6JoHy/xWd18U3GG4LzrceMx4SctMnTmHj7UvYMCfcSV+iqeQ7F6TtlR1Xs96Yq1A4
         zIZG8JrXz0h1lHm3fjRrQXU4TsgXi8nca/ftNAUEQoPLHpNZqCyy++Nvf+lcX/hcOxdI
         DZ8dM5KH/HbwYjIZSotIbBOMEI3a46sv5CE/pXEFeonpSEmGWrXkMZdsqr19rkEyeHmo
         LGIA==
X-Forwarded-Encrypted: i=1; AJvYcCXEc5oyPsMswK5RjLChHEMmBMCX9cuaNcWoTqGbFVkTZ388gRgmc/NpGLr1XjBNFJp8gsIC/IqhgmfH63nhXOY/jNYeqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmfM9lPUPWhv57PCBSIVnhc3SYYDhJs7GsoY3jEjRh9mbZwFS7
	1qzF+rOdZ1x921OPruY74h2/lh3Wwgyqvyse5XIIDNxKIJaTvAUkVyI+MP3UzXnS
X-Gm-Gg: ASbGncvPJfpf8MIacW0nfRM0cqjKEc6FN5NUm5zCNTtPBTbgGNJ/ykOJ9KfhOiZngFE
	e9IkBcW9LkFLouW4CufuoczadtzNB4gvs8CDUrSc/d3TwDmGMjbYV3JbUKK0XJk0t3un+mHNMLa
	mNqP+amDlFrwPr2njqYo6I2/9fifutbpiMWkJe2zSvaGa7X8jXOZ8r88boSdr918fkGyNfdbKa2
	XlsOme2iiW/4vRHXYQogfsPcdZXtyNGiaj+AxQMEytwYrFI/Qi+P8X+nnv6SR8JWz1QfPEQIyMX
	6wSWJkHMGkgY6LEXY61DOWDtEqi/r0V2AoTtT3xCrAiVE3VPWWqTPJ8ZWWHTras=
X-Google-Smtp-Source: AGHT+IGwaZohNZujkd2GfQ4X8XAA8WyTk8Y4eQT6fuSighGLC02aVvwOW4e0WEfImTLx6kD/s93YuQ==
X-Received: by 2002:a17:903:120c:b0:237:de7e:5bbc with SMTP id d9443c01a7336-23c6e585996mr27347175ad.49.1751439556181;
        Tue, 01 Jul 2025 23:59:16 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:7bdc:b579:12a3:62f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bb7dsm122377035ad.90.2025.07.01.23.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:59:15 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: johannes@sipsolutions.net,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>,
	syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Subject: [PATCH wireless-next] wifi: mac80211: reject VHT opmode for unsupported channel widths
Date: Tue,  1 Jul 2025 23:59:09 -0700
Message-ID: <20250702065908.430229-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VHT operating mode notifications must not be processed when the channel
width is 5 MHz or 10 MHz, as the VHT specification does not support these
narrow widths.

Without validation, a malformed notification using 10 MHz can reach
ieee80211_chan_width_to_rx_bw(), triggering a WARN_ON due to the invalid
width. This issue was reported by syzbot.

Reject these widths early in sta_link_apply_parameters() when
opmode_notif is used.

Reported-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ededba317ddeca8b3f08
Fixes: 751e7489c1d7 ("wifi: mac80211: expose ieee80211_chan_width_to_rx_bw() to drivers")
Tested-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
 net/mac80211/cfg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 56540c3701ed..5a6ae093a8bd 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1981,6 +1981,21 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	ieee80211_sta_init_nss(link_sta);
 
 	if (params->opmode_notif_used) {
+		enum nl80211_chan_width width = link->conf->chanreq.oper.width;
+
+		switch (width) {
+		case NL80211_CHAN_WIDTH_20_NOHT:
+		case NL80211_CHAN_WIDTH_20:
+		case NL80211_CHAN_WIDTH_40:
+		case NL80211_CHAN_WIDTH_80:
+		case NL80211_CHAN_WIDTH_160:
+		case NL80211_CHAN_WIDTH_80P80:
+		case NL80211_CHAN_WIDTH_320:
+			break;
+		default:
+			return -EINVAL;
+		}
+
 		/* returned value is only needed for rc update, but the
 		 * rc isn't initialized here yet, so ignore it
 		 */
-- 
2.43.0

