Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9073E49CA
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 08:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787647059; cv=none; b=TMUUTlLhu9u+bA0SJB0k4kBz37+XjNAddhP+ERlTgTp3TcpXn2zNNxqdGSVi3bnnXKzBrLN1+EGo+Ee3F07iCZgB9HhWe6qQatvmX+68ePF+lGeq6Kea2oZzm/+OVgPtu0wMSe+i73y75hjmHAr3yNqUd9p+EN3+w47AU/PN8B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787647059; c=relaxed/simple;
	bh=LNRKnRnQJHlCDb1+W1pzp4TUdD4yCD7c1c5RDxUrecQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r4T2Z7uz69ieY5W1Olab7KY/6HEjhiaoELBDGCcanNLD4WZQbnunoqh2Cec2/iArNjngz5uZZKiSeRAuZ6Gb7aElG5HwYDDi+tX0kxjFXNc+ZkWXh/8oMi1DqFXz9jlNv4U3cx4sXtNmBPW8YrcwiHzmAjRsrELEwBpBbnXDnow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcQE+qaQ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcQE+qaQ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so3247990a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 25 Aug 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647058; x=1788251858; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTiqxajFCS8JhT00U7QUj901RHFXVk9RFW4qrD2ZWqc=;
        b=PcQE+qaQFF0V1OjvN71e1232j5jNTGmDdpyOxQeaNXsycDGSQNANeOczQzFexeblfQ
         88KmsoO5V2nL2mTWRbWmcksr1laW4trsG76N2W7CFaUtZDVr9K918X83mqEF82fhP03R
         z+XFL8JSluwdhrqmtuIXGq5rlh3+eL9wb6Y0dMbMsyW3pF38/4rfwdpyov+KOOFwCJUk
         hqNuTw0ftuAjOxixdrn50R8B9xsi0ZXG61hX9uClMQ1xBRnuqBT+nbNrA4Zta2VjGPh/
         9dyHxrBDfBtfwKpSdC8sOy6XD0OG1chOfbTrt22vVvklvO09llfnvVAs7Jap5f1ZSylr
         KJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647058; x=1788251858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTiqxajFCS8JhT00U7QUj901RHFXVk9RFW4qrD2ZWqc=;
        b=U5hV5rICZoIneOPL8nJnXjmU/tyZQKtKSBkB2oN0TLszTvEkmY4PmHWqBStCl6gwX1
         mYdd0Bm3JdTRqqvIOMyEIERV50gQPHN5J4fGwNy4kehG2PpCH4q1JUVilF1UFozKMkU+
         kxPDa7hBFIU1Lr/Ml0gSGrQWV2Kk4fO+oPibDJeVHvzeeIn2xxJMfAxF52eHhpW1GzsE
         fU0z1HHAXhH8g9hgaNRknqa95JXgF+iPWoQQuC3iE6xttEcNu5HSWdSEStdfnLx8LNgt
         prqh0cZA9yZjOxOrU0TVnDNQCP125Ea14k7mKnARYn0n2njc2DYYlyjQdc/MdHilPyfI
         oQDA==
X-Forwarded-Encrypted: i=1; AHgh+RpqXKRjGvtEkQ2KN3Sn2v0FT7+8rjUPgWL1akTqliScZLMsZ0BqQB2SJNX2ntTkZ0eYJBfDk9FlPsC44K80jDgbKnTwyg==@lists.linux.dev
X-Gm-Message-State: AFuF++ldO//r+sN8qYJipMFhBupw4V8xe6AfvaeepRykm1bkgZAjsuNh
	zYEVXGscLI9o2I/cPMX5uquKu0efO6SR6KzgkJH07WEoCWAjpIJI8ZbN
X-Gm-Gg: AR+sD10sOmANXNInQbLoaLMCyguxPckh4thlDhlhY8SjlYhtS+B4ttpiwb9fY1zU0yZ
	lWd30Vr+W7jag7YBmzWgAhq7L6CMIRhiJFiXbsKhU14xOY7E2XPTYxHLBi8Cp49j87F1D/SRbpB
	XTOrycsoqb8SY8+PU1eNkv6y+QIorr5LSKuvRGQY3dvM0gHR5qRNZt9ODnf38TiyBNDUGsy2XeW
	WBQcVNIxI7q0pftPifhEPGXhxL2j+5WIVKMZ6bzUGzb4jtkn4dMUUsOERhPyKc7DfFQL2LOXz87
	r4UzAQVC97QY118V1lbfWjtBm2oZ6Rrs7Fjfw75NPWfSxydq3ehl6rZfjuFCHGfZTij1oIUWJva
	g84l+WHOfyVWiAp/8Ay5sHqnCvXnoGbqDUOqoowdzoyNjxsuf4JB1DGp53pkzvh98liFKgjneN2
	sFdPqzIjb1Z8vvLFHTpsxTcWMcc/JE/6IBdO0Jw6tyDlGyMuA9BTXsKzwEtEDMbzJdyCB2q3tBI
	ZDBUc6mZ1bD
X-Received: by 2002:a05:6a21:320b:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cd9125ad6dmr10437900637.9.1787647057741;
        Tue, 25 Aug 2026 01:37:37 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:37 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
Date: Tue, 25 Aug 2026 17:37:16 +0900
Message-ID: <20260825083719.643970-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three issues in the KVM RISC-V PMU implementation:

- preserve firmware counter values across stop/start;
- report failures when writing snapshot data to guest memory; and
- fix perf-backed counter accounting across read and stop.

The changes were tested with the existing KVM RISC-V SBI PMU selftests
and additional tests covering the affected stop/start, snapshot failure,
and repeated read paths.

SeungJu Cheon (3):
  RISC-V: KVM: Preserve firmware counter value across stop/start
  RISC-V: KVM: Report snapshot write failure to the guest
  RISC-V: KVM: Fix perf-backed counter accounting across stop and read

 arch/riscv/kvm/vcpu_pmu.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)


base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
-- 
2.52.0

