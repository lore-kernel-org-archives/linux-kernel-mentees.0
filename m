Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F13258A
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  8 May 2025 17:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746725538; cv=none; b=m8xKYRj7sjkLSZttjrBOJVKjp9xfRavXSepRi4iUt1fNaHFYRmPzvYKliCx8g2yaW+7b4pNbtDsuy5VKIkq1lXpldrLh2Np8mVWFoHeaw+8NUkXJDOCKhYrnTKhtwV7ExfzG25hk7I2L3O8HMP2h6b35NZZWVjAmiAtMLBH3ATQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746725538; c=relaxed/simple;
	bh=Czoa04WdZHAxDxPaTXnsEJ/wALLQLIdenMBRznAZXqs=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=oKv5H05IZ0OayeEURS5bAuh5sGBfI0Y1pIKl/33tPFIt3e+Zf+wO5E9m+x8rT8RfnhyKRC5iUfPGnzXK5D3t1T5e8xmCS3SVwRBYtYNOvAM17ggzsCVKkJbDb0ioSlcTPBfEYv0j5nj2odPwF+KLp20SsF2A1ZFxgkWfEGEjmW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=qMqe86PD; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="qMqe86PD"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e033a3a07so15443485ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 08 May 2025 10:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746725535; x=1747330335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IPMbNxc43AcR45VhaO0+Mz0+fFeHkW9XaM5DPtDrlDo=;
        b=qMqe86PDkzZl1U55bvrVTRaNTGq7T78dPdApM2AeUeVELvFXff+sMjj74VPVaHfGPQ
         Zn9mQYmiT5ul2t6AeHgVc40TBvk48rjNVMG7TQYe39B8DMoc9nWHxsheuA+vJoziaGdU
         zFxAgtNdk5mt145p8uzWgfuRWPvYs3n5oJZXQYbI1/VEcROxp2ri21EOHQieXCEo8Cvr
         hS7fHEbWuj0Vlsb3iE16B0Bokb+rzS91jInRRoRrijHfgbvdd/sJzhvNC85HftJPYXew
         cBbUozJ+8FGf0rXlhqeGCmSRLP9kBbMhVbTAhigROYFjqDKmI768pUPEqk4i46QZ1VOe
         90Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746725535; x=1747330335;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPMbNxc43AcR45VhaO0+Mz0+fFeHkW9XaM5DPtDrlDo=;
        b=SKnEQwmr7M1SLlNvirM4l/jznxaL5etvPz0Tpg5eGEZg7moXWBTWYN3vMxB5JcaJb1
         vmDBaeBn4GDiwqFWQ/x11rCALv7Nv/5wvAC3jVg8CY+WJOnDesDd9SYlMpsUMlhGMlhs
         BgZmX5QOSZqQ9F5+lkVXGXWd3ZcISSkrY/u/scWf0W7dzwPjwgIRY/wNnnGjGOLGwLa8
         +lFWT13bH7Wv0rtZAri99/PPTM1TZPSXbdfqb+fTkdisF/DiXpwsH6ouiZMY03kE7Z7i
         plGjNic7pyXP+BLMMzgR9Y1zyrHpJ5qw6IHgn5FlROz6eHWXPkgrVRaZlRltH8ExyKKA
         s5AA==
X-Forwarded-Encrypted: i=1; AJvYcCXGToiGjWE9q+CpyK30QQLYRH/gVNtyWZ82z0CDzkFQ+3DzIxqFo/W9IcIA47XhQdi8ZY/m9sv0YQOUQzUgJNcU6yjZKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwryaHYkfHs1aTDJINjb/JA0OnFuYaP0FhcV1otDuQDC6AMOzYx
	3mdmk4Lb92HlosaH3kfL7UkM4AYEcyXUVpl6NQ+nKGDjY0o3MwFXQKosQOfPMRQ=
X-Gm-Gg: ASbGncubCk09HPRM4zfyi6Tp6dQoCrs5FSPYb2kYGyql1MJlQniBYqG5dxWp/NeK36K
	CmCrX9zilk5W1eBbaMmJ+Mmh2YTr194rAT8fkiJhja5VGM+k7DjaQiYZ+OALql29BLQdHET/+PL
	Yh2Z3l71d7IUqKF++fvmovLFtmTEOHchS+gabr7cXaYWDTz7vmCcf6ZcyjsSRnWiAn3MMQ1gFhs
	LGagfNZVuqd1ODsOcHwSIqQVOD0AkVUPT7+Liq6fTzZ3cotkDBeIB+7YRDxfuUK286pbxAmpzjt
	gaTTAH+MBD0WA+8RfXJ7vjbRh/LF5QdfXA==
