Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759DF3203A9
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532265; cv=none; b=XWt5Tp14h8DJ0LBudV4IIygDeO9qAx005I35jxnYmv0JZinytzbRkIc1HifVNOgGyUaRZU6KnG9HE1tQWQ5fg4ItokJLJxijdbrwOWujvQ5PSPEa1CuVh1+Gc3FAf9g4MbD/HEMM+uJuopoMkP2AQpMjL5UWxO72j/kLEpFFlFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532265; c=relaxed/simple;
	bh=Mo2LccUagUe1xUANazkGwfXyyJJ+Z1hgR0dGeVhngFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PWxDIkx3jYys7Wrm+f5t27e6Ze0tfjZdr2vvPY/006yPlWHCKPysgcUOlrg6AmUtNtXvO2LDho5h7GhYgp4fRn9yZTAIUtwEjhw9wz4XaUHvxCnTV3BZz9J4fevc+hKYYshFFwmMofSRJwQrjmexOZQuWLKYbyX89kQos3ejugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1cnXjjN; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1cnXjjN"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55ce508cfe0so4259791e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 08:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755532260; x=1756137060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k1k2jfv+LptyryYuraaPe3v8D77u/BoWc5hlQC6Q2Ag=;
        b=L1cnXjjNXH/pvNQT/aa4LSLA2BVbjRAn2DY33lUggMBgNLXkX86SkjFyBplcUEFOP8
         25tMfaTzOF/iUhLooXuSoWJzSgDkKOyMF5l2Zv2FMamwsGDdC7tAEciWFwmRVVJvOly/
         9hUE7mtjEbEkZwG7hqlppHnNnzQhBV3q68ch9G9+3R7Xva61XbjM1MEHok+WY3HDdN4D
         8vBdYdd0tnXaxHvAneCazCbZ6733YH+QzC3HZYTtAxuC3hdT7Y8PpaQd7A/iAITqDreu
         wD60UhvYZdZ7FNu64p6zi0BVms2PxK5dh1KG1C6AL+6aWx6y0JA4MLf07YmkoLrbDDrR
         NEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532260; x=1756137060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k1k2jfv+LptyryYuraaPe3v8D77u/BoWc5hlQC6Q2Ag=;
        b=l5V0Fc6x5SXTul5gpr3ObSHkWrqB+TXkoacDGnEAXy8aAwjvhpLs7aJyFGoEYtKeKS
         czBVC+yPIczGT18BbWeTTJGkM0H81y22+f/mJvlZL3pzPy0mwP6quqRe43oLqb36zkN6
         BNl0scji1d3yUSvB7vOmezXUaAC0pdLYv0HzUKNFPkoHrlex7qq4m+GHZYL+F4Q8T0Nd
         sB5i26p/xQ7Bb7GLQAMLMdvyE1IxbBs7xHTQHYoW6Weg+kVBUocdr13CwZQ6khRc1JIf
         vFNqasCDrB4gZKwOOwG/w9aLlJCdxEB6lwORopmEtTUmvuoiRcFS7KNmbEEIugyJSaZ0
         rEAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXWNHRgdjkDboN1W56THcA+ky3n5AXy1Eg6nEqV719j10zWXIqScqiSOLuWB0dG6ybgxEBL5f42Whlcw4FsleIdVvDw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnE1p6dw4XmbVj2raHLRZ+kcPYqNiGpfd1qumQR0Yq6qBJ6UvX
	ZJl+4nRMdkQl6CFitLvwFb/U5ZDiiK97MI9uI3gkI0JArWaLpg7udn7Q
