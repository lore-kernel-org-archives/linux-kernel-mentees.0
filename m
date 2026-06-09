Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD3347521
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Jun 2026 22:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043129; cv=none; b=iSn4zvEllSDOWs7P9vqPsiWcOQY0mkWHAOiEndX3/KiB2IFs8DbOziJmrLVfERCxJ61Ol/PvjpcRAsNekE9PSe+xTE1Zs3ZhBZdidEx4wTretZDHPoOEW3AtOeAwUZa2g+VbY06ST1dVaHCoFcVJnTLC1I/rqUmzKf7zREPNRG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043129; c=relaxed/simple;
	bh=2zHJGczMgPTnPHetrKgAokSYc6u9xAry7V6kAueCMEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2cxHi7d6N4Ptiwr113QXh34AV2IgCDJRylc7r0rt6W+G6ZqRrU6TcVkgzC8ChZ7uwKsceWSuecOE+v+JLvB4udGZJBn5S10PECFn6xwi+TaJCfxzkntKR6S/rv1EUoX7qzSBKlpRPEa5OwWRuNptbc4ZXZan4nal8MoeClA5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeAV50o0; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeAV50o0"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-96387cf6335so4930537241.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Jun 2026 15:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781043127; x=1781647927; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRFLeAm+ZIb8Ah+Gyq2iccaCBid+13JpRL0PKWMiPUg=;
        b=KeAV50o05ZevzKowX8Hq7lW+Ibhdjn+PfFt3zRnwq00vvGuhqVNRDJ9uAgdd1kuIE2
         PM7gnAdjdME8c7TiYUEzy/tgIRchTQMUVAAlUidYeMB37HaxMHwDsfkCOA/Q9hn6Gbt5
         vRs/QFgwXuCZJrpie/twEzA0okjkYw8b9R1hIWt+JnLasQsz2KZsjwsOUB04kWyOrYpi
         kzkyXuL7vuHuUtptz7C9z0ETxDR3dyxuTWs4Lh1mQCabFKgB6tZFjc8U2wnIVxsXTLkU
         rS3Aq5YyzVksimvxIMUNVn2X0miQLQ/VJ5sH4z56SEwkhtJ7jIwJN7bsH3wzxeBkGC3C
         i62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043127; x=1781647927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRFLeAm+ZIb8Ah+Gyq2iccaCBid+13JpRL0PKWMiPUg=;
        b=C+vfY4Db689UZbmnADVu/k5ZKzaTdbxkaUmonM+kSrXrIlJ4gmCmWONjE6qJHu8gbB
         V386dPiEwIhLgOZoOj6cyakBChQ0n71/n+sXDLMcwscjpFmYftp0Aro613AKEAmyhhd5
         lXWQQM38QWTme+pnqqEM7/2sZTC+TYXe4Qu831gPjXNdW2Ei7K+XfuyDVth/81R5SC55
         cv2U/xcOPQ6Xmtn3TnEpnuWqx1vYI+VTC73fUwOQph+FRmXPHsA/aFQk+bxLn4nYoYtT
         GFTFBhtjDja3yshkXeJWxHh3G/vrOkqqaMJFbUiu5TJZLovPB4RQv8br7OAPD34hm+yt
         /5mw==
X-Forwarded-Encrypted: i=1; AFNElJ9IRP840Xi80BGHYXi4hjcn7PX7yaL9B6OyU6+v66ADrf+OthDV9OxrBXs800bBwU4NG9K1Njjwydh4cD5voP9bzBez2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw52UFviHKJeh049DnH+Qn9GjG/geHNOgIhwM8XQRLFIqkyT+lu
	tk8nIHo5HvGeZoIDhWyon4t337+mPXHty5ODiNQ+TW8TOl0AjXeTohgH
X-Gm-Gg: Acq92OFT6oHeCZbQuwxz1zfYETHA5kbSNysqoJMEjUJK0Ybk/0vFPm6IzlcXIXjS2M3
	0lJ09Gv5/6LWU3rK6Dxo3zsiKM6tBRJgOB4N/gSq0UyWuoeCrm/z1w0KIgNx8rS4h1YEKkxote7
	R8/7eududY2as1uQofoHa3/fTuZto42SnFtTlywciwL0jAvKD4V1VZSiPZZc1B3z3gHCdPe0LE/
	pS3hUFR8bpTgdWkbUbL7fWFLEkT4BDnN0RWt7s2m5Bt6TaM0vQVI/QrEPtqXgWAxnJSyFImbdhC
	ldFv5lXWaCfuZXnolE7bJYV1QA1QJP0aCRV6JTWMFtaXh+y2W3q6Y9IS8bW0iupmhvtn0sqwlt/
	mx8QFFT6kgZmhQuCrssJXpKx0wkWNuptSe8XTOlJPrE8h1Psn6yqve7nkFgtd7tA3pl+9rdsprq
	KWGkn7sZ+BRi4G8ufzl1k5YQpvXGI97RcJ7iWPSTdh+LBw04BlYPv7HMQI+34ybSPOvC5TnA3bj
	5oAC8fTwYjiUxWa
X-Received: by 2002:a67:fb92:0:b0:6d2:1633:1803 with SMTP id ada2fe7eead31-700392f5baemr6130775137.19.1781043126899;
        Tue, 09 Jun 2026 15:12:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:f671:db74:6740:62ca])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96413fcc8fdsm17224269241.7.2026.06.09.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:12:06 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	a.nasrolahi01@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: fix unnamed parameters warning detected at checkpatch
Date: Tue,  9 Jun 2026 19:07:03 -0300
Message-ID: <20260609221200.123422-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detected the following WARNING: function definition argument
'struct adapter *' should also have an identifier name.
Add explicit names on those definitions.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi,

v2 was not applying anymore after a rebase, sending v3.
Tks and regards.

Changelog:
v3: rebase; the rtl8723bs/include/rtw_btcoex.h from v2 is not needed anymore.
v2: https://lore.kernel.org/all/20260523142312.9223-1-rodrigo.gobbi.7@gmail.com/
v1: https://lore.kernel.org/all/20260407133416.13983-1-rodrigo.gobbi.7@gmail.com/
---
 drivers/staging/rtl8723bs/include/hal_intf.h    | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ee8ad26325b5..8a85e8419e47 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -239,7 +239,7 @@ c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid);
 s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
-s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
+s32 rtw_hal_fill_h2c_cmd(struct adapter *adapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 6977892a5742..c8592c4753c2 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -215,8 +215,8 @@ struct pwrctrl_priv {
 extern void rtw_init_pwrctrl_priv(struct adapter *adapter);
 extern void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
-s32 rtw_register_task_alive(struct adapter *, u32 task);
-void rtw_unregister_task_alive(struct adapter *, u32 task);
+s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
+void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
 extern s32 rtw_register_tx_alive(struct adapter *padapter);
 extern void rtw_unregister_tx_alive(struct adapter *padapter);
 extern s32 rtw_register_cmd_alive(struct adapter *padapter);
-- 
2.48.1