X-Google-Smtp-Source: AGHT+IE9VgVPP9dUNk5nU36GZVaBczxNclok26A18Dg0EZaOSiwRtsNDoM6n6nUdbHkW7QysWWdeDA==
X-Received: by 2002:a17:902:dacd:b0:22e:566f:bca7 with SMTP id d9443c01a7336-22fc8b5192fmr2750915ad.17.1746725535067;
        Thu, 08 May 2025 10:32:15 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82c3063sm1796455ad.244.2025.05.08.10.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:32:14 -0700 (PDT)
Date: Thu, 08 May 2025 10:32:14 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:32:12 PDT (-0700)
Subject:     Re: [PATCH v4 0/2] Implement endianess swap macros for RISC-V
In-Reply-To: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr, ebiggers@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
  skhan@linuxfoundation.org, zhihang.shao.iscas@gmail.com, bjorn@kernel.org, linux-arch@vger.kernel.org,
  ignacio@iencinas.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ignacio@iencinas.com, Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-3695679f-b501-42f4-95e0-69457773b787@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 26 Apr 2025 07:56:17 PDT (-0700), ignacio@iencinas.com wrote:
> Motivated by [1]. A couple of things to note:
>
> RISC-V needs a default implementation to fall back on. There is one
> available in include/uapi/linux/swab.h but that header can't be included
> from arch/riscv/include/asm/swab.h. Therefore, the first patch in this
> series moves the default implementation into asm-generic.

This seems fine to me, so 

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

It's asm-generic, though, so I usually try to wait for a review from 
Arnd for those.

> Tested with crc_kunit as pointed out here [2]. I can't provide
> performance numbers as I don't have RISC-V hardware yet.
>
> [1] https://lore.kernel.org/all/20250302220426.GC2079@quark.localdomain/
> [2] https://lore.kernel.org/all/20250216225530.306980-1-ebiggers@kernel.org/
>
> Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
> ---
> Changes in v4:
>
> - Add missing include in the 1st patch, reported by
>   https://lore.kernel.org/all/202504042300.it9RcOSt-lkp@intel.com/
> - Rewrite the ARCH_SWAB macro as suggested by Arnd
> - Define __arch_swab64 for CONFIG_32BIT (Ben)
> - Link to v3: https://lore.kernel.org/r/20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com
>
> Arnd, I know you don't like Patch 1 but I tried your suggestions and
> couldn't make them work. Please let me know if I missed anything [3] [4]
>
> [3] https://lore.kernel.org/linux-riscv/f5464e26-faa0-48f1-8585-9ce52c8c9f5f@iencinas.com/
> [4] https://lore.kernel.org/linux-riscv/b3b59747-0484-4042-bdc4-c067688e3bfe@iencinas.com/
>
> Changes in v3:
>
> PATCH 2:
>   Use if(riscv_has_extension_likely) instead of asm goto (Eric). It
>   looks like both versions generate the same assembly. Perhaps we should
>   do the same change in other places such as arch/riscv/include/asm/bitops.h
> - Link to v2: https://lore.kernel.org/r/20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com
>
> Changes in v2:
> - Introduce first patch factoring out the default implementation into
>   asm-generic
> - Remove blank line to make checkpatch happy
> - Link to v1: https://lore.kernel.org/r/20250310-riscv-swab-v1-1-34652ef1ee96@iencinas.com
>
> ---
> Ignacio Encinas (2):
>       include/uapi/linux/swab.h: move default implementation for swab macros into asm-generic
>       riscv: introduce asm/swab.h
>
>  arch/riscv/include/asm/swab.h   | 62 +++++++++++++++++++++++++++++++++++++++++
>  include/uapi/asm-generic/swab.h | 33 ++++++++++++++++++++++
>  include/uapi/linux/swab.h       | 33 +---------------------
>  3 files changed, 96 insertions(+), 32 deletions(-)
> ---
> base-commit: a7f2e10ecd8f18b83951b0bab47ddaf48f93bf47
> change-id: 20250307-riscv-swab-b81b94a9ac1b
>
> Best regards,
