Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74B42DCBE2
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755732078; cv=none; b=Oefz6OGok19XN987b9xpHF+NWhr6UxAhFDGLLVaiMTJ9oxMwe2OM/dE7tD7Oq1YatAMJ6kZnKHiz4tAVrmlWlP5Kj6huqZ3/nMs/pXlks0mYjaGcbd15LeMk5a1CLGqq8jpGh+U4U5+KkKXupesKLLqzU5Kk5NkND3MXM6PYW/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755732078; c=relaxed/simple;
	bh=1O26ZmlZTBFnDBaRzFsCpBXq44KkJ3NiHd/7+DVWzDs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cXNB85pe6g4eSpMvYwQNAgz5W3XQHGS9d8SMR8Ctix8qRHDd52WD7XK7LGhvmGIj6jy8+fQsaLIeLW7gsYm88ZYcl4Qz+jYRdWWIZ5G4F5qCIvceqa57BAcDDqBgj8L3c71rJc2Gr8C6Gk1Owt128/DE63cdp6FHw6r0OHZeCQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EzsBCpeC; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EzsBCpeC"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2eb9ae80so486986b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 16:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755732076; x=1756336876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cp0W+YHyL3b7/DABNObVBBIC3Jh59WNhUlEgXALj3L8=;
        b=EzsBCpeCzC0uJydkuC+f2b26lF/762bIY7IljLHU6NgdcWVqkHGtoZMHB/vnXBMXla
         Kl3HhMWJJ/KSU4ce5yD1daaUCGBVUZpBGWffCiz3dTVEONRYZPu9doq0ccN/IrXoqlUF
         3I3af39X8Udwu2B/CCW7HBoLT6UEooDvKuftk2bI/R898j/HItLa7Yhz7eDBXT2alsSZ
         m0guQaicrZVMx+nV7JikuwgI7KJlfDrDQfURgVMtGivpjgUPP3dcEpaWHiDa1FvItSYx
         2Ai6QDvBgqa+Vz6/tdgfiomBEoUaB3z8/PpQ88pHYmO91Jw2vrwHlobc6fyh9G0xH+G9
         ke0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755732076; x=1756336876;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cp0W+YHyL3b7/DABNObVBBIC3Jh59WNhUlEgXALj3L8=;
        b=oNEVZUhK589P2uy9RUkieTyJg74/r1cBfvhKVLFtnBa3+2iyREEHRqWfFUMTLvPLpO
         /VU/loVBdz2Cds/UoYWrhv/akgLQui1Sd4171LoICgfqh9YOhtnR95qnXQY+r+KB6TNJ
         Asll+vyL7DX1dFm/t6y9USCwMBP4Kamjeo7xoIf7xrFBAm5xishXi7BLPZsp8qLg6hoT
         azV37nzmmQ3dGkdvJP16Lk4U+exqDywLAVZSiT3YekJEwpAx1j6bcU40GIBSyltyKYwV
         hUHlgMLNTTA4yPWnBhsPfZjmobrvNJabHmznp6/+9mbJa1D3e/zIDK18VrrUjJwNZk8S
         Rbgg==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ee4b9huZyRbKeuGaSkuMyU0y8PnQgU4SFM3xjA0voUikbpd5lJh8QwFCZQNslHl5In1BX9Y8f/+sTtt4NMP93K5tww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPHQa2vAQlC67ouw8z2yg8wQl2i3+uqyA2vArM/6EQmNriCLH8
	3SYtzLSAnoq95fsR2VJpKF1m9vEUB0icFQFEtZQK2u11AayFejyEt2zt
X-Gm-Gg: ASbGnctSjb2h48p2FSVCOVUAytYFlbbTbAP5x1AMBt5Y14eMEAR51jms491bl7TMyRc
	ZbUVTfFjkKzb06x29oBuUgRfaV5NdlapBJigb4cIIUsD34Px6r8KMQQsolmgXjHVIbrWfS0+X8n
	lKfRXp61BrFXHP6jsI9yaYXbPH2JqYkinGRYXUY4W5tQa2izJ0GnPkAWrYntXoLJHH5Z7aK9vTx
	Ye0b3Se6wW28Qd+/O4VXPx25HABKfOUBW9OsfB1eMnpZscKrElaKhZ0aF6pwUj/wYuJJJFnczzg
	wozbj3U9stSBcbkCoVYKmbBBBcfPuD0MERCmeppHxtowmZStW0Bl7LRPwSkP3Vmnx1+auQBEIAI
	WlV7v3KVdX7UarV+t+W5g4waHfDB+vs92+iGRCHY5O0DoRc2xDP+gMC1nYbUMjr6XSByr3PNwRT
	IiEfoc5K+GNLNlKZV0Vg==
X-Google-Smtp-Source: AGHT+IFu41U7HMCbVl0868B0wK6iFMzUxciCdGUYL2r8RBObvrHpPnQpeBEYNndHyp8/Vzl3RwHCtA==
X-Received: by 2002:a05:6a00:1408:b0:76b:dbe2:40f6 with SMTP id d2e1a72fcca58-76ea325f93dmr285843b3a.23.1755732075920;
        Wed, 20 Aug 2025 16:21:15 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e923f8364sm2730963b3a.107.2025.08.20.16.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 16:21:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:21:13 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Alperen Aksu <aksulperen@gmail.com>, mpearson-lenovo@squebb.ca
CC: platform-driver-x86@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation/wmi: Fix Typo Error in doc
User-Agent: Thunderbird for Android
In-Reply-To: <20250820155904.32685-2-aksulperen@gmail.com>
References: <20250820155904.32685-2-aksulperen@gmail.com>
Message-ID: <24912814-6891-4223-BCE3-87D1CD6D9A4D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On August 20, 2025 8:58:35 AM PDT, Alperen Aksu <aksulperen@gmail=2Ecom> w=
rote:
>Fix to correct spelling of "Hardware"
>
Hi Alperen,=20

While we can fix the spelling of these, they are currently as provided by =
Lenovo=2E The spelling error exists in the WMI interfaces and during develo=
pment we decided to leave them wrong to match=2E

- Derek

>Signed-off-by: Alperen Aksu <aksulperen@gmail=2Ecom>
>---
> Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst b/Docume=
ntation/wmi/devices/lenovo-wmi-gamezone=2Erst
>index 997263e51a7d=2E=2E24b027362e93 100644
>--- a/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone=2Erst
>@@ -126,7 +126,7 @@ data using the `bmfdec <https://github=2Ecom/pali/bmf=
dec>`_ utility:
>     [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void Se=
tIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Descripti=
on("return code")] UINT32 Data);
>     [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] vo=
id NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, D=
escription("return code")] UINT32 Data);
>     [WmiMethodId(67), Implemented, Description("Is changed Y log")] void=
 IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
>-    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")]=
 void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
>+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardware ID")] =
void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
>   };
>=20
>   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("=
Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C=
628FBD2}")]

- Derek
