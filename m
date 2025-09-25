Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A402DECBA
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 01:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765471; cv=none; b=ca3TxtlAW9oDMTgheouqRhUk3hUcyOPR8xX2X3QjVzjwPKJnG8ofVzV9WHPpfCUmUGwm0VxY8k/mXpaLaZkBHhx7YDiikP76UmZPX1MW0nRw4nbgoYpANPIizrxaVLsSuvy3XDtHnsSLP0feDtroF1Sc0222kA69IPh17BhvQwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765471; c=relaxed/simple;
	bh=BzE2nWlHaSb09IJHmQN5hhf4/KfURbjwUnfIYkRiAM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTc2CeZCVSrD9AEvqCoKNbOiyct9hBe8kgmhXm64fb3cOhLBMhdxdblCh3yXFjkZtn3PwqBj2bCf88lmWb5p5iSzLuaJd5UNS493/c4pStMl7XNWYGqoWs//RkVRecZClGYXAkL3pOChWYcRxFrEf9YDM0oUmb84Co7Q8Q49NjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DY1mnRTO; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DY1mnRTO"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62fc14af3fbso840541a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 24 Sep 2025 18:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758765467; x=1759370267; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BzE2nWlHaSb09IJHmQN5hhf4/KfURbjwUnfIYkRiAM8=;
        b=DY1mnRTOFnVoVXNNQn08+PId3emgw7NA2BBuoX57Vr/Z3tmhONBsSN1CNMgpYrVrPu
         GXAvrDPLUfitasbD5yhE8+e88JAcxo8DLLH0vc1THjt25SAKf3TJWv2Cheke4VPWWhtp
         6XbdxKiJM6e+bpDHAWIkMdCshZLv2KbceyEtydCtX459bFGUqnYvyCZh+d0e1H4w9FyX
         D6dc+gpkiSrNfi62QmcxlOaOWhQ+FyVOFW+/WV1gpdOApVY86YuCKA0nrzAh0EDgTy5N
         EeRRL5xwniVU0u/IDBgITYKyUYn4g+bOIB0+lSqYcexfG+cy+u2GLD4XCcc/S3OJeib5
         vJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758765467; x=1759370267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzE2nWlHaSb09IJHmQN5hhf4/KfURbjwUnfIYkRiAM8=;
        b=dJDSxq6/LU3/s+O+s7WJJ9yyAkX0F4vhrc6l7q7zuqLvlDjYmbLsDqBr0yCVfuFyyS
         R9D25xsfw0dJMnkxymhPhufKtq4f7YzJQP0YBe37I+Tp4vcpPOHFoaUpCr4IkT/WDdVg
         qcyXHQY8P5uHCvYECpA80Pq0FzUzbHPW6pTH6G7HHFDHlaXQD4Sdm+gtCx1X7drMvLx/
         q0ZRPvqnserK6QEPsbUmy6buSqmE5THmAcm+/Xp/PWNqUQJIXkjaraOnPVNChKfmXX0P
         YH78QXT3clDzrrawuYzR/JnFz77AIPl6H0RUVMxYLNNtD5mxDO2W3dt1TWXlw9Cj4Rp/
         nNuA==
X-Forwarded-Encrypted: i=1; AJvYcCWNMWHlIRufuI2JcpF56rylM9d99KQDW1aNoQPkhgdPP4K+RlcEK+3V0EZYW73s23XsHYhwNFvsxQ69KOhRGiCRWgaLug==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlzNtk3Nx7ey/yqilH1GcL63ex0zRXPtpAtdpl0ZaZXd1/3zvd
	OmOCG3OauBX7rqNcr8iYdkxb9djvBsrls73l+y4x+iZG4Sn9O7edr5El0Jw3mBXu6p5H//EH2AA
	jT7lWs897HgI57UAXgLUr2Wfhapvr0J0=
X-Gm-Gg: ASbGncsAT2YPLFZ2Nw1Kzp1rnA0NhZ/fYB2exLkd9Tf45z2FJ3uGj65ZRpd9K77GAUS
	zlqzu3XLETA3n6WAQDGld+SZ1UCombwWuIr5VZ9msog5K26fIaheBNJkMgyYTM8sOMFN3Lqpret
	LxYFfHKfg9FKS7/2oTs3I8ey2u2yLPWiVhMHlHjLv09f7rif9KrpvfGn/YjJpdipSWGqGhddEoh
	NWYKBfnJb/rAC/IcNPUdgIQa36tBtYBatDsA1C0zVntJRtvXGmv8Rg5
X-Google-Smtp-Source: AGHT+IF+/+JTZumqPSyotdgOAvpzeHBPXP4w8U2968XjiTAnXz6ZQtIbPEAD2FTktGdPpJGqn+Q97s4zzwKHhgbTGFk=
X-Received: by 2002:a05:6402:13cd:b0:626:4774:2420 with SMTP id
 4fb4d7f45d1cf-6349fa71749mr1317160a12.20.1758765467408; Wed, 24 Sep 2025
 18:57:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924134350.264597-1-viswanathiyyappan@gmail.com> <20250924161835.63e9a44f@kernel.org>
In-Reply-To: <20250924161835.63e9a44f@kernel.org>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Thu, 25 Sep 2025 07:27:35 +0530
X-Gm-Features: AS18NWDW6_dN93pbRL3G38WQSpiXZWIIBNijqFMY5K6yqGxEhObamRG-8b5i7SE
Message-ID: <CAPrAcgOQmBHkehYTpeLds9yobofXhxJmxAa2Nq80b1T3HFZZ0w@mail.gmail.com>
Subject: Re: [PATCH net v3] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
To: Jakub Kicinski <kuba@kernel.org>
Cc: michal.pecio@gmail.com, edumazet@google.com, andrew+netdev@lunn.ch, 
	davem@davemloft.net, petkan@nucleusys.com, pabeni@redhat.com, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 04:48, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Wed, 24 Sep 2025 19:13:50 +0530 I Viswanath wrote:
> > Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
>
> Sorry, one more nit - please spell out your first name, not just
> the initial (in Author/From and SoB).
> --
> pw-bot: cr

I know it's uncommon but "I Viswanath" is actually my legal name

Thanks
Viswanath
