Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2582D0614
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  5 Apr 2026 11:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775389458; cv=none; b=hXAkhtX5NwTJgLFkJOqEOBL43tTYEKhEayxabPCxlN7aygWusi/bWpDkfAkXYtB1MwR4Ap6xJFcZtYMb6RLMcIEcfxk2yMhwduZUAaOezqeczydGUi+W+VsMHJgShoKvu0YyGLqOAcx2apFomG+G9NcUlDlcgk3OBdXkr/lLMQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775389458; c=relaxed/simple;
	bh=JtxwjPqn8JLZOGXm/M/fdpuwr/fQAvDGx+mEfDoJkqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nRK9LVp45xmTDGKVl1d6aCB8YFxLfkRpQy60MigaDy0Rb77S+pajcan5TSEc0bZFtZ0x6H6vOi7MK2wcg/falJGKW7afBmhk5vKXzbiv8ZmEnhLa8L5TCbRwB+p+lq08DjBKEQmi3ugLh39iANXQ77NF9Pe0zUBF63OvLUfua8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4s54798; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4s54798"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c76e702e01aso173893a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 05 Apr 2026 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775389457; x=1775994257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKPclppo4/mMEFl/e4aPEOGLfhd1Dt+5N7P36rPzZQw=;
        b=W4s54798VyVBe5/Tnk0cRcWMITXmGp7o12HPylu+s7RUwhLGBsHhalDIFuU39jQ2bZ
         OMJV2intOWt6A4Ad3wDXuCK2QUdoi+ObcDr2Bv333r35Un2/NZTEVjOsZzCwZj7YmCv4
         LaIGBmWdFlMnb6hwFSfkeYQJnD3hNj+4R5GbbBpCVB0/9U03CSr2YEZUhRlAvjfgewld
         tMpjW0DPbuR+2HHGuwqfvgTBWCszZREUAxd03Gd4ByQWXLD24JR07qnnvetvStbkgf5p
         DJ9x3qcQDNYCbTMRXPhLXnXqeuwbhOjQl/qfKVvES80lJfz1q8DTW0UFj5h4DEtQ5Fru
         oBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775389457; x=1775994257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IKPclppo4/mMEFl/e4aPEOGLfhd1Dt+5N7P36rPzZQw=;
        b=lKkv/2qHqhCbNskxzIQLSyf5Qe6cp6Syrz6EujyZd/tcwx6e+VIRfBh5Zy9lT17yyS
         Zhh5irCZZ7vTBh78XJD2/eRxosKmsew58LlbA5ol78LSK7d94mST7xwjAFZTQMduWfeO
         NMGohFg34Y1/6/+hDWDwbkv5TslF/8hy7mSXUF9eX5LatT611Z73/X/+rgxYHT0mO7/B
         rQVtxL6osfk8jFRYOzwIlpUcdHr7BKOJM1kvEzVkHpywtJnJzvxxqGMKc/VR038PMquf
         faPRVFA2xRzlyy2ZyPtuqnQqtO3/cQ0ugwRqeIc52T1aMcHu+mhi8ZIhUDY5bcvqUIId
         JnfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7NsozVtkH50ihAbbLG82v1fL2OamU1THBbTsx6X5OUQ7WX0B3xbNfTdbFRgjYN70mCxzgGkB4YdNMP97UX1Ad9d7LEQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YydcnvnhdCXldFyK9nvsR/dQUBTzEx9AFIP1nr1zXcs0OynYrMi
	FR44PokcZ0IeLUB1Uuud3wIWgqTdJLOf1tEcYho4GFhtlWzkY56g5jsQ
X-Gm-Gg: AeBDietE5ZC0vAlynfsybHyW3rM8zy9WoHJ/fx49NuA2+g/0ylk9ZqDMtBoBWpfqp/C
	3sFY98DEvegYLQqPsGP68LvpkdJNLfL8a4xZYZt1j9nECWEYTic/xHBa3Ob8KVip/Jcworv/rCY
	BMlCuvmuua2A9yHqoDZ6GCKbQdFDWYeNDgnpkRaTwPMaoki1qU/DmsacUVT1tlx1nP4QqIP4OE9
	k3xunuInoR8FHzjX1DWAtViRfwbuHGFco4H2oLVuPFRnhdqirpzbet58i1vDkDM0i4tDhufNkHH
	Tzdggddc6iSskBLtMXuiU+h2uroiCILfHrheGrjTjztqvr17j0ZUsHfU/6mktrs/p7ic8JAShbh
	jp763WtAqENUjfNfC0Uk6KSVGRkNmZK2DKXth1g7Qhk7ST0ZeU761iLhAEtozO3BJtt1Ok6inH+
	ekGE0Zd8XOmin1YKvLK/7cK0WnMOZnPMZNJ4n0DmKieHeJDruGIQ==
X-Received: by 2002:a05:6a20:9195:b0:398:7357:bb91 with SMTP id adf61e73a8af0-39f2f2b25b2mr8790452637.33.1775389456825;
        Sun, 05 Apr 2026 04:44:16 -0700 (PDT)
Received: from localhost.localdomain ([111.125.237.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm13938205b3a.19.2026.04.05.04.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 04:44:16 -0700 (PDT)
From: Prithvi Tambewagh <activprithvi@gmail.com>
To: gregkh@linuxfoundation.org,
	abrahamadekunle50@gmail.com,
	b9788213@gmail.com,
	straube.linux@gmail.com,
	ethantidmore06@gmail.com,
	andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org,
	weibu@redadmin.org,
	knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com,
	samasth.norway.ananda@oracle.com,
	lukagejak5@gmail.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	suunj1331@gmail.com,
	ysinghcin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	Prithvi Tambewagh <activprithvi@gmail.com>
Subject: [RFT PATCH v3 2/5] staging: rtl8723bs: remove empty if statement block
Date: Sun,  5 Apr 2026 17:11:29 +0530
Message-Id: <20260405114132.310774-3-activprithvi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove empty if statement block for cleaning up code.

Signed-off-by: Prithvi Tambewagh <activprithvi@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 9e7eebfc02a9..61b35173aa4f 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1425,9 +1425,6 @@ static void phy_IQCalibrate_8723B(
 		}
 	}
 
-	if (0x00 == PathAOK) {
-	}
-
 /* path B IQK */
 	if (is2T) {
 
-- 
2.34.1

