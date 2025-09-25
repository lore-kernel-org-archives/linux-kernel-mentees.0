Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EE32EAB6F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793426; cv=none; b=IbIzhoetcgyAJPZm+oYMpmiZRrxLGN20QQ1X54Mp0bzeDUewN9W+9q+/JUAw2hxKjfkXjTg4GXfKDKizYb3/ftRjrfQh8DVzU9NUtKlP7+W2V+w080r52vmWatwXJJGtv7vpe20Sve2K6KvB8mGoy3zdlZS6AMbNYLhjqk7KjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793426; c=relaxed/simple;
	bh=Do01lFFcNDYlGWQcYjdNtP19mQ6XNKmi0AumEvwX5Ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OShkxnSYtSrt2BGjnUSowbBvO9ryBe8swDWnscrE47ln+/kbbwS8aiqnEb6JPnLz9MwAp8JpaoRRXeyOmdPqP3HmaSYJwCR4ztK0sNjH5ioRaV8EI3zNYihhpCaiGpxX45JwW0SCSRVMqZCseA9OqPWF6XfH87OpGO/WnHAu3ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=YQVgY7t3; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="YQVgY7t3"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99AEE6143C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:43:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEZeFymjKaa1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Sep 2025 09:43:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=jakub@cloudflare.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF6DE6142A
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF6DE6142A
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=YQVgY7t3
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BF6DE6142A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 09:43:43 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b07883a5feeso164700066b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Sep 2025 02:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1758793422; x=1759398222; darn=lists.linuxfoundation.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DCZnhATrsjVbGiYUB4fIkwGkbNdpLbfL2naMCtBsqWk=;
        b=YQVgY7t326Sq3a1WgyuHl1rVKudY5SVF8KNJjIeqtMGE+uFYG3rRjf25xErC6YViWR
         KGuJ6DkMJACS2qOiTwT60DsR4P2Dt/Eu1+BZEjFG/xHKWlk1FRg3WfEiRXzmYjuK0mQP
         5agxWJ6qtpRrCNroOS3t1EOsUpz1ih3ncSphtdSpDQtSu0go89a8/mCQiNIJdAXUrqx4
         WBC/8wKdgLhpDxHJIXF+jukUqjVvn5Qpg6CWnfg9OPsmA1wgi86wRG6m1Wwg1u8kCmIL
         ZlsfVXg8RYLBOEetdFCkb98s/V1dDfpPPY4BSQpjvmovGDjKSafdzHcxgU8SHo/aJ4fp
         3UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758793422; x=1759398222;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCZnhATrsjVbGiYUB4fIkwGkbNdpLbfL2naMCtBsqWk=;
        b=eScySEyeVudSwW9LmlEHZigrawt1yGpfk4FfvE0nRk28rrGJRdSRP/7/195EsD+dd0
         f7wTPI2Wxz8cEx8Y+RXYAPGim3GoNIpnnzGrh3dS9vB6M68XkhaZE8uMU7tgWQSMvc4S
         2ykuNeT/bPDrrx591B2wiFFmBJaGp2mlSjeanhLLQqZMJjvwgZiBAzcSDLeTAvrm1r7m
         k9JoYxocJrceGz8Qm+4/Y5RZnV0ORwXSyPH+s5rDRxpFnHVGaUvzviA5ZCZjvkvF9BiJ
         DloqiPvEEKu2XMdPLM0eG6QMkvcAOTVOvSc37vmNbkTRTn5wRDmcRwJtSvBvx8C4dRPe
         mbrw==
X-Forwarded-Encrypted: i=1; AJvYcCUWPgV79cUJas6K1b4HXzm0ySQXnVi484Nh9a2b89UXTNErGc8GnF/kmwiPkTUr8MGw/2XgOYiBjt+UGIowvAkqQeioKQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxmaOay2Mdz5uiM4QGec/f2dqGVOprYHp+L7cCXJAnrNdavZr3q
	l4vI4lS7iVtu/NxbmhlswSBK1i0bscRqg+GzrYdMvwNoCrwO8SWx1L2gwIeiicovPGA=
X-Gm-Gg: ASbGncuThwYuJg/2ZMEXKTvdKmYHjxfKhM5GdzgbE77NfFa7T5vrfqjl/CcDh5q7zkz
	6YEJwQ7VYf2i5zvZ5gvdcZhR++Rwz+iuPs8AfmpUqwkMGJlNLenuzJ7s3MScaGviWNRh12TAyY4
	QgBoCQBNzmVCb65WhG5oITWVyo3bkfr52X5FgtNMFtb7eGwlaGSKjyluqI1lAHTEYRs6luPeaXl
	atZk/A+b17T0mCd2niOMo1F8OQNRmS0Q/R4rJWiwzHGfZ1ODFaBMlm78hMTvOEHsRhqMs/1wnYr
	lVxaoSmvaWtp6sGdCuQC6dpjX9KdDi1/m8S0glNKbBWZERhA0bPbnkkSNnX6uxk0LyRnYBK/Vdh
	7z/2Kx4T3AA1GLp4=
X-Google-Smtp-Source: AGHT+IHtjYY4u3ev2M33gy9xtE76ugh5Zae/dWOU8GUtMm4PBGTQ07Z0LKjhRfz3yyXn30W6EI50iw==
X-Received: by 2002:a17:907:94c2:b0:b2d:604d:acc9 with SMTP id a640c23a62f3a-b34ba93cd00mr280580766b.35.1758793421736;
        Thu, 25 Sep 2025 02:43:41 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac6:d677:295f::41f:5e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f74fbsm129383166b.51.2025.09.25.02.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 02:43:41 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Cc: davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  donald.hunter@gmail.com,  andrew+netdev@lunn.ch,
  ast@kernel.org,  daniel@iogearbox.net,  hawk@kernel.org,
  john.fastabend@gmail.com,  matttbe@kernel.org,  chuck.lever@oracle.com,
  jdamato@fastly.com,  skhawaja@google.com,  dw@davidwei.uk,
  mkarsten@uwaterloo.ca,  yoong.siang.song@intel.com,
  david.hunter.linux@gmail.com,  skhan@linuxfoundation.org,
  horms@kernel.org,  sdf@fomichev.me,  netdev@vger.kernel.org,
  linux-kernel@vger.kernel.org,  bpf@vger.kernel.org,
  linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 0/4] Add XDP RX queue index metadata via kfuncs
In-Reply-To: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com> (Mehdi Ben
	Hadj Khelifa's message of "Tue, 23 Sep 2025 22:00:11 +0100")
References: <20250923210026.3870-1-mehdi.benhadjkhelifa@gmail.com>
Date: Thu, 25 Sep 2025 11:43:39 +0200
Message-ID: <87h5wq50l0.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Sep 23, 2025 at 10:00 PM +01, Mehdi Ben Hadj Khelifa wrote:
>  This patch series is intended to make a base for setting
>  queue_index in the xdp_rxq_info struct in bpf/cpumap.c to
>  the right index. Although that part I still didn't figure
>  out yet,I m searching for my guidance to do that as well
>  as for the correctness of the patches in this series.

What is the use case/movtivation behind this work?
