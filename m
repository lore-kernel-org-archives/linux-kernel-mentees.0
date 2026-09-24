Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D1B4248DB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 23:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292238; cv=none; b=NXo7mU1ukyEeHzJXYPGbTMbP/IlchmiYeG38o8c/WAu5hJdogbvhxIQ0fy5BdlIizLkxVGHVLMpkHWvfN488bkUt5ret1NTuoyDCYcBosUVozn0aohH0cfmfaVYDP38Wr5R4GE8BW+02e6w3PNILZpM8mDgtGW5B0AaLZBUGYyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292238; c=relaxed/simple;
	bh=L9s05IwcaEGjCqGmULp2mdtQR1iZBPLwYB39kXJUY+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KrfW+YSujIijbEQUEdugXBQX2bChCPakz1KNWpx3LAUCwH+xX75/bPFoimU4lNUBYu4nmuHpbqzeP1giKCCS1qU9daMriutuigSkxaHydXs7viXItogG6sAlobUp8zOE1diiQTKXZ9+qhwc7M8dP0HasVSnuVcXNQD+nKJx0LQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LyKLJBlo; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LyKLJBlo"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-32dec843c37so350588eec.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 24 Sep 2026 16:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790292236; x=1790897036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N0BCZSjIX+UY6/4hcfUjcg/hMZ34STcp2U1v/I0YunY=;
        b=LyKLJBlo7dkPv9fZiQF/Yw6qj2yehwqrinBUEvm+YFRwnx0F3BfraYa4UPrnT4RAPc
         TLvhK7MA/0FDVTBs1QZhNUkGZwUGihl3He7N/DdzrFPDuk8/pMXg+5/wuPETvB7Io+2e
         7wf5jC4sgwzaEVFJi1NgXWT8oGRYd8hnd3kVl6Sqs3O1RhK4yTHO9o9PHry89jDBnAcF
         ygEN0bIiZc260ZcFSlTUWTiDory+iJWThMsJpeqOtqpFgadc/F7TyFhXvstrsnlnTvqz
         jGbBq4tOtYHYzHjflKbVHgVN3IiB4QSflMOzcp5eE8rzjU+UJaP/QqZIcW3g3AjMzJWY
         iWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790292236; x=1790897036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0BCZSjIX+UY6/4hcfUjcg/hMZ34STcp2U1v/I0YunY=;
        b=rVdreKq0VU/jyUFH3TGbIcjAmfNID2qmhi4twS6AJDVltQVz1/4fUYlAkox7c+fN2h
         AM0VVBpCTQP9jvGBAfpBJwgvQd5IXuEtjuBoPTKRdZz/nJ41Y1ditwIDKfY539BSqGEv
         HtYigzFQFsKr+k9F9ygoBBzmCe54sKu1it+MYt330pM08uIqhvQQ1CiBZr1tjW8QrBg6
         o0VpVFX44wdlLy94IzkvsaOGZRQIQwP8KiHSqIr9qG6rjsMK4GNO6zJ6+UiiZQAw5bpL
         QAGwVvWXnzMgbT5fIZ+6Oeu75b3KLw0a3NyiVQ97j9ejve+f7vizKiQm3v5o3yt9oAcB
         rkZg==
X-Forwarded-Encrypted: i=1; AKwUvByovNwpqz+u9yad4PZFz/4GHQUYFYeKc8NovOH3YRh9hAnaW4U5PwzlrbRHVT0fvLgFflwUJGBbRa7vExljgUV9eXCFwA==@lists.linux.dev
X-Gm-Message-State: AFuF++kAuLPePHeZfuocSzajwZwezqqVteNU1nqG1ET4th+MlwSeGtDg
	Olw9RKbeOWQLoOFjTS2HtEpEc/FofO8UBCrpDv5n2s4gGoC0MmA9VMzZ
X-Gm-Gg: AYBFou3juvUat9rrzU26D+vWAj7/fvtjqTguMz5Xc3OEkKChc7oyjBcb5/5spDFcO4x
	EPRBMPnCfv988o0gB2H2BRZI96Ql1QaO5u35YRLoQ+uwhJPzemzQCBH5U7KeSzDzu7v2YjjNN91
	SQYMEzPyoO77OOCdOAqV6gYh23SwKoPFvp8BwOH/u5jyeeJeRf6Wehar+0ewHYpOXLNrnpH7gNp
	0tB08GSfoKFWhyNykl6TwxgIdumeF9ZNrfS5N20UIGoWHA2og0g2e7hQXtS1jubSF2Q/Cs6r4/2
	xcPfByN46zEu2l3+cTOlxfox6g5nsV5x9RPIBmpEK/7mmm879DKKohZTnpowfXUplgb66zHP50k
	v47CJG2ZP6VKNYjTvgSglFeLjjCBb0YocPB3tI8h8v7BtAQ263My/dyH+/NTBk6t4f4Ns2Qkmf3
	SSQhGSWlJn5STzOYMfDTrkcpStDIOgTdWl4LMShUBUFp9lULtl9R3uu7AE0ps=
X-Received: by 2002:a05:693c:87d5:20b0:33b:bfb7:31cc with SMTP id 5a478bee46e88-34001f1961emr3645480eec.16.1790292235455;
        Thu, 24 Sep 2026 16:23:55 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e1:11cd::1c6:c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757263sm1516795eec.12.2026.09.24.16.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 16:23:54 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH] ice: dpll: fix kernel-doc parameter descriptions
Date: Fri, 25 Sep 2026 04:51:38 +0530
Message-ID: <20260924232138.69492-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stale @count and @cgu parameter descriptions from
ice_dpll_init_fwnode_pins() and ice_dpll_init_pins_e825().

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/intel/ice/ice_dpll.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
index 85a74cd6ea1f..d00a2fb683d1 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.c
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
@@ -3919,7 +3919,6 @@ ice_dpll_init_fwnode_pin(struct ice_dpll_pin *pin, const char *name)
  * @pf: board private structure
  * @pins: pointer to pins array
  * @start_idx: starting index for pins
- * @count: number of pins to initialize
  *
  * Initialize input pins for E825 RCLK support. The parent pins (rclk0, rclk1)
  * are expected to be defined by the system firmware (ACPI). This function
@@ -4025,7 +4024,6 @@ static int ice_dpll_init_txclk_pins(struct ice_pf *pf, int start_idx)
 /**
  * ice_dpll_init_pins_e825 - init pins and register pins with a dplls
  * @pf: board private structure
- * @cgu: if cgu is present and controlled by this NIC
  *
  * Initialize directly connected pf's pins within pf's dplls in a Linux dpll
  * subsystem.
-- 
2.53.0

