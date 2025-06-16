Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12751C6FE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750058776; cv=none; b=trAjwLRibQW6IE4bbohZ62zi3OuWNO6EhL7oKz1szf9Pj7SD/vP8LzAYTak9SPZ4iW+sYbpLMiTj/DnC3elOPK0kI/HlTGGVfyklstOQJtf5et0W6RACsSlStES0qUocxQc8FXvxfKGlItIHApGO9AxDd2G9ti4eptlBcI0HXKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750058776; c=relaxed/simple;
	bh=mJYitqaIgu00nPVFj7JM9/H2NYxDQSw81n3Uo6DjgQY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Meq5HSuwdjTBebHgBQS275LJ7hoD8OW1/D1AQgbgLN/Onq0l6EnHKUv8qivyowaRFQ8XYh2cZn9Glpmm47Cr6QYpXYB4chMV+D4X7rV1EXM1kPEEqfnpzV2mK+6Yo/RXokpHyRZ399/1hBds681IdAd7kjek5+irni+ZdiF+le0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DObvbq2q; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DObvbq2q"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ABCC403F9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 07:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ntk1qbnGUsVm for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Jun 2025 07:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com; envelope-from=seokwoo.chung130@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 955AD40386
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 955AD40386
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DObvbq2q
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 955AD40386
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 07:26:14 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-72c40235c34so1000438a34.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 16 Jun 2025 00:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750058773; x=1750663573; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mJYitqaIgu00nPVFj7JM9/H2NYxDQSw81n3Uo6DjgQY=;
        b=DObvbq2qgbeSobY9pCJoF59/q+Dr8MAaJdOA+oVpH+qc7eiQmfbW/8Fo60CeX/gKFd
         68J7K3QwZ0F+wq8V/lBEpwM5z8LAe17Su7Rq1lmbgKF3MFiLV9hhoZdsRuMCdJMf+T58
         N01bT7UZecZwWe3dhescWGyGTdkLTnvIqEeKfOXdnWhxEVEeyS9rDxXK/8kt+HSadJnu
         eo4/m1pQT/87Y4PopNrJ83SYNvYzDbNBA80bE2UL/osjHvFKxueR06pjIS7EP7DL8KNA
         WF3WSDQVlmUWgYmNQfrsROFJcoRbChYjmj8H5XJ1mSiUOz9T0KixVc+Ouv9oAUyV+Vik
         zlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750058773; x=1750663573;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJYitqaIgu00nPVFj7JM9/H2NYxDQSw81n3Uo6DjgQY=;
        b=Iidi5CsIg3yxujdIfK8gqjpw17xi9P5d8g1ExO5NwJgsOxBcVv+/QKnug+GRs0+PFn
         jnq28PnbExbok61kKI6mhzxaKnd/y7uk7mmtPFFeig1G/40E5AmWoO4QmT4Ng9gKG9yq
         OlCB0byaYcDfFgeXttCh5ZSDCNzqTSY4U9tBA24TbFIFila7+o5AN5QB9/XAs/SZHO7O
         gkWhh4pjUijF0unnH1kr0GdWRV8CwHZ4QHD97afNTXGAL2isL7d78CHqSlTLwNK6DbKq
         YR287GR13vuqYEmiHlsVnjbip19/OEuE/liTjFJpZ3mMzhL5LGcNPjSDGcCkvVoqrf1z
         D4Ow==
X-Gm-Message-State: AOJu0Yxdf059+j8YIumUEEDBOCRuOnKFnlyscQvvUCITwXNmXrjFl2rA
	hi8skOJuahoGZ5htYcaRG423cO+EF3e4bPPYSJpJAL9StjC83QLkZspNynX+rcQnUNb5TlISjay
	z4TYFAL9T7IOzUO24JmtMuqhTURfY4QKRlw29l54=
X-Gm-Gg: ASbGncuZWH272lsbr6EwTdauNfoz4RIT3YporxmPLpDqcUKCUdsMJTjFzICmiaqZIlB
	tsgtdf3sH6WnzD5Lzxu4nMNKr8kHEO1C9hxnHCVgTmiMNsP2lnbc4/M5BeNlou6+eQUz4FahAsu
	jEjk084O1wxUBQzYGC65mk6rs8YssdcWZy5mWxsd2D6bF/kw==
X-Google-Smtp-Source: AGHT+IEzqLDpYCYICbqkpjUMi/HK1TVlIAyEQ+6YgadwJY6J50g6HR5GVX3qXVz5blGaCWN9UjXxo0dtZ9rXUyRZQ0U=
X-Received: by 2002:a05:6870:d0d5:b0:2d5:2955:aa6a with SMTP id
 586e51a60fabf-2eaf0830607mr4405427fac.7.1750058773144; Mon, 16 Jun 2025
 00:26:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Ryan Chung <seokwoo.chung130@gmail.com>
Date: Mon, 16 Jun 2025 16:26:00 +0900
X-Gm-Features: AX0GCFuDEOd-JI1oJ4C24zpNfUEjByFoC1Zs46UDTWDwisOyNfNWyli6GVjuo7o
Message-ID: <CAB1jyqw5RzeC4bT0oXEZ4fC2hcLj65sokW8gt=bp6=1d511D_g@mail.gmail.com>
Subject: [BUG] wifi: iwlwifi driver does not detect the card in Linux 6.16
To: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi. I have been trying to build the mainline on my laptop and have
been facing a weird issue. I have been able to use WIFI on my
linux-6.11.0-25-generic on my Ubuntu 24.04. However, on my newest
build (linux-6.16.0-rc1), I can't use my WIFI. Secure boot is off.

I have realized that kernels built with 'make defconfig' would simply
not boot up after adding to grub. Therefore, I copied the .config from
the generic and changed the following two configs:

CONFIG_SYSTEM_ TRUSTED KEYS=3D=E2=80=9D=E2=80=9D
CONFIG_SYSTEM_REVOCATION_KEYS=3D""

They initially required .pem files, but the original .config will not
compile as it created errors and were therefore modified.

I also checked the bottom configs and they seemed to be set correctly.
CONFIG_IWLWIFI=3Dm
CONFIG_IWLMVM=3Dm

Below are some additional information:
- Network controller [0280]: Intel Corporation Device [8086:a840] (rev 10)
- I was able to find my card (A840/00E4) in drv.c
- When running 'lspci -nnk | grep -iA3 network', iwlwifi is NOT listed
as a kernel driver.
- Running 'sudo modprobe iwlwifi' does work

Please let me know if there are ways to fix the issue. If given the
guidance, I would be glad to work on it and write the necessary
patches. Thank you.

Best regards,
Ryan Chung
