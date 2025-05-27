Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D627CB35
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 17:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748367570; cv=none; b=KFOF5wW21IOgT3hqS01JEM5KVgsJHtQDXoIyqBn7fDd95pR61yKXvZcrZ8nvPX5yHDt0dQyqI53TlB6X8aFRYqwDy/Ug0ss5pzyF4UNHIXU3ayM8yteSZVYYYdpyQeg0o2KhFIG5/shTypPRrRK2zSqm1hju+IFJKzgJ0VSe5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748367570; c=relaxed/simple;
	bh=EYOOSZHmScBYxroLZyX5hgkJJ4393kMj/n1uCQ7iaAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqoUoC1JY9PdtGLrJE7FEiy7o6nwh8V+Eqnljk/6aLChB9p7sW3ZwlXpY4NtMP0NNkc5Ct/e9mEG4zgFmyQjj9RZ3nAxF08VxTYSwrp96H2v1wAq5bKVuLY5WxdiERkixAZcBmIR/tTClhqALGLKns08Yfe7ztDbAx++rkmCugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI7z52o3; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI7z52o3"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-af5085f7861so1875793a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 27 May 2025 10:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748367568; x=1748972368; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EYOOSZHmScBYxroLZyX5hgkJJ4393kMj/n1uCQ7iaAE=;
        b=MI7z52o3eBMu1DOcdI+q0fa30ejXue+2hgYGFEP0Jd35b1F06rLscT0yiimCObtbBP
         /Z/Cq8D6Y4nD385RA5FAhhWeHVZQsJlaKpZzbafYHwHAxjENn917vobVQX2+3ALQk52T
         lzW9HovCiKp/t8e56W8+wMyh5cwyoYBcj/900AodUZg6OPSy7CCCptvvWUjmfDEk9lxJ
         YM0zbQ80SW3xqYT9TghMsElGPLRSnRPvIjeF2wfa0971soW+1yJTl1JWtic3sxD7+ncc
         rj7R+/iXbfpm3E/VSKO8nptoWN/YRDYOxIVSkyvXfh7Tk31qGuBytnVRoMJtrhOPTylH
         XBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748367568; x=1748972368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYOOSZHmScBYxroLZyX5hgkJJ4393kMj/n1uCQ7iaAE=;
        b=Qw5gFaUt7cgSMSsSnD4P5SoGzjmgqmhzU42N3jkZHi3e/WVfyWCknY/IPGoDNelEcr
         xIgzhsImCAQfzCjTTYSSXaE9CCCttfkIJZB77O8hB48VJCXfPTZTxQQSoBe1I+WVNW3C
         Be6mdp0APDddK7Xx/F5kzAvx8uZG/hPymcgyI70Bgem+8NtSh6auSeuAKzOQVyrsf+Nn
         UuewOrxUGqjv9CNeljjHH2EPzKiyZg8A0UmQQfergY+JY5YqbQwg8hAoW6SGC9ymH+rk
         BnyRUAgYvMmWEqocwj9bkchZmP086p7Ymi5iAbddd84Lw42S1/dPwaNzT7+32Cr1IZBN
         NB5A==
X-Forwarded-Encrypted: i=1; AJvYcCXL8QxazuO21VN1DrLw8Wbbp0ND9/2+ecZPu42LJeYiHXjP4IzySyKDj/CR3SOxoZQEBXmpANa8/+tErCjzuO55eRPaGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy+wL8/NYqCmOG98t+1YhsiIJcl7RK7XrGKi+Q5xHL0OV1X5RC
	ZHp3tY3tUdDMgna5zX3x4gOy+Net8k2xxUns8E0G9VXHU++uTor9EXAH7spmH3/o11tQ8JYXpQp
	88odENL19lhjv7iygLmCNzGBWhJl7z9M=
X-Gm-Gg: ASbGnctF7kz6XMi43sMVOhEooAEZBK8390Sd5vf6r3xDDo5P8yFxZWdMZ8SKijyswYP
	BqamPfmkoyDRQWgxR8m3z/UXJllZrI0LPd74g26g6KYBsvLxb08mBCMj3N0/B6geJokBdsH3JE6
	S6rCddrlH/PP95bZm92n24hCo0Nt2FoWhHTw==
X-Google-Smtp-Source: AGHT+IGsD9OEtRNbZXsR3KaaCuXRpPRdDOCA9O1CN8Y5Itz5Ik3JkiACaDxLYDLhu3OKDmKe/EEPmaT/zhGc69A/fKQ=
X-Received: by 2002:a17:90b:1d12:b0:30a:b93e:381b with SMTP id
 98e67ed59e1d1-31111a51e1fmr20529925a91.35.1748367567935; Tue, 27 May 2025
 10:39:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250527173116.368912-2-bharadwaj.raju777@gmail.com>
In-Reply-To: <20250527173116.368912-2-bharadwaj.raju777@gmail.com>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Tue, 27 May 2025 23:09:00 +0530
X-Gm-Features: AX0GCFt6U1sh2tAr-8WigeV2EAy1B61xkhRWpwGKCdbr6iSiyNZkk6ZHSdN2EPs
Message-ID: <CAPZ5DTE1z=PPm+v718ZfgYg0oJkEKHJ-pxrSjSGTmxQVqzaP7A@mail.gmail.com>
Subject: Re: [PATCH bcachefs-testing] bcachefs: fix goto jumping over guard initializers
To: kent.overstreet@linux.dev
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Now I'm actually not sure this is the best solution -- the comments in
include/linux/cleanup.h say that gotos and cleanup helpers should never be
mixed in the same function in the first place. So ideally we should not use
these guard helpers until we develop helpers for everything that
we want to clean up using gotos, like printbuf_exit, bch2_trans_put,
and so on, and then switch over everything at once.
