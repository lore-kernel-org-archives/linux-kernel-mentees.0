Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FDF1822E2
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720101072; cv=none; b=r0vvZ7CNvO0fbDtT2GfpPemeUxIg1i0iP/AHPmFC8Cq9um7XIdwhdM0xzjpvGJL/IeBh0SWpQG/3RZNJ6359Tf9xZXDLn7g0TjKgKD2F0R7lHk/SJyXW4Hujn/pN6BzUFlUJi3Y2uA+8iTqgZr1g/XCSsAbYv6J9XYdfla8JhWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720101072; c=relaxed/simple;
	bh=Mk2zjU0OD/BqtSdx1Y/wNXDDAcjEI73Cmr4nJ0Iw0TU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ePR5BKGt592hYKQZFyBmSXJexmM7sXyC3Kb9yveat6iy2rHzQzaTLeVIG3q5RyFQsr2lw3mKvpO2qkJ2tFJ8yNOnvl7Wc2bXi0pFN9DSmbEInjxDU9J+vOe45z0qa8BP+HzTLJUOURoynFkxh6uIEW/BreKNE1n4JK2Qv7Ett04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BCqcDNPj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BCqcDNPj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F6C360820
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 13:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -9.6
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jrrWphkUyaJz for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Jul 2024 13:51:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::649; helo=mail-ej1-x649.google.com; envelope-from=3xaigzgckagwnfieuyfqyyqvo.myw@flex--dvyukov.bounces.google.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 450C960830
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=google.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 450C960830
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCqcDNPj
Received: from mail-ej1-x649.google.com (mail-ej1-x649.google.com [IPv6:2a00:1450:4864:20::649])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 450C960830
	for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  4 Jul 2024 13:51:04 +0000 (UTC)
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-a77b2edfe06so50044366b.0
        for <Linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 04 Jul 2024 06:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720101062; x=1720705862; darn=lists.linuxfoundation.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mk2zjU0OD/BqtSdx1Y/wNXDDAcjEI73Cmr4nJ0Iw0TU=;
        b=BCqcDNPjXw5OoCy5M0MarbVJgo+uKPRUVgqDq0O+OScWkesRbzbHJrsTPbwweVEame
         ybaqt1E/uef2bGxDegJ4WMIFrsu4fc6BbBImHe+oNzxse7QN+Bvn/sSxWxf2yton6/KE
         GSIIx3SeZAktFAQ1GJOWWYGEdAqpfXwH2BHFMgGu8/roq+XmwzaR3Daez8AooYpN56go
         Mou2WWcgxY5C43u4yZz9O+SsHoXj3L/+7L3p2pKYgbUZQDA7yhtIGNbLKMB/baeBKf88
         9954nkyuKlfSl/NACnO0sY+rCZPRcqI/y7Mlsa24s4FcivBJDnE7MawFHDLlxL1M8Jgp
         MOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720101062; x=1720705862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mk2zjU0OD/BqtSdx1Y/wNXDDAcjEI73Cmr4nJ0Iw0TU=;
        b=LjFdnyXEqr9EgzHG+Sb5mdTCJ1m4qtOKTo6HYah2Bp5bnzuKxLU8uKyI7E++DTQXb5
         lSYJaGwbNoDmj2gpUUxouyxncM8ypYP37O+2gD7/zLFa0d/mP2nKlFJv+rQ7CVogYiun
         DisjiXgSYoVwr22t19c3fVXqdg+3QDgEoy3SLiFn63oQi6TSW3IXQmP9uj9pUuh0Zp/7
         nuLsl2TGkkjQo866o674ikqkfEdx2GEJsxPyqB/bUIetAJhM3VJsPJ0xCZrOQWOQrJip
         xBmqgSqTNfqkEEuYH7s8Sp0GqXRckw0PbFYp6G9Hz4S3mwB9tBvcDZ5RuPoz4UgCvV4n
         dIig==
X-Forwarded-Encrypted: i=1; AJvYcCWjidGuDjVK+5WlfdOW4yb36b2jw72ZKCiKOc1Q8BFabKDn7tfwi7j04cC+7a54pmBzChEcEWxpoX/IGrRTu/QqwzyEu3dEcsqrcZzoY6js7n3lC+fp2B5dbK1MR7cM
X-Gm-Message-State: AOJu0YzgNV+O30R9XlEhvcM7eCHXJqeMnpgVXXYVGrg05MBLQs9GfLHf
	cqDUubSlFlonJQNF523vvnXuPHl8NfFF22nk2KJ6zCjrPhEt9mf5lSEb1KHAN/oPhOrTtJfU2jQ
	9MolsUQ==
X-Google-Smtp-Source: AGHT+IFrFc15nopfz9rvRJbJq682fsp+q2IZ5nbvfQreeYJuORUbZwDxqyh1wfijUhGGgU291E1rUbV7ygFF
X-Received: from dvyukov-desk.muc.corp.google.com ([2a00:79e0:9c:201:ef38:74e6:67b5:dcc0])
 (user=dvyukov job=sendgmr) by 2002:a17:906:99c8:b0:a72:8fe5:9c60 with SMTP id
 a640c23a62f3a-a77ba727e6emr125366b.14.1720101061941; Thu, 04 Jul 2024
 06:51:01 -0700 (PDT)
Date: Thu,  4 Jul 2024 15:50:57 +0200
In-Reply-To: <2023082746-antelope-drop-down-5562@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <2023082746-antelope-drop-down-5562@gregkh>
X-Mailer: git-send-email 2.45.2.803.g4e1b14247a-goog
Message-ID: <20240704135057.1174408-1-dvyukov@google.com>
Subject: Re: [PATCH] fs/befs: fix shift-out-of-bounds in befs_check_sb
From: Dmitry Vyukov <dvyukov@google.com>
To: gregkh@linuxfoundation.org
Cc: 88c258bd-3d0c-de79-b411-6552841eb8d0@gmail.com, 
	Linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	luisbg@kernel.org, salah.triki@gmail.com, 
	syzbot+fc26c366038b54261e53@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi,

What's the kernel policy for such cases?
Should this be merged via some fallback fs/mm tree,
or taken directly by Linus?
The filesystem is still enabled in all major distros.
Or should we delete the filesystem from the kernel?

