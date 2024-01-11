Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DCEEBC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jan 2024 01:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCw8WCRB"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7734D83D1C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jan 2024 01:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7734D83D1C
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aCw8WCRB
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wh7sGR6aVoLT
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 11 Jan 2024 01:21:02 +0000 (UTC)
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A2A1083B58
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 11 Jan 2024 01:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2A1083B58
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5ce74ea4bf2so3123677a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 10 Jan 2024 17:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704936062; x=1705540862; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JHpvuaXHtdCaSG+65uNqu4N8NK53ELdVOys3xfjWvOM=;
        b=aCw8WCRB49u3dsal4LAvvyoX4XoYrdUTTBW5pDyF2RhTFGPsSPOF4tY1X/ixZgL/d1
         9Lxrk/vOAQSbwInUTt+sofoDgwzaurRpgLVosf3aPsiTbgyQXQazY4ZImZE2V9BM6xMf
         hyEUoWA+vqMCZimCKaC8hIf/SQEIFWWXM4vMOPxHFyMzgkMHQVeI1/Z4UpU6eberxmoM
         ZIu4XLMYoTWTZYQPd6sKa+XNKeBr4SM3dr90bPt8pa1r93z39MZbR3ilmHsTv0QCCfqj
         WhwmRilFtpIIbErujpqHTrbeO4P95F08bMTlHEZr2FWtEupQhU+PnY0voN7Nmv7J6EKH
         NTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704936062; x=1705540862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHpvuaXHtdCaSG+65uNqu4N8NK53ELdVOys3xfjWvOM=;
        b=MOXFqRxfj6EP5YWUbZMLe/+xiQWP9i6aVeyJnZI0WUQ0bpCL3CmFKnGc69gRTSU/zd
         INMNcDPTUGdUYzDLCCm3FgaHOEZ9n75lZahuts+UpjwA9S/13/zR68s6wrmkHcAmlzTi
         uJPaKpH2mUeVOx0j8B5YZJYzzVG0tnxFQCGHtiNtgJRalOvmke4S/PpQJ/PCSFSUZU1A
         0OXXmY5LjeWhw38TgUg4cTzlkswR2MuVKyIlOjUOu3qkP5t9y3+IISUvP4M5GKNrsQuT
         VQJl3Vx6oJapM+OMEVdVn4WtWnMxHyuzyXObLornV8lyNvcLoH9pxEpVrAr8Fqi1kgnD
         iK7A==
X-Gm-Message-State: AOJu0YysysWFYO77AREdSUGKrbuNP0ppQjudM147ouZAKx/nuNg2OJAZ
	pPkamQLglB3RuH5V3yt/q4Y=
X-Google-Smtp-Source: AGHT+IE14qvrP/2cLWY/HBlCo+wLDJ14aOuepE1K27DJXRzvWLp87IZxeCygH+1D7lZKavhdCWqoGQ==
X-Received: by 2002:a05:6a20:9706:b0:199:fffd:a3e3 with SMTP id hr6-20020a056a20970600b00199fffda3e3mr405012pzc.52.1704936061575;
        Wed, 10 Jan 2024 17:21:01 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:70e2:a0a5:5166:fbbf])
        by smtp.gmail.com with ESMTPSA id v6-20020a626106000000b006d98f584ad5sm4262356pfb.199.2024.01.10.17.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 17:21:01 -0800 (PST)
Date: Wed, 10 Jan 2024 17:20:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Anshul Dalal <anshulusr@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v12 1/2] dt-bindings: input: bindings for Adafruit Seesaw
 Gamepad
Message-ID: <ZZ9CetbTOHuVzR1A@google.com>
References: <20240106015111.882325-1-anshulusr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240106015111.882325-1-anshulusr@gmail.com>

On Sat, Jan 06, 2024 at 07:20:59AM +0530, Anshul Dalal wrote:
> Adds bindings for the Adafruit Seesaw Gamepad.
> 
> The gamepad functions as an i2c device with the default address of 0x50
> and has an IRQ pin that can be enabled in the driver to allow for a rising
> edge trigger on each button press or joystick movement.
> 
> Product page:
>   https://www.adafruit.com/product/5743
> Arduino driver:
>   https://github.com/adafruit/Adafruit_Seesaw
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Anshul Dalal <anshulusr@gmail.com>
> 

Applied, thank you.

-- 
Dmitry
