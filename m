Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94C34CFB9
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673365; cv=none; b=aYtMCvXzPmL8dqh2WX81Y/MqW9NeQOwBlH/ELj1Y1TWZ0wUa2LJbPlbegc4nQpXD0CsRbqs953HSJf8upfJP/Av1nAT3KNgD0SDZ/ecb4GYcHKJPHfeDg+unCsFMsTHMB+3RYhBX+q5udv/o0vpv1pRNt5kancuzRDYZp2GYYM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673365; c=relaxed/simple;
	bh=NB4/159VAJ/LOLYrEdLoYDe6gQW8IwjruqaLuSzroRI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=djvfZzYi3guCbQITsuls6uVg6JfVW0xEojnnY9SzVrJFQ+IqsGu2OS1mFqad1I2xIApj04CVRLOiNZHdA/kYbAtleZpDeRKBSHfBKIm8Y/iuuEuPSNpHhMb8C7/Q6wx5Bq4nWy45cOaeu+KZwkW0Soie2I+FdE+aO6rPsuS5PmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2EFMLTG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2EFMLTG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4884035b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 28 Oct 2025 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761673363; x=1762278163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pUzQKBks4b6XgtXD3YeHoVuqCQLUAhrUCly5cGOnfSg=;
        b=d2EFMLTGLF3sPUZAMg9xf3NrjkHnkqioDN/rWIsrFj3kTPP7tt5PyDIf5cCB2+QbKk
         R8VTAmrLs2IZb6910p28jsYWFz4AImQXFw4eqINRDRCk+kyy3pXtfOKHMOQ1LjMoGcPC
         OOqVxvYKvZ0N9Zxr6S17vWiX0u2xWotj+8XGjzDiKygvxmyRRbF1zJX64G3mmKGqs3Kr
         5D2Ph7e1A6IB6H3SAt3Un/Oi/6wyc4NAF+HjgfKs9/tMfNP3NrflfGppPaFBWHaUGMJs
         2cGTGD98mhE+9YimIbVHrBU+ksfUA8UddmhAxWAtJIn7zFc59DDuU9FFblbgu/Xu79nP
         UzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673363; x=1762278163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUzQKBks4b6XgtXD3YeHoVuqCQLUAhrUCly5cGOnfSg=;
        b=hROlDxgPa5KowMCVcExYIAhbu547zOGxoXKjUoeqbev82ok3+kkshhYDVYmRF2Qh9a
         OJPTy1saqegSDKJ2RUE2vkblwiYQ5aOX0qQONYv4BM+juYNNpZsruOcR4yYBRY2Y7CK4
         wvm3dtgQjhdfYne9PXbWj3yLzAB4QNP4jC77NDZGLlzFfRTdKdhSd4Th7vqcQrHxvkg0
         nUawBfMXb8TC08e282WuxKByzPLn+dH2zFmK43Y3az74pmH7LqjWLyU0/UrGpNnpWghV
         hb2yBNT4mNjMZFfRqzSBW/IPSYriX2YsIkTKReFKm0ikGOBJgOxQV+V+Jfbky1Yzkbv6
         Dl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUAmzmdgpVNAIBwTxH1om5AAMLwrIznwqJ9ehqtZ6r3K6q/01ohNug3bi2833yAhH3hjsOmZmOkSEXM2sfXVMwEo6/W4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUK2MqaS3YfK3OhuNWsp5ZgEn6uz9KhX1P07yR5LW6VUn4vA/L
	Vx1YDxJ+/jXQkYqN8gjOmdkTZG6eyG0CmY5dSFza0xF/OLLV4TRRg7Kg