X-Gm-Gg: ASbGncuVWJBpsaPsLQ7K2vd0oMXbmKWD1Its6qA+zG8mwsLGDCXFS+xjUniaSU2a/O1
	DSXTa/DE/wQ1gAJKjOYKURFWYS3kagUOUIYjdDKdB/q1+8ukNGkikn75dkv1aBhuYAFg528rF09
	8UZamHQeIBfszWfdT7E0hiraZVBNMSOZvoycpDamsxyXqIhRBzgYAo/9GIrIEddTwYZ4WHMgNl7
	fnxsPZCJqbTO8O44WYxUEnOV7W8heNIFLHPKIK2tfNMUJjLKWFWHifrMIsnye/07sTBK1wo+v+k
	va60PVjdS65ugNw+TCKoDNkYQgIZjrTNZQLZJdNE71XQDu+gLMNP11kXJr4Lh8ZPVfCKCdH2PA9
	VTi5H5M5zYxzan0+/ub+Gp/UpM+CvWhCkK5kQMBnIVBMvYZvdEjKJkSk1qhktUgyJ8AL2SwVxz+
	xORwvy4cLAp/L/PNrP6EVz
X-Google-Smtp-Source: AGHT+IF2Q8OElm4cF5e0qgh7ApeOge1RophMUMtEOTLBCEvVf0lwzkkV7zD+z/l9V5F/VLsyU+R4Tw==
X-Received: by 2002:ac2:4c4d:0:b0:55b:8a00:c703 with SMTP id 2adb3069b0e04-55ceeaa196cmr3551845e87.10.1755532260104;
        Mon, 18 Aug 2025 08:51:00 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-8b77-edd5-be95-580d.rev.dnainternet.fi. [2001:14ba:6e:3100:8b77:edd5:be95:580d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef45a007sm1710155e87.159.2025.08.18.08.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:50:59 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: stable@vger.kernel.org
Cc: johannes@sipsolutions.net,
	shaul.triebitz@intel.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Mikhail Lobanov <m.lobanov@rosa.ru>,
	Johannes Berg <johannes.berg@intel.com>,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH 6.6.y] wifi: mac80211: check basic rates validity in sta_link_apply_parameters
Date: Mon, 18 Aug 2025 18:50:38 +0300
Message-ID: <20250818155039.8529-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mikhail Lobanov <m.lobanov@rosa.ru>

[ Upstream commit 16ee3ea8faef8ff042acc15867a6c458c573de61 ]

When userspace sets supported rates for a new station via
NL80211_CMD_NEW_STATION, it might send a list that's empty
or contains only invalid values. Currently, we process these
values in sta_link_apply_parameters() without checking the result of
ieee80211_parse_bitrates(), which can lead to an empty rates bitmap.

A similar issue was addressed for NL80211_CMD_SET_BSS in commit
ce04abc3fcc6 ("wifi: mac80211: check basic rates validity").
This patch applies the same approach in sta_link_apply_parameters()
for NL80211_CMD_NEW_STATION, ensuring there is at least one valid
rate by inspecting the result of ieee80211_parse_bitrates().

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

[ Summary of conflict resolutions:
  - The function ieee80211_parse_bitrates() takes channel width as
    its first parameter, and the chandef struct has been refactored
    in kernel version 6.9, in commit
    6092077ad09ce880c61735c314060f0bd79ae4aa so that the width is
    contained in chanreq.oper.width. In kernel version 6.6 the
    width parameter is defined directly in the chandef struct. ]

Fixes: b95eb7f0eee4 ("wifi: cfg80211/mac80211: separate link params from station params")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
Link: https://patch.msgid.link/20250317103139.17625-1-m.lobanov@rosa.ru
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 net/mac80211/cfg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 3ff7f38394a6..1addfba4b285 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1847,12 +1847,12 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	}
 
 	if (params->supported_rates &&
-	    params->supported_rates_len) {
-		ieee80211_parse_bitrates(link->conf->chandef.width,
-					 sband, params->supported_rates,
-					 params->supported_rates_len,
-					 &link_sta->pub->supp_rates[sband->band]);
-	}
+	    params->supported_rates_len &&
+	    !ieee80211_parse_bitrates(link->conf->chandef.width,
+				      sband, params->supported_rates,
+				      params->supported_rates_len,
+				      &link_sta->pub->supp_rates[sband->band]))
+		return -EINVAL;
 
 	if (params->ht_capa)
 		ieee80211_ht_cap_ie_to_sta_ht_cap(sdata, sband,
-- 
2.50.0

