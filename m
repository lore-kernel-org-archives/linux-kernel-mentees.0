Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F82E22AB
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 19:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764271146; cv=none; b=BHAexfP6LR8KV9vG3q2QCWWqIvazi12uQUgvl7tHEKwQDQG/iLLYMZjHpvQDsovSQBhIarDBwD+sh6/EBNnMev07xLNca1VZDVE+wJbfN0ebv9vjg9b+3Be5764ZwJn14zHgjankXdoTJUdxZyjKLVKLBkCFzIz0CJNrCvVDJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764271146; c=relaxed/simple;
	bh=/QE1RVALkE88Yh1a6KcQNX4EHbhhm5ilrBvnj6nOjhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SPQln8vFIz8w7GyTKLd5RZfZHB0x3+XNbAq+HUvnGJaU4oiazgyua04HDjmuLjd3VV6Yemy8sHsKrQzhXKY2s52Pz0Iuml8uqg41INsvmpAQykqN1eZGaFa4hj2VN4kZ9dNTAzzvVVYSHmWMUs+DXMq2daXD5teQN+jnwLbFkvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdYycDWP; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdYycDWP"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso1296093b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 27 Nov 2025 11:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764271144; x=1764875944; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F23WvkT7Mp8prCP9vsMQmwjTYVVmBHQ0+fJlOv02XNk=;
        b=LdYycDWPixVvnNnmaWaKG/JOdmgoc96M3Vyzm7+oSNn08alP193RPSDaHqqcJN8jJp
         NiqTjtGaw/bIxh036SyH4YWgL5UXjMFifEkiAbRVG0nwo9cR0XvHyBDZQAp63m4ff5Om
         VBoCybrXa4QZxpTSBeK5jFmcW+jdXoYxl8vLXJFYdGNhJgMZ6w8yu09EVKb4HJdqE5nD
         g9c4MFZFNquGgbf7yEYDoEAFjvcHfuu8cK1xOqcpcFSFbT9O9ri1O6CO4CRnRMR6MKca
         uNMFM2F0uDo7DyRudI8gLfmkrcUWjszLUnq33zbMaBRWtbsKdiUEG0CBFZ+s6mM6LNNh
         rWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764271144; x=1764875944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F23WvkT7Mp8prCP9vsMQmwjTYVVmBHQ0+fJlOv02XNk=;
        b=fRGWwjm6NFIue/DvYtaGCdE0aF9XMmYOELhpb2vYkqD/gny9WG4Ac41B3rrAHu7l2Y
         tIs2om7V6SPVckjYFrm86z7RJ1siVd02HXhZGw2xL6hPpI8v5+vSASUIg2C6ftumHwpG
         OMCWYeYgcKu8rLVls7pP0/LqJoOZ9gd5r4rcSrX3aJ6to0AgM22gseqDssfeKRGtujMb
         AvFcRW3K1XoJo3fEmJYpnzhcCDkm/dI1AvA4cV67vCA+tgXiVOx1may3lR9jhyxIlpsB
         P5uhpMJaeia2gsCafmCP2Fl+dV1eysg8ID6npaqgx6EHiL0hHWStIjTizc/nGlHMokfr
         4NkA==
X-Forwarded-Encrypted: i=1; AJvYcCUxv1EaqK70I2JdodxQfwazQjwbCeXE3wexCDy4Jy26oXL+t1s2f+yg7ON804dvHszXjkVc4RNXD3OfP7cUIX7l130cHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/9I4KDvjB7Emysy64cVu7bPPv1CR/3LT4Xq/ps2ZAUauwlqGH
	ueFoNVUu+lBDL0RhH/2Nwv2x5scZ5W4mUvfOB+gwqMzX/uZJk/2YD3md
X-Gm-Gg: ASbGncsCgU0HM+pVDGCVShvWOLw8K+6y+xv6CFJabtJUVjZXyEx33DEjY0ujydi+dE1
	R2XSNVdgYNyNndCBrsnGJDRLRJYiAIiix44WHu0h0Dj1y3wQQ/4b+bTz4XidDktlZXRDGTR3ugT
	sN/LhHob+QxqIfKcjWhL2l99cmnZ38TphF9C6+lBscJVaJX2Qp4mlv5g5BJ/PA/TBi4MJlOWuoy
	YQIVX4qGnM+UBsVVfqneCD5SFhY+f0UHNNn6X4E705DpInu840NXCzNPZ8fBh0vM6ho3BJO10zh
	Z3U8lpczyQwuH2OjfOKLzXMbR9n1/0tJ3liaq+WikhWlopKbfXgKTVLjq56FUcUb9cl0HMUsWsO
	dEa7/IaJQy8Kw+TCvpQjPdK71H4c2GJOnUtAf/sBdNYlmCCIKmLUZLUuTSmcu5k9BT8Lq3LnJ+L
	m99BiwaoQnLCtzSfHc
X-Google-Smtp-Source: AGHT+IEfkxUrALhru/LYVIRVemCtN6SfsCS/++SjEvlyDbNUtwQTOvkACQT7kp8/L72AzSrboRrBiw==
X-Received: by 2002:a05:6a00:92a2:b0:7b8:e02d:d5b1 with SMTP id d2e1a72fcca58-7c58e609950mr25715904b3a.16.1764271143791;
        Thu, 27 Nov 2025 11:19:03 -0800 (PST)
Received: from rakuram-MSI ([2409:40f4:211f:b50d:1190:e256:8b21:a462])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f176096sm2620703b3a.57.2025.11.27.11.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 11:19:03 -0800 (PST)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
To: linux-can@vger.kernel.org
Cc: mkl@pengutronix.de,
	socketcan@hartkopp.net,
	mailhol@kernel.org,
	khalid@kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rakuram.e96@gmail.com,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [RFC PATCH 0/2] can: add dummy_can termination and update SocketCAN docs for CAN XL
Date: Fri, 28 Nov 2025 00:48:06 +0530
Message-ID: <20251127191808.144723-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This RFC series introduces two changes related to CAN XL support:

  1. Add termination configuration support to the dummy_can driver,
     enabling termination testing with iproute2.

  2. Update the SocketCAN documentation to describe CAN XL operation,
     including MTU changes, bittiming/XBTR settings, mixed-mode
     behaviour, error signalling, and example iproute2 usage.

The goal of this RFC is to validate whether the proposed behaviour and
documentation match the expectations for the ongoing CAN XL upstream
work. Feedback from the maintainers is highly appreciated.

Base commit: 
commit 30f09200cc4a ("Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux")

For testing, this series was applied on top of the following patchsets:

  * "treewide: remove can_change_mtu()" (Vincent Mailhol)
        b4 am 20251003-remove-can_change_mtu-v1-1-337f8bc21181@kernel.org
        git am ./20251003_mailhol_can_treewide_remove_can_change_mtu.mbx

  * "can: netlink: add CAN XL support" (Marc Kleine-Budde)
        b4 am 20251126-canxl-v8-0-e7e3eb74f889@pengutronix.de
        git am ./v8_20251126_mkl_can_netlink_add_can_xl_support.mbx

Testing was performed using the iproute2-next tree (canxl-netlink branch),
which contains the required CAN XL netlink support for validating
these changes.

Rakuram Eswaran (2):
  can: dummy_can: add CAN termination support
  docs: can: update SocketCAN documentation for CAN XL

 Documentation/networking/can.rst | 470 ++++++++++++++++++++++++++++---
 drivers/net/can/dummy_can.c      |  21 ++
 2 files changed, 454 insertions(+), 37 deletions(-)

-- 
2.51.0

