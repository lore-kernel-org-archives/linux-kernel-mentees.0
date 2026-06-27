Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03B33262B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jun 2026 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782580238; cv=none; b=qFLhipf9UJuKSyt1wtEFdMaWrVo63+kVmH1mz0cA2YsheMPZVrUpBOR5ZaNuElqczmQN5SRJKnNNTsKi/Q+adPzV1y5Sg5StSICjjIfg37NQ9m7IECkfBhg8zUQ9S8PnSxHAoCSNbH4D0Y5oF4JWZSIfDNMs3Rzxv2pdItN9aik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782580238; c=relaxed/simple;
	bh=5ttfpm3ifddxsgXghuT2QVAd5kOHJ2Ff3lQ2OTVP4Ms=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=qlY6QMjUJ0vZBseeJS7NzjVylG6Nbmo2t5gEah2p86+dLvPbXoZMKdJKS5RVi4b3g3I13szckcb6rIYTc6V5I8cyJGLcdpFUa58BzOQWkgfATDlcATxlGz2PH8ZOrO9eFSbUNGtxYJhvG6yn3PPmYGDQmAso0JA0xDadm0Nymj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nT7sJ4tH; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nT7sJ4tH"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9FF160710
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jun 2026 17:10:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-ArSAw81WhI for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 27 Jun 2026 17:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com; envelope-from=mahad.ibrahim.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF996605F7
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF996605F7
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nT7sJ4tH
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BF996605F7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jun 2026 17:10:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-698439b6e8aso1222302a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 27 Jun 2026 10:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782580233; x=1783185033; darn=lists.linuxfoundation.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ttfpm3ifddxsgXghuT2QVAd5kOHJ2Ff3lQ2OTVP4Ms=;
        b=nT7sJ4tHlyyB45qDjydJRDGM39C+rPzE+/BmqhrfIXHIvdeHu5yrm48Nrxl1QrxA8K
         rp+o++vE16itNhsDTyfBBJA95o+Pd95cyTUVHULraFpMSscoc6K5ksfavG8qA0/akeRK
         OPE1WfqtrtR8wQ/omtX7qeF7517H/g2tC2HNuEp4grzFxF4tgveyee2yIELo+oO5MRm/
         WcVULk2s1y8q5YcuG9mm3hfSFuvZoep6cH7twuYmTbhMfAc9rwZAdhgvBVLSrg1OZg2e
         O9KgE1YByD8sQgVYGHE17XzT30Ea/qBj37KqO0wW70O8eT36KPKPgNRWCnvXpxIeuuis
         R6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782580233; x=1783185033;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ttfpm3ifddxsgXghuT2QVAd5kOHJ2Ff3lQ2OTVP4Ms=;
        b=aFMUwsiq0PZubI+fTZ7OrvyPzW6GE+N7+wVYy2wDj1+YOfrGn8K+un3f4WGqCNjUSJ
         WvEv+/e7BDmWZZczFEJf3RuQ+nr0rt8ea4SEoOI4BNlytzXSXjrvmhCF6CnAq+rlcDMU
         MH+IZcMT/vqSRsfLdQ7yRaIaESbqpHL3ZJ9olF0fhTKBt3h2z0mihc3NaOZmT6ZM6FG3
         kWZg5r3igyyAbNJBMJVNm4orZ3toKcC06C8/Red3ZRVub2URBRaltEZu2oNgov5rFRFM
         M9sysvgEeApYLVqHuDNoHK9+Hok/Q2R+rnHU/LXlwhJZAeNl4WYwzZbpmKLQ1n42C+a0
         GaBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrwf/tNibX2UjvYyGQwnRdgk2zYef93Wls3lf35fasr2zERJNfs/J9UE2wlXgktwnwW5IR89BaWE96OlxaJE381RIRqIA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz21N+SKCD8Z/HrDOv/5xioEhGuaaruO05kzgwVySN82Lf3QxhN
	KurLOHqe//2rhSgqDzQa8fiZdyTUWXGObzYpTqTN9hFjv2GoPxBeCTe8
X-Gm-Gg: AfdE7ckxR4Swi1qSPjQg2Xocn9Ygw3FbN8dKm7C1LDodXeSMYRirYwN1SG6F1R5CK52
	EvoB7Q83RLvATcPjE6mgjUkf7mPF2eql97vErLytxJXyYZuwlEN9D+4b6orpPITTQqYs8Wlel4u
	uVfilhElAxNs89XyS4RvYtOa/vH/Sq23+FM29X1HR1el5tGKyHd/1VfrnxlT9g1gHLPPtIU7PeW
	5dUbgIpGg+yofEss6Y1X3jBKZ/ejdnQ6l8VqihkKWkWKEACddI2vfi098GeUT+7xaDUQF9YEUuq
	6xG7ndlBfLojRJmp76rnvZSvynls2yHl1hZGAqbOnNPES49+95iNx4gR9U10vGXL3a/DyrFYn7J
	xJCf+3bSND5dWuV4ZeIyq+D8kIuQaGk3X7hIzUqu4FzEBGb6He0/B7EAkzxVrb2NpASIsCX1HWW
	7EbBRfsfhTf+b4HTc/5bs=
X-Received: by 2002:a17:907:7b8f:b0:c12:343d:d20d with SMTP id a640c23a62f3a-c12343dff47mr217096066b.39.1782580233392;
        Sat, 27 Jun 2026 10:10:33 -0700 (PDT)
Received: from localhost ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbbac51asm504245166b.7.2026.06.27.10.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 10:10:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Jun 2026 17:10:30 +0000
Message-Id: <DJJZYCL2DGFB.3SAYSE3IIAJY1@gmail.com>
To: "Amir Goldstein" <amir73il@gmail.com>, "Mahad Ibrahim"
 <mahad.ibrahim.dev@gmail.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, <fuse-devel@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Joanne Koong"
 <joannelkoong@gmail.com>
Subject: Re: [PATCH v2] fuse: replace passthrough backing-id IDR with a
 counter and hashtable
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
 <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
 <CAOQ4uxgX0Oqc+KnEHx6n01UfNQAOPfk3m2rQ3vYTGM98HOV0Yw@mail.gmail.com>
In-Reply-To: <CAOQ4uxgX0Oqc+KnEHx6n01UfNQAOPfk3m2rQ3vYTGM98HOV0Yw@mail.gmail.com>

Thank you Amir, this is incredibly helpful.

I hadn't thought about offloading the allocator to userspace, but now that
you mention it, it does make more sense given the server already manages
most of the backing file lifecycle. Thanks for that.

The two bugs are clear, I overlooked them. I'll scrutinize my code harder
from now on.

Since you asked whether Miklos agrees, I'll wait for his response. However
I will start learning about it right away.

And yeah! I am a student, an LFX kernel mentee under Shuah Khan.

Thanks,
Mahad
