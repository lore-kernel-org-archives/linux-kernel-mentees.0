Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A268D1A2622
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  3 Jul 2025 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751571495; cv=none; b=WhiXWjZCoRoYBNMTqFszdm1yvHl4IWZk5Hp2Q545cL3U9l/N7BTtpe/5dj3JtJkYyM0Xrzdr1LE5yg6XdEaiqOo9GKCGnSSJYt6DqZcQ7uaO+dvG+0cXfMlO927xm38kh20UFhqGr2lOlehjtyB16wzjpxt72O5bgkB9LVrytmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751571495; c=relaxed/simple;
	bh=p5uOMFHvJwUGuJvmvYotmeGOkDlMkIpY+4J3jc724Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PSBiBxiuyak7mPXJ1ShKWyiFgpOGI9buzacFqFbJwJ2e/npaPgMd6RFeq68zJy+/GaHkoFSx4gExuXwOGZaOZBJP5dSju/8JIWBTiU50Rj313h3GrMkDPWv3LDP9i60jdt2SCTIIqEIafxdM1MVfnv5TtiSsaUuHRTO1BnhgFXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2hx0bbR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2hx0bbR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23694cec0feso2575505ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Jul 2025 12:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751571493; x=1752176293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mfLY4ZIIX6c7Uf9FQfy3N6nezkDQGS+OMzVy2anSQiE=;
        b=N2hx0bbRxubEHflsxcamIB1cIN5xwYDLxnpZcJOpGxm7iu0hD7Xvm6VdwmqfpFLIHX
         lPF7whjE6LsW01UZ79fygcyo/PEnTVDda5E5znAvR+T7JObpZLjNO9JPtiD76XQOZb4r
         y7BmIdsmwbhU1CdQSzGdgbxpa5FigpQ5Yl5vTZJvKKzPEjByw3eKtwr4HG7GoQ8EfFK0
         soOaVEmu1h/UrFuDOGOeFrGc3HqpSpc/GpvREQ8u72+D+a7GV9a3aSu2gBXzGnWGdz9n
         Alr9ScbMC63LfWs6hSrXcN3T81dMw9beAk3eRpG+vHPHPntSEDzqQUC5ACoHpvU7uNaL
         NA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751571493; x=1752176293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mfLY4ZIIX6c7Uf9FQfy3N6nezkDQGS+OMzVy2anSQiE=;
        b=h+0GQurOtEuGsiKA8puEhmOdSt8Ogn31fCvM4hbdFhaxN6GXFlip765QlD89aejdDi
         GbWplsB5hdBpWhDi0vTykyCkUGNtqzZNlu2/PznkTTtLZdJJNRQv7KNseziD+JifEoz0
         Px7C+DQE+NliS46qfbns1pRo/Lo0Di5Azf2tumfppo2frhjEPGjBe4OS8wC9TsSYeKGC
         5hOyvUqoC7yPYNe0Cm4kwkZdW0KMj37dWBaalO+5uQZ01eTVYxSF1rExLyZlmlnxAo7N
         7lF9A8At6+G6oLBb/bZka/nx+hcB9LaIVN0BRGxSiLmBvYpu7Md96oSIusiJK689Alzu
         rONQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHu06f0w1b0G0mJuD/w7iGL6l068dIq2ClxjywGcPPMH5vHC2pupTSzZdY+mnsJO1UaHtySLL22XKj0KVURNDCOrA4QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYAvLhRuivOVo29b88tiHYfsCc0HkcpDh1AgPJ8/dKCuT2/NVk
	qN+t3blm0vQi/euZ4+f941gZnvwaCEXAxD9Zxbvuty4Shv8OZFpzC5Fu
X-Gm-Gg: ASbGncuTMHPJzjHb08HUAxCA7Gdfe+qaMb5IFxeQ3IZ4znzwd3Dn4dFo9/WOQT0n9CI
	TZeVEQGzBO5Am7iEFV7T9IdyWoorTEmNjQFx3BmY8J+6UMm5RmfsuztVwnmnhThf1wK6S0ywafP
	1jD8lCYIikdjF8qfH5kOfYx2eGqSGxGIp0XTdMIQhEDi7bar1kLgcPzzISni1r1wBIrHAbvG4cG
	RGNxcaPLITP/vZYekCmNsCgLWrvvj35TFw2fyjbILrfxOzZiM9XFQz9Ayv65BdqNyrgNKyaCH8u
	EhBKvBgBe+B0S1s0VJsrKtqm9048QbcZxmZkOEWlcVUSkdEuOnzz8d1AjADbTbo=
X-Google-Smtp-Source: AGHT+IEWpfYnkVr+s6TSpjhobBo4AZaEkt/VIFDfi8qDj8tp/r66E4q6OKPr5Gj3/ggnBkjffzqwxQ==
X-Received: by 2002:a17:903:2f8d:b0:235:779:ede5 with SMTP id d9443c01a7336-23c6e5b6125mr114749925ad.40.1751571492849;
        Thu, 03 Jul 2025 12:38:12 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:788:c50d:c37c:e870])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431f1basm2947795ad.25.2025.07.03.12.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 12:38:12 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: johannes@sipsolutions.net
Cc: nico.escande@gmail.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Moon Hee Lee <moonhee.lee.ca@gmail.com>
Subject: [PATCH v2] wifi: mac80211: reject VHT opmode for unsupported channel widths
Date: Thu,  3 Jul 2025 12:37:57 -0700
Message-ID: <20250703193756.46622-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VHT operating mode notifications are not defined for channel widths
below 20 MHz. In particular, 5 MHz and 10 MHz are not valid under the
VHT specification and must be rejected.

Without this check, malformed notifications using these widths may
reach ieee80211_chan_width_to_rx_bw(), leading to a WARN_ON due to
invalid input. This issue was reported by syzbot.

Reject these unsupported widths early in sta_link_apply_parameters()
when opmode_notif is used. The accepted set includes 20, 40, 80, 160,
and 80+80 MHz, which are valid for VHT. While 320 MHz is not defined
for VHT, it is allowed to avoid rejecting HE or EHT clients that may
still send a VHT opmode notification.

Reported-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ededba317ddeca8b3f08
Fixes: 751e7489c1d7 ("wifi: mac80211: expose ieee80211_chan_width_to_rx_bw() to drivers")
Tested-by: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
---
Changes in v2:
- Dropped NL80211_CHAN_WIDTH_20_NOHT from the accepted channel widths.
- Clarified in the commit message that 320 MHz is not defined for VHT
  but still allowed to support HE/EHT clients that may send a VHT
  opmode notification.

 net/mac80211/cfg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 56540c3701ed..d76643d46150 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1981,6 +1981,20 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	ieee80211_sta_init_nss(link_sta);
 
 	if (params->opmode_notif_used) {
+		enum nl80211_chan_width width = link->conf->chanreq.oper.width;
+
+		switch (width) {
+		case NL80211_CHAN_WIDTH_20:
+		case NL80211_CHAN_WIDTH_40:
+		case NL80211_CHAN_WIDTH_80:
+		case NL80211_CHAN_WIDTH_160:
+		case NL80211_CHAN_WIDTH_80P80:
+		case NL80211_CHAN_WIDTH_320: /* not VHT, allowed for HE/EHT */
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

