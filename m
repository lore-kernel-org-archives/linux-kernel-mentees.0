Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299CF146D45
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Oct 2025 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759800139; cv=none; b=PSie9UqeH4bjw/RqIpDWLbzocEahEqqMZdymjnA52HMfiuTgbt2pRPXp89krcYxLGDl+0A4H+q+Y0MWLR9YMKZKfZgpZFVfQWqwaOP2QDU6MFA8yOU28+9t1+uYP01LFZLBPRjGDF0jcqqS6lWiqIOkY52LP1YUoFgoHGDbg+mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759800139; c=relaxed/simple;
	bh=H/Vde5fSyegTVrxDL779b0Ekl1TqghJb8VzoeMUW5sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q647wDsWNMc8QHyzDKXFmhGVhJAyjHmcA2FmsPlNsOy40iJrCUcYXHy37wcvAg6E//0I6zZvB0twcXgc+7HacBTWrL5kdLGlaY4TSWrFoa0UJ8pb34LmowZgFbtVvaXmuQ6lfby+mWJXNvkSJbiIAIEsXcNHu7+c+P6EINTJZaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dl2Lp/RY; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dl2Lp/RY"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5522bd69e14so3325685e0c.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 06 Oct 2025 18:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759800137; x=1760404937; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oeZtd1lS2iAL5Eb5txNbBPZr6F+hk2iic2qSNfSBlxc=;
        b=dl2Lp/RYS4UvoZnB+isEbT9xv1xFOdGZ4cwLEoZ/X8FC/g7KHvl3oqPPomvphZTyJZ
         GOVwpPakMZTZN+H++T8PpjML66rgJaSuVJIiJqIesoSoI8qOcsly4J0IaE4qsWFw+Wl4
         CBEvqRrR0OZs3Di9oo8iG/Mb58ooHaO6mlM34Vm8VQDAtgmAZJT0OoT8juEDUJFL9FGz
         SlJ8BD1EaLTUmQg+l5j3O0PQl059fK12U/iyAEm3B0F8M38Ogasvu3gd8WECbTWXHNQu
         y3f/HBbGpkKhNnnCv88DbQS1y6QfO+BrqnU/obRTSzyvDr37TGRRqsdDsq5LopECRV6D
         DJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759800137; x=1760404937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeZtd1lS2iAL5Eb5txNbBPZr6F+hk2iic2qSNfSBlxc=;
        b=uAp4P8Hi0lKGXJGyZ5KDLqfqIomA95tpzh/kJ8PAozqNJnpOAHjlYYB9/sLsTeox2Z
         ioFpwXuoRrGLgB5g25Ablkgls4s1IPIe8k29nGpfBmpU+BaT8E+vGkcLXGxTGWRnGCJ5
         lekAk1w+gIcF9YNyuuIl2Fl4Ftf5LKJrAbRK9vMzygFB9EePrNpI4PGPUJz2bk4Tzy+P
         iprxwbkVpPpvgjNY+HOFFtQK0jC//p4yMY9En+4mPzqCE+PXxA4KD8D2Gw+au6yAoITk
         9FhDrwjYKFEQ/b1PDCsGG2/mw7mtMIRI6tV/v21xhgrfAGvWL64VZ88LvFBxK1spEaYx
         S1NA==
X-Forwarded-Encrypted: i=1; AJvYcCWvAtb+14j7Dz9TRir3V8OQOMKn5Ceqf4y7G887+jycelwc41qfsd1D/97KTvQbTR1YY4/pry2/IHD2lfPevT6F6qLlUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1K/sM+v6rwy/jVM+D/lOF3pc3wIjEQSocuDIae9/CgWni1seB
	hOGOMcYsKEsEe1mcpy3ksQfHYjCp5iUjs6koUAv9FXezLkDDp4njnmPZ
X-Gm-Gg: ASbGncucuXNzJ95sS8YSdb9zqOnlwVy6yKyS/lyNQZt9LjkiLll0+HIBmBJaVTmxq8v
	7THlgfxWoIau310mKNJK2yRQyTbqjL5sjCwnN7Ttbs5c0OdNyLFKK4PCNQA/LIkkOgObxBbC755
	oocUIpJ0FL4YIA12pTS9J8c24oglaCt2+EDaOEM2cgjkBR3drFRaT5cTM2iD4V/v/Bl3JfqiU97
	4dvAE+nEMycwbIX3Zj/eS+A+cqcY7EYdiivqtAaoj/ScCakoNrjB0H1wzMcTitQKqb1zbEHYSR3
	5jycUI58VqpfKtdJf1UbMhTo/tM6404UOUB8aXNJ95rBDcjaCFVmNQtaW6Er6BbB7Har/UpsJh/
	08ypCEV+sZ0beYQhgVPNx9V046WVPaK8MIZZqqvXNE4Z+4L3fgwpzLchp64gzo3M=
X-Google-Smtp-Source: AGHT+IFmBzhKhtg5t4PSLIdciapJfvhjo0L3FJBJCxbNlT3KY5aZygpXM3hCFzRlcEVz+ZGVmyRtfQ==
X-Received: by 2002:a05:6122:514:b0:54b:bc60:93f8 with SMTP id 71dfb90a1353d-5524ea2517fmr5491547e0c.9.1759800137067;
        Mon, 06 Oct 2025 18:22:17 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf6558esm3444393e0c.22.2025.10.06.18.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:22:16 -0700 (PDT)
Message-ID: <4124e1a5-fcd9-4ce3-9d97-5ebe8018207e@gmail.com>
Date: Mon, 6 Oct 2025 21:22:12 -0400
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: usb: lan78xx: fix use of improperly initialized
 dev->chipid in lan78xx_reset
To: I Viswanath <viswanathiyyappan@gmail.com>, Thangaraj.S@microchip.com,
 Rengarajan.S@microchip.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
References: <20251001131409.155650-1-viswanathiyyappan@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251001131409.155650-1-viswanathiyyappan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/1/25 09:14, I Viswanath wrote:
> dev->chipid is used in lan78xx_init_mac_address before it's initialized:
> 
> lan78xx_reset() {
>     lan78xx_init_mac_address()
>         lan78xx_read_eeprom()
>             lan78xx_read_raw_eeprom() <- dev->chipid is used here
> 
>     dev->chipid = ... <- dev->chipid is initialized correctly here
> }

Please describe the testing you performed.
