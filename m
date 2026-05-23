Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2A33A5E6E
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 May 2026 14:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779546203; cv=none; b=cV9MenY1PPAEh/OCTLxcoBaKOzlYRk0xmRfzh5tr7YtvJT7fet0OQpcGsxXm8/GV4a+IsWe9zbRkDnpb8ngm7f6aK6Z/hs0QtHSoWSm/6+s+L/GWnmZADWQkm1hxyXiiczRY51H21P+V/PO3jpf1ZhWZFik8ssfYWHkt8MMUhBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779546203; c=relaxed/simple;
	bh=IA94beLlgFgNnR/mzwcV2gx/sJgJDQl4FswMOGNqdFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Za/+XhnMdV3/5NIiiAav7UpXUC57ywCH7qxyG4y4DBcT4BKGPzRgK8JkgzRiIH9xWxRh3M0K6O/fpCnEOsUvIXoNBDTmL5K6VdsvqogKr+p37HIGgAU64mJmVruWJqv0ZvrHVmHPiJNnbhKU6PRS1mfwAaIH1KAEig3x4iRzBN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En1a05rg; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En1a05rg"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9618b8bdc51so88322241.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 23 May 2026 07:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779546200; x=1780151000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlT2zSnX17vDDLfqokYYdNJkwNYXYU3J3hA/g1yO64s=;
        b=En1a05rg51XUlBWEAXTJ49yO0j94AqzqFqd9gNG/JS7EFAcJdLKL1e3UAZQiqDR6xV
         +6HDxkOEmWwWX0150QsHxdZmLdegq59DVC2T7kRPG2Ii8cBjXmBckfLnGiV1vrxaS2jh
         XWeS/kQo6mKeatrfRy9JZR0q6bIoRUtm9aSgwAQRvAYzTOH0J39icmusSR3kbU25jLSy
         posGEcc3wptbL3RjcESwLE7irTOpcjxWgqQzxJmSLOLe1wae4xp/c/95INPfxjpWt14m
         AwiqB1HI9uPZte5KTgbGxXtEA+AK30ZhoIUJzh7qRty72l3bFzhT0mcOxhX1rhgP0oKu
         XIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779546200; x=1780151000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlT2zSnX17vDDLfqokYYdNJkwNYXYU3J3hA/g1yO64s=;
        b=o2cZhmK47ogtJfj8rg4qxgRCl/hWOcswUlqk2boQODXAS5ZyRl+1ynZQqMqb7l81Kp
         A5gN7Ja1iIcFuDLHCn9wUNiY5JHmbBmXDYdFv6C92S8lZoq6cYDTA++M1RbDn98b0CxP
         c+x2hVv/L/DbzDyimqETlL0VK/DifJnkTA2/w0DoFQIykEJtBK9Z0iNUU5aQ/tWam5AU
         2nmimbODhBYyu/ACRz+H/+hI2U8VJ5xoxoAUtz7QdmCfZKHxR+kpRmMQ12WHvOnZSH++
         MXZCzRQqF3wpaRJA0yI+VrBl4OW1SkTjKIjtpyvyfCEfc8F94rcHnztKwFenvbcmP/HW
         DGeg==
X-Forwarded-Encrypted: i=1; AFNElJ828v84d0p/KHaZ/vQMeh7yT58TmC+Pd3+ymt4BPhoFUdJc9QSq5hjPB3rq9l3EzMI7iMHD3iS+hoUuisW3tXPPJTRlGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwQuBeRlfltCLPabDjMiOl+R8O2n+FP1AfZL8vtTisE3PcwNNb
	UuwiG7fEP0FKGS1uUzyYakfjpEMlh2+DhaqvKTX7ZlmAdQ+L2Yxr0444
X-Gm-Gg: Acq92OGIjXXx1PVeYGj1ryRfm2PlQAe5X1ZZDKfWy9Wp6iTWIRted/S40e/ijGXA2ZH
	q3JGUavpgcWhfxPTRiuCZGO1zPaqxhcy7pVAX6qAmF05Hz+DNT/HdjbaR2jporDdH/1HIKRHnTG
	TbpryxL03TEpaS+yAOMeF9I2I5PfwQgwk/Dccgl3tkjZo+04ykB9l0+gIpjg1rsxK7k2e3WJA4c
	x3YUAw31/vXpeSB2O0cB9if8iaLgwD58Ojmc9WroZ1PKUWH/hRNF2fITNLO7SZHsbnoObCAfrxM
	NZLdaKxoBNSq8L+sCuaIzkx9IBSG4FIvMnVoV3NdHAySGLOv/4IJ1wtYPAWddXw7BF2uBZ42Vus
	hWVFwCCdS3hIDM7xMkaplYRFRZliYGdvEBoMrtKVq4N4guHfDPQpHLDc2wI9MsC92d/N/MhmEHj
	qprFpG2KV1bEkUtnShYfDNCh51UC5ullZoRLK5RGX5kRKd1XRbFLi2cy6Zws9dntUjFUJhHDTCL
	5wOqQ==
X-Received: by 2002:a05:6122:8d3:b0:575:24b5:88e7 with SMTP id 71dfb90a1353d-586628bc866mr4267961e0c.11.1779546199957;
        Sat, 23 May 2026 07:23:19 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:a6bd:e693:2cb9:1e78])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-588c129cba5sm3709183e0c.14.2026.05.23.07.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 07:23:18 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	a.nasrolahi01@gmail.com
Subject: [PATCH v2] staging: rtl8723bs: fix unnamed parameters warning detected at checkpatch
Date: Sat, 23 May 2026 11:18:43 -0300
Message-ID: <20260523142312.9223-1-rodrigo.gobbi.7@gmail.com>
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
Changelog:
v2: use adapter instead of padapter
v1: https://lore.kernel.org/all/20260407133416.13983-1-rodrigo.gobbi.7@gmail.com/
---
 drivers/staging/rtl8723bs/include/hal_intf.h    |  2 +-
 drivers/staging/rtl8723bs/include/rtw_btcoex.h  | 10 +++++-----
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index b193854bfe6e..55c0010968a3 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -252,7 +252,7 @@ c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid);
 s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
-s32 rtw_hal_fill_h2c_cmd(struct adapter *, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
+s32 rtw_hal_fill_h2c_cmd(struct adapter *adapter, u8 ElementID, u32 CmdLen, u8 *pCmdBuffer);
 
 void SetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg8723BS(struct adapter *padapter, u8 variable, u8 *val);
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 19764c80b8ba..9fbb145c8d45 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -15,14 +15,14 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *, u8 mediaStatus);
-void rtw_btcoex_HaltNotify(struct adapter *);
+void rtw_btcoex_MediaStatusNotify(struct adapter *adapter, u8 mediaStatus);
+void rtw_btcoex_HaltNotify(struct adapter *adapter);
 
 /*  ================================================== */
 /*  Below Functions are called by BT-Coex */
 /*  ================================================== */
-void rtw_btcoex_RejectApAggregatedPacket(struct adapter *, u8 enable);
-void rtw_btcoex_LPS_Enter(struct adapter *);
-void rtw_btcoex_LPS_Leave(struct adapter *);
+void rtw_btcoex_RejectApAggregatedPacket(struct adapter *adapter, u8 enable);
+void rtw_btcoex_LPS_Enter(struct adapter *adapter);
+void rtw_btcoex_LPS_Leave(struct adapter *adapter);
 
 #endif /*  __RTW_BTCOEX_H__ */
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index c27d07861b8c..df5dbcceea06 100644
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

