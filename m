Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36012222AA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 14 Aug 2025 05:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755150504; cv=none; b=DNaES2cfYB8PyKnLcGE0y4OCiwrQcx/At1j3B4OwmTYetdjYrnPdVaeOhW+UvJlkgtNgaj/HiXED/2kaTztKcWyLW8P/+czks6dXTxWPNm6I9KGsZBi8PtCClQEX35Fo4vRHFT07E4NvWwn6F1YPdER+64sbg6iGhnLEOlaliXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755150504; c=relaxed/simple;
	bh=+0OzEiu1IwHYZBATpQwNvFeQfWRM20a9bZXzyMJbRNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BgWFA9GdNJ7JIXLyrpFRA54oi35RgmLsse1gIY1/gWLmiycOZmqDii264MPzdI+3ENaIlQVRV1dM3S+SfSb8D1BTmp71XEWRwUrlHBL+dIirX6f+EEyp2xGZ0gfPNpYcqaNYmb0Ju7uCp8g0FORr2FRPLKEWc9KMVd+wNopHd84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6mLUqJF; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6mLUqJF"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55ce510e769so577307e87.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 13 Aug 2025 22:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755150501; x=1755755301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUNtO4pH/dYIC4p6AKf+kH0mLx/dB4II9+DFQLnph/s=;
        b=M6mLUqJF2OJaTj0vwCKZ9qQ/PscamI2SU0NjEzl/x0Fkz6aNXgY0Jozjj9NtPTzoN9
         t123cdPs2IyDRkKfE4/goBNPOdvU3Vior/IoBIoBa6cs09V/yso69DwL6BzKx814r1Xd
         dWZXZtFBeM6npdXgYzqZFEvE3Xh0NAZuKCWJWvJ9txy+QokVCp0E6iLmjAhKelG0sgBI
         Xd/Qd02xNFxevb/qWo/D+fO5e2eDAQ76p1BRby0KFi9ayBVR2FYkUXmEYsmYI9zUaGLW
         uX6jp85KXe145wbHLSn/PA0C18dEDV1HZ0SfPqQ2zsEoo6qTiiF3HDnAY40aGCAJywp4
         2q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755150501; x=1755755301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUNtO4pH/dYIC4p6AKf+kH0mLx/dB4II9+DFQLnph/s=;
        b=bXFMPzenx2XXnnJ1urbRmXrUSSykoE3b6izRGL0Hj3Ccmr5lvVqi5uWyJ0c1ITPO5T
         aXPuflMoxyBqPwa5+/kqx83/kIaphugNBIZG/oOW4hjLmjumsvmuJe1LgEAlA42RdgtT
         c0xUn50zo0XO/V/g6wF2CG1WYX7aEYF2Z7fEOJZPSvXtPDISuyc9hMwFjK66ozvG1XPw
         qjoP/HkAdERIqsN3a3/GQkaXZ73oulz4TLUnYHewxsGAr/QO/N0gu2EmIVJoO9qP3jkt
         pSBrlQd+ZE+xH9B05BdWTyW14RSzX+K8n6fxuftV1lBu/bGs4dH2Jhacsh5h9OOvW4cc
         dphA==
X-Forwarded-Encrypted: i=1; AJvYcCULWccn6EdMvDCqi6TB1uZxfMX4lCJNZ7UGY5yr4WJxCD/XmiEtMXFUV+NQq/ZvGy4UXfGvusqHfREit8OY71K6WnjgMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWeOLskUdFd0NXcLyAsU25PPNXqmtyd6f8vfmgPPv+0u8QNBzm
	BNjYzCe9AMzBwS1oYFIGUPAFYnwb5uhcIKC0/Afm4Zdz5gYgiWA7yMiz
X-Gm-Gg: ASbGncs4SfwQKJGzz0ZkdTYJiCdZh6VfWS/PjpXF+LOZr9E8EsLKtdt8D63ObIaQh0t
	RVHybI0JfHJl4hQM4NjGyHxt2W3yOcPr7eiR4VGAoU1mjacBEth56RkOf0MNzGrg6CMdPutmXj5
	Jsh9NiJftKOGVvoR2r/m8UHDZn0N5LBuPPpMp10yjhASySEjeXJP95ww4vnKNOZRIZ1MWpqpHJk
	v7jBihZPp4ptN88SPTidGBqJutu2BCIDHo88FYA/xmtU8P1I4ewfuuAklHBU3upp7t0Tqo9SLBl
	Li0WPMIizilj3U4wYdtfJvi4VncX7/gDF5/Q5+abtC3C3VTo+jm1M4JKsWtNnKTIbhEnU3Xec9b
	YrRLsq0UFhTAt2Oqyr1ut6aUIyHRudzbz6arFPEeU7NEwjfn8sBkXMFxCv5qEKwkYmaxgPlnJAF
	s/HhvQStgnEMFktlrx51Gg
X-Google-Smtp-Source: AGHT+IF0cS6nJeqSR4x3dUlA00S4ZeJZ+cRKVOPAb2WYQETUE7cy0JiKDYv/snz5x7N5TkN5gAYglw==
X-Received: by 2002:a05:6512:420b:b0:55b:9192:319b with SMTP id 2adb3069b0e04-55ce5045d9emr390809e87.53.1755150500391;
        Wed, 13 Aug 2025 22:48:20 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-4a6b-e900-eeb1-e216.rev.dnainternet.fi. [2001:14ba:6e:3100:4a6b:e900:eeb1:e216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c987acsm5447456e87.100.2025.08.13.22.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 22:48:19 -0700 (PDT)
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
Subject: [PATCH 6.12.y] wifi: mac80211: check basic rates validity in sta_link_apply_parameters
Date: Thu, 14 Aug 2025 08:48:04 +0300
Message-ID: <20250814054804.114024-1-hannelotta@gmail.com>
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
(cherry picked from commit 16ee3ea8faef8ff042acc15867a6c458c573de61)
Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 net/mac80211/cfg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index cf2b8a05c338..9da17d653238 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1879,12 +1879,12 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	}
 
 	if (params->supported_rates &&
-	    params->supported_rates_len) {
-		ieee80211_parse_bitrates(link->conf->chanreq.oper.width,
-					 sband, params->supported_rates,
-					 params->supported_rates_len,
-					 &link_sta->pub->supp_rates[sband->band]);
-	}
+	    params->supported_rates_len &&
+	    !ieee80211_parse_bitrates(link->conf->chanreq.oper.width,
+				      sband, params->supported_rates,
+				      params->supported_rates_len,
+				      &link_sta->pub->supp_rates[sband->band]))
+		return -EINVAL;
 
 	if (params->ht_capa)
 		ieee80211_ht_cap_ie_to_sta_ht_cap(sdata, sband,
-- 
2.50.0

