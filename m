Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F58D2765D6
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 26 Aug 2025 03:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756178047; cv=none; b=vDb4snWwKsNY3FpcEE6ssL8vdx6MVBRPFymqrCgtJvvfiYUwiEsfTqJBZeO3Q9Df83Y+BJ47/nNlfLTCA67OsR3asj2OLg+yIP6gTemjW/hvu5TGfOYMCh53eVsMm+bZ19t65SxhUyaXNBB2p4XgoTcIRGqyD6WP3zdSbGs9t38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756178047; c=relaxed/simple;
	bh=5YN6O6GC9zj2w2gyr2C02jpCaY11GyipQ674DFoTk6o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kfoMUMg8bagp7pUL7hXghqrkWc75y7RYvEPOzbMJQTMDsfWCRiTITbu0lLIGQhZ5h/Oxq0fWW2i/618fG0Pm4BV1MXxMSu96Q7MiPXO5Sr1lFoFen/lEqfFe7SgmJ3YerOugyld1NUrb5LaEImCQOB4w2hynE7YrH+aE6SkkEKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGqsB8Fc; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGqsB8Fc"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f4bc9bc93so644223e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 20:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756178043; x=1756782843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=haEGMgQWYPiavHeip3qnO9dXl3bo4enC7b6lrk3mafQ=;
        b=dGqsB8Fcrym3ZN6Ch9ueIAtVtRQPtQWlRO2rrkDk5bmR8N1zNmh9GoGt6kg1pb0xN3
         1BN8GujUY4gujPgd++QzmCFfVYDYr1xX9XzBX3aWg4tAxqnPmH16JHb4foptFHtVQyNt
         cxNUynM4F9bQH3ODhAYNjtM54hrxlEtHG7YaGTdQWoBuJS+uBHRnVvnHgDuc6N8hf3Uz
         s90086dbOH824YsGoiW8Tv7A4pdpaAONND9Yosh3oHDNByMAxOw45oDG5xvf/GxkgnLs
         RNyZbKuzAtuBI3lvfAFY0XU0Fgtg3KUujKIdfqy9CXRcchrBo1egBk6sIU6JiL4saifr
         GYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756178043; x=1756782843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haEGMgQWYPiavHeip3qnO9dXl3bo4enC7b6lrk3mafQ=;
        b=HTN4jZERO89JgCTC/LoZr7kqHGxeekutems5r3WTLrSgriYg0HYC6cAjWi9RAajOhN
         mepjUOO4gmzrJgugIkKmzfQEjNv4XS97Ask1hxvcxH+mir+1PPYTGEeXe4d5XNQttDAL
         VMzvEBga6wEHWvvcwZdaUqQ66wZ3m2Dhm8Py5/01aZRbuXr1mKSgzzRRZv8ecec8ANiz
         zlp/huLyrMaZLfgwTk0ebhNiZ9b+BHlKCFqEu/E/c4U7XQO0KNHFhRd/TAHjpvIne1C5
         JTAlbhjY4SAR0mF4iLdFJFCpGc9noau/2hrUGu5/b6g7l33wZKzamABpxKbEtyAtLUq1
         s5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXR3GNQVU7NiIzYqb+V0k0V3Ej283ofq3MHWyFZwzCUkmzeaf238QdUEnFJFXgVUPzpb4Oi+GmNgR0wbQyTw3o6OnpdqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4xObFxFqgUO4VBxrxuvwRg/9Yr4cJcMxb+0oezhQRAZP+mNhb
	96ieHxrEzgEBTiEDV41YCfyb/SODmefC0bW0iHs5Sx7wbZCZHE8LSfX4
X-Gm-Gg: ASbGncurpwps9Ug9zoJ0y8Eav8x+Vhz3Gh4+MZl5X3BgYdp3fFASaT+pjUqYqXrY5s1
	5RQl0FvTybDl1yR3i1m9Pjl/9BxP591iArhdS/nOAZXi+uSWqNEy2b3E98LYzXgUJdbs9zFTv68
	rcnQfZiwgCv8GsIet/D3tp1Go1dPzGSnDN0CAFyS/J5brqzHlBDgxrwjeksYbDqJCheACMzyJLo
	eOrIm9hpR+/Sg5Mcw6sLoyGY4wENJ9yJkcSXtQV32gG0zCDJCrulRh+VN7Np6L6p4dwI3tlZYeI
	NwgY6urng39JSxuaK6aHA6cpBfk4vShf1lftrx/MhqelWwMLmustOuYAx4FxlTM8WfSIfIyv/Fl
	EHG/TN5GoQ5lq9hwQ56li1FXnNbKCWUhX1vfh5LyZoY/4zQq2YB35kCrm4ZwIob14dzleiAFqjR
	HUdgL4cnNCMMPhKcvkmA==
X-Google-Smtp-Source: AGHT+IG2uTbsT5FvN5W8j68SQ4oNq78+Q+UaUZ0b0Isc15lY0SLDiJWQZ60TgwVz89K1MIlLZzkIWw==
X-Received: by 2002:a05:6512:124a:b0:55f:4107:ac4d with SMTP id 2adb3069b0e04-55f4107b076mr2811906e87.32.1756178042760;
        Mon, 25 Aug 2025 20:14:02 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-af6-b340-a13b-482e.rev.dnainternet.fi. [2001:14ba:6e:3100:af6:b340:a13b:482e])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f3d4d1afasm1706832e87.58.2025.08.25.20.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 20:14:00 -0700 (PDT)
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
Subject: [PATCH 5.15.y] wifi: mac80211: check basic rates validity in sta_link_apply_parameters
Date: Tue, 26 Aug 2025 06:13:52 +0300
Message-ID: <20250826031352.510675-1-hannelotta@gmail.com>
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

Fixes: b95eb7f0eee4 ("wifi: cfg80211/mac80211: separate link params from station params")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosa.ru>
Link: https://patch.msgid.link/20250317103139.17625-1-m.lobanov@rosa.ru
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
[ Summary of conflict resolutions:
  - Function ieee80211_parse_bitrates() takes channel width as its
    first parameter in mainline kernel version. In v5.15 the function
    takes the whole chandef struct as its first parameter.
  - The same function takes link station parameters as its last
    parameter, and in v5.15 they are in a struct called sta,
    instead of a struct called link_sta. ]
Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 net/mac80211/cfg.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 2b77cb290788..706ff67f4254 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1658,12 +1658,13 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 			return ret;
 	}
 
-	if (params->supported_rates && params->supported_rates_len) {
-		ieee80211_parse_bitrates(&sdata->vif.bss_conf.chandef,
-					 sband, params->supported_rates,
-					 params->supported_rates_len,
-					 &sta->sta.supp_rates[sband->band]);
-	}
+	if (params->supported_rates &&
+	    params->supported_rates_len &&
+	    !ieee80211_parse_bitrates(&sdata->vif.bss_conf.chandef,
+				      sband, params->supported_rates,
+				      params->supported_rates_len,
+				      &sta->sta.supp_rates[sband->band]))
+		return -EINVAL;
 
 	if (params->ht_capa)
 		ieee80211_ht_cap_ie_to_sta_ht_cap(sdata, sband,
-- 
2.50.0

