Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D6B288D6
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  4 Oct 2025 03:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759548137; cv=none; b=WBXD63oiOThC7M6xEYKvHrC8FzHizNFgSEUfiJnLUhHJbojFe4egtAP6MYZFQkmwQe7mwwrKDNUGAlX11yihz7aClxNsXHU9KB5xNekx8sLeRIAmIzzwszCFaGtFirRipeclGHtAf7fSX+PKbpOwbNx/o2WrjgVv7Revawz5dbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759548137; c=relaxed/simple;
	bh=ey/UirZuMoQH6VVDj0zZ1/9OEU+uMzZ+O8OKJwtAu/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxioZx9fNnpSqI7K7mFkyz1Nig/sxy0Q9h3xm2lMoA+vMuMlGokwsXLeMZ7is/e2D6ZoWQ3BwIZNKLZ/0u4i6cdUjBq7sT9adS4AJRH3T0FoEyFV+bhnqShMah/whQ66qZTC5Awln4BXoijEf7yPsuIhWpjOvyTlRBSueoQA/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ho6+aKTq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ho6+aKTq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso2533529a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 20:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759548135; x=1760152935; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vT/ORNW0pW5y5PIVl3vdZCajLNmtGvBDvw6fpaJcnVQ=;
        b=ho6+aKTqUrjE95lbxVRySjbv6bKLzL6xMek1hPX75gQBBvhNzlFN6TCIOp0we8njh2
         A390s0XaVjyIAMC+yTxSRzD1XEuZagQGql4Gd3zFDt1Z10gVhRo5RGj+Gi+X4cb+DJzw
         UIiReVO2MI744uB+gM57EUWCtQAV8ON/CV8Lyn77j4RNm4G5Xr9r9/TCUdMH5Ox4Px4n
         ZCQW0JZtAaoTBMwUGZU38bNtLJqbhQe0J06bw5L+yvuvHZITx+S32JvvkAMW3chW5hFM
         kah8qbx4MsMBqn/CzK5SvihoARTnaabY8QJu5Wxn6v3wTp4Pit7cLqD6l56joN2q/WOp
         J4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759548135; x=1760152935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vT/ORNW0pW5y5PIVl3vdZCajLNmtGvBDvw6fpaJcnVQ=;
        b=umRqAdzh9hyZnMKTgpA+dV6a1ttC9b9D2E6vuRGDAPtxbcdllQK1kQIRXrB5KNfJR2
         2JlxoVa47Dtidrr3uX05TY99zxr5rOXY4U3jgqMjBpN3C0mYNubWIun8lDG2ptfZgMZG
         mJZrmLoANRdBKtbV8UjXnc/gxYoGL5A+F1Hv/2/asox7pGHeuvkq8FJIPn+ACl1pwyAW
         zKCVj9IQUKaSNdoFy2bp8j/U50wQWJqaYK8Ik1vj5cMP9ML1EHlspmNZezeCchmQ6hJs
         5AQVuC9fETV+wXy008jVD8v3Cd0Uaom+KVzBiBCodIEyNap1NAKMEkyOOFyvWKE1s2V2
         hqvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0QXUOgBnb3nnUGpXw6WO3s5I1Wc1DIyEWJAcJp5IEsmigcXtBuXkok9YSAf9z1C4OdPqNwuloVG2qgyKQgmkPqxLS6Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKwMTokvuW6A2yCtcyK87QFPRycIEMMCVBkI4fFlSpKgc6nU6R
	I+179LmTKgfojPZd2m/vg7ebVpOVDObgTP+xlxol0y/kVSLiZoVid8tM
X-Gm-Gg: ASbGncuS5MkU3YJvr9s/oJs8rgY/CcBcj2b17l97HiTdnGAhIPCq4UINknhHPMcr8/5
	8pVymz4QRH/NxPgnozywEhJDwRrS6KFk9wmkZEbELTF/8QgbNkACShNpahzS4UkklsO0Yd6QXuX
	LYNjDxZIrUnWCDFemgZguK0NFDZCtsOb3+nA6VcblBE9skeYSs3Vtc4D4JAD9qyksgi26aEaMoQ
	il9BJ6g7zgPIKJGBTqKuZy586Z04v/QH7Vjgmjf8C0u3zzCeHAUH5PLIOVeFvu1wVK4vkDI+svb
	EeibEXTRUKY83a76rQKnRyQXxKpuWZko3EmFVgxqDDLl5T5snfzKr1W96AmfsIOc77OrvXqDHE7
	TBI0d1SOlYN59UKVfT8sqYYErTDeP1rY7qHijkVZHagjnC1S1RTMdOC9rk3sS1jrmHJC/Eto=
X-Google-Smtp-Source: AGHT+IHEj0aXuUhMgTbCirX4CidHBDMcg5LPlI/yovtk5eB8b98mCogwEGyUGrgHax0e9En0MN3Xpg==
X-Received: by 2002:a17:903:2f8e:b0:24c:d322:d587 with SMTP id d9443c01a7336-28e9a60b519mr64976925ad.26.1759548135023;
        Fri, 03 Oct 2025 20:22:15 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.90.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8444sm64824745ad.86.2025.10.03.20.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 20:22:14 -0700 (PDT)
Message-ID: <21b1dc10-acad-43b9-a9c6-24abb2886856@gmail.com>
Date: Sat, 4 Oct 2025 08:52:08 +0530
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: Shrikant Raskar <raskar.shree97@gmail.com>, jic23@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
 matt@ranostay.sg, skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20251004015623.7019-1-raskar.shree97@gmail.com>
 <20251004015623.7019-2-raskar.shree97@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20251004015623.7019-2-raskar.shree97@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/10/25 07:26, Shrikant Raskar wrote:
> The MAX30100 sensor supports multiple LED pulse widths (200us, 400us,
> 800us, 1600us). These settings affect measurement resolution and power
> consumption. Until now, the driver always defaulted to 1600us.
> 
> Introduce a new device tree property `maxim,pulse-width` that allows
> users to select the desired pulse width in microseconds from device
> tree.
> 
> Valid values are: 200, 400, 800, 1600.
> 
> This prepares for driver changes that read this property and configure
> the SPO2 register accordingly.
> 
> Signed-off-by: Shrikant Raskar <raskar.shree97@gmail.com>

The subject prefix [PATCH 1/2] says it's a two part patch series. But I think
you send all changes in a single patch. If single patch use [PATCH] instead
of [PATCH 1/2].


