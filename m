Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B2720C001
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 Aug 2025 20:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755980536; cv=none; b=SjnxwOyGahsVqnO7Xd6klGCv37MOfIBC8moCwL9ZefV42hjHsKATHMV5MZmilyOA/B5WQo7kkepTH1Do+5kA/3UDJiCcHzb9RlJkXYuyXBHuC/pNfxYMptktsssQmBSd3PnF1okxKk+0LUSZxfTotUdZvvwh1yMspRcrruOnnyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755980536; c=relaxed/simple;
	bh=Qnh7y1w9mFZQs85MUbGVVhpfR1+vrDCmKmHC+wR3zjw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q9suovxZmyjxpPNlBj8mytmXnvdsSaurKetTjtpeXZVGPoy7DJGWqMgnFMBqm3/LVRNDDZc5qEdOEv24tukAbMNH7RWlUqn7wUlVNAJFKVw84/TZ2bi02oRqm0AeUjPQ/7C78CLBHOAkuID3W54hduUhmQ1cVLDhZPSHXhYluw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0y4zkGQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0y4zkGQ"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55ce4b9c904so3560827e87.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 Aug 2025 13:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755980533; x=1756585333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uk6JBqLr1nBAcjMKhAnoLZr+fShwwUXueuyG4gyTX0M=;
        b=U0y4zkGQpTrcE1poUl9I7qQ7gF/bZD7UxKLkqyPHKF9bnChU0LBWA4h+gKcSWNpSuI
         kiAkufY63cstpsPb9LA9PMNYKOpB0B05kiV6oYsxOdY3gvpNHhob1J1czEXMPFTQWILu
         BOZ2Fh3Y7GDBhfeR5kjLH5tyX5YjtUzAEaXd8PdK50pb7UeqEq3ap7s/xZZHmhzgKROd
         6U/jGu0rsosjNzlgummZ1Nya0LyvZF204x91+9cTqqarZ1fUPK01Yb1CLAN1o/Ke/H5A
         2HhnvnnN5aHoWqjHbQZzgDrWpiSU8ZFgRXpFkN8wH5wD80rrLS7H2rWXtZ7mWKluHPMT
         7l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755980533; x=1756585333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uk6JBqLr1nBAcjMKhAnoLZr+fShwwUXueuyG4gyTX0M=;
        b=nSBAox1b03u/VEU+yDczp8VK2dCJl+pk+7/6YvCYFQ9zIWM3AKzPkPt67h5Eryprsc
         XAiQ41V0gE02AETFfmAJ/d6dNIkR/Mbn0kdmf645VfEInYa0BZFO58iBmGFX9an9+A+I
         Y5/a5EfHG/CWIjmKHIN6qSBJWRko9OiaJPlzvSQBvOdMjt7Yro0yNUO+baIqvxffDra+
         RLEPJO96IG4SSq/ilcw+rINd5fvxQ21XhJLSpDCuafCV8rWDrc1d0YvE7YwheJmyHtHc
         t4Od2aO8Iu43+U4kXSCVdQ1tl/spJrligtN7LPQbMe+9x7SQIz0L4vZgt5D+ZioI24uS
         azRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkzNuVgQXgHu2nlYkSkGftFrL1+cgBMwIhfh8JyPfNFTs8erjzz9oOztrjPWI3OBOYQgzSCOQ8BpT3YGG4dAq83DlkpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyppGQsEFmsZxv29oz87zU3S6cyozLi189ItY4QaCRVa4j4kAq+
	bAQU2Tr/6h7ns8b8P7QsO8WWpWMLW14JICxBMoeA4mJsTxoZkkbYLAmCgGIZwwvbFdQ=
X-Gm-Gg: ASbGncvQE70FExSIujKgWUCR1KRSLf9esE9fCbSSUvVstEUQ7VE1DuCuIYCY3VjXx9P
	Lqpfpbpt1UJA91+2a4mdxATHPs034Hp49FK/VD9hituKEVWPX3xGzQ6scVSzvParZFRerTBo1ye
	aMIQwqoms0pAMQHNXjlMLtVSzKd9OAxbjnBEfUGEdDeVuKkiXVtor+7YA0KLFHiWWou/v0Lm9EZ
	rGmCPQwB/Sn96UMMW2mO2gyfbYUKuPNn6RTtKOEBdyjOnYazA1kjr54ORAWkndG38Bh2775X094
	44LjoQwO7caI+Cir86qYwqqn5+Qjt2bCCVshq/rwJ38jKSI9eY3AnLnupOLNXKHVCWTMkVgTRht
	Fuk7kxTNPGXMKmjPh+b84Iv+JgnAWPxpCS7C4Oh7qavHhk0fhTGozNRfVFdMz4ljgrVdHqlHaFQ
	XQGayia5LcN/oN2OSH4YPE
X-Google-Smtp-Source: AGHT+IFAVwVWCHwpngEfXoBUmU1nMTU7i5v8D3RecjDEHrG1BGNk9ukVlMqichFmxVcZin/kLP3Dgg==
X-Received: by 2002:a05:6512:304c:b0:55c:d730:c86f with SMTP id 2adb3069b0e04-55f23d8fd5cmr2470714e87.21.1755980532888;
        Sat, 23 Aug 2025 13:22:12 -0700 (PDT)
Received: from uuba.fritz.box (2001-14ba-6e-3100-e1f1-3f10-2a0d-f34f.rev.dnainternet.fi. [2001:14ba:6e:3100:e1f1:3f10:2a0d:f34f])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c99e65sm677901e87.109.2025.08.23.13.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 13:22:12 -0700 (PDT)
From: =?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
To: stable@vger.kernel.org
Cc: johannes@sipsolutions.net,
	shaul.triebitz@intel.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	Benjamin Berg <benjamin.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Johannes Berg <johannes.berg@intel.com>,
	=?UTF-8?q?Hanne-Lotta=20M=C3=A4enp=C3=A4=C3=A4?= <hannelotta@gmail.com>
Subject: [PATCH 6.1.y 1/2] wifi: mac80211: avoid lockdep checking when removing deflink
Date: Sat, 23 Aug 2025 23:22:07 +0300
Message-ID: <20250823202208.43086-1-hannelotta@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Benjamin Berg <benjamin.berg@intel.com>

struct sta_info may be removed without holding sta_mtx if it has not
yet been inserted. To support this, only assert that the lock is held
for links other than the deflink.

This fixes lockdep issues that may be triggered in error cases.

Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>
Signed-off-by: Gregory Greenman <gregory.greenman@intel.com>
Link: https://lore.kernel.org/r/20230619161906.cdd81377dea0.If5a6734b4b85608a2275a09b4f99b5564d82997f@changeid
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
(cherry picked from commit b8b80770b26c4591f20f1cde3328e5f1489c4488)
Signed-off-by: Hanne-Lotta Mäenpää <hannelotta@gmail.com>
---
 net/mac80211/sta_info.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index dd1864f6549f..e9ae92094794 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -357,8 +357,9 @@ static void sta_remove_link(struct sta_info *sta, unsigned int link_id,
 	struct sta_link_alloc *alloc = NULL;
 	struct link_sta_info *link_sta;
 
-	link_sta = rcu_dereference_protected(sta->link[link_id],
-					     lockdep_is_held(&sta->local->sta_mtx));
+	link_sta = rcu_access_pointer(sta->link[link_id]);
+	if (link_sta != &sta->deflink)
+		lockdep_assert_held(&sta->local->sta_mtx);
 
 	if (WARN_ON(!link_sta))
 		return;
-- 
2.50.0

