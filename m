Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0411519D8AC
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 15:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766675336; cv=none; b=fwHc/NcNwf+TqIWyDnyvJOndTG6RREhfxvw0XCVJmq9XmvhzS8FoLyTI9BiBIiK5xW7JI/jvt6PqvJtr0K5FIpQLnks9LuS4PdnqIOBsrqjkZpzKi1ta4JmcSq7A0IIfA9LuTCVedNuwBoET2bCfRcVHT+RPoPXp1SKsycuwgVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766675336; c=relaxed/simple;
	bh=1a8WVK/5R0u2R7uTPPcpwGnVq8+rcROVcLyIqeUBGAE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kwWLv+fK7b577EARcigw51RmIzQYMty/6aBljDoVCYmMlLRIXgiTzxBQHG9hw1L0rBEKW1LFFhXYqt7ZyPD0XNKEuHM65n4G9LJjrqWCWDMigDpZU/kOluUQ+p5450lZb53zKiX61lnmW7lW+H/DmIUBuYff34+JfQBIT0oGU38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=tTzDultn; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="tTzDultn"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6cc366884so3116331a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Dec 2025 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1766675334; x=1767280134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4enrxTcJXMNYO4nBPNY3Xlx1Fas4M0tOaGVZ1+UN1kM=;
        b=tTzDultnxGKKiNVT53I1S6UTur8sLXWNdE/WWHMEXTHJcR+Ff4YwW1BNED/JsrO6of
         FelFPUZDuK4G35cmoBpzAMRnLssjkU8MlfMSI2N99K+47+K7/6jnphKdGacX/1TEjOBU
         04BPhhFTzmGHZH/5Ol408q9LzwB+beSorkXJ+TM09ph/POIFE5f61HSH0vxTxexMIk3u
         77B/g7bR9c7orS1GBTv3oL53oT9wuVy+uD/gQcjbnqt/rzHnGSMV2kun45zD2Kym7x1T
         C5pbzDf7d6pwAA0maOsRQi0n9aUDmpPesyN+zia2n2Q1V8tJlv06NxegzNGQ9NgKWCOr
         gBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766675334; x=1767280134;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4enrxTcJXMNYO4nBPNY3Xlx1Fas4M0tOaGVZ1+UN1kM=;
        b=GT2shBh+ASeS8E9fSEKXt8FHveyI4XxqCKCudaIZ2wXjNwLiLukbdwUAEDS84HwrOD
         7Zxtk8qTWRbNUEphNRlBBadIX+K8/8rU8BNIcuPntSvElTDSQpd2qmC+LCGeubu24QE4
         IWOrcNDImn07aLzWAkvNewr8Mmi7Bd3HDEdv0JbYg+RvhTP3nbuJgLbaQwwJ6rEUyPn6
         fL5xfbvh4VbMOij42bTkh2OqU6g1bXaYCk7KOiKUjX9DKkx35u7n8pe4c3fksuOkDwCz
         7rAZeB8W06dDSYUyz1+YDpIqGagArXLB5olhBSO/RIOWBByVT369EmuDFGKPh2ZuaBjj
         hssg==
X-Forwarded-Encrypted: i=1; AJvYcCVbp7I1fLG/ufDwhm1D4k2fiH5gxpHvoYG25h+6NYgJn6p0X+SyFCvFukynisBztHVgSZaILVDKAA4jJY/MrQApr4Hkrw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9/IKhG9KEHtvWmzjDewrJzosTK1mElLwwpwmqqhtXHGuSq/oa
	KxV53vfn8Rw2HVfd36GQ3c9Tbsg524Q0du6lCfYHVUc3f+msExr5Wri9/sTl+TiJ6b8=
X-Gm-Gg: AY/fxX5Cy7IG0xPbxn9O2g3m/jwQqab2rWoGT74iK8w4ahFqUTLJRYfx5LTn5eIed24
	idmTCtlEY43s/3yBeqO5o86COm4jssOIEPF5gCBx/FazioXWcNaUgEQrEMdbuvkPf0YVua7sMUm
	UbRg650Anh49ZELDQCNjKItlo4omWpCaCKNjn+K2GLwFvWN9oLWR16TmnOSldu7p39TL1gHsDoS
	i7O6kReRrAtN5edqUkqcVVE6VbRQf40QL7K1KiCMtW7avm30eFbbjpJEugtHDaRz0EszNNYPT+F
	Eq2axnVGUP4yDnq9I5eaijGNwEitT8FNKYVi98f8a9T3YPra2qKU/NGD0FRUlfpt+8wwVICxggq
	XZ+xHXGb5q0VIpMXAA5ERNMkSCRzKzGimkipbOs2/iHBd5F8n/cH+Lo5NMdaU+RTk9TPEntlIdW
	IozGc=
X-Google-Smtp-Source: AGHT+IHvysv98JjOtrG/XeetHHlKyurM7jKSGEnAoF86eGaByvTJgHoycWQr3WJoF84WobCqIy6E9Q==
X-Received: by 2002:a05:6808:1b1e:b0:450:c9c3:a249 with SMTP id 5614622812f47-457b21cfc2amr10228559b6e.45.1766675333911;
        Thu, 25 Dec 2025 07:08:53 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-457b3edb41fsm9481403b6e.18.2025.12.25.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 07:08:52 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: io-uring@vger.kernel.org, brauner@kernel.org, jack@suse.cz, 
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com, khalid@kernel.org, 
 syzbot+00e61c43eb5e4740438f@syzkaller.appspotmail.com, 
 stable@vger.kernel.org
In-Reply-To: <20251225072829.44646-1-activprithvi@gmail.com>
References: <20251225072829.44646-1-activprithvi@gmail.com>
Subject: Re: [PATCH v2] io_uring: fix filename leak in __io_openat_prep()
Message-Id: <176667533028.68806.11770987520631890583.b4-ty@kernel.dk>
Date: Thu, 25 Dec 2025 08:08:50 -0700
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 25 Dec 2025 12:58:29 +0530, Prithvi Tambewagh wrote:
>  __io_openat_prep() allocates a struct filename using getname(). However,
> for the condition of the file being installed in the fixed file table as
> well as having O_CLOEXEC flag set, the function returns early. At that
> point, the request doesn't have REQ_F_NEED_CLEANUP flag set. Due to this,
> the memory for the newly allocated struct filename is not cleaned up,
> causing a memory leak.
> 
> [...]

Applied, thanks!

[1/1] io_uring: fix filename leak in __io_openat_prep()
      commit: b14fad555302a2104948feaff70503b64c80ac01

Best regards,
-- 
Jens Axboe



