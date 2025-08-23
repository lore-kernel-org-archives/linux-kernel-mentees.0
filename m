Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2019D065
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 Aug 2025 20:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755980552; cv=none; b=Ga1PUfJoYB0FcZkNhaHkVkIA25oxuQMbmVi7Z2JQXdbjC7Z6XBK+O8LXYOQdPAfL/xjktjEGDfMN/Unp3wqLXkjDBhuHYja3Q7em/cQMWLipaBoOlpwfuqx0W50sORKpn2mUVn9vocQk8+rDS3U9fJYq48os47rYFHs1cf8FEaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755980552; c=relaxed/simple;
	bh=FQccn/mnCuKMjzy32KODULbWn9j7n+6MgtLwkBtBSUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBJek22hCcwTBVy520OId+0LsoTxmIsuXo/LMCWw8MUcrk2N1M2qELnWMI2/p8PQ6FiW1kvrmN7a/eAt5pcGOMZ+jGJ8P3YX1G2Gr4KbymEmvvk6ZEhebjyzfQwi2EglKdGW44J9JNO5kYxEGiv8M0VqH5CBEPqIwNfRrKYfzuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NseLGR03; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NseLGR03"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce4b9c904so3560927e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 Aug 2025 13:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755980548; x=1756585348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkaVXvGmGwTwhyRFOa6DDpH5NmVfdKNvcReIU8TQCxM=;
        b=NseLGR03aUxNlyk6e5OFDHvaL/Miu4W5TAsCUYwYH/H7pSDcoSx0x+FbHH2Ei2IHAe
         i9+Z+fhytdbtFKoY+xmBclx8aGHENRE505/1EE4vUgGaSkbFPJCB5hWXAorvn+ofmDlN
         vnkbaJqtof5CBo0T8yXRWST0p6wM9r6qp5AgrWlCDZ2XvlcnXJDoOGtaQQfSunh3BoBr
         xZ0s0es3LuuQinUPhMNmd6c9Pd2cspHvz5eqKmuMz7kW48qzSRi4NimEEljhYAfOH+V8
         30yWuaa/a+7faBkS4HNeunNaHzTDYBsRIC1YNbeFNBjmqEPC8SQh1mwNHo20g9ibOjv0
         nZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755980548; x=1756585348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkaVXvGmGwTwhyRFOa6DDpH5NmVfdKNvcReIU8TQCxM=;
        b=HrbnuWC3MN0NDoDl5RVGnahQ5MVhgm4+i+WsaeFD1MFlRiQYu9X1Z6W3zngvYh+qTP
         Z3hHamu7mZc/+AbtDQkbElG26syuENh/+JScs0d+Bk/LalUvj8MRumR+JMGV8WE+bV5x
         IE2MwbnCqwynIAGK2WupNApfaD7IYawVhdjIqBGhYYyEM5OVePrSGdb25wqDAY5rcjDB
         eyH7ykA2V3dF8yuAgAuDUu9HUv/Jz3yekpgvZKklmdsJLwU8iUgWweUq6jrS5vgfAjtr
         n55Ofxp8rYromyO0B/xCr123VLy42XkjYkahwzh/GKs1gdTmVpKR2WRAlVUkC7bh1Q+4
         vW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUuFIGv/tt1GbX8YhGmAsN8dXde1cUy/rMa/UICC+d+pTV69P/M2394xFRuhWz/1h9VhxMQX99pXVGfkXu0puXlppNG5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+dOg/PsQ6Fy7g4j3b5G/uobMY/qW1EaXMSrBHG7Wom+MQS6o6
	As1GQx2vV3UFkdBd+HAZfkJfOjsfe0s6ppg5irSmUni/vMr6t8tUBK42
X-Gm-Gg: ASbGncuo0ZeHTHd2H1RwZKQSuS7fsfQhLHfz1GgpTk6vTSgmB10MObChtRyenrQSZYr
	f44B6pIJe3UcsxIqJ6apMkFaFti9lZZ2ubWtrylDaVM2VMG+DWGw0ZGXFEypc5kSs3wrGGvWwTS
	qtEwk4sSP3f3X3wZmhdCOY2NN/GNBuDvYXD9YnS1khgy1xw6QwXubULxP46I04xWby7g9bBb05d
	olLSj6UR4QM5Ms6Z8KlKResgkrB1UBKcLCg9+5MqTlumormT61XK3G70hZjC3XBwYPe6XYcpbYC
	m0Luz+21TEUh1QGaU9bgxj1q+4/aGYa8UHrAwgq/3p3h5cn5ORJXWiu0/jlng+Xe4ggFF9KrI9b
	Jy297IOKfGcaSF1tsdIoNCAvM/1i/ZovFffZRdoQyhw5X2fwNX7QdiXC7BVvf9zVJVwfyNxY6FJ
	bxE9AK08zElPS3+0sDxy1k
X-Google-Smtp-Source: AGHT+IHT5OiJrgOGVSNUQDNc7iv/jwpAb+TzHRjYVDlMIt2lEi03MK6Ye96jnRvqifCPUN5ywys4Og==
X-Received: by 2002:a05:6512:3ca6:b0:55f:3f00:a833 with SMTP id 2adb3069b0e04-55f3f00ac62mr364421e87.8.1755980548333;
        Sat, 23 Aug 2025 13:22:28 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-e1f1-3f10-2a0d-f34f.rev.dnainternet.fi. [2001:14ba:6e:3100:e1f1:3f10:2a0d:f34f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c99e65sm677901e87.109.2025.08.23.13.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 13:22:26 -0700 (PDT)
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
Subject: [PATCH 6.1.y 2/2] wifi: mac80211: check basic rates validity in sta_link_apply_parameters
Date: Sat, 23 Aug 2025 23:22:08 +0300
Message-ID: <20250823202208.43086-2-hannelotta@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250823202208.43086-1-hannelotta@gmail.com>
References: <20250823202208.43086-1-hannelotta@gmail.com>
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
    contained in chanreq.oper.width. In kernel version 6.1 the
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
index be48d3f7ffcd..b42eb781d7f7 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1735,12 +1735,12 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
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