X-Gm-Gg: ASbGncsH8tog0SNecP3NxbcDNzMR8QVNR97YNzP6h1QGW8olWm+e384KRyCqNgHwVoO
	8Qk2IpC8uTtxSwjGFJ+AASNsPa884NIqrRqYGpqw7lVMKR+E8dkppgSL+abhqzd9dHLtLjAaZWv
	WixBroB1aGJYeczk/TXjeRCoEfI45eqlfFXFnGxppJ4MHqNEw43KTMhjXzgcykSIbyyyJdEfCQJ
	aUlQ2ueWuZeujA25MvTmaJ7n7eSv4cKvysXT6JI0wW2ZzxbOXKUPAz1H0e0g6vamumfu7FJ13Fl
	uny5fssdzgh7KKbuLjr6nhu3D7EQjuXUfxm0GqrDtRvcbRp5SMYP0taWj2Xp/32p9wD7gnbRHDY
	YtD3Kjwyld2xPIdkT+IX84+IDUlulKzczjkAi8QwsCZCibrKGDUJajNqMRIQ7Z7o4B9D4RyMaOb
	5mNNZiTunfNBTo2e7QwCj3Ik7mEI+fkerJtc3Zkk48PitXNpifxeWieSsCS2A1SZKRoE0=
X-Google-Smtp-Source: AGHT+IFkagOU2linMs2kD3kWq1TGqg7rAVt5JSOnY9BDlaUoP7+rT5UX8pceuf3wIHeJnBVA96Qorg==
X-Received: by 2002:a05:6a21:3289:b0:266:1f27:a01e with SMTP id adf61e73a8af0-344d3e45d1amr5219012637.39.1761673362484;
        Tue, 28 Oct 2025 10:42:42 -0700 (PDT)
Received: from debian.domain.name ([223.181.113.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b71268bde68sm11086746a12.1.2025.10.28.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:42:41 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sdf@fomichev.me,
	kuniyu@google.com,
	ahmed.zaki@intel.com,
	aleksander.lobakin@intel.com,
	jacob.e.keller@intel.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	I Viswanath <viswanathiyyappan@gmail.com>
Subject: [RFC/RFT PATCH net-next v3 0/2] net: Split ndo_set_rx_mode into snapshot and deferred write
Date: Tue, 28 Oct 2025 23:12:20 +0530
Message-ID: <20251028174222.1739954-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an implementation of the idea provided by Jakub here

https://lore.kernel.org/netdev/20250923163727.5e97abdb@kernel.org/

ndo_set_rx_mode is problematic because it cannot sleep.

To address this, this series proposes dividing existing set_rx_mode
implementations into set_rx_mode and write_rx_config

The new set_rx_mode will be responsible for updating the rx_config
snapshot which will be used by ndo_write_rx_config to update the hardware

In brief, The callback implementations should look something like:

set_rx_mode():
    prepare_rx_config();
    update_snapshot();

write_rx_config():
    read_snapshot();
    do_io();

write_rx_config() is called from a work item making it sleepable
during the do_io() section.

This model should work correctly if the following conditions hold:

1. write_rx_config should use the rx_config set by the most recent
    call to set_rx_mode before its execution.

2. If a set_rx_mode call happens during execution of write_rx_config,
    write_rx_config should be rescheduled.

3. All calls to modify rx_mode should pass through the set_rx_mode +
    schedule write_rx_config execution flow.

1 and 2 are guaranteed because of the properties of work queues

Drivers need to ensure 3

ndo_write_rx_config has been implemented for 8139cp driver as proof of
concept

To use this model, a driver needs to implement the
ndo_write_rx_config callback, have a member rx_config in
the priv struct and replace all calls to set rx mode with
schedule_and_set_rx_mode();
---
v1:
Link: https://lore.kernel.org/netdev/20251020134857.5820-1-viswanathiyyappan@gmail.com/

v2:
- Exported set_and_schedule_rx_config as a symbol for use in modules
- Fixed incorrect cleanup for the case of rx_work alloc failing in alloc_netdev_mqs
- Removed the locked version (cp_set_rx_mode) and renamed __cp_set_rx_mode to cp_set_rx_mode
Link: https://lore.kernel.org/netdev/20251026175445.1519537-1-viswanathiyyappan@gmail.com/

v3:
- Added RFT tag
- Corrected mangled patch

I Viswanath (2):
  net: Add ndo_write_rx_config and helper structs and functions:
  net: ethernet: Implement ndo_write_rx_config callback for the 8139cp
    driver

 drivers/net/ethernet/realtek/8139cp.c | 78 ++++++++++++++++-----------
 include/linux/netdevice.h             | 38 ++++++++++++-
 net/core/dev.c                        | 53 ++++++++++++++++--
 3 files changed, 131 insertions(+), 38 deletions(-)
-- 
2.34.1

